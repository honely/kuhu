<?php

namespace app\common\library;


class MiniAppToken{

    private $ExpireTIme = 86400; //一天
    private $nowTime;
    public function __construct() {
        $this->nowTime = request()->time();
    }

    // +---------------------------------------------------------------------
    // |  获得接口Token
    // +---------------------------------------------------------------------

    /**
     * api 获得token
     */
    public function getAuthCodeToken($appId,$memberId,$expireTime,$device){
        $key = config("tokenkey.miniapp_website_key");
        $time = $this->nowTime + $this->ExpireTIme;
        $token = "{$appId}|{$memberId}|{$expireTime}|{$device}|{$key}|{$time}";
        return  authcode($token);
    }

    public function getAuthDeCodeToken($token){
        $token =   authcode($token,"DECODE");
        if($token == false){
            return false;
        }
        $_key = config("tokenkey.miniapp_website_key");
        @list($appId,$memberId,$expireTime,$device,$key,$time) = explode("|",$token);
        if($appId <= 0  || $key != $_key ){
            return false;
        }
        return [
            'app_id' => $appId,
            'member_id' => $memberId,
            'expire_time' => $expireTime,
            'device' => $device,
        ];
    }




    // +---------------------------------------------------------------------
    // |  获得接口Token
    // +---------------------------------------------------------------------

    /**
     * api 获得token
     */
    public function getUserAuthCodeToken($userId,$openId=''){
        $key = config("tokenkey.miniapp_api_key");
        $time = $this->nowTime + $this->ExpireTIme;
        $token = "{$userId}|{$openId}|{$key}|{$time}";

        return  authcode($token);
    }

    public function getUserAuthDeCodeToken($token){
        $token =   authcode($token,"DECODE");
        if($token == false){
            return false;
        }
        $_key = config("tokenkey.miniapp_api_key");
        @list($userId,$openId,$key,$time) = explode("|",$token);
        if($userId <= 0  || $key != $_key ){
            return false;
        }
        return [
            'user_id' => $userId,
            'open_id' => $openId,
        ];
    }

}
