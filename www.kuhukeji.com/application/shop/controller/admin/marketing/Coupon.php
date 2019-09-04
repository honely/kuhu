<?php

namespace app\shop\controller\admin\marketing;

use app\shop\controller\admin\Common;
use app\shop\model\shop\CouponModel;
use app\shop\model\shop\GoodscategoryModel;
use app\shop\model\shop\UserCouponModel;
use app\shop\model\shop\UserModel;


class Coupon extends Common
{

    public function getTypeArea()
    {
        $this->datas = [
            'couponType' => statusToMap(getMean('coupon_type')),
            'useArea' => statusToMap(getMean('coupon_usearea')),
            'useType' => statusToMap(getMean('coupon_use_type')),
        ];
    }

    public function create()
    {
        $cat_id = (int) $this->request->param("cat_id",0);
        $p_cat_id = (int) $this->request->param("p_cat_id",0);
        $userarea = (int) $this->request->param('userarea',0);
        if (!$userarea) {
            $cat_id = $p_cat_id = 0;
        } else {
            $GoodscategoryModel = new GoodscategoryModel();
            if (!$category = $GoodscategoryModel->where(['app_id'=>$this->appId])->find($cat_id)) {
                $this->warning("分类不存在!");
            }
            if ($category->parent_id != $p_cat_id) {
                $this->warning("参数不正确!");
            }
        }

        $CouponModel = new CouponModel();
        $res = $CouponModel->setData($CouponModel->dataFilter($this->appId,$cat_id,$p_cat_id,$userarea));
        if ($res == false) {
            $this->warning($CouponModel->getError());
        }
    }

