<?php

namespace app\common\model\member;

use app\common\model\CommonModel;

class MemberModel extends CommonModel
{
    protected $pk = 'member_id';
    protected $name = 'member';
    protected $insert = ['add_time', 'add_ip'];
    protected $update = ['last_time', 'last_ip'];


    protected $rules = [
        ['mobile', 'max:11', '请输入合法的手机号'],
        ['password', 'max:32', '密码最多不能超过32个字符'],
        ['is_lock', 'number', '锁定必须是数字'],
    ];


    /**
     * @param bool $mobile
     * @param bool $password
     * @return array|bool
     */
    public function dataFilter($mobile = false,$password = false)
    {
        $request = request();
        $param = [
            "has_app_num" => (int)$request->param("has_app_num", "0"),//已创建的APP数量
            "max_app_num" => (string)$request->param("max_app_num", ""),//最大APP数量
            "is_lock" => (int)$request->param("is_lock", "0"),//锁定
            "agency_id" => (int)$request->param("agency_id", "0"),//代理商ID 0代表没有代理商
        ];
        if ($mobile) {
            $mobile = (string)$request->param("mobile", "");//用户名
            if(!isMobile($mobile)){
                $this->error = '请输入合法的手机号';
                return false;
            }
            if($this->where("mobile",$mobile)->find()){
                $this->error = '用户已存在';
                return false;
            }

            $param['mobile'] = $mobile;
        }
        if ($password) {
            $password =  (string)$request->param("password", "");//密码
            if($password){
                $param['password'] = md5($password);
            }

        }
        return $param;
    }



    /**
     * 用户登录验证
     * @param $mobile string 用户名(手机号)
     * @param $password string 密码
     * @return array|bool  成功返回用户信息 否则返回false
     */
    public function checkLogin($mobile, $password, $ip)
    {
        if (!$mobile) {
            $this->error = '用户名或密码错误';
            return false;
        }

        if (!$password) {
            $this->error = '用户名或密码错误';
            return false;
        }

        if (!$member = $this->checkMobileExist($mobile)) {
            $this->error = '用户名或密码错误';
            return false;
        }

        if ($member->password != md5($password)) {
            $this->error = '用户名或密码错误';
            return false;
        }

        if ($member->is_lock != 0){
            $this->error = '当前用户已锁定,禁止登录！';
            return false;
        }

        $this->save(['last_ip'=>$ip,'last_time'=>time()],['member_id'=>$member->member_id]);

        $return = [
            'info' => [
                'member_id' => $member->member_id,
                'username' => $member->mobile,
                'mobile' => $member->mobile,
            ],
        ];

        return $return;
    }


    /**
     * 注册用户
     * @param $mobile string 用户名(手机号)
     * @param $password string 密码
     * @return array|bool  成功返回true 否则返回false
     */
    public function register($mobile, $password, $ip)
    {
        if (!isMobile($mobile)) {
            $this->error = '当前手机号码/用户名不合法!';
            return false;
        }
        if (!$password) {
            $this->error = '密码必须填写!';
            return false;
        }
        if ($this->checkMobileExist($mobile)) {
            $this->error = '当前用户名/手机号码已注册!';
            return false;
        }
        $data = [
            'mobile'=>$mobile,
            'password'=>md5($password),
            'max_app_num' =>config("limitnum.create_app_num"),
        ];
        $this->save($data);
        $data['member_id'] =  $this->member_id;
        return $data;
    }


    /**
     * 检查手机号码是否已存在
     * @param $mobile string 用户名
     * @return bool
     */
    public function checkMobileExist($mobile){
        return $this->where(['mobile'=>$mobile])->find();
    }


}
