<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class UserCouponModel extends CommonModel
{
    protected $pk = 'user_coupon_id';
    protected $name = 'app_shop_user_coupon';
    protected $insert = ['add_time','add_ip'];

    protected $rules = [
        ['coupon_id', 'require|number', '优惠券ID不能为空！'],
        ['user_id', 'require|number', '用户ID不能为空！'],
        ['name', 'require|max:128', '优惠券名称必须填写|优惠券名称长度超过限制！'],
        ['money', 'require|number', '抵用金额不能为空！'],
        ['condition', 'require|number', '抵用需满金额不能为空！'],
        ['expire_start_time', 'require|number', '使用开始时间必须选择！|使用开始时间必须选择！'],
        ['expire_end_time', 'require|number', '使用结束时间必须选择！|使用结束时间必须选择！'],
        ['app_id', 'require|number', '参数不正确|参数不正确！'],
        ['type', 'require|number', '参数不正确|参数不正确！'],
        ['userarea', 'require|number', '参数不正确|参数不正确！'],
        ['is_used', 'require|number', '参数不正确|参数不正确！'],
        ['cat_id', 'require|number', '分类必须选择!|分类必须选择！'],
        ['p_cat_id', 'require|number', '分类的上级分类必须选择!|分类的上级分类必须选择！'],
    ];

    public function dataFilter($app_id = 0)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "coupon_id" => (int)$request->param("coupon_id", 0),
            "user_id" => (int)$request->param("user_id", 0),
            "name" => (string)$request->param("name", ''),
            "money" => moneyToInt($request->param("money", 0)),//抵用金额
            "condition" => moneyToInt($request->param("condition", 0)),//满多少可抵用
            "expire_start_time" => $request->param("expire_start_time", 0,"strtotime"),//领取结束时间
            "expire_end_time" => $request->param("expire_end_time", 0,"strtotime"),//领取结束时间
            "type" => (int)$request->param("type", 0),
            "userarea" => (int)$request->param("userarea", 0),
            "is_used" => (int)$request->param("is_used", 0),
            "cat_id" => (int)$request->param("cat_id", 0),
            "p_cat_id" => (int)$request->param("p_cat_id", 0),
        ];
        return $param;
    }


    /**
     * 给用户赠送优惠券
     * @param $userIds
     * @param $coupon_id
     */
    public function sendCoupon($userIds,$coupon,$get_type) {
        $data = [];
        foreach ($userIds as $v) {
            $data[] = [
                'coupon_id' => $coupon->coupon_id,
                'app_id' => $coupon->app_id,
                'user_id' => $v,
                'name' => $coupon->name,
                'money' => $coupon->money,
                'condition' => $coupon->condition,
                'expire_start_time' => $coupon->expire_start_time,
                'expire_end_time' => $coupon->expire_end_time,
                'type' => $coupon->type,
                'userarea' => $coupon->userarea,
                'cat_id' => $coupon->cat_id,
                'p_cat_id' => $coupon->p_cat_id,
            ];
        }
        $res = $this->saveAll($data);
        if ($res) {
            return true;
        } else {
            return false;
        }

    }


    /**
     * 检查优惠券是否可用
     */
    public function checkCanUserCoupon($userCouponId){

    }


}
