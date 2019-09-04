<?php

namespace app\shop\controller\admin\goods;

use app\shop\controller\admin\Common;
use app\shop\logic\shop\goods\GoodsRepertoryLogic;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\GoodsRepertoryModel;
use app\shop\model\shop\SettingModel;
use app\shop\model\shop\StockModel;
use think\Exception;

class Stock extends Common
{
    /**
     *  库存日志
     */
    public function index()
    {
        $where['app_id'] = $this->appId;
        $goods_name = (string)$this->request->param("goods_name");
        $bar_code = (string)$this->request->param("bar_code");
        $goods_sn = (string)$this->request->param("goods_sn");
        if (!empty($goods_name)) {
            $where["goods_name"] = ["LIKE", "%{$goods_name}%"];
        }
        if ($bar_code) {
            $where['bar_code'] = $bar_code;
        }
        if ($goods_sn) {
            $where['goods_sn'] = $goods_sn;
        }
        $goods_id = (int)$this->request->param("goods_id");
        if ($goods_id) {
            $where["goods_id"] = $goods_id;
        }
        $order_id = (int)$this->request->param("order_id");
        if ($order_id) {
            $where["order_id"] = $order_id;
        }

        $change_type = (int)$this->request->param("change_type", -999);
        if ($change_type > 0) {
            $where["change_type"] = $change_type;
        }
        $end_add_time = (int)$this->request->param("end_add_time", 0, "strtotime");
        $bg_add_time = (int)$this->request->param("bg_add_time", 0, "strtotime");
        if ($end_add_time > 0 && $bg_add_time > 0) {
            $where["add_time"] = ["between", [$bg_add_time, $end_add_time]];
        }

        $StockModel = new StockModel();
        $listTmp = $StockModel->where($where)->order("log_id desc")->page($this->page, $this->limit)->select();
        $count = $StockModel->where($where)->count();
        $list = [];
        $changeTypeMean = getMean('shop_stock_change_type');
        foreach ($listTmp as $k => $v) {
            if ($v->key_name) {
                $key_name_arr = explode(',', $v->key_name);
            }
            $list[] = [
                'log_id' => (int)$v->log_id,
                'goods_id' => (int)$v->goods_id,
                'goods_name' => (string)$v->goods_name,
                'sku_type' => (int)$v->sku_type,
                'order_sn' => (string)$v->order_sn ? $v->order_sn : '',
                'goods_sn' => (string)$v->goods_sn ? $v->goods_sn : '',
                'bar_code' => (string)$v->bar_code ? $v->bar_code : '',
                'photo' => (string)$v->photo ? $v->photo : '',
                'this_stock' => (int)$v->this_stock ? $v->this_stock : '',
                'order_id' => (int)$v->order_id ? $v->order_id : '',
                'stock' => (int)$v->stock,
                'change_type' => (int)$v->change_type,
                'change_type_mean' => isset($changeTypeMean[$v->change_type]) ? $changeTypeMean[$v->change_type] : '',
                'add_time' => $v->add_time ? date("Y-m-d H:i", $v->add_time) : '--',
                'add_ip' => $v->add_ip,
                'spec_key' => $v->spec_key,
                'key_name' => $v->spec_key ? $key_name_arr : '无规格',
            ];
        }

        $this->datas = [
            'manageType' => $changeTypeMean,
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    /**
     * 产品库存列表
     */
    public function stockList()
    {
        $this->limit = 10;
        $goods_name = (string)$this->request->param('goods_name', '');
        $bar_code = (string)$this->request->param('bar_code', '');
        $goods_sn = (string)$this->request->param('goods_sn', '');
        $goods_id = (int)$this->request->param('goods_id', 0);
        $stock_status = (int)$this->request->param('stock_status', '');
        $respWhere['app_id'] = $this->appId;
        $goodsWhere['app_id'] = $this->appId;
        $SettingModel = new SettingModel();
        $GoodsRepertoryModel = new GoodsRepertoryModel();
        $GoodsModel = new GoodsModel();

        if ($bar_code) {
            $respWhere['bar_code'] = $bar_code;
        }
        if ($goods_sn) {
            $respWhere['goods_sn'] = $goods_sn;
        }
        if ($goods_id) {
            $this->limit = 1000;
            $respWhere['goods_id'] = $goods_id;
        }

        //商品名称需要去商品表查询   查出的goodIds给库存表IN查询
        $goodIds = [];
        if ($goods_name) {
            $goodsWhere['goods_name'] = ['like', $goods_name];
            $goods_tmp = $GoodsModel->where($goodsWhere)->select();
            foreach ($goods_tmp as $v) {
                $goodIds[$v->goods_id] = $v->goods_id;
            }
            $goodIds = empty($goodIds) ? '' : $goodIds;
            $respWhere['goods_id'] = ['in', $goodIds];
        }

        //查询库存预警设置
        $stock_congfig = getMean('shop_stock_default_count_setting');
        $manage_type = getMean('shop_stock_change_type');
        $stock_status_mean = getMean('shop_stock_status_mean');
        $stock_setting_tmp = $SettingModel->where(['app_id' => $this->appId])->value('stock_setting');
        $stock_setting = json_decode($stock_setting_tmp, true) ? json_decode($stock_setting_tmp, true) : $stock_congfig;
        //库存状态需要修改查询条件
        if ($stock_status >= 0) {
            switch ($stock_status) {
                case 1:
                    $respWhere['goods_num'] = ['<=', $stock_setting['sold_out']];
                    break;
                case 2:
                    $respWhere['goods_num'] = [['>', $stock_setting['sold_out']], ['<=', $stock_setting['critical']], 'AND'];
                    break;
                case 3:
                    $respWhere['goods_num'] = [['>', $stock_setting['critical']], ['<=', $stock_setting['danger']], 'AND'];
                    break;
                case 4:
                    $respWhere['goods_num'] = [['>', $stock_setting['danger']], ['<=', $stock_setting['safe']], 'AND'];
                    break;
                case 5:
                    $respWhere['goods_num'] = ['>', $stock_setting['safe']];
                    break;
            }
        }

        //查询的商品
        if ($goods_name || $goods_id) {
            $specListTmp = $GoodsRepertoryModel->where($respWhere)->select();
        } else {
            $specListTmp = $GoodsRepertoryModel->where($respWhere)->order("repertory_id desc")->page($this->page, $this->limit)->select();
        }
        $count = $GoodsRepertoryModel->where($respWhere)->count();

        if (empty($goodsIds)) {
            foreach ($specListTmp as $v) {
                $goodsIds[$v->goods_id] = $v->goods_id;
            }
            $goodsIds = empty($goodsIds) ? '' : $goodsIds;
        }

        $goodsList = $GoodsModel->itemsByIds($goodsIds);

        $list = [];

        foreach ($specListTmp as $vv) {
            if ($vv->key_name) {
                $key_name_arr = explode(',', $vv->key_name);
            }
            $list[] = [
                'repertory_id' => $vv->repertory_id,
                'goods_id' => $vv->goods_id,
                'goods_name' => (string)empty($goodsList[$vv->goods_id]['goods_name']) ? '' : $goodsList[$vv->goods_id]['goods_name'],
                'spec_key' => (string)$vv->spec_key,
                'key_name' => $vv->spec_key ? $key_name_arr : '无规格',
                'shop_price' => (int)$vv->shop_price ? round($vv->shop_price / 100, 2) : 0,
                'market_price' => (int)$vv->market_price ? round($vv->market_price / 100, 2) : 0,
                'goods_num' => (int)$vv->goods_num,
                'bar_code' => (string)$vv->bar_code,
                'goods_sn' => (string)$vv->goods_sn,
                'photo' => $vv->photo ? $vv->photo : $goodsList[$vv->goods_id]['photo'],
            ];
        }

        $this->datas = [
            'stock_status_mean' => $stock_status_mean,
            'status_limit' => $stock_setting,
            'manage_type' => $manage_type,
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit,
        ];

    }


    /**
     * 删除
     */
    public function delStock()
    {
        $repertory_id = (int)$this->request->param('repertory_id');
        $repertoryIds = (string)$this->request->param('repertoryIds');

        $repertoryIds = json_decode($repertoryIds, true) ? json_decode($repertoryIds, true) : '';
        $GoodsRepertoryModel = new GoodsRepertoryModel();
        if ($repertory_id && !is_array($repertoryIds)) {
            $GoodsRepertoryModel->where(['app_id' => $this->appId, 'repertory_id' => $repertory_id])->delete();
        } elseif (is_array($repertoryIds) && !$repertory_id) {
            $GoodsRepertoryModel->where(['app_id' => $this->appId, 'repertory_id' => ['in', $repertoryIds]])->delete();
        }
    }


    /**
     * 修改库存
     */
    public function changeStock()
    {
        $repertory_id = (int)$this->request->param('repertory_id', 0);
        $repertoryIds = (string)$this->request->param('repertoryIds', '');
        $type = (int)$this->request->param('type', -999);
        $number = (int)$this->request->param('number', 0);
        $manage_type = getMean('shop_stock_change_type');
        $GoodsRepertoryModel = new GoodsRepertoryModel();
        if (!isset($manage_type[$type])) {
            $this->warning('参数不正确1');
        }
        if ($number <= 0) {
            $this->warning('参数不正确2');
        }
        $repertoryIds = json_decode($repertoryIds, true) ? json_decode($repertoryIds, true) : [];
        if (empty($repertoryIds)) {
            $repertoryIds[$repertory_id] = $repertory_id;
        }
        $repertorys = $GoodsRepertoryModel->itemsByIds($repertoryIds);
        $goodsIds = [];
        foreach ($repertorys as $v) {
            if ($v->app_id != $this->appId) {
                $this->warning('参数不正确！');
            }
            $goodsIds[$v->goods_id] = $v->goods_id;
        }
        $goodsIds = empty($goodsIds) ? '' : $goodsIds;
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->itemsByIds($goodsIds);
        if ($type) {    //修改库存并写日志
            $GoodsRepertoryLogic = new GoodsRepertoryLogic();
            try {
                $GoodsRepertoryLogic->batchChangeStock($repertorys, $repertoryIds, $goods, $goodsIds, $type, $number);
            } catch (Exception $exception) {
                $warning = $exception->getMessage();
                $this->warning($warning);
            }

        }
    }
}
