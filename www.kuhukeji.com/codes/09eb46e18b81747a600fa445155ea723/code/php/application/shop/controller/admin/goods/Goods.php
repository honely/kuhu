<?php

namespace app\shop\controller\admin\goods;
use app\shop\controller\admin\Common;

use app\shop\logic\shop\goods\GoodsLogic;
use app\shop\model\shop\GoodscategoryModel;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\GoodsRepertoryModel;
use app\shop\model\shop\GoodstypeModel;
use think\Exception;
use think\Validate;

class Goods extends Common
{

    public function getPcatlist(){
        $GoodscategoryModel = new GoodscategoryModel();
        $cats = $GoodscategoryModel->where(['app_id'=> $this->appId,'parent_id'=>0])->order(['orderby'=>'desc'])->select();
        $return  = [];
        foreach($cats as $val){
            $return[] = [
                'cat_id' => $val['cat_id'],
                'cat_name' => $val['name'],
            ];
        }
        $this->datas['cats'] = $return;
    }

    public function getCalldata(){
        $cid = (int)$this->request->param('cid');
        $GoodscategoryModel = new GoodscategoryModel();
        $cats = $GoodscategoryModel->where(['app_id'=> $this->appId,'parent_id'=>$cid])->order(['orderby'=>'desc'])->select();
        $catR  = [];
        foreach($cats as $val){
            $catR[] = [
                'cat_id' => $val['cat_id'],
                'cat_name' => $val['name'],
            ];
        }
        $this->datas['cats'] = $catR;

        $sid = (int) $this->request->param('sid');
        $num = (int)$this->request->param('num');
        $num = $num > 0 ? $num : 8;
        $where = ['app_id'=> $this->appId,'is_online'=>1,'is_delete'=>0];
        if(!empty($sid)){
            $where['cat_id|p_cat_id'] = $sid;
        }else{
           if(!empty($cid)){
               $where['p_cat_id'] = $cid;
           }
        }
        $order = $this->request->param('order');
        $orderby = [];
        switch ($order){
            case 1:
                $orderby = ['shop_price'=>'asc'];
                break;
            case 2:
                $orderby = ['sales_sum'=>'desc'];
                break;
            case 3:
                $orderby = ['goods_id'=>'desc'];
                break;
            case 4:
                $orderby = ['orderby'=>'desc'];
                break;
            default:
                $orderby = ['orderby' => 'desc','sales_sum'=>'desc','views'=>'desc'];
                break;
        }
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->where($where)->order($orderby)->limit(0,$num)->select();
        $hdTitles = $GoodsModel->getActivityTitle($goods);
        $return  = [];
        foreach($goods as $val){
            $return  [] = [
                'goods_id' => $val['goods_id'],
                'photo'    => $val['photo'],
                'goods_name' => $val['goods_name'],
                'market_price' => moneyFormat($val['market_price']),
                'shop_price' => moneyFormat($val['shop_price']),
                'hd_title' => isset($hdTitles[$val['goods_id']]) ? $hdTitles[$val['goods_id']]['hd_title'] : '',
            ];
        }
        $this->datas['goods'] = $return;
    }

    public function create()
    {
        $GoodsModel = new GoodsModel();
        $param = $GoodsModel->dataFilter();
        $param['app_id'] = $this->appId;
        $param['goods_sn'] = $GoodsModel->goodsSn($param['goods_sn'], $this->appId);
        if($param['type_id'] <= 0){
            $this->warning("请选择一个商品模型");
        }
        if ($param['goods_sn'] == false) {
            $this->warning("商品编码已存在");
        }
        $goodsSpecArray = $GoodsModel->checkPrice($this->appId, $param);
        if ($goodsSpecArray == false) {
            $this->warning("价格未填写完整或sku编码已存在");
        }
        $goodsSpecData = $goodsSpecArray['goods_spec_data'];
        $param['shop_price'] = $goodsSpecArray['shop_price'];
        $param['market_price'] = $goodsSpecArray['market_price'];
        $param['plus_vip_price'] = $goodsSpecArray['plus_vip_price'];
        $param['spec_map'] = $goodsSpecArray['spec_map'];
        if ($param['is_free_shipping'] == 0 && $GoodsModel->checkFreight($param['freight_template_id'], $this->appId) == false) {
            $this->warning("物流参数错误");
        }
        $res = $GoodsModel->setData($param);
        if ($res == false) {
            $this->warning($GoodsModel->getError());
        }
        $goods_id = $GoodsModel->goods_id;
        $GoodsRepertoryModel = new GoodsRepertoryModel();
        if ($param['sku_type'] == 1) {
            foreach ($goodsSpecData as &$val) {
                $val['goods_id'] = $goods_id;
            }
            unset($val);
            $GoodsRepertoryModel->saveAll($goodsSpecData);
        } else {
            $goodsSpecData['goods_id'] = $goods_id;
            $GoodsRepertoryModel->save($goodsSpecData);
        }
    }


