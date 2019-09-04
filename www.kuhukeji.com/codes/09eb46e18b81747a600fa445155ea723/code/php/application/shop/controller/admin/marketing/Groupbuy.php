<?php

namespace app\shop\controller\admin\marketing;

use app\shop\controller\admin\Common;
use app\shop\model\shop\GoodsRepertoryModel;
use app\shop\model\shop\GroupBuyItemJoinModel;
use app\shop\model\shop\GroupBuyItemModel;
use app\shop\model\shop\GroupBuyModel;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\UserModel;

class Groupbuy extends Common
{
    
    
    public function getCalldata(){
        $where = [
            'app_id' => $this->appId,
            'is_online' => 1,
        ];
        $showType = (int)$this->request->param('showType');
        $showType = $showType == 2 ? 2 : 3;//目前只有 一排2个或者一排3个 
        $GroupBuyModel = new GroupBuyModel();
        $datas = $GroupBuyModel->where($where)->order(['orderby'=>'desc'])->limit(0,$showType)->select(); 
        if(!empty($datas)){
            $goodsIds = [];
            foreach ($datas as $val){
                $goodsIds[$val['goods_id']] = $val['goods_id'];
            }
            if(!empty($goodsIds)){
                $GoodsModel = new GoodsModel();
                $goods = $GoodsModel->itemsByIds($goodsIds);
                $return  = [];
                foreach ($datas as $val){
                    $return[]  = [
                        'groupbuy_id' => $val['groupbuy_id'],
                        'need_num'   => $val['need_num'],
                        'groupbuy_price' => round($val['groupbuy_price']/100,2),
                        'photo'  => isset($goods[$val['goods_id']]) ? $goods[$val['goods_id']]['photo'] : '',
                        'price'  => isset($goods[$val['goods_id']]) ? round($goods[$val['goods_id']]['shop_price']/100,2) : '',
                    ];    
                }   
                $this->datas['goods'] = $return;
            }
        }
    }
    
    public function create(){
        $GroupBuyModel = new GroupBuyModel();
        $param = $GroupBuyModel->dataFilter($this->appId);
        if($rep_spec = $GroupBuyModel->checkGoods($param)){
            if ($rep_spec === false) {
                $this->warning($GroupBuyModel->getError() ? $GroupBuyModel->getError():'"请填选择商品"');
            }
        }
        $GoodsModel = new GoodsModel();
        if (!$goods = $GoodsModel->where(['app_id'=>$this->appId])->find($param['goods_id'])) {
            $this->warning('商品不存在！');
        }
        if ($param['end_time'] < 1) {
            $this->warning('成团时间至少1小时！');
        }
        if ($param['need_num'] < 2 || $param['need_num'] > 5) {
            $this->warning('成团人数请控制在2-5人！');
        }

        $spec = json_decode($param['spec']) ? json_decode($param['spec'],true) : [];

        if (count($spec) == 1 && $goods->sku_type == 0) {
            $spec[0]['groupbuy_price'] = $param['groupbuy_price'];
            $spec[0]['vip_groupbuy_price'] = $param['vip_groupbuy_price'];
        }
        $_spec = [];
        if (!empty($spec) && $goods->sku_type == 1) {
            $groupbuy_price = $vip_groupbuy_price = [];
            foreach ($spec as $v) {
                $_spec[] = [
                    'repertory_id' => $v['repertory_id'],
                    'goods_id' => $v['goods_id'],
                    'spec_key' => $v['spec_key'],
                    'key_name' => $v['key_name'],
                    'goods_num' => $v['goods_num'],
                    'shop_price' => moneyToInt($v['shop_price']),
                    'bar_code' => $v['bar_code'],
                    'sku_type' => $v['sku_type'],
                    'photo' => $v['photo'],
                    'market_price' => moneyToInt($v['market_price']),
                    'plus_vip_price' => moneyToInt($v['plus_vip_price']),
                    'groupbuy_price' => moneyToInt($v['groupbuy_price']),
                    'vip_groupbuy_price' => moneyToInt($v['vip_groupbuy_price']),
                ];
                $groupbuy_price[] = isset($v['groupbuy_price']) ? moneyToInt($v['groupbuy_price']) : 0;
                $vip_groupbuy_price[] = isset($v['vip_groupbuy_price']) ? moneyToInt($v['vip_groupbuy_price']) : 0;
            }
            sort($groupbuy_price);
            sort($vip_groupbuy_price);
            $param['groupbuy_price'] = isset($groupbuy_price[0]) ? $groupbuy_price[0] : 0;
            $param['vip_groupbuy_price'] = $param['is_vip'] == 1 ? (isset($vip_groupbuy_price[0]) ? $vip_groupbuy_price[0] : 0) : 0;
        }

        $param['goods_name'] = $goods['goods_name'];
        $param['photo'] = $goods['photo'];
        $param['spec'] = json_encode($_spec);

        $res = $GroupBuyModel->setData($param);
        if ($res == false) {
            $this->warning($GroupBuyModel->getError());
        }
        $GoodsModel = new GoodsModel();
        $GoodsModel->save([
            'prom_type' => getMean("shop_prom_type","k")['pt'],
            'prom_id'   => $GroupBuyModel->groupbuy_id,
        ],['goods_id'=>$param['goods_id']]);
    }


