<?php

namespace app\shop\controller\admin\marketing;

use app\shop\controller\admin\Common;
use app\shop\model\shop\BargainItemModel;
use app\shop\model\shop\BargainModel;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\GoodsRepertoryModel;

class Bargain extends Common
{


    public function getCalldata(){
         $where = [
            'app_id' => $this->appId,
            'is_online' => 1,
        ];
        $showType = (int)$this->request->param('showType');
        $showType = $showType == 2 ? 2 : 3;//目前只有 一排2个或者一排3个
        $BargainModel = new BargainModel();
        $datas = $BargainModel->where($where)->order(['orderby'=>'desc'])->limit(0,$showType)->select();
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
                        'bargain_id' => $val['bargain_id'],
                        'bargain_price' => round($val['bargain_price']/100,2),
                        'photo'  => isset($goods[$val['goods_id']]) ? $goods[$val['goods_id']]['photo'] : '',
                        'price'  => isset($goods[$val['goods_id']]) ? round($goods[$val['goods_id']]['shop_price']/100,2) : '',
                    ];
                }
                $this->datas['goods'] = $return;
            }
        }

    }

    public function create(){
        $BargainModel = new BargainModel();
        $param = $BargainModel->dataFilter($this->appId);
        if($BargainModel->checkGoods($param) == false){
            $this->warning($BargainModel->getError());
        }
        if (($param['init_price'] - $param['bargain_price'])/$param['need_num'] < 1) {
            $this->warning("请输入合理砍完人数！");
        }

        $res = $BargainModel->setData($param);
        //处理砍价信息 验证砍价
        if ($res == false) {
            $this->warning($BargainModel->getError());
        }
        $GoodsModel = new GoodsModel();
        $GoodsModel->save([
            'prom_type' => getMean("shop_prom_type","k")['kj'],
            'prom_id'   => $BargainModel->bargain_id,
        ],['goods_id'=>$param['goods_id']]);
    }

    public function edit()
    {
        $bargain_id = (int)$this->request->param("bargain_id");
        $BargainModel = new BargainModel();
        if (!$detail = $BargainModel->find($bargain_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $param = $BargainModel->dataFilter($this->appId);
        if (($param['init_price'] - $param['bargain_price'])/$param['need_num'] < 1) {
            $this->warning("请输入合理砍完人数！");
        }

        $res = $BargainModel->setData($param,$bargain_id);
        if ($res === false) {
            $this->warning($BargainModel->getError());
        }

        $GoodsModel = new GoodsModel();
        //如果换产品了   释放原产品
        if ($param['goods_id'] != $detail['goods_id']) {
            $GoodsModel->save(['prom_type'=>0,'prom_id'=>0],['goods_id'=>$detail['goods_id']]);
        }
        //保存新的关联(可能没变)
        $GoodsModel->save([
            'prom_type' => getMean("shop_prom_type","k")['kj'],
            'prom_id'   => $bargain_id,
        ],['goods_id'=>$param['goods_id']]);
    }

    public function del()
    {
        $bargain_id = (int)$this->request->param("bargain_id");
        $BargainModel = new BargainModel();
        if (!$detail = $BargainModel->find($bargain_id)) {
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

        if ($good->prom_type != getMean("shop_prom_type","k")['kj'] || $good->prom_id != $bargain_id) {
            $this->warning("参数不正确！");
        }
        $GoodsModel->save(['prom_type'=>0,'prom_id'=>0],['goods_id'=>$detail->goods_id]);
        $BargainModel->where("bargain_id", $bargain_id)->delete();
    }

    public function detail()
    {
        $bargain_id = (int)$this->request->param("bargain_id");
        $BargainModel = new  BargainModel();
        if (!$detail = $BargainModel->find($bargain_id)) {
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
            $specTmp = $GoodsRepertoryModel->where(['goods_id' => $goods->goods_id])->select();
            foreach ($specTmp as $v) {
                $spec[] = [
                    'repertory_id' => $v->repertory_id,
                    'goods_id' => $v->goods_id,
                    'spec_key' => $v->spec_key,
                    'key_name' => $v->key_name,
                    'shop_price' => moneyFormat($v->shop_price),
                    'goods_num' => $v->goods_num,
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
            'market_price' => moneyFormat($goods->market_price,true),
            'shop_price' => moneyFormat($goods->shop_price,true),
            'photo' => $goods->photo,
            'sku_type' => $goods->sku_type,
            'goods_spec' => $spec,
        ];


        $detail = [
            'bargain_id' => $detail->bargain_id,
            'goods_id' => $detail->goods_id,
            'need_num' => $detail->need_num,
            'sold_num' => $detail->sold_num,
            'is_vip_more_bargain' => $detail->is_vip_more_bargain,
            'orderby' => $detail->orderby,
            'end_time' => (int)($detail->end_time / 3600),
            'is_online' => $detail->is_online,
            'init_price' => moneyFormat($detail->init_price),
            'bargain_price' => moneyFormat($detail->bargain_price),
            'num' => $detail->num,
            'spec' => json_decode($detail->spec,true),
            'seo' => json_decode($detail->seo) ? json_decode($detail->seo,true) : $this->default_seo,
        ];


        $this->datas = [
            'detail' => $detail,
            'goods' => $goods,
        ];

    }




    public function index(){
        $BargainModel = new BargainModel();
        $where['app_id'] = $this->appId;
        $goods_id = (int)$this->request->param("goods_id",0);
        if ($goods_id) {
            $where["goods_id"] = $goods_id;
        }
        $bargain_id = (int)$this->request->param("bargain_id",0);
        if ($bargain_id) {
            $where["bargain_id"] = $bargain_id;
        }
//        $keywords = (string)$this->request->param("keywords",'');
//        if ($keywords) {
//            $where["spec"] = ['like',"%$keywords%"];
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
        $list = $BargainModel->where($where)->order("bargain_id desc")->page($this->page, $this->limit)->select();
        $count = $BargainModel->where($where)->count();
        $goodsIds = [];
        foreach ($list as $val){
            $goodsIds[$val->goods_id] = $val->goods_id;
        }
        $GoodsModel = new GoodsModel();
        $goods  =  $GoodsModel->itemsByIds($goodsIds);
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'bargain_id' => $val->bargain_id,
                'goods_id' => $val->goods_id,
                'goods_name' => empty($goods[$val->goods_id]) ? '' :  $goods[$val->goods_id]->goods_name,
                'photo' => empty($goods[$val->goods_id]) ? '' :  $goods[$val->goods_id]->photo,
                'goods_sn' => empty($goods[$val->goods_id]) ? '' :  $goods[$val->goods_id]->goods_sn,
                'need_num' => $val->need_num,
                'sold_num' => $val->sold_num,
                'is_vip_more_bargain' => $val->is_vip_more_bargain,
                'orderby' => $val->orderby,
                'end_time' => (int)($val->end_time/3600),
                'is_online' => $val->is_online,
                'init_price' => moneyFormat($val->init_price,true),
                'bargain_price' => moneyFormat($val->bargain_price,true),
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




    public function setOnline()
    {
        $bargain_id = (int)$this->request->param("bargain_id",0);
        $is_online = (int)($this->request->param("is_online") == 1);
        $BargainModel = new  BargainModel();
        if (!$detail = $BargainModel->find($bargain_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $BargainModel->save(['is_online'=>$is_online],['bargain_id'=>$bargain_id]);
    }



    public function join() {
        $bargain_id = (int) $this->request->param('bargain_id',0);
        $where = [
            'bargain_id' => $bargain_id,
        ];
        $user_id = (int) $this->request->param('user_id',0);
        $name = (string) $this->request->param('name','');
        $mobile = (string) $this->request->param('mobile','');
        $now_num = (int) $this->request->param('now_num',0);
        $end_time = (int) $this->request->param('end_time','','strtotime');
        $add_time = (int) $this->request->param('add_time','','strtotime');
        $is_invalid = (int) $this->request->param('is_invalid',-999);
        $is_pay = (int) $this->request->param('is_pay',-999);
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
        if ($is_pay >= 0) {
            $where['is_pay'] = $is_pay;
        }
        if ($is_success >= 0) {
            $where['is_success'] = $is_success;
        }

        $BargainItemModel = new BargainItemModel();
        $bargain_list_tmp = $BargainItemModel->where($where)->order('bargain_item_id desc')->page($this->page,$this->limit)->select();
        $count = $BargainItemModel->where($where)->count();
        $bargain_list = [];
        //$bargain = [];
        $BargainModel = new BargainModel();
        $bargain_tmp = $BargainModel->find($bargain_id);
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->find($bargain_tmp->goods_id);
        $bargain = [
            'goods_sn' => $goods->goods_sn,
            'goods_name' => $goods->goods_name,
            'need_num' => $bargain_tmp->need_num,
            'is_vip_more_bargain' => $bargain_tmp->is_vip_more_bargain,
            'end_time' => $bargain_tmp->end_time / 3600,
        ];
        foreach ($bargain_list_tmp as $v) {
            $bargain_log = [];
            $bargain_log_tmp = json_decode($v->bargain_log, true) ? json_decode($v->bargain_log, true) : [];
            foreach ($bargain_log_tmp as $vv) {
                if ($vv['user_id']) {
                    $bargain_log[] = [
                        'user_id' => $vv['user_id'],
                        'nickname' => $vv['nickname'],
                        'face' => $vv['face'],
                        'price' => moneyFormat($vv['price'])
                    ];
                }
            }
            $bargain_list[] = [
                'bargain_item_id' => $v->bargain_item_id,
                'user_id' => $v->user_id,
                'name' => $v->name,
                'mobile' => $v->mobile,
                'goods_name' => $v->goods_name,
                'key_name' => $v->spec_key ? $v->key_name : '无规格',
                'photo' => $v->photo,
                'now_price' => moneyFormat($v->now_price, true),
                'bargain_price' => moneyFormat($v->bargain_price, true),
                'init_price' => moneyFormat($v->init_price, true),
                'now_num' => $v->now_num,
                'need_num' => $v->need_num,
                'bargain_log' => $bargain_log,
                'end_time' => date("Y-m-d H:i",$v->end_time),
                'add_time' => date("Y-m-d H:i",$v->add_time),
                'is_invalid' => $v->is_invalid,
                'is_pay' => $v->is_pay,
                'is_success' => $v->is_success,
            ];
        }

        $this->datas = [
            'bargain' => $bargain,
            'list' => $bargain_list,
            'count' => $count,
            'limit' => $this->limit,
        ];

    }

}
