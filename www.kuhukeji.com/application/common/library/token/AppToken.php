<?php

namespace app\common\library\token;

/**
 * 小程序后台所有token
 * Class AppToken
 * @package app\common\library\token
 */
class AppToken
{

    private $expireTime = 365;
    private $importStr = '&&&';
    private $token ;
    private $nowTime;

    public function __construct() {
        $this->token = config('tokenkey.app');
        $this->nowTime = request()->time();
    }

    // +---------------------------------------------------------------------
    // |  用户登录处理
    // +---------------------------------------------------------------------

    public function getMemberAuthCode($memberId) {
        $expireTime = $this->nowTime + 60 * 24 * $this->expireTime;
        $token = $memberId . $this->importStr . $this->token . $this->importStr . $expireTime. $this->importStr . 'member';
        return  authcode($token);
    }

    /**
     * 解密memberAuthCode
     * @param string $code      加密的code
     */
    public function getMemberAuthDeCode($code){
        $auth =   authcode($code,"DECODE");
        if($auth == false){
            return false;
        }
        @list($id,$key,$extime,$type) = explode($this->importStr,$auth);
        if($type != 'member') return false;
        if($id <= 0 || $key != $this->token ){
            return false;
        }
        return [
            'member_id' => $id,
        ];
    }




    // +---------------------------------------------------------------------
    // |  小程序管理
    // +---------------------------------------------------------------------

    /**
     * 管理员登录
     * @param int $appId 登录的小程序ID
     * @param int $manageId 管理员ID 用户管理员为超级管理员 id 为0
     * @return bool|string
     */
    public function getAppAuthCode($appId,$manageId=0) {
        $expireTime = $this->nowTime + 60 * 24 * $this->expireTime;
        $token = $appId . $this->importStr .$manageId . $this->importStr .   $this->token . $this->importStr . $expireTime.$this->importStr .'miniapp' ;
        return  authcode($token);
    }

    /**
     * 解密memberAuthCode
     * @param string $code     加密的code
     */
    public function getAppAuthDeCode($code){
        $auth =   authcode($code,"DECODE");

        if($auth == false){
            return false;
        }

        @list($id,$manageId,$key,$extime,$type) = explode($this->importStr,$auth);
        if($type != 'miniapp') return false;

        if($id <= 0 || $key != $this->token ){
            return false;
        }
        return [
            'app_id' => $id,
            'manage_id' => $manageId,
        ];

    }

    // +---------------------------------------------------------------------
    // |  小程序管理总后台管理 自营平台类型的
    // +---------------------------------------------------------------------

    /**
     * 管理员登录
     * @param int $appDir 登录的小程序类型
     * @param int $manageId 小程序的私有管理员
     * @return bool|string
     */
    public function getAppAdminAuthCode($appDir,$manageId=0) {
        $expireTime = $this->nowTime + 60 * 24 * $this->expireTime;
        $token = $appDir . $this->importStr .$manageId . $this->importStr .   $this->token . $this->importStr . $expireTime.$this->importStr .'miniappAdmin' ;
        return  authcode($token);
    }

    /**
     * 解密memberAuthCode
     * @param string $code     加密的code
     */
    public function getAppAdminAuthDeCode($code){
        $auth =   authcode($code,"DECODE");
        if($auth == false){
            return false;
        }

        @list($dir,$manage_id,$key,$extime,$type) = explode($this->importStr,$auth);
        if($type != 'miniappAdmin') return false;
        if( empty($dir)  || $key != $this->token ){
            return false;
        }
        return [
            'app_dir' => $dir,
            'manage_id' => $manage_id,
        ];

    }


    /**
     * 前端商户入驻
     * @param int $appDir 登录的小程序类型
     * @param int $member_id 管理员ID 后台的管理员ID
     * @return bool|string
     */
    public function getAppWebAuthCode($appDir,$member_id=0) {
        $expireTime = $this->nowTime + 60 * 24 * $this->expireTime;
        $token = $appDir . $this->importStr .$member_id . $this->importStr .   $this->token . $this->importStr . $expireTime.$this->importStr .'miniappWeb' ;
        return  authcode($token);
    }

    /**
     * 解密memberAuthCode
     * @param string $code     加密的code
     */
    public function getAppWebAuthDeCode($code){
        $auth =   authcode($code,"DECODE");
        if($auth == false){
            return false;
        }

        @list($dir,$member_id,$key,$extime,$type) = explode($this->importStr,$auth);
        if($type != 'miniappWeb') return false;
        if(empty($dir) || $key != $this->token ){
            return false;
        }
        return [
            'app_dir' => $dir,
            'member_id' => $member_id,
        ];
    }


}
