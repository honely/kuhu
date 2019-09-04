<?php
namespace app\shop\controller\api;


use app\common\library\token\ApiToken;


class ShopCommon extends Common {

    protected $checkLogin = false;
    protected $userId=0;
    protected $openId=0;

    public function _initialize(){
        parent::_initialize();
        $this->checkUser($this->checkLogin);
    }

    protected function checkUser($type=false){
        $userToken = $this->request->param('user_token');
        $MiniAppToken= new ApiToken();
        $user = $MiniAppToken->getUserAuthDeCodeToken($userToken);
        if( $type == true && $user == false){
            $this->custom('',100,'未登录');
        }
        $this->openId = empty($user['open_id']) ? '' : $user['open_id'];
        $this->userId =  empty($user['user_id']) ? 0 : $user['user_id'];
    }

}
