<?php

namespace app\common\library\token;

/**
 * 总后台操作
 * Class AdminToken
 * @package app\common\library\token\
 */
class AdminToken {

    private $importStr = '&&&';
    private $token ;
    private $nowTime;
    public function __construct() {
        $this->token = config('tokenkey.admin');
        $this->nowTime = request()->time();
    }

    // +---------------------------------------------------------------------
    // |
    // +---------------------------------------------------------------------

    public function getAdminAuthCodeToken($adminId){
        $token  = $adminId . $this->importStr  . $this->token . $this->importStr  . $this->nowTime.$this->importStr  .'admin';
        return  authcode($token);
    }
    public function getAdminAuthDeCodeToken($token){
        $token =   authcode($token,"DECODE");
        if($token == false){
            return false;
        }

        @list($adminId,$key,$time,$type) = explode($this->importStr,$token);
        if($type != 'admin') return false;
        if($adminId <= 0  || $key != $this->token  ){
            return false;
        }
        return [
            'admin_id' => $adminId,
        ];
    }


}

