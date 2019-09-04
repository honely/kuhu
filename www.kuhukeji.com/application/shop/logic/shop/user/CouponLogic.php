<?php

namespace app\shop\logic\shop\user;

use app\shop\model\shop\CouponModel;
use app\shop\model\shop\GoodscategoryModel;
use app\shop\model\shop\UserCouponModel;
use app\shop\model\shop\UserModel;
use think\Exception;

/**
 * 优惠券 逻辑定义
 * Class CouponLogic
 * @package Home\Logic
 */
class CouponLogic
{
    private $money;

    private $userId;

    private $appId;

    private $error;

    public function getError() {
        return $this->error;
    }

    public function setUserId($userId) {
        $this->userId = $userId;
        return $this;
    }

    public function setAppId($appId) {
        $this->appId = $appId;
        return $this;
    }

    /**
     * @param $couponId
     * @param $userId
     * @param bool $checkreceive
     * @return $this|bool
     */
    public function receiveCoupon($couponId,$userId,$checkreceive = false) {
        $CouponModel = new CouponModel();
        if (!$coupon = $CouponModel->find($couponId)) {
            throw new Exception("参数错误！");
        }
        if ($checkreceive == true) { //判断是否有效
            if ($coupon->send_start_time > time()) {
                throw new Exception("尚未开始！");
            }
            if ($coupon->send_end_time < time()) {
                throw new Exception("已经结束！");
            }
        }
        $UserModel = new UserModel();
        $UserModel->findUser($userId);
        $user = $UserModel->getUser();
        if ($coupon->type == 1 && $UserModel->checkVip() == false) {
            throw new Exception("您不是会员，无法领取当前优惠券！");
        }
        if ($coupon->type == 2 && $UserModel->checkFirstOrder() == false) {
            throw new Exception("当前优惠券仅限新用户领取！");
        }
        if ($coupon->app_id != $user->app_id) {
            throw new Exception("参数不正确！");
        }
        $UserCouponModel = new UserCouponModel();
        if ($user_coupon = $UserCouponModel->where(['coupon_id'=>$couponId])->find()) {
            throw new Exception("请不要重复领取优惠券！");
        }

        $user_coupon_data = [
            'coupon_id' => $couponId,
            'app_id' => $user->app_id,
            'user_id' => $user->user_id,
            'name' => $coupon->getAttr('name'),
            'money' => $coupon->money,
            'condition' => $coupon->condition,
            'expire_start_time' => $coupon->expire_start_time,
            'expire_end_time' => $coupon->expire_end_time,
            'userarea' => $coupon->userarea,
            'cat_id' => $coupon->cat_id,
            'p_cat_id' => $coupon->p_cat_id,
            'get_type' => $coupon->get_type,
            'type' => $coupon->getAttr('type'),
        ];
        $UserCouponModel->save($user_coupon_data);
        return true;
    }


    /**
     * 获得可领取的优惠券
     *
     */
    //$gettype 0.下单赠送 1.后台赠送 2是免费领取 默认免费领取
    public function getReceiveAbleCouponList($check_recieve_time = false,$type = [0],$usearea = 0,$cat_id=0,$gettype = 2) {
        $CouponModel = new CouponModel();
        $where = [
            'app_id' => $this->appId,
            'is_online' => 1,
            'type' => ['in',$type],
            'userarea' => $usearea,
            'get_type' => $gettype,
        ];
        if ($check_recieve_time == true) {
            $where['send_start_time'] = ['<',time()];
            $where['send_end_time'] = ['>',time()];
        }
        if ($cat_id > 0) {
            $where['cat_id|p_cat_id'] = $cat_id;
        }

        $list_tmp = $CouponModel->where($where)->whereExp('send_num','< create_num')->order("orderby desc")->select();
        $cat_ids = [];
        foreach ($list_tmp as $v) {
            $cat_ids[$v->cat_id] = $v->cat_id;
        }
        $cat_ids = empty($cat_ids) ? '' : $cat_ids;
        $GoodscategoryModel = new GoodscategoryModel();
        $cats = $GoodscategoryModel->itemsByIds($cat_ids);

        $list = [];
        foreach ($list_tmp as $v) {
            $list[] = [
                'coupon_id' => $v->coupon_id,
                'name' => $v->name,
                'money' => moneyFormat($v->money,true),
                'condition' => moneyFormat($v->condition,true),
                'expire_end_time' => $v->expire_end_time ? date("Y-m-d H:i",$v->expire_end_time) : '不过期',
                'type' => $v->type,
                'type_mean' => getMean('coupon_use_type')[$v->type],
                'userarea' => $v->userarea,
                'userarea_mean' => getMean('coupon_usearea')[$v->userarea],
                'cat_id' => $v->cat_id,
                'cat_name' => $v->cat_id > 0 ? (isset($cats[$v->cat_id]['name']) ? $cats[$v->cat_id]['name'] : '--') : '全场通用',
            ];
        }
        return $list;
    }