    public function edit()
    {
        $coupon_id = (int)$this->request->param("coupon_id");
        $cat_id = (int)$this->request->param("cat_id",0);
        $p_cat_id = (int)$this->request->param("p_cat_id",0);
        $userarea = (int) $this->request->param('userarea',0);
        if (!$userarea) {
            $cat_id = $p_cat_id = 0;
        } else {
            $GoodscategoryModel = new GoodscategoryModel();
            if (!$category = $GoodscategoryModel->where(['app_id'=>$this->appId])->find($cat_id)) {
                $this->warning("分类不存在!");
            }
            if ($category->parent_id != $p_cat_id) {
                $this->warning("参数不正确!");
            }
        }

        $CouponModel = new CouponModel();
        if (!$detail = $CouponModel->find($coupon_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        //var_dump($CouponModel->dataFilter($this->appId,$cat_id,$p_cat_id,$userarea), $coupon_id);die;
        $res = $CouponModel->setData($CouponModel->dataFilter($this->appId,$cat_id,$p_cat_id,$userarea), $coupon_id);
        if ($res === false) {
            $this->warning($CouponModel->getError());
        }


    }

    public function del()
    {
        $coupon_id = (int)$this->request->param("coupon_id");
        $CouponModel = new CouponModel();
        if (!$detail = $CouponModel->find($coupon_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $CouponModel->where("coupon_id", $coupon_id)->delete();
    }


    public function index(){
        $CouponModel = new CouponModel();
        $where['app_id'] = $this->appId;

        $is_vip = (int) $this->request->param("is_vip",-999);
        $is_online = (int) $this->request->param("is_online",-999);
        $userarea = (int) $this->request->param("userarea",-999);
        $type = (int) $this->request->param("type",-999);
        if ($is_vip >= 0) {
            $where["is_vip"] = $is_vip;
        }
        if ($is_online >= 0) {
            $where["is_online"] = $is_online;
        }
        if ($userarea >= 0) {
            $where["userarea"] = $userarea;
        }
        if ($type >= 0) {
            $where["type"] = $type;
        }

        $keyword = (string)$this->request->param("keyword");
        if ($keyword) {
            $where["name"] = ["LIKE", "%{$keyword}%"];
        }

        $send_start_time = (int)$this->request->param("send_start_time", 0, "strtotime");
        $send_end_time = (int)$this->request->param("send_end_time", 0, "strtotime");
        if ($send_start_time > 0 && $send_end_time > 0) {
            $where["send_start_time|send_end_time"] = ["between", [$send_start_time, $send_end_time]];
        }
        $expire_start_time = (int)$this->request->param("expire_start_time", 0, "strtotime");
        $expire_end_time = (int)$this->request->param("expire_end_time", 0, "strtotime");
        if ($expire_start_time > 0 && $expire_end_time > 0) {
            $where["expire_start_time|expire_end_time"] = ["between", [$expire_start_time, $expire_end_time]];
        }
        $list = $CouponModel->where($where)->order("orderby desc,coupon_id desc")->page($this->page, $this->limit)->select();
        $count = $CouponModel->where($where)->count();
        $catIds = [];
        foreach ($list as $v) {
            if ($v->cat_id > 0 && $v->userarea == 1)
            $catIds[$v->cat_id] = $v->cat_id;
            if ($v->p_cat_id > 0) {
                $catIds[$v->p_cat_id] = $v->p_cat_id;
            }

        }
        $catIds = empty($catIds) ? '' : $catIds;
        $datas = [];
        $GoodscategoryModel = new GoodscategoryModel();
        $categorys = $GoodscategoryModel->itemsByIds($catIds);
        $couponUseType = getMean('coupon_use_type');
        $useArea = getMean('coupon_usearea');
        $couponType = getMean('coupon_type');
        foreach ($list as $val) {
            $datas[] = [
                'coupon_id' => $val->coupon_id,
                'name' => (string) $val->name,
                'cat_name' => isset($categorys[$v->p_cat_id]) ? $categorys[$v->p_cat_id]['name'] : (isset($categorys[$v->cat_id]) ? $categorys[$v->cat_id]['name'] : '--'),
                'money' => moneyFormat($val->money,true),
                'condition' => moneyFormat($val->condition,true),
                'send_start_time' => $val->send_start_time ? date('Y-m-d',$val->send_start_time) : '--',
                'send_end_time' => $val->send_end_time ? date('Y-m-d',$val->send_end_time) : '--',
                'expire_start_time' => $val->expire_start_time ? date('Y-m-d',$val->expire_start_time) : '--',
                'expire_end_time' => $val->expire_end_time ? date('Y-m-d',$val->expire_end_time) : '--',
                'type' => (int) $val->type,
                'type_mean' => isset($couponUseType[$val->type]) ? $couponUseType[$val->type] : '--',
                'userarea' => (int) $val->userarea,
                'userarea_mean' => isset($useArea[$val->userarea]) ? $useArea[$val->userarea] : '--',
                'get_type' => (int) $val->get_type,
                'get_type_mean' => isset($couponType[$val->get_type]) ? $couponType[$val->get_type] : '--',
                'cat_id' => (int) $val->cat_id,
                'p_cat_id' => (int) $val->p_cat_id,
                'is_online' => (int) $val->is_online,
                'orderby' => (int) $val->orderby,
                'create_num' => (int) $val->create_num,
                'send_num' => (int) $val->send_num,
                'use_num' => (int) $val->use_num,
                'add_time' => $val->add_time ? date("Y/m/d H:i:s", $val->add_time) : '--',
                'add_ip' => (string) $val->add_ip,
            ];
        }

        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
            'couponUseType' => statusToMap($couponUseType),
            'useArea' => statusToMap($useArea),
            'couponType' => statusToMap($couponType),
        ];
    }


    public function detail()
    {
        $coupon_id = (int)$this->request->param("coupon_id");
        $CouponModel = new CouponModel();
        if (!$detail = $CouponModel->find($coupon_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }

        $datas = [
            'coupon_id' => $detail->coupon_id,
            'cat_id' => (int) $detail->cat_id,
            'p_cat_id' => (int) $detail->p_cat_id,
            'name' => (string) $detail->name,
            'money' => moneyFormat($detail->money),
            'condition' => moneyFormat($detail->condition),
            'create_num' => (int)$detail->create_num,
            'send_num' => (int)$detail->send_num,
            'use_num' => (int)$detail->use_num,
            'send_start_time' => date('Y-m-d',$detail->send_start_time),
            'send_end_time' => date('Y-m-d',$detail->send_end_time),
            'expire_start_time' => date('Y-m-d',$detail->expire_start_time),
            'expire_end_time' => date('Y-m-d',$detail->expire_end_time) ,
            'type' => (int) $detail->type,
            'userarea' => (int) $detail->userarea,
            'is_online' => (int) $detail->is_online,
            'orderby' => (int) $detail->orderby,
        ];
        $this->datas = [
            'detail' => $datas,
            'couponType' => statusToMap(getMean('coupon_type')),
            'useArea' => statusToMap(getMean('coupon_usearea')),
            'couponUseType' => statusToMap(getMean('coupon_use_type')),
        ];
    }


    public function online()
    {
        $coupon_id = (int)$this->request->param("coupon_id");
        $CouponModel = new CouponModel();
        if (!$detail = $CouponModel->find($coupon_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $CouponModel->save([
            'is_online' => $detail->is_online ^ 1,
        ], ['coupon_id' => $coupon_id]);
    }


    public function onlineAll(){
        $coupon_ids = (array)$this->request->param("coupon_ids/a");
        $online = (int)($this->request->param("online") == 1);
        if (empty($coupon_ids)) {
            $this->warning();
        }
        $CouponModel = new CouponModel();
        $CouponModel->where("app_id",$this->appId)->whereIn("coupon_id",$coupon_ids)->update(['is_online'=>$online]);
    }



    public function setVip()
    {
        $coupon_id = (int) $this->request->param('coupon_id',0);
        $is_vip = (int) $this->request->param('is_vip',0);
        $CouponModel = new CouponModel();
        if (!$detail = $CouponModel->find($coupon_id)) {
            $this->warning('参数不正确!');
        }
        if ($detail->app_id != $this->appId) {
            $this->warning('参数不正确!');
        }
        $CouponModel->save(['is_vip'=>$is_vip],['coupon_id'=>$coupon_id]);
    }



    public function setCurrency()
    {
        $coupon_id = (int) $this->request->param('coupon_id',0);
        $is_currency = (int) $this->request->param('is_currency',0);
        $CouponModel = new CouponModel();
        if (!$detail = $CouponModel->find($coupon_id)) {
            $this->warning('参数不正确!');
        }
        if ($detail->app_id != $this->appId) {
            $this->warning('参数不正确!');
        }
        $CouponModel->save(['is_currency'=>$is_currency],['coupon_id'=>$coupon_id]);
    }



    public function setOnline()
    {
        $coupon_id = (int) $this->request->param('coupon_id',0);
        $is_online = (int) $this->request->param('is_online',0);
        $CouponModel = new CouponModel();
        if (!$detail = $CouponModel->find($coupon_id)) {
            $this->warning('参数不正确!');
        }
        if ($detail->app_id != $this->appId) {
            $this->warning('参数不正确!');
        }
        $CouponModel->save(['is_online'=>$is_online],['coupon_id'=>$coupon_id]);
    }

    //可视化组件使用0 默认排序  1、价格排序  2、下载量  3、使用最多 4、推荐排序
    public function getCalldata(){
        $CouponModel = new CouponModel();
        $where['app_id'] = $this->appId;
        //只能是免费领取的显示在前台
        $where['get_type'] = 2;
        $where['send_end_time'] = ['EGT',time()];
        $order = (int)$this->request->param('order');
        $showType = (int) $this->request->param('showType');
        $showType = $showType == 1 ? 1 : 3; //作为LIMIT 使用
        $orderby = '';
        switch ($order){
            case 1:
                $orderby = 'money ASC';
                break;
            case 2:
                $orderby = 'send_num desc';
                break;
            case 3:
                $orderby = 'use_num desc';
                break;
            case 4:
                 $orderby = 'orderby desc';
                break;
            default:
                $orderby = 'coupon_id desc';
                break;
        }
        $datas = $CouponModel->where($where)->order($orderby)->limit(0,$showType)->select();
        
        $return = [];
       
        foreach($datas as $val){
            $return [] = [
                'coupon_id' => $val['coupon_id'],
                'name'      => $val['name'],
                'money'     => round($val['money'],2),
                'userarea'  => $val['userarea'] == 0 ? '全场通用' : '指定分类',
                'expire_start_time' => date('Y-m-d',$val['expire_start_time']),
                'expire_end_time'  => date('Y-m-d',$val['expire_end_time']),
            ];
        }
        $this->datas['coupons'] = $return;
    }

    public function getIndex(){
        $CouponModel = new CouponModel();
        $where['app_id'] = $this->appId;
        $where['type'] = 1;

        $is_vip = (int) $this->request->param("is_vip",-999);
        $is_online = (int) $this->request->param("is_online",-999);
        $userarea = (int) $this->request->param("userarea",-999);
        if ($is_vip >= 0) {
            $where["is_vip"] = $is_vip;
        }
        if ($is_online >= 0) {
            $where["is_online"] = $is_online;
        }
        if ($userarea >= 0) {
            $where["userarea"] = $userarea;
        }

        $keyword = (string)$this->request->param("keyword");
        if ($keyword) {
            $where["name"] = ["LIKE", "%{$keyword}%"];
        }

        $send_start_time = (int)$this->request->param("send_start_time", 0, "strtotime");
        $send_end_time = (int)$this->request->param("send_end_time", 0, "strtotime");
        if ($send_start_time > 0 && $send_end_time > 0) {
            $where["send_start_time|send_end_time"] = ["between", [$send_start_time, $send_end_time]];
        }
        $expire_start_time = (int)$this->request->param("expire_start_time", 0, "strtotime");
        $expire_end_time = (int)$this->request->param("expire_end_time", 0, "strtotime");
        if ($expire_start_time > 0 && $expire_end_time > 0) {
            $where["expire_start_time|expire_end_time"] = ["between", [$expire_start_time, $expire_end_time]];
        }
        $list = $CouponModel->where($where)->order("orderby desc,coupon_id desc")->page($this->page, $this->limit)->select();
        $count = $CouponModel->where($where)->count();
        $catIds = [];
        foreach ($list as $v) {
            if ($v->cat_id > 0 && $v->userarea == 1)
                $catIds[$v->cat_id] = $v->cat_id;
            if ($v->p_cat_id > 0) {
                $catIds[$v->p_cat_id] = $v->p_cat_id;
            }

        }
        $catIds = empty($catIds) ? '' : $catIds;
        $datas = [];
        $GoodscategoryModel = new GoodscategoryModel();
        $categorys = $GoodscategoryModel->itemsByIds($catIds);
        $couponType = getMean('coupon_type');
        $useArea = getMean('coupon_usearea');
        foreach ($list as $val) {
            $datas[] = [
                'coupon_id' => $val->coupon_id,
                'name' => (string) $val->name,
                'cat_name' => isset($categorys[$v->p_cat_id]) ? $categorys[$v->p_cat_id]['name'] : (isset($categorys[$v->cat_id]) ? $categorys[$v->cat_id]['name'] : '--'),
                'money' => moneyFormat($val->money,true),
                'condition' => moneyFormat($val->condition,true),
                'send_start_time' => $val->send_start_time ? date('Y-m-d',$val->send_start_time) : '--',
                'send_end_time' => $val->send_end_time ? date('Y-m-d',$val->send_end_time) : '--',
                'expire_start_time' => $val->expire_start_time ? date('Y-m-d',$val->expire_start_time) : '--',
                'expire_end_time' => $val->expire_end_time ? date('Y-m-d',$val->expire_end_time) : '--',
                'type' => (int) $val->type,
                'type_mean' => isset($couponType[$val->type]) ? $couponType[$val->type] : '--',
                'userarea' => (int) $val->userarea,
                'userarea_mean' => isset($useArea[$val->userarea]) ? $useArea[$val->userarea] : '--',
                'cat_id' => (int) $val->cat_id,
                'p_cat_id' => (int) $val->p_cat_id,
                'is_online' => (int) $val->is_online,
                'orderby' => (int) $val->orderby,
                'create_num' => (int) $val->create_num,
                'send_num' => (int) $val->send_num,
                'use_num' => (int) $val->use_num,
                'add_time' => $val->add_time ? date("Y/m/d H:i:s", $val->add_time) : '--',
                'add_ip' => (string) $val->add_ip,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    /**
     * 非用户赠送优惠券
     */
    public function sendCoupon () {
        $userIds = (array) $this->request->param('userIds/a');
        $user_id = (int) $this->request->param('user_id',0);
        $coupon_id = (int) $this->request->param('coupon_id',0);
        $CouponModel = new CouponModel();
        if (!$coupon = $CouponModel->find($coupon_id)) {
            $this->warning('参数不正确!');
        }
        if ($coupon->app_id != $this->appId) {
            $this->warning('参数不正确!');
        }

        if (count($userIds) > 200) {
            $this->warning('每次操作不得超过200位用户');
        }
        if ($user_id) {
            array_push($userIds,$user_id);
        }
        if (empty($userIds)) {
            $this->warning('请先选择用户!');
        }

        $UserModel = new UserModel();
        $users = $UserModel->itemsByIds($userIds);
        foreach ($users as $v) {
            if ($v->app_id != $this->appId) {
                $this->warning('部分用户不存在！');
            }
        }

        $UserCouponModel = new UserCouponModel();
        $UserCouponModel->sendCoupon($userIds,$coupon,getMean('coupon_type','key')['zdff']);
    }



}
