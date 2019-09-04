<?php

namespace app\shop\controller\admin\marketing;

use app\shop\controller\admin\Common;
use app\shop\logic\shop\goods\GoodsLogic;
use app\shop\logic\shop\goods\GoodsRepertoryLogic;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\GoodsRepertoryModel;
use app\shop\model\shop\RushBuyGoodsModel;
use app\shop\model\shop\RushBuyModel;


class Rushbuy extends Common
{
    public function detail()
    {
        $rushbuy_id = (int)$this->request->param("rushbuy_id");
        $RushBuyModel = new  RushBuyModel();
        if (!$detail = $RushBuyModel->find($rushbuy_id)) {
            $this->warning("不存在数据!");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据!");
        }

        $detail = [
            'rushbuy_id' => $detail->rushbuy_id,
            'order_num' => $detail->order_num,
            'start_time' => date("Y-m-d H:i",$detail->start_time),
            'end_time' => date("Y-m-d H:i",$detail->end_time),
            'is_online' => $detail->is_online,
            'is_vip' => (int) $detail->is_vip,
            'orderby' => $detail->orderby,
            'seo' => json_decode($detail->seo) ? json_decode($detail->seo,true) : $this->default_seo,
        ];

        $this->datas = $detail;
    }


    public function edit()
    {
        $rushbuy_id = (int)$this->request->param("rushbuy_id",0);
        $RushBuyModel = new RushBuyModel();
        if (!$detail = $RushBuyModel->find($rushbuy_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $param = $RushBuyModel->dataFilter($this->appId);
        if ($param['start_time'] >= $param['end_time']) {
            $this->warning("请选择合理的时间范围");
        }

        $rushbuys = $RushBuyModel->where(['app_id'=>$this->appId,'rushbuy_id'=>['neq',$rushbuy_id]])->select();
        foreach ($rushbuys as $v) {
            if ($v->rushbuy_id != $rushbuy_id) {
                if (($param['end_time'] < $v->end_time && $param['end_time'] > $v->start_time) || ($param['start_time'] < $v->end_time && $param['start_time'] > $v->start_time)) {
                    $this->warning("活动开始结束时间不得与其他同类活动交叉，请选择合理时间范围");
                }
            }
        }
        $res = $RushBuyModel->setData($param,$rushbuy_id);
        if ($res == false) {
            $this->warning($RushBuyModel->getError());
        }
    }


    public function create(){
        $RushBuyModel = new RushBuyModel();
        $param = $RushBuyModel->dataFilter($this->appId);
        $rushbuys = $RushBuyModel->where(['app_id'=>$this->appId])->select();
        if ($param['start_time'] >= $param['end_time']) {
            $this->warning("请选择合理的时间范围");
        }
        foreach ($rushbuys as $v) {
            if (($param['end_time'] < $v->end_time && $param['end_time'] > $v->start_time) || ($param['start_time'] < $v->end_time && $param['start_time'] > $v->start_time)) {
                $this->warning("活动开始结束时间不得与其他同类活动交叉，请选择合理时间范围");
            }
        }
        $res = $RushBuyModel->setData($param);
        if ($res == false) {
            $this->warning($RushBuyModel->getError());
        }
    }


    public function index(){
        $RushBuyModel = new RushBuyModel();
        $where['app_id'] = $this->appId;
        $rushbuy_id = (int)$this->request->param("rushbuy_id",0);
        if ($rushbuy_id) {
            $where["rushbuy_id"] = $rushbuy_id;
        }
        $name = (string)$this->request->param("name",'');
        if ($name) {
            $where["name"] = ['like',"%$name%"];
        }
        $is_online = (int)$this->request->param("is_online",-999);
        if ($is_online >= 0) {
            $where["is_online"] = $is_online;
        }
        $end_add_time = (int)$this->request->param("end_add_time", 0, "strtotime");
        $bg_add_time = (int)$this->request->param("bg_add_time", 0, "strtotime");
        if ($end_add_time > 0 && $bg_add_time > 0) {
            $where["add_time"] = ["between", [$bg_add_time, $end_add_time]];
        }
        $listTmp = $RushBuyModel->where($where)->order("rushbuy_id desc")->page($this->page, $this->limit)->select();
        $count = $RushBuyModel->where($where)->count();
        $list = [];
        foreach ($listTmp as $v) {
            $list[] = [
                'rushbuy_id' => $v->rushbuy_id,
                'name' => $v->name,
                'prom_img' => $v->prom_img,
                'order_num' => $v->order_num,
                'start_time' => $v->start_time ? date("Y-m-d H:i",$v->start_time) : '--',
                'end_time' => $v->end_time ? date("Y-m-d H:i",$v->end_time) : '--',
                'is_online' => $v->is_online,
                'is_vip' => $v->is_vip,
                'orderby' => $v->orderby,
                'add_time' => $v->add_time ? date("Y-m-d H:i",$v->add_time) : '--',
                'add_ip' => $v->add_ip,
                'seo' => json_decode($v->seo) ? json_decode($v->seo,true) : $this->default_seo,
            ];
        }

        $this->datas = [
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    public function online()
    {
        $rushbuy_id = (int)$this->request->param("rushbuy_id",0);
        $is_online = (int)($this->request->param("is_online") == 1);
        $RushBuyModel = new  RushBuyModel();
        if (!$detail = $RushBuyModel->find($rushbuy_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $RushBuyModel->save(['is_online'=>$is_online],['rushbuy_id'=>$rushbuy_id]);
    }


    public function del()
    {
        $rushbuy_id = (int)$this->request->param("rushbuy_id");
        $RushBuyModel = new RushBuyModel();
        if (!$detail = $RushBuyModel->find($rushbuy_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $RushBuyGoodsModel = new RushBuyGoodsModel();
        $count = $RushBuyGoodsModel->where(['rushbuy_id'=>$rushbuy_id,'app_id'=>$this->appId])->count();
        if ($count > 0) {
            $this->warning("当前活动下存在关联商品，请先删除关联商品再删除！");
        }
        $RushBuyModel->where("rushbuy_id", $rushbuy_id)->delete();
    }


    public function goodsIndex(){
        $rushbuy_id = (int) $this->request->param('rushbuy_id',0);
        $RushBuyModel = new RushBuyModel();
        if (!$rushbuy = $RushBuyModel->find($rushbuy_id)) {
            $this->warning("参数不正确");
        }
        $RushBuyGoodsModel = new RushBuyGoodsModel();
        $where['app_id'] = $this->appId;
        $where['rushbuy_id'] = $rushbuy_id;
        $goods_id = (int)$this->request->param("goods_id",0);
        if ($goods_id) {
            $where["goods_id"] = $goods_id;
        }
        $keywords = (string)$this->request->param("keywords",'');
        if ($keywords) {
            $where["goods_name|spec"] = ['like',"%$keywords%"];
        }

        $listTmp = $RushBuyGoodsModel->where($where)->order("rushbuy_goods_id desc")->page($this->page, $this->limit)->select();
        $count = $RushBuyGoodsModel->where($where)->count();
        $goodsIds = [];
        foreach ($listTmp as $v) {
            $goodsIds[$v->goods_id] = $v->goods_id;
        }
        $goodsIds = empty($goodsIds) ? '' : $goodsIds;
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->itemsByIds($goodsIds);
        $list = [];
        foreach ($listTmp as $v) {
            $list[] = [
                'rushbuy_id' => $v->rushbuy_id,
                'rushbuy_goods_id' => $v->rushbuy_goods_id,
                'goods_id' => $v->goods_id,
                'goods_name' => isset($goods[$v->goods_id]['goods_name']) ? $goods[$v->goods_id]['goods_name'] : '--',
                'photo' => empty($goods[$v->goods_id]['photo']) ? '' : $goods[$v->goods_id]['photo'],
                'rushbuy_price' => moneyFormat($v->rushbuy_price,true),
                'vip_rushbuy_price' => moneyFormat($v->vip_rushbuy_price,true),
                'is_vip' => $v->is_vip,
                'spec' => json_decode($v->spec, true),
                'goods_num' => $v->goods_num,
                'buy_num' => $v->buy_num,
                'is_online' => $v->is_online,
                'orderby' => $v->orderby,
                'add_time' => date("Y-m-d H:i",$v->add_time),
                'add_ip' => (string) $v->add_ip,
            ];
        }
        $rushbuy_data = [
            'rushbuy_id' => $rushbuy->rushbuy_id,
            'name' => $rushbuy->name,
            'start_time' => date("Y-m-d H:i",$rushbuy->start_time),
            'end_time' => date("Y-m-d H:i",$rushbuy->end_time),
            'surplus_time' => $rushbuy->end_time - time() > 0 ? $rushbuy->end_time - time() : 0,
        ];

        $this->datas = [
            'rushbuy' => $rushbuy_data,
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    public function goodsCreate(){
        $rushbuy_id = (int) $this->request->param('rushbuy_id',0);
        if (!$rushbuy_id) {
            $this->warning('参数不正确！');
        }
        $RushBuyGoodsModel = new RushBuyGoodsModel();
        $param = $RushBuyGoodsModel->dataFilter($this->appId);

        $spec = $RushBuyGoodsModel->checkGoods($param,$rushbuy_id);
        if ($spec === false) {
            $this->warning($RushBuyGoodsModel->getError() ? $RushBuyGoodsModel->getError():'"请填选择商品"');
        }


        $GoodsModel = new GoodsModel();
        if (!$goods = $GoodsModel->where(['app_id'=>$this->appId])->find($param['goods_id'])) {
            $this->warning('商品不存在！');
        }
        //$spec = json_decode($param['spec']) ? json_decode($param['spec'],true) : [];

        if (count($spec) <= 1 && $goods->sku_type == 0) {
            if($param['is_vip'] == 1 && $param['vip_rushbuy_price'] <= 0){
                $this->warning("请输入会员价格");
            }
            $spec[0]['rushbuy_price'] = isset($param['rushbuy_price']) ? moneyFormat($param['rushbuy_price']) : 0;
            $spec[0]['vip_rushbuy_price'] = isset($param['vip_rushbuy_price']) ? moneyFormat($param['vip_rushbuy_price']) : 0;

        }


        $_spec = [];
        if (!empty($spec) && $goods->sku_type == 1) {
            if (!empty($spec)) {
                $rushbuy_price = $vip_rushbuy_price = [];
                $goods_num = 0;
                foreach ($spec as $v) {
                    if($param['is_vip'] == 1 && $v['vip_rushbuy_price'] <= 0){
                        $this->warning("请输入会员价格");
                    }
                    $rushbuy_price[] = isset($v['rushbuy_price']) ? moneyToInt($v['rushbuy_price']) : 0;
                    $vip_rushbuy_price[] = isset($v['vip_rushbuy_price']) ? moneyToInt($v['vip_rushbuy_price']) : 0;
                    $_goods_num = isset($v['goods_num']) ? $v['goods_num'] : 0;
                    $goods_num = $goods_num + $_goods_num;
                    $_spec[] = [
                        'repertory_id' => $v['repertory_id'],
                        'spec_key' => $v['spec_key'],
                        'key_name' => $v['key_name'],
                        'shop_price' => moneyToInt($v['shop_price']),
                        'market_price' => moneyToInt($v['market_price']),
                        'plus_vip_price' => moneyToInt($v['plus_vip_price']),
                        'goods_num' => $v['goods_num'],
                        'sku_type' => $v['sku_type'],
                        'photo' => $v['photo'],
                        'rushbuy_price' => moneyToInt($v['rushbuy_price']),
                        'vip_rushbuy_price' => moneyToInt($v['vip_rushbuy_price']),
                    ];
                }
                sort($rushbuy_price);
                sort($vip_rushbuy_price);
                $param['rushbuy_price'] = isset($rushbuy_price[0]) ? $rushbuy_price[0] : 0;

                $param['vip_rushbuy_price'] = $param['is_vip'] == 1 ? (isset($vip_rushbuy_price[0]) ? $vip_rushbuy_price[0] : 0) : 0;
                $param['goods_num'] = $goods_num;
            }
        }

        $param['goods_name'] = $goods['goods_name'];
        //$param['surplus_num'] = (int) $this->request->param('surplus_num',0);

        $param['spec'] = json_encode($_spec);

        $res = $RushBuyGoodsModel->setData($param);
        if ($res == false) {
            $this->warning($RushBuyGoodsModel->getError());
        }

        $GoodsModel = new GoodsModel();
        $GoodsModel->save([
            'prom_type' => getMean("shop_prom_type","k")['qg'],
            'prom_id'   => $rushbuy_id,
        ],['goods_id'=>$param['goods_id']]);
    }


    public function goodsEdit()
    {
        $rushbuy_goods_id = (int)$this->request->param("rushbuy_goods_id");
        $RushBuyGoodsModel = new RushBuyGoodsModel();
        if (!$detail = $RushBuyGoodsModel->find($rushbuy_goods_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $param = $RushBuyGoodsModel->dataFilter($this->appId);
        $rep_spec = $RushBuyGoodsModel->checkGoods($param);

        if($rep_spec === false){
            $this->warning($RushBuyGoodsModel->getError() ? $RushBuyGoodsModel->getError():'"请填选择商品"');
        }
        $spec = json_decode($param['spec']) ? json_decode($param['spec'],true) : [];
        $GoodsModel = new GoodsModel();
        if (!$goods = $GoodsModel->where(['app_id'=>$this->appId])->find($param['goods_id'])) {
            $this->warning('商品不存在！');
        }

        if (count($spec) <= 1 && $goods->sku_type == 0) {
            $spec[0]['rushbuy_price'] = isset($param['rushbuy_price']) ? moneyFormat($param['rushbuy_price']) : 0;
            $spec[0]['vip_rushbuy_price'] = isset($param['vip_rushbuy_price']) ? moneyFormat($param['vip_rushbuy_price']) : 0;
            if($param['is_vip'] == 1 && $param['vip_rushbuy_price'] <= 0){
                $this->warning("请输入会员价格");
            }
        }

        $_spec = [];
        if (!empty($spec) && $goods->sku_type == 1) {
            if (!empty($spec)) {
                $rushbuy_price = $vip_rushbuy_price = [];
                $goods_num = 0;
                foreach ($spec as $v) {
                    if($param['is_vip'] == 1 && $v['vip_rushbuy_price'] <= 0){
                        $this->warning("请输入会员价格");
                    }
                    $rushbuy_price[] = isset($v['rushbuy_price']) ? moneyToInt($v['rushbuy_price']) : 0;
                    $vip_rushbuy_price[] = isset($v['vip_rushbuy_price']) ? moneyToInt($v['vip_rushbuy_price']) : 0;
                    $_goods_num = isset($v['goods_num']) ? $v['goods_num'] : 0;
                    $goods_num = $goods_num + $_goods_num;
                    $_spec[] = [
                        'repertory_id' => $v['repertory_id'],
                        'spec_key' => $v['spec_key'],
                        'key_name' => $v['key_name'],
                        'shop_price' => moneyToInt($v['shop_price']),
                        'market_price' => moneyToInt($v['market_price']),
                        'plus_vip_price' => moneyToInt($v['plus_vip_price']),
                        'goods_num' => $v['goods_num'],
                        'sku_type' => $v['sku_type'],
                        'photo' => $v['photo'],
                        'rushbuy_price' => isset($v['rushbuy_price']) ? moneyToInt($v['rushbuy_price']) : 0,
                        'vip_rushbuy_price' => isset($v['vip_rushbuy_price']) ? moneyToInt($v['vip_rushbuy_price']) : 0,
                    ];
                }
                sort($rushbuy_price);
                sort($vip_rushbuy_price);
                $param['rushbuy_price'] = isset($rushbuy_price[0]) ? $rushbuy_price[0] : 0;
                $param['vip_rushbuy_price'] = $param['is_vip'] == 1 ? (isset($vip_rushbuy_price[0]) ? $vip_rushbuy_price[0] : 0) : 0;
                $param['goods_num'] = $goods_num;
            }
        }


        $param['goods_name'] = $detail['goods_name'];
        $param['spec'] = json_encode($_spec);
        //$param['surplus_num'] = (int) $this->request->param('surplus_num',0);

        $res = $RushBuyGoodsModel->setData($param,$rushbuy_goods_id);
        if ($res === false) {
            $this->warning($RushBuyGoodsModel->getError());
        }
        //如果换产品了   释放原产品
        $GoodsModel = new GoodsModel();
        if ($param['goods_id'] != $detail['goods_id']) {
            $GoodsModel->save(['prom_type'=>0,'prom_id'=>0],['goods_id'=>$detail['goods_id']]);
        }
        $GoodsModel->save([
            'prom_type' => getMean("shop_prom_type","k")['qg'],
            'prom_id'   => $detail->rushbuy_id,
        ],['goods_id'=>$param['goods_id']]);
    }


    public function goodsDetail()
    {
        $rushbuy_id = (int)$this->request->param("rushbuy_id");
        $rushbuy_goods_id = (int)$this->request->param("rushbuy_goods_id");
        $RushBuyGoodsModel = new RushBuyGoodsModel();
        if (!$detail = $RushBuyGoodsModel->find($rushbuy_goods_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }

        $GoodsModel = new GoodsModel();
        if (!$goods = $GoodsModel->find($detail->goods_id)) {
            $this->warning("不存在商品");
        }

        $spec = [];
        $goods_num = 0;
        if ($goods->sku_type == 1) {
            $specTmp = json_decode($detail->spec) ? json_decode($detail->spec,true) : [];
            $spec = [];
            foreach ($specTmp as $v) {
                $_goods_num = (int) $v['goods_num'];
                $goods_num = $goods_num + $_goods_num;
                $spec[] = [
                    'spec_key' => $v['spec_key'],
                    'key_name' => $v['key_name'],
                    'market_price' => moneyFormat($v['market_price']),
                    'shop_price' => moneyFormat($v['shop_price']),
                    'plus_vip_price' => moneyFormat($v['plus_vip_price']),
                    'photo' => $v['photo'],
                    'rushbuy_price' => isset($v['rushbuy_price']) ? moneyFormat($v['rushbuy_price']) : 0,
                    'vip_rushbuy_price' => isset($v['vip_rushbuy_price']) ? moneyFormat($v['vip_rushbuy_price']) : 0,
                    'goods_num' => (int) $v['goods_num'],
                ];
            }
        }

        $goods = [
            'goods_id' => $goods->goods_id,
            'goods_name' => $goods->goods_name,
            'photo' => $goods->photo,
            'sku_type' => $goods->sku_type,
            'shop_price' => moneyFormat($goods->shop_price),
            'goods_spec' => $spec,
            'orderby' => $detail->orderby,
            'rushbuy_price' => $detail->rushbuy_price ? moneyFormat($detail->rushbuy_price) : 0,
            'vip_rushbuy_price' => $detail->vip_rushbuy_price ? moneyFormat($detail->vip_rushbuy_price) : 0,
            'is_online' => $detail->is_online,
            'is_vip' => $detail->is_vip,
            'goods_num' => $goods->sku_type == 1 ? $goods_num : $detail->goods_num,
            //'surplus_num' => (int)$detail->surplus_num,
        ];

        $GoodsRepertoryModel = new GoodsRepertoryModel();
        $rep_where = [
            'goods_id' => $goods['goods_id'],
        ];
        $rep_tmp = $GoodsRepertoryModel->where($rep_where)->select();
        $rep = [];
        foreach ($rep_tmp as $v) {
            $rep[] = [
                'repertory_id' => $v->repertory_id,
                'spec_key' => $v->spec_key,
                'key_name' => $v->key_name,
                'shop_price' => moneyFormat($v->shop_price),
                'market_price' => moneyFormat($v->market_price),
                'plus_vip_price' => moneyFormat($v->plus_vip_price),
                'goods_num' => $v->goods_num,
                'sku_type' => $v->sku_type,
                'photo' => $v->photo,
            ];
        }


        $this->datas = [
            'goods' => $goods,
            'rep' => $rep,
            'count' => count($spec),
        ];

    }


    public function goodsDel()
    {
        $rushbuy_goods_id = (int)$this->request->param("rushbuy_goods_id");
        $RushBuyGoodsModel = new RushBuyGoodsModel();
        if (!$detail = $RushBuyGoodsModel->find($rushbuy_goods_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $GoodsModel = new GoodsModel();
        if (!$goods = $GoodsModel->find($detail->goods_id)) {
            $this->warning("不存在数据");
        }
        if ($goods->prom_type > 0 && $goods->prom_type != getMean("shop_prom_type","k")['qg'] && $goods->prom_type != $detail->rushbuy_id) {
            $this->warning("参数不正确!");
        }
        $GoodsModel->save(['prom_type'=>0,'prom_id'=>0],['goods_id'=>$detail->goods_id]);

        $RushBuyGoodsModel->where("rushbuy_goods_id", $rushbuy_goods_id)->delete();

    }


    public function goodsOnline()
    {
        $rushbuy_goods_id = (int)$this->request->param("rushbuy_goods_id");
        $is_online = (int)($this->request->param("is_online") == 1);
        $RushBuyGoodsModel = new RushBuyGoodsModel();
        if (!$detail = $RushBuyGoodsModel->find($rushbuy_goods_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $RushBuyGoodsModel->save(['is_online'=>$is_online],['rushbuy_goods_id'=>$rushbuy_goods_id]);



    }


}
