<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/3/7 0007
 * Time: 13:26
 */

namespace app\shop\logic\shop\miniapp;


use app\common\model\app\OpenSettingModel;
use app\shop\model\shop\UserOpenIdModel;
use JiaweiXS\WeApp\WeApp;
use think\Exception;
use WeMini\Crypt;

class WeixinMiniapp extends MiniappCommon
{

    protected $weApp;
    protected $error;
    protected $appId;

    public function __construct($appId, $device)
    {

        parent::__construct($appId, $device);
        $token = config("tokenkey.admin");
        if (is_dir(ROOT_PATH . "runtime/{$token}") == false) {
            mkdir(ROOT_PATH . "runtime/{$token}");
        }
        $this->weApp = new WeApp($this->appSetting['appid'], $this->appSetting['appsecret'], ROOT_PATH . "runtime/{$token}");
    }

    /**
     * 获得登录验证信息
     */
    public function getSessionKey($code, $openId = "")
    {
        if (empty($openId) && empty($code)) return false;
        $sessionKey = '';

        if (!empty($code)) {
            try {
                $res = json_decode(json_encode((new Crypt($this->appSetting))->session($code)));
            } catch (Exception $exception) {
                return false;
            }
            $openId = $res->openid;
            $sessionKey = $res->session_key;
        }
        $UserOpenIdModel = new UserOpenIdModel();
        $userOpen = $UserOpenIdModel->where("app_id", $this->appId)->where("open_id", $openId)->find();
        if (empty($userOpen)) {
            $UserOpenIdModel->save([
                'app_id' => $this->appId,
                'open_id' => $openId,
                'type' => 2,
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
            'session_key' => $sessionKey,
            'open_id' => $openId,
        ];

    }


    /**
     * checkOpenId
     */
    public function checkOpenId($openId)
    {
        $UserOpenIdModel = new UserOpenIdModel();
        $userOpen = $UserOpenIdModel->where("type", 2)
            ->where("app_id", $this->appId)->where("open_id", $openId)->find();
        if (empty($userOpen)) return false;

        return ['open_id' => $userOpen->open_id];
    }


    /**
     * 解密手机号
     */
    public function getMobile($param)
    {
        $iv = $param['iv'];
        $encryptedData = $param['encryptedData'];
        $openId = $param['openId'];
        $code = $param['code'];
        $res = $this->getSessionKey($code, $openId);
        if ($res == false) return false;
        $data = $this->decryptData($encryptedData, $iv, $res['session_key']);
        if (empty($data->purePhoneNumber)) {
            return false;
        }
        return [
            'mobile' => $data->purePhoneNumber,
            'open_id' => $res['open_id'],
        ];
    }

    /**
     * 创建支付信息
     * $param
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
        $options = [
            'attach' => $param['order_id'],
            'body' => $param['title'],
            'out_trade_no' =>  $param['order_id'] . time(),
            'total_fee' => $param['money'],
            'openid' => $param['openid'],
            'trade_type' => 'JSAPI',
            'notify_url' => $param['notify_url'],
            'spbill_create_ip' => request()->ip(),
        ];

        $this->appSetting = [
            'appid' => $this->appSetting['appid'],
            'appsecret' => $this->appSetting['appsecret'],
            // 配置商户支付参数（可选，在使用支付功能时需要）
            'mch_id' => $this->appSetting['merchantid'],
            'mch_key' => $this->appSetting['merchantsecret'],
        ];
        try {
            $wechat = new \WeChat\Pay($this->appSetting);
            // 生成预支付码
            $result = $wechat->createOrder($options);
            $options = $wechat->createParamsForJsApi($result['prepay_id']);
            return [
                'order_info' => $options,
                'form_id' => $result['prepay_id'],
            ];
        } catch (\Exception $e) {
            //继续向外抛出
            throw  new  Exception($e->getMessage());
        }
    }

    /**
     * 检验数据的真实性，并且获取解密后的明文.
     * @param $encryptedData string 加密的用户数据
     * @param $iv string 与用户数据一同返回的初始向量
     * @param $data string 解密后的原文
     * @return int 成功0，失败返回对应的错误码
     */
    public function decryptData($encryptedData, $iv, $sessionKey)
    {
        if (strlen($sessionKey) != 24) {
            return -4001;
        }
        $aesKey = base64_decode($sessionKey);
        if (strlen($iv) != 24) {
            return -4002;
        }
        $aesIV = base64_decode($iv);
        $aesCipher = base64_decode($encryptedData);
        $result = openssl_decrypt($aesCipher, "AES-128-CBC", $aesKey, 1, $aesIV);
        $dataObj = json_decode($result);
        if ($dataObj == NULL) {
            return -4003;
        }
        if ($dataObj->watermark->appid != $this->appSetting['appid']) {
            return -4003;
        }
        return $dataObj;
    }

    /**
     * 验证Callback
     */
    public function checkCallback($param = null)
    {
        $this->appSetting['mch_id'] = $this->appSetting['merchantid'];
        $this->appSetting['mch_key'] = $this->appSetting['merchantsecret'];
        try {

            $wechat = new \WeChat\Pay($this->appSetting);
            // 4. 获取通知参数
            $data = $wechat->getNotify();
            if ($data['result_code'] === 'SUCCESS' && $data['result_code'] === 'SUCCESS') {
                return [
                    'order_info' => $data,
                ];
            }
        } catch (\Exception $e) {

            return false;
        }
    }

    /**
     * 回调相应结果
     */
    public function response()
    {
        $wechat = new \WeChat\Pay($this->appSetting);
        return $wechat->getNotifySuccessReply();
    }

    /**
     * 暂时只获取推广码
     */
    public function getQrcode($pid)
    {
        $qrcode = $this->weApp->getQRCode();
        $res_array = $qrcode->getQRCodeB("pid={$pid}", "pages/index/index", $width = null, $auto_color = null, $line_color = null);
        $fileDir = "/cdn/image/" . date("Ymd", time());
        $fileName = "/" . md5(uniqid(true)) . ".png";
        if (is_dir(ROOT_PATH . $fileDir) == false) {
            mkdir(ROOT_PATH . $fileDir);
        }
        $file = ROOT_PATH . $fileDir . $fileName;
        file_put_contents($file, $res_array);
        return request()->domain() . $fileDir . $fileName;;
    }

    /**
     * @param $param
     * @return bool
     * 退款
     */
    public function refund($param)
    {
        $this->appSetting['mch_id'] = $this->appSetting['merchantid'];
        $this->appSetting['mch_key'] = $this->appSetting['merchantsecret'];
        $this->getSslFile();
        try {
        $wechat = new \WeChat\Pay($this->appSetting);
        $options = [
            'transaction_id' => $param->transaction_id,
            'out_refund_no' => date("YmdHis", time()) . rand(1000, 2000),
            'total_fee' => $param->total_fee,
            'refund_fee' => $param->money,
        ];
        $result = $wechat->createRefund($options);
        } catch (\Exception $e) {
            return false;
        }
        return true;
    }


    /**
     * 获取证书文件 //地址为
     */
    private function getSslFile()
    {
        $dir = ROOT_PATH . "/cdn/file/";

        $update = [];
        $date = date("Ymd", time());
        $return = [];
        if (file_exists($this->appSetting['cert_dir'])) {
            $this->appSetting['ssl_cer'] = $this->appSetting['cert_dir'];
        } else {
            if (!is_dir($dir . $date)) {
                mkdir($dir . $date);
            }
            $fileNmae = md5(uniqid(true));
            $file = $dir . $date . DS . $fileNmae . ".pem";
            $update['cert_dir'] = $file;
            $test = "-----BEGIN CERTIFICATE-----\r\n{$this->appSetting['cert']}\r\n-----END CERTIFICATE-----";

            file_put_contents($file,$test);
            $this->appSetting['ssl_cer'] = $file;
        }
        if (file_exists($this->appSetting['pem_dir'])) {
            $this->appSetting['ssl_key'] = $this->appSetting['pem_dir'];
        } else {
            if (!is_dir($dir . $date)) {
                mkdir($dir . $date);
            }
            $fileNmae = md5(uniqid(true));
            $file = $dir . $date . DS . $fileNmae . ".pem";
            $update['cert_dir'] = $file;
            $test = "-----BEGIN PRIVATE KEY-----\r\n{$this->appSetting['pem']}\r\n-----END PRIVATE KEY-----";
            file_put_contents($file,$test);
            $this->appSetting['ssl_key'] = $file;
        }
        if (!empty($update)) {
            $OpenSettingModel = new OpenSettingModel();
            $setting = [
                'appid' => $this->appSetting['appid'],
                'appsecret' => $this->appSetting['appsecret'],
                'merchantid' => $this->appSetting['merchantid'],
                'merchantsecret' => $this->appSetting['merchantsecret'],
                'cert' => $this->appSetting['cert'],
                'pem' => $this->appSetting['pem'],
                'cert_dir' =>  $this->appSetting['ssl_cer'],
                'pem_dir' =>  $this->appSetting['ssl_key'],
            ];
            $OpenSettingModel->setAppId($this->appId)->setSetting("weixin", $setting);
        }
    }


}
