<?php

namespace app\shop\controller\admin\marketing;
use app\shop\controller\admin\Common;

use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\ManjianModel;

class Manjian extends Common
{
    public function create()
    {
        $ManjianModel = new ManjianModel();
        $param = $ManjianModel->dataFilter($this->appId);
        $manjians = $ManjianModel->where(['app_id'=>$this->appId])->select();
        if ($param['start_time'] >= $param['end_time']) {
            $this->warning("请选择合理的时间范围");
        }
        foreach ($manjians as $v) {
            if (($param['end_time'] < $v->end_time && $param['end_time'] > $v->start_time) || ($param['start_time'] < $v->end_time && $param['start_time'] > $v->start_time)) {
                $this->warning("活动开始结束时间不得与其他同类活动交叉，请选择合理时间范围");
            }
        }
        $goodsIds = $ManjianModel->checkGoods($param);
        if ($goodsIds == false) {
            $this->warning($ManjianModel->getError());
        }
        $res = $ManjianModel->setData($param);

        if ($res == false) {
            $this->warning($ManjianModel->getError());
        }
        $manjian_id = $ManjianModel->manjian_id;
        $goodsData = [];
        foreach ($goodsIds as $val) {
            $goodsData[] = [
                'goods_id' => $val,
                'prom_id' => $manjian_id,
                'prom_type' => getMean("shop_prom_type", "k")['mj'],
            ];
        }
        $GoodsModel = new GoodsModel();
        $GoodsModel->saveAll($goodsData);
    }

    public function edit()
    {
        $manjian_id = (int)$this->request->param("manjian_id");
        $ManjianModel = new ManjianModel();
        if (!$detail = $ManjianModel->find($manjian_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $param = $ManjianModel->dataFilter($this->appId);
        if ($param['start_time'] >= $param['end_time']) {
            $this->warning("请选择合理的时间范围");
        }

        $manjians = $ManjianModel->where(['app_id'=>$this->appId,'manjian_id'=>['neq',$manjian_id]])->select();
        foreach ($manjians as $v) {
            if ($v->manjian_id != $manjian_id) {
                if (($param['end_time'] < $v->end_time && $param['end_time'] > $v->start_time) || ($param['start_time'] < $v->end_time && $param['start_time'] > $v->start_time)) {
                    $this->warning("活动开始结束时间不得与其他同类活动交叉，请选择合理时间范围");
                }
            }
        }

        $goodsIds = $ManjianModel->checkGoods($param, $manjian_id);
        if ($goodsIds == false) {
            $this->warning($ManjianModel->getError());
        }
        $res = $ManjianModel->setData($param,$manjian_id);
        if ($res === false) {
            $this->warning($ManjianModel->getError());
        }
        $goodsData = [];
        foreach ($goodsIds as $val) {
            $goodsData[] = [
                'goods_id' => $val,
                'prom_id' => $manjian_id,
                'prom_type' => getMean("shop_prom_type", "k")['mj'],
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
        $manjian_id = (int)$this->request->param("manjian_id");
        $ManjianModel = new ManjianModel();
        if (!$detail = $ManjianModel->find($manjian_id)) {
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
            if ($v->prom_type != getMean("shop_prom_type", "k")['mj'] || $v->prom_id != $manjian_id) {
                $this->warning("参数不正确！");
            }
        }

        $GoodsModel->save(['prom_type' => 0, 'prom_id' => 0], ['goods_id' => ['in', $goodsIds]]);
        $ManjianModel->where("manjian_id", $manjian_id)->delete();
    }

    public function detail()
    {
        $manjian_id = (int)$this->request->param("manjian_id");
        $ManjianModel = new  ManjianModel();
        if (!$detail = $ManjianModel->find($manjian_id)) {
            $this->warning("不存在数据!");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据!");
        }
        $goodsIds = json_decode($detail->goods_ids, true) ? json_decode($detail->goods_ids, true) : '';

        $GoodsModel = new GoodsModel();

        if (!$_goods = $GoodsModel->itemsByIds($goodsIds)) {
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
                'market_price' => moneyFormat($v->market_price, true),
                'shop_price' => moneyFormat($v->shop_price, true),
                'photo' => $v->photo,
                'sku_type' => $v->sku_type,
            ];
        }


        $detail = [
            'manjian_id' => $detail->manjian_id,
            'goods_ids' => $goodsIds,
            'name' => $detail->name,
            'prom_img' => $detail->prom_img,
            'man' => moneyFormat($detail->man),
            'jian' => moneyFormat($detail->jian),
            'vip_man' => moneyFormat($detail->vip_man),
            'vip_jian' => moneyFormat($detail->vip_jian),
            'start_time' => date("Y-m-d H:i", $detail->start_time),
            'end_time' => date("Y-m-d H:i", $detail->end_time),
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


    public function index()
    {
        $ManjianModel = new ManjianModel();
        $where['app_id'] = $this->appId;

        $manjian_id = (int)$this->request->param("manjian_id", 0);
        if ($manjian_id) {
            $where["manjian_id"] = $manjian_id;
        }

        $name = (string)$this->request->param("name", '');
        if ($name) {
            $where["name"] = ['like', "%$name%"];
        }

        $is_online = (int)$this->request->param("is_online", -999);
        if ($is_online >= 0) {
            $where["is_online"] = $is_online;
        }
        $is_vip = (int)$this->request->param("is_vip", -999);
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
        $list = $ManjianModel->where($where)->order("manjian_id desc")->page($this->page, $this->limit)->select();
        $count = $ManjianModel->where($where)->count();
        $goodsIds = $goodsIdsTmp = [];
        foreach ($list as $val) {
            $goodsIdsTmp[] = json_decode($val->goods_ids, true);
        }
        foreach ($goodsIdsTmp as $v) {
            foreach ($v as $vv) {
                $goodsIds[$vv] = $vv;
            }
        }
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->itemsByIds($goodsIds);
        $datas = [];
        foreach ($list as $val) {
            $itemGoodsIds = json_decode($val->goods_ids, true) ? json_decode($val->goods_ids, true) : [];
            $datas[] = [
                'manjian_id' => $val->manjian_id,
                'goods_ids' => $itemGoodsIds,
                'name' => (string)$val->name,
                'goods_name' => empty($goods[$itemGoodsIds[0]]) ? '' : $goods[$itemGoodsIds[0]]['goods_name'],
                'man' => moneyFormat($val->man),
                'jian' => moneyFormat($val->jian),
                'vip_man' => moneyFormat($val->vip_man),
                'vip_jian' => moneyFormat($val->vip_jian),
                'is_vip' => $val->is_vip,
                'is_online' => $val->is_online,
                'orderby' => $val->orderby,
                'start_time' => date("Y/m/d H:i:s", $val->start_time),
                'end_time' => date("Y/m/d H:i:s", $val->end_time),
                'add_time' => date("Y/m/d H:i:s", $val->add_time),
                'add_ip' => $val->add_ip,
                'prom_img' => (string)$val->prom_img,
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
        $manjian_id = (int)$this->request->param("manjian_id", 0);
        $is_online = (int)($this->request->param("is_online") == 1);
        $ManjianModel = new  ManjianModel();
        if (!$detail = $ManjianModel->find($manjian_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $ManjianModel->save(['is_online' => $is_online], ['manjian_id' => $manjian_id]);
    }

}
