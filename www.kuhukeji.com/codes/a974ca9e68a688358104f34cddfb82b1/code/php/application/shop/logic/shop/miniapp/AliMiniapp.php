<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/3/7 0007
 * Time: 13:26
 */

namespace app\shop\logic\shop\miniapp;


use Alipay\AlipayRequestFactory;

use Alipay\AopClient;
use app\common\model\app\OpenSettingModel;
use app\shop\model\shop\UserOpenIdModel;
use BaiduMiniProgram\BaiduClient;
use think\Exception;
use We;


class AliMiniapp extends MiniappCommon
{


    public function __construct($appId, $device)
    {
        parent::__construct($appId, $device);
        $keyPair = \Alipay\Key\AlipayKeyPair::create(
            "-----BEGIN RSA PRIVATE KEY-----
{$this->appSetting['privatekey']}
-----END RSA PRIVATE KEY-----",
            "-----BEGIN PUBLIC KEY-----
 {$this->appSetting['publickey']}
-----END PUBLIC KEY-----"
        );
        $this->appId = $appId;
        $this->weApp = new \Alipay\AopClient($this->appSetting['appid'], $keyPair);
    }

    /**
     * 获得登录验证信息
     */
    public function getSessionKey($code, $openId = "")
    {
        $sessionKey = "";
        if (empty($code) && empty($openId)) return false;
        if (!empty($code)) {
            $request = AlipayRequestFactory::create("alipay.system.oauth.token", [
                'grant_type' => 'authorization_code',
                'code' => $code
            ]);
            try {
                $data = $this->weApp->execute($request)->getData();
                $openId = $data['user_id'];
                $sessionKey = $data['refresh_token'];
            } catch (\Exception $ex) {
                return false;
            }
        }
        $UserOpenIdModel = new UserOpenIdModel();
        $userOpen = $UserOpenIdModel->where("type", 3)
            ->where("app_id", $this->appId)->where("open_id", $openId)->find();
        if (empty($userOpen)) {
            $UserOpenIdModel->save([
                'app_id' => $this->appId,
                'open_id' => $openId,
                'type' => 3,
                'session_key' => $sessionKey,
            ]);
        } else {
            if (!empty($sessionKey)) {
                $UserOpenIdModel->save(['session_key' => $sessionKey], ['open_user_id' => $userOpen->open_user_id]);
            } else {
                $sessionKey = $userOpen->session_key;
            }
        }
        return [
            'open_id' => $openId,
            'session_key' => $sessionKey,
        ];

    }

    /**
     * checkOpenId
     */
    public function checkOpenId($openId)
    {
        $UserOpenIdModel = new UserOpenIdModel();
        $userOpen = $UserOpenIdModel->where("type", 3)
            ->where("app_id", $this->appId)->where("open_id", $openId)->find();
        if (empty($userOpen)) return false;
        return ['open_id' => $userOpen->open_id];
    }

    /**
     * 创建支付信息
     * $param = [
     *      title         测试商品
     *      subject       副标题
     *      openid        第三方ID
     *      notify_url    支付成功通知地址
     *      return_url    网页支付回跳地址
     *      order_id      订单号
     *      money         支付金额
     * ];
     */
    public function createOrder($param)
    {
        // 创建接口实例
        // 组装参数，可以参考官方商户文档
        $request = AlipayRequestFactory::create("alipay.trade.create", [
            'notify_url' => $param['notify_url'],
            'biz_content' => [
                'body' => $param['title'], // 对一笔交易的具体描述信息。如果是多种商品，请将商品描述字符串累加
                'subject' => $param['subject'], // 商品的标题 / 交易标题 / 订单标题 / 订单关键字等
                'out_trade_no' => date("YmdHis") . $param['order_id'], // 商户网站唯一订单号
                'total_amount' => moneyFormat($param['money']), // 订单总金额，单位为元，精确到小数点后两位，取值范围 [0.01,100000000]
                'buyer_id' => $param['openid'],
            ],
        ]);
        try {
            $data = $this->weApp->execute($request)->getData();
            return [
                'order_info' => $data['trade_no'],
                'form_id' => '',
            ];
        } catch (\Exception $e) {
            //继续向外抛出
            throw  new  Exception($e->getMessage());
        }

    }


    public function checkCallback($param = null)
    {
        $request = request();
        $param = array(
            'gmt_create' => $request->param('gmt_create'),
            'charset' => $request->param('charset'),
            'seller_email' => $request->param('seller_email'),
            'subject' => $request->param('subject'),
            'sign' => $request->param('sign'),
            'body' => $request->param('body'),
            'buyer_id' => $request->param('buyer_id'),
            'invoice_amount' => $request->param('invoice_amount'),
            'notify_id' => $request->param('notify_id'),
            'fund_bill_list' => $request->param('fund_bill_list'),
            'notify_type' => $request->param('notify_type'),
            'trade_status' => $request->param('trade_status'),
            'receipt_amount' => $request->param('receipt_amount'),
            'buyer_pay_amount' => $request->param('buyer_pay_amount'),
            'app_id' => $request->param('app_id'),
            'sign_type' => $request->param('sign_type'),
            'seller_id' => $request->param('seller_id'),
            'gmt_payment' => $request->param('gmt_payment'),
            'notify_time' => $request->param('notify_time'),
            'version' => $request->param('version'),
            'out_trade_no' => $request->param('out_trade_no'),
            'total_amount' => $request->param('total_amount'),
            'trade_no' => $request->param('trade_no'),
            'auth_app_id' => $request->param('auth_app_id'),
            'buyer_logon_id' => $request->param('buyer_logon_id'),
            'point_amount' => $request->param('point_amount'),
        );
        ob_start(); // 启动输出缓冲区
        try {
            $passed = $this->weApp->verify($param); // 验证支付宝服务器发来的参数数据签名
        } catch (\Exception $ex) {
            $passed = null;
            printf('%s | %s' . PHP_EOL, get_class($ex), $ex->getMessage()); // 验证过程发生错误，打印异常信息
        }
        if ($passed) {
            return [
                'order_info' => $param,
            ];
        }
        return false;
        ob_get_clean();
    }

    public function response()
    {
        return "success";
    }

    public function refund($param)
    {
        $config = [
            'debug' => false,
            'appid' => $this->appSetting['appid'],
            'public_key' => SecurityEditorHtml($this->appSetting['publickey']),
            'private_key' => SecurityEditorHtml($this->appSetting['privatekey']),
        ];
        $out_trade_no = $param->out_trade_no;
        $refund_fee = round($param->money/100,2);
        try {
            $pay = We::AliPayApp($config);
            $result = $pay->refund($out_trade_no, $refund_fee);
            return true;
        } catch (\Exception $e) {
            return false;
        }
    }
}
