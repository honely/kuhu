<?php

namespace app\shop\controller\api;

use app\shop\logic\shop\miniapp\Miniapp;
use app\shop\logic\shop\user\AgentLogic;
use app\shop\model\shop\RechargeModel;
use app\shop\model\shop\SettingModel;
use app\shop\model\shop\UserModel;
use app\shop\model\shop\UserMoneyLogModel;
use app\shop\model\shop\UserIntegralLogModel;
use app\shop\model\shop\UserIntegralModel;
use app\shop\model\shop\WithdrawApplyModel;
use think\Exception;

class User extends ShopCommon
{
    protected $checkLogin = true;

    /**
     * 会员信息
     */
    public function info()
    {
        $UserModel = new UserModel();
        if (!$user = $UserModel->findUser($this->userId)) {
            $this->warning("参数错误！");
        }
        $this->datas = [
            'user_id' => $this->userId,
            'mobile' => $UserModel->getUser()->mobile,
            'nickname' => $UserModel->getUser()->nickname,
            'face' => $UserModel->getUser()->face,
            'is_vip' => (int)$UserModel->checkVip(),
            'is_agent' => (int)$UserModel->checkAgent(),
            'agent_group' => $UserModel->getUser()->agent_group,
            'agent_group_mean' => getMean('agent_group')[$UserModel->getUser()->agent_group],
            'sex' => $UserModel->getUser()->sex,
            'sex_mean' => getMean('user_sex')[$UserModel->getUser()->sex],
            'birthday' => (string) $UserModel->getUser()->birthday,
        ];
    }


    /**
     *
     */


    /**
     * 个人中心
     */
    public function index()
    {
        $UserModel = new UserModel();
        $UserModel->findUser($this->userId);
        $user = $UserModel->getUser();
        if(empty($user)){
            $this->warning("参数错误！");
        }
        $SettingModel = new SettingModel();
        if (!$setting = $SettingModel->find($this->appId)) {
            $this->warning('尚未设置商家信息，请提醒管理员设置!');
        }
        $order_count = $UserModel->getOrderCounted();

        $this->datas = [
            'money' => moneyFormat($UserModel->getUserMoney(), true),
            'integral' => $UserModel->getUserIntegral(),
            'coupon_num' => $UserModel->getUserCouponNum(),
            'unpay_order_count' => $order_count['unpay_order_count'],
            'unshipping_order_count' => $order_count['unshipping_order_count'],
            'unconfirm_order_count' => $order_count['unconfirm_order_count'],
            'uncomment_order_count' => $order_count['uncomment_order_count'],
            'user_id' => $UserModel->getUser()->user_id,
            'mobile' => $UserModel->getUser()->mobile,
            'nickname' => $UserModel->getUser()->nickname,
            'face' => $UserModel->getUser()->face,
            'is_vip' => (int)$UserModel->checkVip(),
            'is_agent' => (int)$UserModel->checkAgent(),
            'agent_group' => $UserModel->getUser()->agent_group,
            'agent_group_mean' => getMean('agent_group')[$UserModel->getUser()->agent_group],
            'sex' => $UserModel->getUser()->sex,
            'sex_mean' => getMean('user_sex')[$UserModel->getUser()->sex],
            'birthday' =>  (string) $UserModel->getUser()->birthday,
            'is_fenxiao' => (int) ($setting->is_fenxiao == 1),
            'user_withdraw_limit' => moneyFormat($setting->user_withdraw_limit),
            'agent_withdraw_limit' => moneyFormat($setting->agent_withdraw_limit),
        ];

    }