    /**
     * 获取用户可以使用的优惠券
     * @param $user_id|用户id
     * @param $coupon_id|优惠券id
     * @return int|mixed
     */
    public function getUserCouponList($user_id,$is_used = false,$checkexpire = true,$cat_id=0) {
        $UserCouponModel = new UserCouponModel();
        $where = [
            'user_id' => $user_id,
            'is_used' => 0,
            'used_time' => 0,
        ];
        if ($is_used == true) {
            $where['is_used'] = 1;
            $where['used_time'] = ['>',0];
        }
        if ($checkexpire == true) {
            $where['expire_start_time'] = ['<',time()];
            $where['expire_end_time'] = ['>',time()];
        }
        if ($cat_id > 0) {
            $where['cat_id|p_cat_id'] = $cat_id;
        }
        $list_tmp = $UserCouponModel->where($where)->select();
        $cat_ids = [];
        foreach ($list_tmp as $v) {
            $cat_ids[$v->cat_id] = $v->cat_id;
        }
        $cat_ids = empty($cat_ids) ? '' : $cat_ids;
        $GoodscategoryModel = new GoodscategoryModel();
        $cats = $GoodscategoryModel->itemsByIds($cat_ids);

        $list = [];
        foreach ($list_tmp as $v) {
            $list[] = [
                'user_coupon_id' => $v->user_coupon_id,
                'name' => $v->name,
                'money' => moneyFormat($v->money,true),
                'condition' => moneyFormat($v->condition,true),
                'expire_end_time' => $v->expire_end_time ? date("Y-m-d H:i",$v->expire_end_time) : '不过期',
                'type' => $v->type,
                'type_mean' => getMean('coupon_use_type')[$v->type],
                'userarea' => $v->userarea,
                'userarea_mean' => getMean('coupon_usearea')[$v->userarea],
                'cat_id' => $v->cat_id,
                'cat_name' => $v->cat_id > 0 ? (isset($cats[$v->cat_id]['name']) ? $cats[$v->cat_id]['name'] : '--') : '全场通用',
            ];
        }
        return $list;
    }

    /**
     * @param $user_id
     * @param $user_coupon_id
     * @param $cat_id
     * @param $money
     * 检查优惠券是否可用
     */
    public function checkUserCoupon($user_id,$user_coupon_id,$cat_id,$money) {
        $UserCouponModel = new UserCouponModel();
        if (!$user_coupon = $UserCouponModel->find($user_coupon_id)) {
            return false;
        }
        if ($user_coupon->user_id != $user_id) {
            return false;
        }
        if ($user_coupon->cat_id != $cat_id) {
            return false;
        }
        if ($user_coupon->expire_start_time > time()) {
            return false;
        }
        if ($user_coupon->expire_end_time < time()) {
            return false;
        }
        if ($money < $user_coupon->conditon) {
            return false;
        }
        return true;
    }


    /**
     * @param $user_coupon_id
     * @return bool
     * 退还用户的优惠券
     */
    public function returnUserCoupon($user_coupon_id) {
        $UserCouponModel = new UserCouponModel();
        if (!$user_coupon = $UserCouponModel->find($user_coupon_id)) {
            return true;
        } else {
            $UserCouponModel->isUpdate(true)->save(['is_used'=>0,'used_time'=>0],['user_coupon_id'=>$user_coupon_id]);
            return true;
        }
    }


    public function returnUserCouponCount($user_id) {
        $UserCouponModel = new UserCouponModel();
        $where = [
            'user_id' => $user_id,
            'is_used' => 0,
            'used_time' => 0,
            'expire_end_time' => ['>',time()]
        ];
        return $UserCouponModel->where($where)->count();
    }


}
