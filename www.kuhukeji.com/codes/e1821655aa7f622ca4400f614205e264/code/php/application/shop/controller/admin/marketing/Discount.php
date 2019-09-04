<?php

namespace app\shop\controller\admin\marketing;

use app\shop\controller\admin\Common;
use app\shop\model\shop\DiscountModel;
use app\shop\model\shop\GoodsModel;

class Discount extends Common
{
    public function create(){
        $DiscountModel = new DiscountModel();
        $param = $DiscountModel->dataFilter($this->appId);
        $discounts = $DiscountModel->where(['app_id'=>$this->appId])->select();
        if ($param['start_time'] >= $param['end_time']) {
            $this->warning("请选择合理的时间范围");
        }
        foreach ($discounts as $v) {
            if (($param['end_time'] < $v->end_time && $param['end_time'] > $v->start_time) || ($param['start_time'] < $v->end_time && $param['start_time'] > $v->start_time)) {
                $this->warning("活动开始结束时间不得与其他同类活动交叉，请选择合理时间范围");
            }
        }
        if($DiscountModel->checkGoods($param) === false){
            $this->warning($DiscountModel->getError() ? $DiscountModel->getError():'"请填选择商品"');
        }

        $res = $DiscountModel->setData($param);
        if ($res === false) {
            $this->warning($DiscountModel->getError());
        }
        $param['goods_ids'] = json_decode($param['goods_ids']) ? json_decode($param['goods_ids'],true) : '';

        $GoodsModel = new GoodsModel();
        $GoodsModel->isUpdate(true)->save([
            'prom_type' => getMean("shop_prom_type","k")['dz'],
            'prom_id'   => $DiscountModel->discount_id,
        ],['goods_id'=> ['in',$param['goods_ids']]]);
    }
    

    
    public function getCalldata(){
        $showType =(int) $this->request->param('showType');
        $showType = $showType == 2 ? 2 :3; //是显示3个还是显示10个 
        $t = time();
        $where = [
            'app_id'=> $this->appId,
            'is_online' => 1,
            'start_time' => ['ELT',$t],
            'end_time'   => ['EGT',$t],
        ];
        $discount = DiscountModel::where($where)->find();
        if(!empty($discount)){
            $endTime = $discount['end_time'] - $t; //还有多少时间
            $goodsId = json_decode($discount['goods_ids'],true);
            if(!empty($goodsId)){
               $GoodsModel = new GoodsModel();
               $goods = $GoodsModel->itemsByIds($goodsId);
               if(!empty($goods)){
                    $myGoods = [];
                    $i = 0;
                    foreach($goods as $val){
                        if($val['is_online'] == 1){
                            $i++;
                            $myGoods[] = [
                                'goods_name' => $val['goods_name'],
                                'shop_price'    => round($val['shop_price']/100,2),
                                'discount_price' => round($val['shop_price'] * $discount['discount']/10000,2),
                                'photo' => $val['photo'],
                                'goods_id' => $val['goods_id'],
                            ];
                            if($i == $showType) break;
                        }
                    }
                    
                    if(!empty($myGoods)){
                        $this->datas['goods'] = $myGoods;
                        $this->datas['djs'] = $endTime;
                    }
               }
            }
        }
    }