    /**
     *  我的积分
     */
    public function myIntegral()
    {
        $where['user_id'] = $this->userId;
        $date_type = (string)$this->request->param('date_type', '');
        $date_area_start = (int)$this->request->param('date_area_start', '', "strtotime");
        $date_area_end = (int)$this->request->param('date_area_end', '', "strtotime");
        $type = (int)$this->request->param('type', -999);
        $UserIntegralModel = new UserIntegralModel();
        $UserIntegralLogModel = new UserIntegralLogModel();
        if ($type > 0) {
            $where['type'] = $type;
        }
        if ($date_type) {
            $date_trance = [
                1 => '-3 month',
                2 => '-1 month',
                3 => '-1 week',
            ];

            $listTmp = $UserIntegralLogModel->where($where)->whereTime('add_time', $date_trance[$date_type])->order('log_id desc')->page($this->page, $this->limit)->select();

        } elseif ($date_area_start && $date_area_end) {
            if ($date_area_end <= $date_area_start) {
                $this->warning('请选择合理的时间区间');
            }
            if (($date_area_end - $date_area_start) / 31536000 >= 1) {
                $this->warning('仅支持时间跨度12个月以内的查询');
            }
            $listTmp = $UserIntegralLogModel->where($where)->whereTime('add_time', 'between', [$date_area_start, $date_area_end])->order('log_id desc')->page($this->page, $this->limit)->select();
        } else {
            $listTmp = $UserIntegralLogModel->where($where)->order('log_id desc')->page($this->page, $this->limit)->select();
        }

        $type_means_tmp = getMean('integral_log_type');


        $list = [];
        $UserIntegralLogModel = new UserIntegralLogModel();
        foreach ($listTmp as $v) {
            $list[] = [
                'log_id' => $v->log_id,
                'num' => $v->num,
                'mark' => $UserIntegralLogModel->checkType($v->type),
                'type_mean' => $type_means_tmp[$v->type],
                'add_time' => date("Y-m-d H:i", $v->add_time),
            ];
        }
        $type_means = [];
        foreach ($type_means_tmp as $key => $vv) {
            $type_means[] = [
                'key' => $key,
                'val' => $vv
            ];
        }
        $this->datas = [
            'list' => $list,
            'isMore' => (int)($this->limit == count($list)),
            'integral' => $UserIntegralModel->getUserGold($this->userId, 2),
            'type_means' => $type_means,
        ];
    }


    //我的余额(我的钱包)
    public function myMoney()
    {
        $where['app_id'] = $this->appId;
        $where['user_id'] = $this->userId;
        $date_type = (int)$this->request->param('date_type', -999);
        $date_area_start = (int)$this->request->param('date_area_start', '', "strtotime");
        $date_area_end = (int)$this->request->param('date_area_end', '', "strtotime");
        $type = (int)$this->request->param('type', -999);
        $UserMoneyLogModel = new UserMoneyLogModel();
        if ($type > 0) {
            $where['type'] = $type;
        }
        if ($date_type > 0 && $date_type < 4) {
            $date_trance = [
                1 => '-3 month',
                2 => '-1 month',
                3 => '-1 week',
            ];
            $listTmp = $UserMoneyLogModel->where($where)->whereTime('add_time', $date_trance[$date_type])->order('log_id desc')->page($this->page, $this->limit)->select();
        } elseif ($date_area_start && $date_area_end) {
            if ($date_area_end <= $date_area_start) {
                $this->warning('请选择合理的时间区间');
            }
            if (($date_area_end - $date_area_start) / 31536000 >= 1) {
                $this->warning('仅支持时间跨度12个月以内的查询');
            }
            $listTmp = $UserMoneyLogModel->where($where)->whereTime('add_time', 'between', [$date_area_start, $date_area_end])->order('log_id desc')->page($this->page, $this->limit)->select();
        } else {
            $listTmp = $UserMoneyLogModel->where($where)->order('log_id desc')->page($this->page, $this->limit)->select();
        }
        $type_means_tmp = getMean('user_money_type');

        $list = [];
        foreach ($listTmp as $v) {
            $list[] = [
                'log_id' => $v->log_id,
                'money' => moneyFormat($v->money),
                'mark' => $UserMoneyLogModel->checkType($v->type),
                'type_mean' => $type_means_tmp[$v->type],
                'add_time' => date("Y-m-d H:i", $v->add_time),
            ];
        }
        $type_means = [];
        foreach ($type_means_tmp as $key => $vv) {
            $type_means[] = [
                'key' => $key,
                'val' => $vv
            ];
        }
        $UserModel = new UserModel();
        $UserModel->findUser($this->userId);

        $this->datas = [
            'list' => $list,
            'isMore' => (int)($this->limit == count($list)),
            'money' => moneyFormat($UserModel->getUserMoney(),true),
            'type_means' => $type_means,
        ];
    }


