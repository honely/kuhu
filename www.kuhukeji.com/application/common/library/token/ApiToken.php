<?php

namespace app\common\library\token;


/**
 * 小程序token
 * Class MiniAppToken
 * @package app\common\library
 */

class ApiToken{

    private $expireTime = 365;
    private $token ;
    private $nowTime;
    public function __construct() {
        $this->nowTime = request()->time();
        $this->token = config('tokenkey.api');
    }

    // +---------------------------------------------------------------------
    // | 获得接口Token
    // +---------------------------------------------------------------------

    public function getAuthCodeToken($appId,$memberId,$expireTime,$device){
        $time = $this->nowTime + $this->expireTime;
        $token = "{$appId}|{$memberId}|{$expireTime}|{$device}|{$this->token}|{$time}";
        return  authcode($token);
    }

    public function getAuthDeCodeToken($token){
        $token =   authcode($token,"DECODE");
        if($token == false){
            return false;
        }
        @list($appId,$memberId,$expireTime,$device,$key,$time) = explode("|",$token);
        if($appId <= 0  || $key != $this->token ){
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
    // | 获得接口userToken
    // +---------------------------------------------------------------------

    public function getUserAuthCodeToken($userId,$openId=''){

        $time = $this->nowTime + $this->expireTime;
        $token = "{$userId}|{$openId}|{$this->token}|{$time}";

        return  authcode($token);
    }

    public function getUserAuthDeCodeToken($token){
        $token =   authcode($token,"DECODE");
        if($token == false){
            return false;
        }
        @list($userId,$openId,$key,$time) = explode("|",$token);
        if($userId <= 0  || $key != $this->token ){
            return false;
        }
        return [
            'user_id' => $userId,
            'open_id' => $openId,
        ];
    }

}