    public function edit()
    {
        $discount_id = (int)$this->request->param("discount_id");
        $DiscountModel = new DiscountModel();
        if (!$detail = $DiscountModel->find($discount_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $param = $DiscountModel->dataFilter($this->appId);

        if ($param['start_time'] >= $param['end_time']) {
            $this->warning("请选择合理的时间范围");
        }

        $discounts = $DiscountModel->where(['app_id'=>$this->appId,'discount_id'=>['neq',$discount_id]])->select();
        foreach ($discounts as $v) {
            if ($v->discount_id != $discount_id) {
                if (($param['end_time'] < $v->end_time && $param['end_time'] > $v->start_time) || ($param['start_time'] < $v->end_time && $param['start_time'] > $v->start_time)) {
                    $this->warning("活动开始结束时间不得与其他同类活动交叉，请选择合理时间范围");
                }
            }
        }

        $goodsIds = json_decode($param['goods_ids']) ? json_decode($param['goods_ids'],true) : '';

        if (!$check = $DiscountModel->checkGoods($param,$discount_id)) {
            $this->warning($DiscountModel->getError());
        }
        $res = $DiscountModel->setData($param,$discount_id);
        if ($res === false) {
            $this->warning($DiscountModel->getError());
        }
        $goodsData = [];
        foreach ($goodsIds as $val) {
            $goodsData[] = [
                'goods_id' => $val,
                'prom_id' => $discount_id,
                'prom_type' => getMean("shop_prom_type", "k")['dz'],
            ];
        }
        $GoodsModel = new GoodsModel();
        $GoodsModel->saveAll($goodsData);
        $delGoodsIds = array_diff(json_decode($detail->goods_ids), $goodsIds);
        if (!empty($delGoodsIds)) {
            $delGoodsData = [];
            foreach ($delGoodsIds as $val) {
                $delGoodsData[] = [
                    'goods_id' => $val,
                    'prom_id' => 0,
                    'prom_type' => 0,
                ];
            }
            $GoodsModel->saveAll($delGoodsData);
        }

    }

    public function del()
    {
        $discount_id = (int)$this->request->param("discount_id");
        $DiscountModel = new DiscountModel();
        if (!$detail = $DiscountModel->find($discount_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $goodsIds = json_decode($detail->goods_ids, true) ? json_decode($detail->goods_ids, true) : '';
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->itemsByIds($goodsIds);
        foreach ($goods as $v) {
            if ($v->app_id != $this->appId) {
                $this->warning("参数不正确！");
            }

            if ($v->prom_type != getMean("shop_prom_type","k")['dz'] || $v->prom_id != $discount_id) {
                $this->warning("参数不正确！");
            }
        }

        $GoodsModel->save(['prom_type'=>0,'prom_id'=>0],['goods_id'=>['in',$goodsIds]]);
        $DiscountModel->where("discount_id", $discount_id)->delete();
    }

    public function detail()
    {
        $discount_id = (int)$this->request->param("discount_id");
        $DiscountModel = new  DiscountModel();
        if (!$detail = $DiscountModel->find($discount_id)) {
            $this->warning("不存在数据!");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据!");
        }
        $goodsIds = json_decode($detail->goods_ids,true) ? json_decode($detail->goods_ids,true) : '';

        $GoodsModel = new GoodsModel();

        if (!$_goods =  $GoodsModel->itemsByIds($goodsIds)) {
            $this->warning('参数不正确!');
        }
        $goods = [];
        foreach ($_goods as $v) {
            if ($v->app_id != $this->appId) {
                $this->warning('参数不正确!');
            }
            $goods[] = [
                'goods_id' => $v->goods_id,
                'cat_id' => $v->cat_id,
                'p_cat_id' => $v->p_cat_id,
                'goods_sn' => $v->goods_sn,
                'goods_name' => $v->goods_name,
                'market_price' =>  round($v->market_price / 10,1),
                'shop_price' => round($v->shop_price / 10 ,1),
                'photo' => $v->photo,
                'sku_type' => $v->sku_type,
            ];
        }


        $detail = [
            'discount_id' => $detail->discount_id,
            'goods_ids' => $goodsIds,
            'name' => $detail->name,
            'prom_img' => (string) $detail->prom_img,
            'discount' => round($detail->discount/10,1),
            'vip_discount' => round($detail->vip_discount/10,1),
            'start_time' => date("Y-m-d H:i",$detail->start_time),
            'end_time' => date("Y-m-d H:i",$detail->end_time),
            'buy_limit' => $detail->buy_limit,
            'buy_num' => $detail->buy_num,
            'orderby' => $detail->orderby,
            'is_vip' => $detail->is_vip,
            'is_online' => $detail->is_online,
            'seo' => json_decode($detail->seo) ? json_decode($detail->seo, true) : $this->default_seo,
        ];


        $this->datas = [
            'detail' => $detail,
            'goods' => $goods,
        ];

    }


    public function index(){
        $DiscountModel = new DiscountModel();
        $where['app_id'] = $this->appId;

        $discount_id = (int)$this->request->param("discount_id",0);
        if ($discount_id) {
            $where["discount_id"] = $discount_id;
        }

        $is_online = (int)$this->request->param("is_online",-999);
        if ($is_online >= 0) {
            $where["is_online"] = $is_online;
        }
        $is_vip = (int)$this->request->param("is_vip",-999);
        if ($is_vip >= 0) {
            $where["is_vip"] = $is_vip;
        }
        $end_add_time = (int)$this->request->param("end_add_time", 0, "strtotime");
        $bg_add_time = (int)$this->request->param("bg_add_time", 0, "strtotime");
        if ($end_add_time > 0 && $bg_add_time > 0) {
            $where["add_time"] = ["between", [$bg_add_time, $end_add_time]];
        }
        $end_start_time = (int)$this->request->param("end_start_time", 0, "strtotime");
        $bg_start_time = (int)$this->request->param("bg_start_time", 0, "strtotime");
        if ($end_add_time > 0 && $bg_add_time > 0) {
            $where["start_time"] = ["between", [$bg_start_time, $end_start_time]];
        }
        $end_end_time = (int)$this->request->param("end_end_time", 0, "strtotime");
        $bg_end_time = (int)$this->request->param("bg_end_time", 0, "strtotime");
        if ($end_end_time > 0 && $bg_end_time > 0) {
            $where["end_time"] = ["between", [$bg_end_time, $end_end_time]];
        }
        $list = $DiscountModel->where($where)->order("discount_id desc")->page($this->page, $this->limit)->select();
        $count = $DiscountModel->where($where)->count();
        $goodsIdsTmp =  $goodsIds = [];
        foreach ($list as $val){
            $goodsIdsTmp[] = json_decode($val->goods_ids,true);
        }
        foreach ($goodsIdsTmp as $v) {
            foreach ($v as $vv) {
                $goodsIds[$vv] = $vv;
            }
        }

        $GoodsModel = new GoodsModel();
        $goods  =  $GoodsModel->itemsByIds($goodsIds);

        $datas = [];
        foreach ($list as $val) {
            $itemGoodsIds = json_decode($val->goods_ids, true) ? json_decode($val->goods_ids, true) : [];
            $datas[] = [
                'discount_id' => $val->discount_id,
                'goods_ids' => $itemGoodsIds,
                'name' => $val->name,
                'goods_name' => empty($goods[$itemGoodsIds[0]]) ? '' :  $goods[$itemGoodsIds[0]]['goods_name'],
                'discount' => round($val->discount / 10,1),
                'vip_discount' => round($val->vip_discount / 10,1),
                'is_vip' => $val->is_vip,
                'is_online' => $val->is_online,
                'orderby' => $val->orderby,
                'start_time' => date("Y/m/d H:i:s",$val->start_time),
                'end_time' => date("Y/m/d H:i:s",$val->end_time),
                'add_time' => date("Y/m/d H:i:s",$val->add_time),
                'add_ip' => $val->add_ip,
                'buy_num' => $val->buy_num,
                'buy_limit' => $val->buy_limit,
                'prom_img' => (string) $val->prom_img,
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
        $discount_id = (int)$this->request->param("discount_id",0);
        $is_online = (int)($this->request->param("is_online") == 1);
        $DiscountModel = new  DiscountModel();
        if (!$detail = $DiscountModel->find($discount_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $DiscountModel->save(['is_online'=>$is_online],['discount_id'=>$discount_id]);
    }

}
