<?php

namespace app\web\controller;

use app\common\library\Captcha;
use app\common\library\token\AppToken as CodeAuth;
use app\common\model\member\MemberModel;
use app\common\model\setting\SettingModel;
use app\common\model\sms\MemberMobileCode;
use app\web\controller\Common;

class Passport extends Common
{
    public function protocol()
    {
        return $this->fetch();
    }

    public function login()
    {

        if ($this->request->method() == 'POST') {
            $mobile = (string)$this->request->param('mobile');
            $password = (string)$this->request->param('password');
            $ip = $this->request->ip();
            $MemberModel = new MemberModel();
            if (!$member = $MemberModel->checkLogin($mobile, $password, $ip)) {
                $this->error($MemberModel->getError(), '', '100');
            }
            $CodeAuth = new CodeAuth();
            $auth = $CodeAuth->getMemberAuthCode($member['info']['member_id']);
            cookie("wyuMemberToken", $auth);
            $this->success('登录成功！', '/web/member/index', '200');
        } else {
            return $this->fetch();
        }
    }

    public function forget()
    {
        if ($this->request->method() == 'POST') {
            $mobile = (string)$this->request->param('mobile');
            $password = (string)$this->request->param('password');
            $ip = $this->request->ip();
            $code = $this->request->param('code');
            if (empty($code)) {
                $this->error('验证码不能为空');
            }
            if (!isMobile($mobile)) {
                $this->error('手机号码不正确');
            }
            if (empty($password)) {
                $this->error('密码不能为空');
            }
            $MemberModel = new MemberModel();
            if (!$member = $MemberModel->where('mobile', $mobile)->find()) {
                $this->error('用户不存在');
            }
            $MemberMobileCode = new MemberMobileCode();
            if (!$MemberMobileCode->checkCode($mobile, $code)) {
                $this->error('手机验证码不正确');
            }
            $MemberModel->save(['password' => md5($password)], ['member_id' => $member['member_id']]);
            $CodeAuth = new CodeAuth();
            $auth = $CodeAuth->getMemberAuthCode($member['member_id']);
            cookie("wyuMemberToken", $auth);
            $this->success('修改密码成功', '/web/member/index', '200');
        } else {
            $SettingModel = new SettingModel();
            $is_gee_open = 0;
            if ($res = $SettingModel->find('geetest')) {
                if ($res = json_decode($res['v'], true)) {
                    if (!empty($res)) {
                        $is_gee_open = $res['is_open'];
                    }
                }
            }
            $this->assign('is_gee_open', $is_gee_open);
            return $this->fetch();
        }

    }

    public function register()
    {
        if ($this->request->method() == 'POST') {
            $mobile = (string)$this->request->param('mobile');
            $password = (string)$this->request->param('password');
            $ip = $this->request->ip();
            $code = $this->request->param('code');
            if (empty($code)) {
                $this->error('验证码不能为空');
            }
            if (!isMobile($mobile)) {
                $this->error('手机号码不正确');
            }
            $MemberMobileCode = new MemberMobileCode();
            if (!$MemberMobileCode->checkCode($mobile, $code)) {
                $this->error('手机验证码不正确');
            }

            $MemberModel = new MemberModel();
            if (!$member = $MemberModel->register($mobile, $password, $ip)) {
                $this->error($MemberModel->getError(), '', '100');
            }
            $CodeAuth = new CodeAuth();
            $auth = $CodeAuth->getMemberAuthCode($member['member_id']);
            cookie("wyuMemberToken", $auth);
            $this->success('注册成功！', '/web/member/index', '200');
        } else {
            $SettingModel = new SettingModel();
            $is_gee_open = 0;
            if ($res = $SettingModel->find('geetest')) {
                if ($res = json_decode($res['v'], true)) {
                    if (!empty($res)) {
                        $is_gee_open = $res['is_open'];
                    }
                }
            }
            $this->assign('is_gee_open', $is_gee_open);
            return $this->fetch();
        }
    }


    /**
     * 发送短信验证码
     */
    public function sendSms()
    {
        $SettingModel = new SettingModel();
        $is_gee_open = 0;
        if ($res = $SettingModel->find('geetest')) {
            if ($res = json_decode($res['v'], true)) {
                if (!empty($res)) {
                    $is_gee_open = $res['is_open'];
                }
            }
        }

        if ($is_gee_open == 1 && !(new Captcha())->getResult()) {
            $this->error('请先拖动滑块验证');
            return;
        }

        $mobile = (string)$this->request->param("mobile");
        if (!isMobile($mobile)) {
            $this->error('手机号码错误');
        }
        $MemberMobileCode = new MemberMobileCode();
        $res = $MemberMobileCode->sendCode($mobile);
        if ($res == false) {
            $this->error($MemberMobileCode->getError(), '', 100);
        }
        $this->success('发送成功');

    }

    /**
     * 发送短信验证码
     */
    public function sendSms2()
    {
        $SettingModel = new SettingModel();
        $is_gee_open = 0;
        if ($res = $SettingModel->find('geetest')) {
            if ($res = json_decode($res['v'], true)) {
                if (!empty($res)) {
                    $is_gee_open = $res['is_open'];
                }
            }
        }
        if ($is_gee_open == 1 && !(new Captcha())->getResult()) {
            $this->error('请先拖动滑块验证');
            return;
        }
        $mobile = (string)$this->request->param("mobile");
        if (!isMobile($mobile)) {
            $this->error('手机号码错误');
        }

        $MemberModel = new MemberModel();
        if (!$member = $MemberModel->where('mobile', $mobile)->find()) {
            $this->error('用户不存在');
        }

        $MemberMobileCode = new MemberMobileCode();
        $res = $MemberMobileCode->sendCode($mobile);
        if ($res == false) {
            $this->error($MemberMobileCode->getError(), '', 100);
        }
        $this->success('发送成功');

    }


    /**
     * 开始验证
     */
    public function getStart()
    {
        echo (new Captcha())->getStart();
    }

}
