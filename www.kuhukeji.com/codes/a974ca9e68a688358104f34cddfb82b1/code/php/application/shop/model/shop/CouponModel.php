<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class CouponModel extends CommonModel
{
    protected $pk = 'coupon_id';
    protected $name = 'app_shop_coupon';
    protected $insert = ['add_time', 'add_ip'];

    protected $rules = [
        ['name', 'require|max:128', '优惠券名称必须填写|优惠券名称长度超过限制！'],
        ['money', 'require|number', '抵用金额不能为空！'],
        ['condition', 'require|number', '抵用需满金额不能为空！'],
        ['create_num', 'require|number', '优惠券个数不能为空！|优惠券个数不能为空！'],
        ['send_start_time', 'require|number', '领取开始时间必须选择！|领取开始时间必须选择！'],
        ['send_end_time', 'require|number', '领取结束时间必须选择！|领取结束时间必须选择！'],
        ['expire_start_time', 'require|number', '使用开始时间必须选择！|使用开始时间必须选择！'],
        ['expire_end_time', 'require|number', '使用结束时间必须选择！|使用结束时间必须选择！'],
        ['app_id', 'require|number', '参数不正确|参数不正确！'],
        ['cat_id', 'require|number', '分类必须选择!|分类必须选择！'],
        ['p_cat_id', 'require|number', '分类的上级分类必须选择!|分类的上级分类必须选择！'],
    ];

    public function dataFilter($app_id = 0, $cat_id, $p_cat_id, $userarea)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "cat_id" => (int)$cat_id,
            "p_cat_id" => (int)$p_cat_id,
            "create_num" => (int)$request->param("create_num", 0),
            "name" => (string)$request->param("name", ""),//标题
            "money" => moneyToInt($request->param("money", 0)),//抵用金额
            "condition" => moneyToInt($request->param("condition", 0)),//满多少可抵用
            "send_start_time" => $request->param("send_start_time", 0, "strtotime"),//领取开始时间
            "send_end_time" => $request->param("send_end_time", 0, "strtotime"),//领取结束时间
            "expire_start_time" => $request->param("expire_start_time", 0, "strtotime"),//领取结束时间
            "expire_end_time" => $request->param("expire_end_time", 0, "strtotime"),//领取结束时间
            "get_type" => (int)$request->param("get_type", 0),//领取类型
            "userarea" => $userarea, //可用范围
            "type" => (int)$request->param("type", 0),//可领取角色
            "is_online" => (int)$request->param("is_online", 0),//上架状态
            "orderby" => (int)$request->param("orderby", 0),//排序
        ];
        return $param;
    }


    /**
     * 获取优惠券
     * @param $appId
     * @param $catId
     * @param $pCatId
     * @param int $userarea
     * @param int $type
     */
    public function getCoupon($appId, $catId=0, $pCatId=0, $userarea = false, $type = false){

        $where['app_id'] = $appId;
        $catId > 0 && $where['cat_id'] = $catId;
        $pCatId > 0 && $where['p_cat_id'] = $pCatId;
        $userarea != false && $where['userarea'] = $userarea - 1;
        $type != false && $where['type'] = $type;
        return $this->where($where)->order("orderby desc")->select();
    }


}
