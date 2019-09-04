<?php

namespace app\common\library;

use Alipay\AlipayRequestFactory;
use think\Error;
use think\Exception;

/**
 * 头条小程序 临时类
 * Class ToutiaoMini
 * @package app\common\library
 */
class ToutiaoMini
{
    private $curl;
    private $setting;


    /**
     * ToutiaoMini constructor.
     * @param $setting [
     *  appid,secret,pay_appid pay_secret pay_mid
     * ];
     */
    public function __construct($setting)
    {
        $this->setting = $setting;
        $this->curl = new Curl();

    }

    /**
     * 解密CODE
     */
    public function getCode($code)
    {
        $url = "https://developer.toutiao.com/api/apps/jscode2session?appid={$this->setting['appid']}&secret={$this->setting['secret']}&code={$code}";
        $res = $this->curl->get($url);
        $res = json_decode($res);
        if (!empty($res) && $res->error == 0) {
            return $res;
        } else {
            exception('系统异常');
        }
    }


    public function getOrderSn($param)
    {

        $param['title'] = "novel";
        $param['subject'] = "测试的商品";
        $url = "https://tp-pay.snssdk.com/gateway";
        $time = request()->time();
        $ip = request()->ip();
        $data = [
            "out_order_no" => rand(10000, 99999) . $param['order_id'],
            "uid" => $param['openid'],
            "merchant_id" => $this->setting['pay_mid'],
            "total_amount" => $param['money'],
            "currency" => "CNY",
            "subject" => $param['subject'],
            "body" => $param['title'],
            "valid_time" => "600",
            "trade_time" => $time,
            "notify_url" => $param['notify_url'],
            "risk_info" => json_encode(['ip' => $ip]),
        ];
        $payload = [
            "app_id" => $this->setting['pay_appid'],
            "format" => "JSON",
            "charset" => "utf-8",
            "sign_type" => "MD5",
            "timestamp" => $time,
            "version" => "1.0",
            "merchant_id" => $this->setting['pay_mid'],
            "uid" => $param['openid'],
            "biz_content" => json_encode($data),
            "method" => "tp.trade.create"
        ];
        $sign_list = [];
        foreach ($payload as $key => $value) {
            $sign_list[$key] = $key . "=" . $value;
        }
        ksort($sign_list);
        $a = implode("&", $sign_list);
        $payload["sign"] = md5($a . $this->setting['pay_secret']);
        $header = ['Content-Type:application/x-www-form-urlencoded'];
        $res = $this->curl->post($url, http_build_query($payload), $header);
        $res = json_decode($res);

        if (empty($res) || $res->response->code != 10000) {
            exception('系统异常');
        }
        $config = [
            // 沙箱模式
            'debug'       => false,
            // 应用ID
            'appid'       => $this->setting['alipay_app_id'],
            // 支付宝公钥(1行填写)
            'public_key'  => $this->setting['alipay_public_secret'],
//               ,
            // 支付宝私钥(1行填写)
            'private_key' => $this->setting['alipay_private_secret'],
            // 支付成功通知地址
        ];
        $config['notify_url'] = $param['notify_url'];
        try {
            // 实例支付对象
            $pay = \We::AliPayApp($config);
            $result = $pay->apply([
                'out_trade_no' =>  $res->response->trade_no, // 商户订单号
                'total_amount' => round($param['money']), // 支付金额
                'subject'      => $param['subject'], // 支付订单描述
                'body' =>  $param['title'],
            ]);
        } catch (\Exception $e) {
            explode($e->getMessage());
        }
        $data = [
            'app_id' => $this->setting['pay_appid'],
            'method' => 'tp.trade.confirm',
            'sign' => '',
            'sign_type' => 'MD5',
            'timestamp' =>(string) $time ,
            'risk_info'  => '',
            'trade_no' => $res->response->trade_no,
            'merchant_id' => $this->setting['pay_mid'],
            'uid' => $param['openid'],
            'total_amount' => $param['money'],
            'pay_channel' => 'ALIPAY_NO_SIGN',
            'pay_type' => 'ALIPAY_APP',
            'params' => json_encode(['url' => $result]),
        ];
        $sign_array = [
            "app_id={$data['app_id']}",
            "sign_type={$data['sign_type']}",
            "timestamp={$data['timestamp']}",
            "trade_no={$data['trade_no']}",
            "merchant_id={$data['merchant_id']}",
            "uid={$data['uid']}",
            "total_amount={$data['total_amount']}",
            "params={$data['params']}",
        ];
        sort($sign_array);
        $sign_array_str = implode("&", $sign_array);
        $data["sign"] = md5($sign_array_str . $this->setting['pay_secret']);
        return $data;




    }

    public function microtime_float()
    {
        list($usec, $sec) = explode(" ", microtime());
        return (string)  ((float)$usec + (float)$sec);
    }

}
