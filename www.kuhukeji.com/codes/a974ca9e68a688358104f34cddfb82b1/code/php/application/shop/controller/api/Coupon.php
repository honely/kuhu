<?php

namespace app\shop\controller\api;

use app\shop\logic\shop\user\CouponLogic;
use app\shop\model\shop\CouponModel;
use app\shop\model\shop\GoodscategoryModel;
use app\shop\model\shop\UserCouponModel;
use app\shop\model\shop\UserModel;
use think\Exception;


class Coupon extends ShopCommon
{
    protected $checkLogin = true;
    //可领优惠券列表
    public function index()
    {
        $UserCouponModel = new UserCouponModel();
        $user_coupon_where = [
            'user_id' => $this->userId,
        ];
        $user_coupon_list = $UserCouponModel->where($user_coupon_where)->select();
        $couponIds = [];
        foreach ($user_coupon_list as $v) {
            $couponIds[$v->coupon_id] = $v->coupon_id;
        }
        $couponIds = empty($couponIds) ? '' : $couponIds;
        $CouponModel = new CouponModel();
        $keywords = (string) $this->request->param('keywords');
        $UserModel = New UserModel();
        $UserModel->findUser($this->userId);

        $where['app_id'] = $this->appId;
        $where['is_online'] = 1;
        //$where['create_num'] = ['exp', "> send_num"];
        $where['send_start_time'] = ['<', time()];
        $where['send_end_time'] = ['>', time()];
        if ($UserModel->checkVip() == false) {
            $where['type'] = 0;
        }
        //$where['coupon_id'] = ['not in', $couponIds];
        if (!empty($keywords)) {
            if (is_numeric($keywords)) {
                $where['coupon_id'] = $keywords;
            } else {
                $where['name'] = ['like',"%$keywords%"];
            }
        }
        $orderby = ['orderby' => 'desc'];

        $listTmp = $CouponModel->where($where)->whereExp('create_num','> send_num')->order($orderby)->page($this->page, $this->limit)->select();
        $catIds = [];
        foreach ($listTmp as $v) {
            if ($v->cat_id > 0 && $v->userarea == 1)
                $catIds[$v->cat_id] = $v->cat_id;
            if ($v->p_cat_id > 0) {
                $catIds[$v->p_cat_id] = $v->p_cat_id;
            }
        }
        $catIds = empty($catIds) ? '' : $catIds;
        $GoodscategoryModel = new GoodscategoryModel();
        $categorys = $GoodscategoryModel->itemsByIds($catIds);
        $list = [];
        foreach ($listTmp as $val) {
            $list[] = [
                'coupon_id' => (int) $val->coupon_id,
                'name' => (string) $val->name,
                'money' => moneyFormat($val->money,true),
                'condition' => moneyFormat($val->condition,true),
                'create_num' => $val->create_num,
                'send_num' => $val->send_num,
                'use_num' => $val->use_num,
                'expire_start_time' => date("Y-m-d H:i",$val->expire_start_time),
                'expire_end_time' => date("Y-m-d H:i",$val->expire_end_time),
                'type' => (int) $val->type,
                'type_mean' => getMean('coupon_use_type')[$val->type],
                'userarea' => (int) $val->userarea,
                'cat_name' => isset($categorys[$val->p_cat_id]) ? $categorys[$val->p_cat_id]['name'] : (isset($categorys[$val->cat_id]) ? $categorys[$val->cat_id]['name'] : '--'),
                'is_receive' => (int) isset($couponIds[$val->coupon_id]),
            ];
        }

        $this->datas['list'] = $list;
        $this->datas['isMore'] = (int)($this->limit == count($list));
    }

    /**
     * 我的优惠券列表
     */
    public function myCoupon()
    {
        $type = (int) $this->request->param('type',-999);
        $UserCouponModel = new UserCouponModel();
        $coupon_where['user_id'] = $this->userId;
        if ($type >= 0) {
            if ($type == 0) {
                $coupon_where['used_time'] = 0;
                $coupon_where['is_used'] = 0;
                $coupon_where['expire_end_time'] = ['>',time()];
            } elseif ($type == 1) {
                $coupon_where['is_used'] = 1;
            } elseif ($type == 2) {
                $coupon_where['is_used'] = 0;
                $coupon_where['expire_end_time'] = ['<=',time()];
            }
        }
        $coupon_tmp = $UserCouponModel->where($coupon_where)->order('user_coupon_id desc')->page($this->page,$this->limit)->select();
        $list =[];
        foreach ($coupon_tmp as $v) {
            $list[] = [
                'user_coupon_id' => $v->user_coupon_id,
                'coupon_id' => $v->coupon_id,
                'name' => $v->name,
                'money' => moneyFormat($v->money),
                'condition' => moneyFormat($v->condition),
                'expire_start_time' => date("Y-m-d H:i",$v->expire_start_time),
                'expire_end_time' => date("Y-m-d H:i",$v->expire_end_time),
                'type' => $v->type,
                'type_mean' => getMean('coupon_use_type')[$v->type],
                'userarea' => $v->userarea,
                'userarea_mean' => getMean('coupon_usearea')[$v->userarea],

            ];
        }
        $this->datas['list'] = $list;
        $this->datas['isMore'] = (int)($this->limit == count($list));
    }


    public function receiveCoupon() {
        $coupon_id = (int) $this->request->param('coupon_id',0);
        $CouponLogic = new CouponLogic();
        try {
            $CouponLogic->receiveCoupon($coupon_id,$this->userId,$checkreceive = false);
        } catch (Exception $exception) {
            $warning = $exception->getMessage();
            $this->warning($warning);
        }
    }



}
