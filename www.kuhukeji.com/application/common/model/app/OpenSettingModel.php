<?php

namespace app\common\model\app;

use app\common\model\CommonModel;

class OpenSettingModel extends CommonModel
{
    protected $pk = 'app_id';
    protected $name = 'app_open_setting';
    protected $type;


    protected $setting = [
        'weixin' => [   //微信配置信息
            'appid' => '',
            'appsecret' => '',
            'merchantid' => '',
            'merchantsecret' => '',
            'cert' => '',
            'pem' => '',
            'cert_dir' => '',
            'pem_dir'  => '',
        ],
        'h5' => [],
        'baidu' => [  //百度配置信息
            'appkey' => '',
            'appsecret' => '',
            'payappkey' => '',
            'dealId' => '',
            'privatekey' => '',
            'publickey' => '',
        ],
        'toutiao' => [
            'appid' => '',
            'secret' => '',
            'pay_mid' => '',
            'pay_appid' => '',
            'pay_secret' => '',
            'alipay_app_id' => '',
            'alipay_public_secret' => '',
            'alipay_private_secret' => '',
        ],
        'ali' => [  //阿里配置信息
            'appid' => '',
            'publickey' => '',
            'privatekey' => '',
            'aeskey' => '',
        ],
    ];


    protected $appId;

    /**
     * 设置应用ID
     */
    public function setAppId($appId)
    {
        $this->appId = $appId;
        return $this;
    }


    /**
     * 设置配置
     * @param $device
     */
    public function setSetting($device, $data)
    {
        $setting = [];
        $no = ["cert_dir","pem_dir"];
        foreach ($this->setting[$device] as $key => $val) {
            if(in_array($key,$no,true)){
                $setting[$key] = "";
            }else{
                if (empty($data[$key])) {
                    $this->error = "{$key}";
                    return false;
                }
                $setting[$key] = $data[$key];
            }
        }
        if($this->find($this->appId)){
            $this->save([$device=>json_encode($setting)],['app_id'=>$this->appId]);
        }else{
            $this->save([$device=>json_encode($setting),'app_id'=>$this->appId]);
        }
        return true;
    }

    /**
     * 获取配置
     * @param $device
     */
    public function getSetting($device)
    {
        return ((array)json_decode($this->where(['app_id' => $this->appId])->value($device), true)) +
            $this->setting[$device];
    }


    public function checkType($type)
    {
        $types = [
            'weixin' => 1,
            'ali' => 2,
            'baidu' => 3,
            'toutiao' => 4,
            'h5' => 5
        ];
        return !empty($types[$type]);
    }


}
