<?php

namespace app\shop\controller\api;

use app\shop\logic\shop\miniapp\Miniapp;
use app\shop\logic\shop\TxSms;
use app\shop\model\shop\UserModel;
use app\common\library\token\ApiToken;
use app\shop\model\sms\ShopMemberMobileCode;
use think\Exception;

class Passport extends ShopCommon
{

    /**
     * 手机号登录
     * @param $mobile string 手机号
     * @param $code string 验证码
     */
    public function mobile()
    {
        $mobile = (string)$this->request->param("mobile");
        $code = (string)$this->request->param("sms_code");
        if (empty($mobile) || empty($code)) {
            $this->warning("用户名或验证码错误");
        }
        $ShopMemberMobileCode = new ShopMemberMobileCode();
        if ($ShopMemberMobileCode->checkCode($mobile, $code, $this->appId) == false) {
            $this->warning("用户名或验证码错误");
        }
        $UserModel = new UserModel();
        if (!$UserModel->findUser(0, $mobile, $this->appId)->getUser()) {
            //注册
            $pid = (int)$this->request->param("pid");
            $user_id = $UserModel->register($mobile, $this->appId, $this->device, '', $pid);
        } else {
            $user_id = $UserModel->getUser()->user_id;
            $UserModel = new UserModel();
            $UserModel->save([
                'last_time' => request()->time(),
                'last_ip' => request()->ip(),
                'last_device' => $this->device,
            ], ['user_id' => $user_id]);
        }
        $open_id = (string)$this->request->param("open_id");
        $res = Miniapp::makeModule($this->device, $this->appId)->checkOpenId($open_id);
        if ($res == false) {
            $this->warning("小程序登录失败请联系客服");
        }
        $MiniAppToken = new ApiToken();
        $userToken = $MiniAppToken->getUserAuthCodeToken($user_id, $res['open_id']);
        $this->datas['user_token'] = $userToken;
        $this->datas['user_id'] = $user_id;
    }


    /**
     * 手机号授权登录（微信）
     */
    public function authMobile()
    {
        $data['iv'] = (string) $this->request->param("iv", '', '');
        $data['encryptedData'] = (string)$this->request->param("encrypted_data", '', '');
        $data['openId'] = (string)$this->request->param("open_id");
        $data['code'] = (string)$this->request->param("code");
        $res = Miniapp::makeModule($this->device, $this->appId)->getMobile($data);
        if ($res == false) $this->warning("授权失败请使用用户名密码登录");
        $mobile = $res['mobile'];
        $UserModel = new UserModel();
        if (!$UserModel->findUser(0, $mobile, $this->appId)->getUser()) {
            //注册
            $pid = (int)$this->request->param("pid");
            $user_id = $UserModel->register($mobile, $this->appId, $this->device, $pid);
        } else {
            $user_id = $UserModel->getUser()->user_id;
            $UserModel = new UserModel();
            $UserModel->save([
                'last_time' => request()->time(),
                'last_device' => $this->device,
                'last_ip' => request()->ip(),
            ], ['user_id' => $user_id]);
        }
        $open_id = (string)$this->request->param("open_id");
        $res = Miniapp::makeModule($this->device, $this->appId)->checkOpenId($open_id);
        if ($res == false) {
            $this->warning("小程序登录失败请联系客服");
        }
        $MiniAppToken = new ApiToken();
        $userToken = $MiniAppToken->getUserAuthCodeToken($user_id, $res['open_id']);
        $this->datas['user_token'] = $userToken;
        $this->datas['user_id'] = $user_id;
    }


    /**
     * 发送短信验证码
     */
    public function getSmsCode()
    {
        $mobile = (string)$this->request->param("mobile");
        if (empty($mobile) || isMobile($mobile) == false) {
            $this->warning("请输入正确的手机号");
        }
        $ShopMemberMobileCode = new ShopMemberMobileCode();
        $res = $ShopMemberMobileCode->sendCode($mobile, $this->appId);
        if ($res == false) {
            $this->warning($ShopMemberMobileCode->getError());
        }

    }

}

