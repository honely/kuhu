<?php

namespace app\shop\logic\shop\miniapp;

class Miniapp
{

    static public function makeModule($device, $appId)
    {
        switch ($device) {
            case "weixin":
                return new WeixinMiniapp($appId, $device);
            case "ali" :
                return new AliMiniapp($appId, $device);
            case "baidu" :
                return new BaiduMiniapp($appId, $device);
            case "h5" :
                return new WebMiniapp($appId, $device);
            case "toutiao" :
                return new ToutiaoMini($appId, $device);
            default :
                return (new WeixinMiniapp($appId, $device))->setAppId($appId)->setDevice($device)->getSetting();
        }
    }

}