    public function edit()
    {
        $goods_id = (int)$this->request->param("goods_id");
        $GoodsModel = new GoodsModel();
        if (!$detail = $GoodsModel->find($goods_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $data['cat_id'] = $this->request->param('cat_id');
        $data['p_cat_id'] = $this->request->param('p_cat_id');
        $data['goods_name'] = $this->request->param('goods_name');
        $data['keywords'] = $this->request->param('keywords');
        $data['photo'] = $this->request->param('photo');
        $data['goods_sn'] = $detail->goods_sn;
        $data['is_online'] = $this->request->param('is_online');
        $data['is_free_shipping'] = $this->request->param('is_free_shipping');
        $data['orderby'] = $this->request->param('orderby');
        $data['type_id'] = $detail->type_id;
        $data['sales_sum'] = (int)$this->request->param('sales_sum');
        $data['is_recommend'] = $this->request->param('is_recommend');
        $data['is_coupon'] = $this->request->param('is_coupon');
        $data['is_new'] = $this->request->param('is_new');
        $data['is_hot'] = $this->request->param('is_hot');
        $data['views'] = (int)$this->request->param('views');
        $data['freight_template_id'] = (int)$this->request->param('freight_template_id');
        $data['photos'] = (string)$this->request->param('photos', "", "SecurityEditorHtml");
        $data['goods_content'] = (string)$this->request->param('goods_content', "", "SecurityEditorHtml");
        $data['last_update'] = $this->request->time();
        if ($data['is_free_shipping'] == 0 && $GoodsModel->checkFreight($data['freight_template_id'], $this->appId) == false) {
            $this->warning("物流参数错误");
        }
        if ( $data['is_online'] == 0 && ($detail->prom_type > 0 || $detail->prom_id > 0)) {
            $warning = getMean('shop_prom_type')[$detail->prom_type];
            $this->warning("当前商品已参加{$warning}活动,请先在活动中解除商品关联再下架商品");
        }
        $seo_tmp = (string) $this->request->param('seo','','SecurityEditorHtml');
        $seo = json_decode($seo_tmp) ? json_decode($seo_tmp, true) : [];
        if (!empty($seo)) {
            if (!$seo['title']) {
                $this->warning("请填写百度SEO标题");
            }
            if (!$seo['keywords']) {
                $this->warning("请填写百度SEO关键词");
            }
            if (!$seo['description']) {
                $this->warning("请填写百度SEO描述");
            }
            if (!$seo['releaseDate']) {
                $this->warning("请选择百度SEO信息原始发布时间");
            }
            if (empty($seo['image'])) {
                $this->warning("请上传百度SEO封面图片");
            }
            if (count($seo['image']) > 3) {
                $seo['image'] = array_slice($seo['image'],0,3);
            }
            $data['seo'] = json_encode($seo,JSON_UNESCAPED_UNICODE);
        } else {
            $this->warning("请填写百度SEO相关信息");
        }
        $res = $GoodsModel->setData($data, $goods_id);
        if ($res === false) {
            $this->warning($GoodsModel->getError());
        }
    }


    public function del()
    {
        $goods_id = (int)$this->request->param("goods_id", 0);
        $GoodsModel = new GoodsModel();
        if (!$goods = $GoodsModel->find($goods_id)) {
            $this->warning('参数不正确1！');
        }
        if ($goods->app_id != $this->appId) {
            $this->warning('参数不正确2！');
        }
        if ($goods->prom_type > 0 || $goods->prom_id > 0) {
            $warning = getMean('shop_prom_type')[$goods->prom_type];
            $this->warning("当前商品已参加{$warning}活动,请先在活动中解除商品关联再来删除商品");
        }
        $GoodsModel->save(['is_delete' => 1], ['goods_id' => $goods_id]);
    }


    public function index()
    {
        $GoodsModel = new GoodsModel();
        $where['app_id'] = $this->appId;
        $where['is_delete'] = 0;
        $cat_id = (int)$this->request->param("cat_id");
        if (!empty($cat_id)) {
            $where["cat_id"] = $cat_id;
        }

        $p_cat_id = (int)$this->request->param("p_cat_id");
        if (!empty($p_cat_id)) {
            $where["p_cat_id"] = $p_cat_id;
        }

        $type_id = (int)$this->request->param("type_id");
        if (!empty($type_id)) {
            $where["type_id"] = $type_id;
        }

        //包邮
        $this->request->param("is_free_shipping") == 1 && $where["is_free_shipping"] = 1;
        //推荐
        $this->request->param("is_recommend") == 1 && $where["is_recommend"] = 1;
        //新品
        $this->request->param("is_new") == 1 && $where["is_new"] = 1;
        //热门
        $this->request->param("is_hot") == 1 && $where["is_hot"] = 1;
        //会员
        $this->request->param("is_plus_vip") == 1 && $where["is_plus_vip"] = 1;
        //分佣
        $this->request->param("is_commission") == 1 && $where["is_commission"] = 1;

        $goods_sn = (string)$this->request->param("goods_sn");
        if (!empty($goods_sn)) {
            $where["goods_sn"] = ["LIKE", "%{$goods_sn}%"];
        }

        $goods_name = (string)$this->request->param("goods_name");
        if (!empty($goods_name)) {
            $where["goods_name"] = ["LIKE", "%{$goods_name}%"];
        }


        $is_online = (int)$this->request->param("is_online");
        if (!empty($is_online)) {
            $where["is_online"] = $is_online - 1;
        }

        $end_add_time = (int)$this->request->param("end_add_time", 0, "strtotime");
        $bg_add_time = (int)$this->request->param("bg_add_time", 0, "strtotime");
        if ($end_add_time > 0 && $bg_add_time > 0) {
            $where["add_time"] = ["between", [$bg_add_time, $end_add_time]];
        }
        $list = $GoodsModel->where($where)->order("goods_id desc")->page($this->page, $this->limit)->select();
        $count = $GoodsModel->where($where)->count();
        $datas = [];
        $shop_prom_type = getMean("shop_prom_type");
        $catIds = $typeIds = [];
        foreach ($list as $val) {
            $catIds[$val->p_cat_id] = $val->p_cat_id;
            $catIds[$val->cat_id] = $val->cat_id;
            $typeIds[$val->type_id] = $val->type_id;
        }
        $GoodstypeModel = new GoodstypeModel();
        $goodsTypes = $GoodstypeModel->itemsByIds($typeIds);
        $GoodscategoryModel = new GoodscategoryModel();
        $cats = $GoodscategoryModel->itemsByIds($catIds);
        foreach ($list as $val) {
            $datas[] = [
                'goods_id' => $val->goods_id,
                'cat_id' => empty($cats[$val->cat_id]) ? '' : $cats[$val->cat_id]->name,
                'p_cat_id' => empty($cats[$val->p_cat_id]) ? '' : $cats[$val->p_cat_id]->name,
                'goods_sn' => $val->goods_sn,
                'goods_name' => $val->goods_name,
                'market_price' => moneyFormat($val->market_price, true),
                'shop_price' => moneyFormat($val->shop_price, true),
                'plus_vip_price' => moneyFormat($val->plus_vip_price, true),
                'keywords' => $val->keywords,
                'photo' => $val->photo,
                'is_online' => $val->is_online,
                'is_free_shipping' => $val->is_free_shipping,
                'orderby' => $val->orderby,
                'sales_sum' => $val->sales_sum,
                'is_recommend' => $val->is_recommend,
                'is_new' => $val->is_new,
                'is_hot' => $val->is_hot,
                'sku_type' => $val->sku_type,
                'type_id' => empty($goodsTypes[$val->type_id]) ? '' : $goodsTypes[$val->type_id]->name,
                'views' => $val->views,
                'prom_type_mean' => $shop_prom_type[$val->prom_type],
                'is_plus_vip' => $val->is_plus_vip,
                'is_commission' => $val->is_commission,
                'is_coupon' => $val->is_coupon,
                'comment_count' => $val->comment_count,
                'add_time' => date("Y/m/d H:i:s", $val->add_time),
                'last_update' => date("Y/m/d H:i:s", $val->last_update),
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    public function detail()
    {
        $goods_id = (int)$this->request->param("goods_id");
        $GoodsModel = new GoodsModel();
        if (!$detail = $GoodsModel->find($goods_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'goods_id' => $detail->goods_id,
            'cat_id' => $detail->cat_id,
            'p_cat_id' => $detail->p_cat_id,
            'goods_sn' => $detail->goods_sn,
            'goods_name' => $detail->goods_name,
            'market_price' => moneyFormat($detail->market_price, true),
            'shop_price' => moneyFormat($detail->shop_price, true),
            'plus_vip_price' => moneyFormat($detail->plus_vip_price, true),
            'keywords' => $detail->keywords,
            'photo' => $detail->photo,
            'is_online' => $detail->is_online,
            'is_free_shipping' => (int)$detail->is_free_shipping,
            'orderby' => $detail->orderby,
            'is_recommend' => $detail->is_recommend,
            'is_new' => $detail->is_new,
            'is_hot' => $detail->is_hot,
            'type_id' => $detail->type_id,
            'weight' => $detail->weight,
            'sales_sum' => $detail->sales_sum,
            'views' => $detail->views,
            'is_plus_vip' => $detail->is_plus_vip,
            'is_commission' => $detail->is_commission,
            'is_coupon' => $detail->is_coupon,
            'freight_template_id' => $detail->freight_template_id,
            'photos' => (array)json_decode($detail->photos, true),
            'goods_content' => (array)json_decode($detail->goods_content, true),
            'seo' => json_decode($detail->seo) ? json_decode($detail->seo, true) : $this->default_seo,
        ];
    }


    public function online()
    {
        $goods_id = (int)$this->request->param("goods_id");
        $GoodsModel = new GoodsModel();
        if (!$detail = $GoodsModel->find($goods_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        if ($detail->prom_id || $detail->prom_type) {
            $shop_prom_type = getMean("shop_prom_type");
            $this->warning("当前商品已关联 {$shop_prom_type[$detail->prom_type]} 营销，必须先解除关联！");
        }
        $GoodsModel->save([
            'is_online' => $detail->is_online ^ 1,
        ], ['goods_id' => $goods_id]);
    }


    public function setSpecDetail()
    {
        $goods_id = (int)$this->request->param("goods_id");
        $GoodsModel = new GoodsModel();
        if (!$detail = $GoodsModel->find($goods_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $data['photo'] = $detail->photo;
        $data['goods_sn'] = $detail->goods_sn;
        $data['goods_spec'] = $this->request->param("goods_spec", '', "SecurityEditorHtml");
        $data['goods_attr'] = $this->request->param("goods_attr", "", "SecurityEditorHtml");
        $data['sku_type'] = $detail->sku_type;
        $data['type_id'] = $detail->type_id;
        $data['is_commission'] = $this->request->param("is_commission");
        $data['is_coupon'] = $this->request->param("is_coupon");
        $data['is_plus_vip'] = $this->request->param("is_plus_vip");
        $data['shop_price'] = $this->request->param("shop_price");
        $data['market_price'] = $this->request->param("market_price");
        $data['goods_num'] = $this->request->param("goods_num");
        $data['plus_vip_price'] = $this->request->param("plus_vip_price");
        $data['commission'] = $this->request->param("commission");
        $goodsSpecArray = $GoodsModel->checkPrice($this->appId, $data, false);
        $goodsSpecData = $goodsSpecArray['goods_spec_data'];
        if ($goodsSpecData == false) {
            $this->warning("请仔细填写商品价格");
        }
        $data['shop_price'] = $goodsSpecArray['shop_price'];
        $data['market_price'] = $goodsSpecArray['market_price'];
        $data['plus_vip_price'] = $goodsSpecArray['plus_vip_price'];
        $data['spec_map'] = $goodsSpecArray['spec_map'];
        $GoodsModel->allowField(true)->save($data, ['goods_id' => $goods_id]);
        $GoodsRepertoryModel = new GoodsRepertoryModel();
        $GoodsRepertoryModel->where("goods_id", $goods_id)->delete();
        if ($data['sku_type'] == 1) {
            foreach ($goodsSpecData as &$val) {
                $val['goods_id'] = $goods_id;
            }
            unset($val);
            $GoodsRepertoryModel->saveAll($goodsSpecData);
        } else {
            $goodsSpecData['goods_id'] = $goods_id;
            $GoodsRepertoryModel->save($goodsSpecData);
        }

    }


    public function getSpecDetail()
    {
        $goods_id = (int)$this->request->param("goods_id");
        try{
            $GoodsLogic = new GoodsLogic();
            $detail = $GoodsLogic->setAppId($this->appId)
                ->setGoodsId($goods_id)
                ->getGoods();
        }catch (Exception $exception){
            $this->warning($exception->getMessage());
        }
        $spec = $GoodsLogic->getSpec();
        $sepcIds = [];
        foreach ($spec as $val) {
            foreach ($val as $v) {
                $sepcIds[] = $v['item_id'];
            }
        }
        $detail = $GoodsLogic->getGoods();
        $shop_price = 0;
        $goods_num = 0;
        $market_price = 0;
        $plus_vip_price = 0;
        $commission = 0;
        $sepcPrice = [];
        if ($detail->sku_type == 0) {
            $GoodsRepertoryModel = new GoodsRepertoryModel();
            $spec = $GoodsRepertoryModel->where("goods_id", $goods_id)->find();
            if ($detail) {
                $shop_price = moneyFormat($spec->shop_price);
                $goods_num = $spec->goods_num;
                $market_price = moneyFormat($spec->market_price);
                $plus_vip_price = moneyFormat($spec->plus_vip_price);
                $commission = moneyFormat($spec->commission);
            }
        } else {
            $GoodsRepertoryModel = new GoodsRepertoryModel();
            $specValue = $GoodsRepertoryModel->where("goods_id", $goods_id)
                ->column("
                    spec_key,
                    key_name,
                    market_price,
                    plus_vip_price,
                    goods_num,
                    commission,
                    shop_price,
                    bar_code,
                    photo
                ", "spec_key");
            $specMap = (array)json_decode($detail->spec_map);
            $sepcPrice = [];
            foreach ($specMap as $val) {
                if (empty($specValue[$val->spec_key])) {
                    $sepcPrice[] = [
                        "spec_key" => $val->spec_key,
                        "key_name" => $val->key_name,
                        "market_price" => 0,
                        "plus_vip_price" => 0,
                        "shop_price" => 0,
                        "goods_num" => 0,
                        "commission" => 0,
                        "bar_code" => '',
                        "photo" => '',
                        'invalid' => 1,
                    ];
                } else {
                    $sepcPrice[] = [
                        "spec_key" => $val->spec_key,
                        "key_name" => $val->key_name,
                        "market_price" => moneyFormat($specValue[$val->spec_key]['market_price']),
                        "plus_vip_price" => moneyFormat($specValue[$val->spec_key]['plus_vip_price']),
                        "shop_price" => moneyFormat($specValue[$val->spec_key]['shop_price']),
                        "goods_num" => $specValue[$val->spec_key]['goods_num'],
                        "commission" => moneyFormat($specValue[$val->spec_key]['commission']),
                        "bar_code" => $specValue[$val->spec_key]['bar_code'],
                        "photo" => $specValue[$val->spec_key]['photo'],
                        'invalid' => 0,
                    ];
                }
            }
        }
        $goods_spec = [];
        $goods_spec['spec'] = $sepcIds;
        $goods_spec['type_id'] = $detail->type_id;
        $goods_spec['itemPrice'] = $sepcPrice;
        $this->datas['detail'] = [
            'type_id' => $detail->type_id,
            'goods_spec' => empty($sepcPrice) ? [] : $goods_spec,
            'goods_attr' => (array) json_decode($detail->goods_attr, true),
            'sku_type' => $detail->sku_type,
            'is_commission' => $detail->is_commission,
            'is_coupon' => $detail->is_coupon,
            'is_plus_vip' => $detail->is_plus_vip,
            'shop_price' => $shop_price,
            'market_price' => $market_price,
            'goods_num' => $goods_num,
            'plus_vip_price' => $plus_vip_price,
            'commission' => $commission,
            'sepcIds' => $sepcIds,
        ];

    }


    public function specIndex()
    {
        $GoodsModel = new GoodsModel();
        $where['app_id'] = $this->appId;
        $where['is_delete'] = 0;
        $cat_id = (int)$this->request->param("cat_id");
        if (!empty($cat_id)) {
            $where["cat_id"] = $cat_id;
        }

        $p_cat_id = (int)$this->request->param("p_cat_id");
        if (!empty($p_cat_id)) {
            $where["p_cat_id"] = $p_cat_id;
        }

        $type_id = (int)$this->request->param("type_id");
        if (!empty($type_id)) {
            $where["type_id"] = $type_id;
        }

        //包邮
        $this->request->param("is_free_shipping") == 1 && $where["is_free_shipping"] = 1;
        //推荐
        $this->request->param("is_recommend") == 1 && $where["is_recommend"] = 1;
        //新品
        $this->request->param("is_new") == 1 && $where["is_new"] = 1;
        //热门
        $this->request->param("is_hot") == 1 && $where["is_hot"] = 1;
        //会员
        $this->request->param("is_plus_vip") == 1 && $where["is_plus_vip"] = 1;
        //分佣
        $this->request->param("is_commission") == 1 && $where["is_commission"] = 1;

        $goods_sn = (string)$this->request->param("goods_sn");
        if (!empty($goods_sn)) {
            $where["goods_sn"] = ["LIKE", "%{$goods_sn}%"];
        }

        $goods_name = (string)$this->request->param("goods_name");
        if (!empty($goods_name)) {
            $where["goods_name"] = ["LIKE", "%{$goods_name}%"];
        }


        $is_online = (int)$this->request->param("is_online");
        if (!empty($is_online)) {
            $where["is_online"] = $is_online - 1;
        }

        $prom_id = (int)$this->request->param("prom_id",0);
        $prom_type = (int)$this->request->param("prom_type",0);
        $is_edit = (int)$this->request->param("is_edit",0);
        $goods_id = (int)$this->request->param("goods_id",0);

        $where["prom_type"] = $prom_type;
        $where["prom_id"] = $prom_id;


        $end_add_time = (int)$this->request->param("end_add_time", 0, "strtotime");
        $bg_add_time = (int)$this->request->param("bg_add_time", 0, "strtotime");
        if ($end_add_time > 0 && $bg_add_time > 0) {
            $where["add_time"] = ["between", [$bg_add_time, $end_add_time]];
        }

        $list = $GoodsModel->where($where)->order("goods_id desc")->page($this->page, $this->limit)->select();
        $count = $GoodsModel->where($where)->count();
        $datas = [];
        $shop_prom_type = getMean("shop_prom_type");
        $catIds = $typeIds = $goodsIds = [];
        foreach ($list as $val) {
            $catIds[$val->p_cat_id] = $val->p_cat_id;
            $catIds[$val->cat_id] = $val->cat_id;
            $typeIds[$val->type_id] = $val->type_id;
            $goodsIds[$val->goods_id] = $val->goods_id;
        }
        $GoodstypeModel = new GoodstypeModel();
        $goodsTypes = $GoodstypeModel->itemsByIds($typeIds);
        $GoodscategoryModel = new GoodscategoryModel();
        $cats = $GoodscategoryModel->itemsByIds($catIds);
        $GoodsRepertoryModel = new GoodsRepertoryModel();
        $goodsIds = empty($goodsIds) ? '' : $goodsIds;
        $specTmp = $GoodsRepertoryModel->whereIn('goods_id', $goodsIds)->select();
        $spec = [];
        foreach ($specTmp as $v) {
            $spec[$v->goods_id][] = [
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

        foreach ($list as $val) {
            $datas[] = [
                'goods_id' => $val->goods_id,
                'cat_id' => empty($cats[$val->cat_id]) ? '' : $cats[$val->cat_id]->name,
                'p_cat_id' => empty($cats[$val->p_cat_id]) ? '' : $cats[$val->p_cat_id]->name,
                'goods_sn' => $val->goods_sn,
                'goods_name' => $val->goods_name,
                'market_price' => moneyFormat($val->market_price, true),
                'shop_price' => moneyFormat($val->shop_price, true),
                'plus_vip_price' => moneyFormat($val->plus_vip_price, true),
                'keywords' => $val->keywords,
                'photo' => $val->photo,
                'is_online' => $val->is_online,
                'is_free_shipping' => $val->is_free_shipping,
                'orderby' => $val->orderby,
                'sales_sum' => $val->sales_sum,
                'is_recommend' => $val->is_recommend,
                'is_new' => $val->is_new,
                'is_hot' => $val->is_hot,
                'sku_type' => $val->sku_type,
                'type_id' => empty($goodsTypes[$val->type_id]) ? '' : $goodsTypes[$val->type_id]->name,
                'views' => $val->views,
                'prom_type_mean' => $shop_prom_type[$val->prom_type],
                'is_plus_vip' => $val->is_plus_vip,
                'is_commission' => $val->is_commission,
                'is_coupon' => $val->is_coupon,
                'goods_spec' => $spec[$val->goods_id],
                'comment_count' => $val->comment_count,
                'add_time' => date("Y/m/d H:i:s", $val->add_time),
                'last_update' => date("Y/m/d H:i:s", $val->last_update),
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }

}