    public function edit()
    {
        $groupbuy_id = (int)$this->request->param("groupbuy_id",0);
        $GroupBuyModel = new GroupBuyModel();
        if (!$detail = $GroupBuyModel->find($groupbuy_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $param = $GroupBuyModel->dataFilter($this->appId);
        if ($param['need_num'] < 2 || $param['need_num'] > 5) {
            $this->warning('成团人数请控制在2-5人！');
        }
        if ($param['end_time'] < 1) {
            $this->warning('成团时间至少1小时！');
        }

        if($rep_spec = $GroupBuyModel->checkGoods($param)){
            if ($rep_spec === false) {
                $this->warning($GroupBuyModel->getError() ? $GroupBuyModel->getError():'"请选择商品"');
            }
        }
        $GoodsModel = new GoodsModel();
        if (!$goods = $GoodsModel->where(['app_id'=>$this->appId])->find($param['goods_id'])) {
            $this->warning('商品不存在！');
        }

        $spec = json_decode($param['spec']) ? json_decode($param['spec'],true) : [];
        if (count($spec) <= 1 && $goods->sku_type == 0) {
            $spec[0]['groupbuy_price'] = $param['groupbuy_price'];
            $spec[0]['vip_groupbuy_price'] = $param['vip_groupbuy_price'];
        }

        if (!empty($spec) && $goods->sku_type == 1) {
            $groupbuy_price = $vip_groupbuy_price = [];
            foreach ($spec as $v) {
                $groupbuy_price[] = moneyToInt($v['groupbuy_price']);
                $vip_groupbuy_price[] = moneyToInt($v['vip_groupbuy_price']);
                $_spec[] = [
                    'repertory_id' => $v['repertory_id'],
                    'goods_id' => $v['goods_id'],
                    'spec_key' => $v['spec_key'],
                    'key_name' => $v['key_name'],
                    'shop_price' => $v['shop_price'],
                    'goods_num' => $v['goods_num'],
                    'bar_code' => $v['bar_code'],
                    'sku_type' => $v['sku_type'],
                    'photo' => $v['photo'],
                    'market_price' => moneyToInt($v['market_price']),
                    'plus_vip_price' => moneyToInt($v['plus_vip_price']),
                    'groupbuy_price' => moneyToInt($v['groupbuy_price']),
                    'vip_groupbuy_price' => moneyToInt($v['vip_groupbuy_price']),
                ];
            }
            sort($groupbuy_price);
            sort($vip_groupbuy_price);
            $spec = $_spec;
            $param['groupbuy_price'] = isset($groupbuy_price[0]) ? $groupbuy_price[0] : 0;
            $param['vip_groupbuy_price'] = $param['is_vip'] == 1 ? (isset($vip_groupbuy_price[0]) ? $vip_groupbuy_price[0] : 0) : 0;
        }


        $param['spec'] = json_encode($spec);
        $param['goods_name'] = $goods['goods_name'];
        $param['photo'] = $goods['photo'];
        $res = $GroupBuyModel->setData($param,$groupbuy_id);
        if ($res === false) {
            $this->warning($GroupBuyModel->getError());
        }

        $GoodsModel = new GoodsModel();
        //如果换产品了   释放原产品
        if ($param['goods_id'] != $detail['goods_id']) {
            $GoodsModel->save(['prom_type'=>0,'prom_id'=>0],['goods_id'=>$detail['goods_id']]);
        }
        $GoodsModel->save([
            'prom_type' => getMean("shop_prom_type","k")['pt'],
            'prom_id'   => $groupbuy_id,
        ],['goods_id'=>$param['goods_id']]);
    }

    public function del()
    {
        $groupbuy_id = (int)$this->request->param("groupbuy_id");
        $GroupBuyModel = new GroupBuyModel();
        if (!$detail = $GroupBuyModel->find($groupbuy_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $GoodsModel = new GoodsModel();
        if (!$good = $GoodsModel->find($detail->goods_id)) {
            $this->warning("商品不存在！");
        }
        if ($good->app_id != $this->appId) {
            $this->warning("参数不正确！");
        }
        if ($good->prom_type != 2 || $good->prom_id != $groupbuy_id) {
            $this->warning("参数不正确！");
        }
        $GoodsModel->save(['prom_type'=>0,'prom_id'=>0],['goods_id'=>$detail->goods_id]);
        $GroupBuyModel->where("groupbuy_id", $groupbuy_id)->delete();
    }

    public function detail()
    {
        $groupbuy_id = (int)$this->request->param("groupbuy_id");
        $GroupBuyModel = new  GroupBuyModel();
        if (!$detail = $GroupBuyModel->find($groupbuy_id)) {
            $this->warning("不存在数据!");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据!");
        }

        $GoodsModel = new GoodsModel();
        if (!$goods =  $GoodsModel->find($detail->goods_id)) {
            $this->warning('参数不正确!');
        }
        if ($goods->app_id != $this->appId) {
            $this->warning('参数不正确!');
        }

        $spec = [];
        if ($goods->sku_type == 1) {
            $GoodsRepertoryModel = new GoodsRepertoryModel();
            $specTmp = $GoodsRepertoryModel->where(['goods_id'=>$goods->goods_id])->select();
            foreach ($specTmp as $v) {
                $spec[] = [
                    'repertory_id' => $v->repertory_id,
                    'goods_id' => $v->goods_id,
                    'spec_key' => $v->spec_key,
                    'key_name' => $v->key_name,
                    'shop_price' => moneyFormat($v->shop_price),
                    'goods_num' => (int)$v->goods_num,
                    'bar_code' => $v->bar_code,
                    'sku_type' => $v->sku_type,
                    'photo' => $v->photo,
                    'market_price' => moneyFormat($v->market_price),
                    'plus_vip_price' => moneyFormat($v->plus_vip_price),
                ];
            }
        }


        $goods = [
            'goods_id' => $goods->goods_id,
            'cat_id' => $goods->cat_id,
            'p_cat_id' => $goods->p_cat_id,
            'goods_sn' => $goods->goods_sn,
            'goods_name' => $goods->goods_name,
            'market_price' => moneyFormat($goods->market_price),
            'shop_price' => moneyFormat($goods->shop_price),
            'photo' => $goods->photo,
            'sku_type' => $goods->sku_type,
            'goods_spec' => $spec,

        ];
        $detail_spec_tmp = json_decode($detail->spec) ? json_decode($detail->spec, true) : [];
        $detail_spec = [];

        foreach ($detail_spec_tmp as $v) {

            $detail_spec[] = [
                'repertory_id' => $v['repertory_id'],
                'goods_id' => $v['goods_id'],
                'spec_key' => $v['spec_key'],
                'key_name' => $v['key_name'],
                'sku_type' => $v['sku_type'],
                'shop_price' => isset($v['shop_price']) ? moneyFormat($v['shop_price']) : 0,
                'market_price' => isset($v['market_price']) ? moneyFormat($v['market_price']) : 0,
                'plus_vip_price' => isset($v['plus_vip_price']) ? moneyFormat($v['plus_vip_price']) : 0,
                'groupbuy_price' => isset($v['groupbuy_price']) ? moneyFormat($v['groupbuy_price']) : 0,
                'vip_groupbuy_price' => isset($v['vip_groupbuy_price']) ? moneyFormat($v['vip_groupbuy_price']) : 0,
            ];
        }

        $detail = [
            'groupbuy_id' => $detail->groupbuy_id,
            'goods_id' => $detail->goods_id,
            'need_num' => $detail->need_num,
            'success_num' => $detail->success_num,
            'orderby' => $detail->orderby,
            'end_time' => $detail->end_time / 3600,
            'is_online' => $detail->is_online,
            'groupbuy_price' => moneyFormat($detail->groupbuy_price),
            'vip_groupbuy_price' => moneyFormat($detail->vip_groupbuy_price),
            'num' => $detail->num,
            'spec' => $detail_spec,
            'is_vip' => (int) $detail->is_vip,
            'seo' => json_decode($detail->seo) ? json_decode($detail->seo,true) : $this->default_seo,
        ];


        $this->datas = [
            'detail' => $detail,
            'goods' => $goods,
        ];

    }




    public function index(){
        $GroupBuyModel = new GroupBuyModel();
        $where['app_id'] = $this->appId;
        $goods_id = (int)$this->request->param("goods_id",0);
        if ($goods_id) {
            $where["goods_id"] = $goods_id;
        }
        $groupbuy_id = (int)$this->request->param("groupbuy_id",0);
        if ($groupbuy_id) {
            $where["groupbuy_id"] = $groupbuy_id;
        }
//        $keywords = (string)$this->request->param("keywords",'');
//        if ($keywords) {
//            $where["spec|title"] = ['like',"%$keywords%"];
//        }
        $is_online = (int)$this->request->param("is_online",-999);
        if ($is_online >= 0) {
            $where["is_online"] = $is_online;
        }
        $end_add_time = (int)$this->request->param("end_add_time", 0, "strtotime");
        $bg_add_time = (int)$this->request->param("bg_add_time", 0, "strtotime");
        if ($end_add_time > 0 && $bg_add_time > 0) {
            $where["add_time"] = ["between", [$bg_add_time, $end_add_time]];
        }
        $list = $GroupBuyModel->where($where)->order("groupbuy_id desc")->page($this->page, $this->limit)->select();
        $count = $GroupBuyModel->where($where)->count();
        $goodsIds = [];
        foreach ($list as $val){
            $goodsIds[$val->goods_id] = $val->goods_id;
        }
        $GoodsModel = new GoodsModel();
        $goods  =  $GoodsModel->itemsByIds($goodsIds);
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'groupbuy_id' => $val->groupbuy_id,
                'goods_id' => $val->goods_id,
                'goods_name' => $val->goods_name ? $val->goods_name :  $goods[$val->goods_id]->goods_name,
                'photo' => $val->photo ? $val->photo :  $goods[$val->goods_id]->photo,
                'goods_sn' => empty($goods[$val->goods_id]) ? '' :  $goods[$val->goods_id]->goods_sn,
                'need_num' => $val->need_num,
                'success_num' => $val->success_num,
                'orderby' => $val->orderby,
                'end_time' => (int)($val->end_time / 3600),
                'is_online' => $val->is_online,
                'groupbuy_price' => moneyFormat($val->groupbuy_price,true),
                'vip_groupbuy_price' => moneyFormat($val->vip_groupbuy_price,true),
                'num' => $val->num,
                'add_time' => date("Y/m/d H:i:s",$val->add_time),
                'add_ip' => $val->add_ip,
            ];
        }

        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }




    public function online()
    {
        $groupbuy_id = (int)$this->request->param("groupbuy_id",0);
        $is_online = (int)($this->request->param("is_online") == 1);
        $GroupBuyModel = new  GroupBuyModel();
        if (!$detail = $GroupBuyModel->find($groupbuy_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $GroupBuyModel->save(['is_online'=>$is_online],['groupbuy_id'=>$groupbuy_id]);
    }



    public function join() {
        $groupbuy_id = (int) $this->request->param('groupbuy_id',0);
        $where = [
            'groupbuy_id' => $groupbuy_id,
            'is_pay' => 1,
        ];
        $user_id = (int) $this->request->param('user_id',0);
        $name = (string) $this->request->param('name','');
        $mobile = (string) $this->request->param('mobile','');
        $now_num = (int) $this->request->param('now_num',0);
        $end_time = (int) $this->request->param('end_time','','strtotime');
        $add_time = (int) $this->request->param('add_time','','strtotime');
        $is_invalid = (int) $this->request->param('is_invalid',-999);
        $is_success = (int) $this->request->param('is_success',-999);

        if ($user_id) {
            $where['user_id'] = $user_id;
        }
        if ($name) {
            $where['name'] = ['like',"%$name%"];
        }
        if ($mobile) {
            $where['mobile'] = ['like',"%$mobile%"];
        }
        if ($end_time) {
            $where['end_time'] = ['>',$end_time];
        }
        if ($add_time) {
            $where['add_time'] = ['>',$add_time];
        }
        if ($now_num) {
            $where['now_num'] = ['>=',$now_num];
        }
        if ($is_invalid >= 0) {
            $where['is_invalid'] = $is_invalid;
        }
        if ($is_success >= 0) {
            $where['is_success'] = $is_success;
        }

        $GroupBuyModel = new GroupBuyModel();
        $groupbuy_tmp = $GroupBuyModel->find($groupbuy_id);
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->find($groupbuy_tmp->goods_id);
        $groupbuy = [
            'goods_sn' => $goods->goods_sn,
            'goods_name' => $goods->goods_name,
            'need_num' => $groupbuy_tmp->need_num,
            'end_time' => $groupbuy_tmp->end_time / 3600,
        ];

        $GroupBuyItemModel = new GroupBuyItemModel();
        $groupbuy_item_list_tmp = $GroupBuyItemModel->where($where)->order('groupbuy_item_id desc')->page($this->page,$this->limit)->select();
        $count = $GroupBuyItemModel->where($where)->count();

        $groupbuy_item_ids = $userIds = [];
        foreach ($groupbuy_item_list_tmp as $v) {
            $groupbuy_item_ids[$v->groupbuy_item_id] = $v->groupbuy_item_id;
            $userIds[$v->user_id] = $v->user_id;
        }
        $groupbuy_item_ids = empty($groupbuy_item_ids) ? '' : $groupbuy_item_ids;
        $userIds = empty($userIds) ? '' : $userIds;

        $GroupBuyItemJoinModel = new GroupBuyItemJoinModel();
        $join_where = [
            'is_pay' => 1,
            'groupbuy_item_id' => ['in',$groupbuy_item_ids],
            'user_id' => ['in',$userIds],
        ];
        $groupbuy_item_joins_tmp = $GroupBuyItemJoinModel->where($join_where)->select();
        $groupbuy_item_list = $groupbuy_item_joins = [];
        foreach ($groupbuy_item_joins_tmp as $v) {
            $groupbuy_item_joins[$v->user_id] = [
                'name' => $v->name,
                'mobile' => $v->mobile,
            ];
        }

        foreach ($groupbuy_item_list_tmp as $v) {
            $groupbuy_item_list[] = [
                'groupbuy_item_id' => $v->groupbuy_item_id,
                'user_id' => $v->user_id,
                'name' => $groupbuy_item_joins[$v->user_id]['name'],
                'mobile' => $groupbuy_item_joins[$v->user_id]['mobile'],
                'need_num' => $v->need_num,
                'now_num' => $v->now_num,
                'end_time' => date("Y-m-d H:i",$v->end_time),
                'add_time' => date("Y-m-d H:i",$v->add_time),
                'is_vip' => $v->is_vip,
                'is_invalid' => $v->is_invalid,
                'is_success' => $v->is_success,
            ];
        }

        $this->datas = [
            'groupbuy' => $groupbuy,
            'list' => $groupbuy_item_list,
            'count' => $count,
            'limit' => $this->limit,
        ];

    }


    public function joinList() {
        $groupbuy_item_id = (int) $this->request->param('groupbuy_item_id',0);
        $GroupBuyItemModel = new GroupBuyItemModel();
        $groupbuy_item = $GroupBuyItemModel->find($groupbuy_item_id);
        $GroupBuyItemJoinModel = new GroupBuyItemJoinModel();
        $where = [
            'groupbuy_item_id' => $groupbuy_item_id,
            'is_pay' => 1,
        ];
        $groupbuy_item_join_tmp = $GroupBuyItemJoinModel->where($where)->page($this->page,$this->limit)->select();
        $count = $GroupBuyItemJoinModel->where($where)->count();
        $groupbuy_item_join = [];
        $pay_type = getMean('order_payment_method');
        foreach ($groupbuy_item_join_tmp as $v) {
            $groupbuy_item_join[] = [
                'join_id' => $v->join_id,
                'user_id' => $v->user_id,
                'is_tuanzhang' => (int)($v->user_id == $groupbuy_item->user_id),
                'name' => $v->name,
                'mobile' => $v->mobile,
                'bar_code' => $v->bar_code,
                'key_name' => $v->key_name,
                //'goods_price' => moneyFormat($v->goods_price,true),
                //'shipping_price' => moneyFormat($v->shipping_price,true),
                'is_pay' => $v->is_pay,
                'pay_type' => $v->pay_type,
                'pay_type_mean' => $pay_type[$v->pay_type],
                'pay_time' => date("Y-m-d H:i",$v->pay_time),
            ];
        }
        $this->datas = [
            'list' => $groupbuy_item_join,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


}