    /**
     * 申请提现余额
     * @param $user_type  int  提现类型(1.用户 2.推广员)
     * @param $money  int  提现金额
     */
    public function withdrawMoney()
    {
        $user_type = (int)$this->request->param('user_type', 1);
        if (!isset(getMean('shop_withdraw_type')[$user_type])) {
            $this->warning("参数不正确!");
        }
        $money = $this->request->param('money', 0, 'moneyToInt');
        $SettingModel = new SettingModel();
        if (!$withdraw_default = $SettingModel->find($this->appId)) {
            $withdraw_default = $SettingModel->getWithdrawDefault();
        }

        $limit_money = $withdraw_default['user_withdraw_limit'];
        if($user_type == 2){
            $limit_money = $withdraw_default['agent_withdraw_limit'];
        }
        if ($money < $limit_money) {
            $this->warning("最少提现" .moneyFormat($limit_money,true). "元");
        }
        $data = [
            'user_id' => $this->userId,
            'app_id' => $this->appId,
            'type' => $user_type,
            'money' => $money,
            'status' => getMean('shop_withdraw_status', 'key')['sqz'],
        ];
        $WithdrawApplyModel = new WithdrawApplyModel();
        $WithdrawApplyModel->save($data);

        if ($user_type == 1) {
            $UserModel = new UserModel();
            if (!$user = $UserModel->findUser($this->userId)->getUser()) {
                $this->warning("参数错误");
            }
            if ($user->app_id != $this->appId) {
                $this->warning("参数错误");
            }
            $type = getMean('user_money_type', 'key')['tx'];
            if ($UserModel->userMoney($money, $type) == false) {
                $msg = $UserModel->geterror();
                $this->warning($msg);
            }
        } elseif ($user_type == 2) {
            try {
                $AgentLogic = new AgentLogic($this->appId, $this->userId);
                if ($AgentLogic->getAgentMoney() < $money) {
                    throw new Exception("佣金余额不足！");
                }
                $type = getMean('agent_money_type', 'key')['tx'];
                $AgentLogic->changeAgentMoney($money, $type);
            } catch (Exception $exception) {
                $this->warning($exception->getMessage());
            }
        }
    }


    /**
     * 余额充值
     */
    public function recharge()
    {
        $money = (int)$this->request->param("money", 0, "moneyToInt");
        if ($money < 100) {
            $this->warning("最少充值一元");
        }
        $RechargeModel = new RechargeModel();
        $RechargeModel->save([
            'user_id' => $this->userId,
            'app_id' => $this->appId,
            'money' => $money,
        ]);
        $pay_type = (string) $this->request->param("pay_type",'wyu');
        empty($pay_type) && $pay_type = "wyu";
        $order_id =$RechargeModel->rec_id;
        $param = [
            'title' => "余额充值",
            'subject' => "余额充值",
            'openid' => $this->openId,
            'notify_url' => request()->domain() . config('callbackUrl.money_payment_notify_callback').'/appid/'.$this->appId . '/device/' . $this->device . '/pay_type/' . $pay_type . '/order_id/' . $order_id,
            'return_url' => request()->domain() .config('callbackUrl.money_payment_return_callback').'/appid/'.$this->appId . '/device/' . $this->device . '/pay_type/' . $pay_type . '/order_id/' . $order_id,
            'order_id' => $order_id,
            'money' => $money,
            'goods_id' => $order_id,
            'pay_type' => $pay_type,
            'order_type' => 4,
        ];
        try {
            $res = Miniapp::makeModule($this->device, $this->appId)->createOrder($param);
            $order_info = $res['order_info'];
            $this->datas =  [
                'order_id' => $order_id,
                'is_pay' => 1,
                'order_info' => $order_info,
            ];
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }

    }


    //同步用户信息
    public function syncUserInfo() {
        $UserModel = new UserModel();
        if (!$user = $UserModel->findUser($this->userId)->getUser()) {
            $this->warning('用户不存在！');
        }
        $nickname = (string) $this->request->param('nickname','','SecurityEditorHtml');
        $face = (string) $this->request->param('face','','SecurityEditorHtml');
        $sex = (int) $this->request->param('sex',0);
        $birthday = (int) $this->request->param('birthday','','strtotime');
        if ($nickname) {
            $data['nickname'] = $nickname;
        }
        if ($face) {
            $data['face'] = $face;
        }
        if ($sex) {
            $data['sex'] = $sex;
        }
        if ($birthday) {
            $data['birthday'] = $birthday;
        }
        if (!empty($data)) {
            $UserModel->isUpdate(true)->save($data,['user_id'=>$this->userId]);
        }
    }


    public function getAbout() {
        $SettingModel = new SettingModel();
        if (!$setting = $SettingModel->find($this->appId)) {
            $this->warning('商家尚未设置!');
        }
        $this->datas = [
            'company_name' => (string) $setting->company_name,
            'banner' => (string) $setting->banner,
            'introduce' => json_decode($setting->introduce) ? json_decode($setting->introduce, true) : [],
            'address' => (string) $setting->address,
            'tel' => (string) $setting->tel,
            'mobile' => (string) $setting->mobile,
            'email' => (string) $setting->email,
            'qrcode' => (string) $setting->qrcode,
        ];
    }

}




