<?php

namespace app\shop\model\shop;

use app\shop\logic\shop\user\AgentLogic;
use app\shop\logic\shop\user\CouponLogic;
use app\shop\model\CommonModel;
use think\Exception;


class  UserModel extends CommonModel
{

    protected $pk = 'user_id';
    protected $name = 'app_shop_user';
    protected $insert = ['add_time', 'add_ip'];

    protected $user; //当前的用户


    /**
     * 获取用户信息
     * @param $userId
     */
    public function findUser($userId, $mobile = '', $appId = 0)
    {
        if (empty($mobile) && $appId <= 0) {
            $this->user = $this->find($userId);
        } else {
            $this->user = $this->where("mobile", $mobile)->where("app_id", $appId)->find();
        }
        return $this;
    }




    /**
     * 获取用户余额
     */
    public function getUserMoney()
    {
        return $this->user->money;
    }


    /**
     * 获得用户账户积分
     */
    public function getUserIntegral()
    {
        $IntegralModel = new IntegralModel();
        return $IntegralModel->getUserGold($this->user->user_id, 2);
    }

    /**
     * 获得用户账户积分
     */
    public function getUserCouponNum()
    {
        $CouponLogic = new CouponLogic();
        return $CouponLogic->returnUserCouponCount($this->user->user_id);
    }


    /**
     * 操作余额
     */
    public function userMoney($money, $type)
    {
        if ($money <= 0) return false;
        $UserMoneyLogModel = new UserMoneyLogModel();
        $res = $UserMoneyLogModel->checkType($type);
        if ($res == false) {
            $this->error = "操作错误";
            return false;
        }
        $userMoney = $this->user->money;
        if ($res == "add") {
            $userMoney = $userMoney + $money;
        } else {
            if ($money > $this->user->money) {
                $this->error = "余额不足";
                return false;
            }
            $userMoney = $userMoney - $money;
        }
        $this->save(['money' => $userMoney], ['user_id' => $this->user->user_id]);
        $UserMoneyLogModel->save([
            'user_id' => $this->user->user_id,
            'app_id' => $this->user->app_id,
            'get_type' => $res == "add" ? 1 : 2,
            'type' => $type,
            'money' => $money,
            'total_user_money' => $userMoney,
            'order_id' => 0,
        ]);
        return true;
    }


    /**
     * 操作积分
     */
    public function userIntegral($integral, $type)
    {
        if ($integral <= 0) return false;
        $UserIntegralLogModel = new UserIntegralLogModel();
        $res = $UserIntegralLogModel->checkType($type);
        if ($res == false) {
            $this->error = "操作错误";
            return false;
        }
        $UserIntegralModel = new UserIntegralModel();
        if ($res == "add") {
            $UserIntegralModel->addGold($this->user->app_id, $this->user->user_id, $integral, $type);
        } else {
            $isUse = $UserIntegralModel->useGold($this->user->user_id, $integral, $type, $this->user->app_id);
            if ($isUse == false) {
                $this->error = "扣除失败";
                return false;
            }
        }
        return true;
    }


    /**
     * 获取父级ID
     */
    public function getPid()
    {
        return $this->user->pid;
    }


    /**
     * 获取用户
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * 是否是VIP
     */
    public function checkVip()
    {
        return !empty($this->user) && $this->user->plus_vip_time > request()->time();
    }

    /**
     * 验证账号密码
     */
    public function checkPassword($password)
    {
        return !empty($this->user) && $this->user->password == md5($password);
    }


    /**
     *  是否是分销代理
     */
    public function checkAgent($is_lock = true)
    {
        $is_agent = !empty($this->user) && $this->user->agent_group > 0;
        if ($is_lock) {
            return $is_agent && $this->user->agent_lock == 0;
        } else {
            return $is_agent;
        }
    }


    /**
     *  是否是首单
     */
    public function checkFirstOrder($is_pay = false)
    {
        $OrderModel = new OrderModel();
        $where = ['user_id' => $this->user->user_id];
        if ($is_pay) {
            $where['pay_status'] = ['>', getMean('order_pay_status', 'key')['wzf']];
        }
        return (bool)$OrderModel->where($where)->find();
    }

    /**
     * @param $mobile
     * @param $appId
     * @param $device
     * @param int $pid
     * @return mixed
     */
    public function register($mobile, $appId, $device, $pwd = '', $pid = 0)
    {
        //查询 注册赠送 积分
        $integral = 0;
        //查询 注册赠送 余额
        $money = 0;
        //查询 注册赠送  plusVIP
        $plus_vip_time = 0;
        //查询 注册赠送 优惠券
        $coupon = [];
        try{
            $AgentLogic = new AgentLogic($appId,$pid);
            $agent = $AgentLogic->getParentIds();
        }catch (Exception $exception){
            $agent = [];
        }
        $domain =   request()->domain();
        $this->save([
            'app_id' => $appId,
            'mobile' => $mobile,
            'face' => "{$domain}/cdn/system/face.png",
            'password' => empty($pwd) ? md5(uniqid()) : md5($pwd),
            'nickname' => '用户' . substr($mobile, -4),
            'money' => $money,
            'plus_vip_time' => $plus_vip_time,
            'device' => $device,
            'last_time' => request()->time(),
            'last_ip' => request()->ip(),
            'pid' => empty($agent) ? 0 : $pid,
            'pid2' => empty($agent) ? 0 : $agent['pid'],
            'pid3' => empty($agent) ? 0 : $agent['pid2'],
        ]);
        if(!empty($agent)){
            $AgentLogic->setUserNum();
        }
        return $this->user_id;
    }


    /**
     *
     */
    public function getUserAgnet()
    {

    }


    /**
     * 获得订单信息
     */

    public function getOrderCounted()
    {
        $orderModel = new OrderModel();
        $unpay_where = [
            'user_id' => $this->user->user_id,
            'pay_status' => getMean('order_pay_status', 'key')['wzf'],
            'end_time' => ['>', time()],
        ];
        $unpay_order_count = $orderModel->where($unpay_where)->count();
        $unshipping_where = [
            'user_id' => $this->user->user_id,
            'shipping_status' => getMean('order_shipping_status', 'key')['wfh'],
            'pay_status' => getMean('order_pay_status', 'key')['yzf'],
        ];
        $unshipping_order_count = $orderModel->where($unshipping_where)->count();
        $unconfirm_where = [
            'user_id' => $this->user->user_id,
            'shipping_status' => ['>', getMean('order_shipping_status', 'key')['wfh']],
            'pay_status' => getMean('order_pay_status', 'key')['yzf'],
        ];
        $unconfirm_order_count = $orderModel->where($unconfirm_where)->count();
        $un_comment_where = [
            'user_id' => $this->user->user_id,
            'goods_rank' => 0,
        ];
        $CommentModel = new CommentModel();
        $uncomment_order_count = $CommentModel->where($un_comment_where)->count('order_id');
        $data = [
            'unpay_order_count' => $unpay_order_count,
            'unshipping_order_count' => $unshipping_order_count,
            'unconfirm_order_count' => $unconfirm_order_count,
            'uncomment_order_count' => $uncomment_order_count,
        ];
        return $data;
    }

    static public function setOrderNum(){

    }

}
