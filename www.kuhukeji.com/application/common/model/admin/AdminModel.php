<?php

namespace app\common\model\admin;

use app\common\library\token\AdminToken;
use app\common\model\CommonModel;
use app\common\model\setting\SettingModel;
class AdminModel extends CommonModel
{
    protected $pk = 'admin_id';
    protected $name = 'admin';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['username', 'require|max:32', '用户名最多不能超过32个字符'],
        //['password', 'require|max:32', '密码最多不能超过32个字符'],
        ['real_name', 'max:64', '姓名最多不能超过64个字符'],
        ['mobile', 'require|max:12', '请输入手机号|手机号最多不能超过12个字符'],
        ['is_lock', 'number', '是否锁定必须是数字'],
    ];


    public function dataFilter()
    {
        $request = request();
        $param = [
            "username" => (string)$request->param("username", ""),//用户名
            "real_name" => (string)$request->param("real_name", ""),//姓名
            "mobile" => (string)$request->param("mobile", "默认值"),//手机号
            "last_ip" => (string)$request->param("last_ip", ""),//最后登录IP
            "is_lock" => (int)$request->param("is_lock", "0"),//锁定
            "face" => (string)$request->param("face", ""),//头像
        ];
        if ($password = (string)$request->param("password", "")) {
            $param['password'] = md5($password);
        }
        return $param;
    }



    public function checkLogin($username, $password){
        if (empty($username)) {
            $this->error = "用户名或密码错误";
            return false;
        }
        if (empty($password)) {
            $this->error = "用户名或密码错误";
            return false;
        }
        $admin = $this->where("username", $username)->find();
        if (empty($admin)) {
            $this->error = "用户名或密码错误";
            return false;
        }

        if ($admin->password != md5($password)) {
            $this->error = "用户名或密码错误";
            return false;
        }
        $CodeAuth = new AdminToken();
        $SettingModel = new  SettingModel();
        $account = $SettingModel->getCache('wyu_auth');
        $t = time();
        $return = [
            'info' => [
                'admin_id' => $admin->admin_id,
                'face' => $admin->face,
                'username' => $admin->username,
                'mobile' => $admin->mobile,
            ],
            'account' => ['account_id'=>$account->account_id,'account_t'=>$t,'account_sign'=>md5($t . $account->account_id . $account->account_token)],
            'auth' => ['admin', 'setting'],
            'token' => $CodeAuth->getAdminAuthCodeToken($admin->admin_id),
        ];
        return $return;
    }

}
