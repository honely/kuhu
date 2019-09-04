<?php


namespace app\shop\logic\shop\miniapp;



use think\Exception;

class WebMiniapp extends MiniappCommon
{

    protected $autoGetSetting = false;

    public function __construct($appId, $device){
        parent::__construct($appId, $device);
    }

    /**
     * 下单支付
     */
    public function createOrder($param)
    {
        try {
            if ($param['pay_type'] == 'ali'){
                $this->device = "toutiao";
                $this->getSetting();
                return $this->aliWebPay($param);
            }
            $this->device = "weixin";
            $this->getSetting();
            return $this->weixinWebPay($param);
        }catch (Exception $exception){
            throw  new Exception($exception->getMessage());
        }
    }

    /**
     *  支付宝h5支付
     */
    private function aliWebPay($param){

        $config = [
            // 沙箱模式
            'debug'       => false,
            // 应用ID
            'appid'       => $this->appSetting['alipay_app_id'],
            // 支付宝公钥(1行填写)
            'public_key'  => SecurityEditorHtml($this->appSetting['alipay_public_secret']),
//               ,
            // 支付宝私钥(1行填写)
            'private_key' => SecurityEditorHtml($this->appSetting['alipay_private_secret']),
            // 支付成功通知地址
        ];
        $config['notify_url'] = $param['notify_url'];
        $config['return_url'] = $param['return_url'];
        try {
            // 实例支付对象
            $pay = \We::AliPayWap($config);
            $result = $pay->apply([
                'out_trade_no' => $param['order_id']  , //商户订单号
                'total_amount' => moneyFormat($param['money']),//支付金额
                'subject'      => $param['subject'],    //支付订单描述
                'body'      => $param['title'],         //支付订单描述
            ]);
            return [
                'order_info' => $result,
                'form_id' => '',
            ];
        } catch (\Exception $e) {
            // 异常处理
            throw new Exception($e->getMessage());
        }
    }

    /**
     *  微信h5支付
     */
    private function weixinWebPay($param){
        //获得微信支付参数
        $this->appSetting  ['cache_path'] = ROOT_PATH . '/runtime/cache';
        $this->appSetting = [
            'appid' => $this->appSetting['appid'],
            'appsecret' => $this->appSetting['appsecret'],
            // 配置商户支付参数（可选，在使用支付功能时需要）
            'mch_id' => $this->appSetting['merchantid'],
            'mch_key' => $this->appSetting['merchantsecret'],

        ];
        $time = time();
        $options = [
            'body'             =>  $param['title'],
            'out_trade_no'     =>  rand(1000, 9999) . $param['order_id'],
            'total_fee'        => $param['money'],
            'trade_type'       => 'MWEB',
            'notify_url'       => $param['notify_url'],
            'spbill_create_ip' => request()->ip(),
            'attach' => $param['order_id'],
            'time_start' =>  date("YmdHis",$time),
            'time_expire' => date("YmdHis", $time + 605),
            'goods_tag' =>$param['title'],
            'product_id' => $param['goods_id'],
        ];


        try {
            $wechat = new \WeChat\Pay($this->appSetting);
            $result = $wechat->createOrder($options);
            return [
                'order_info' => $result['mweb_url'],
                'form_id' => '',
            ];
        } catch (\Exception $e) {
            //继续向外抛出
            throw  new  Exception($e->getMessage());
        }

    }


}
