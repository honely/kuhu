<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class IntegralGoodsModel extends CommonModel
{
    protected $pk = 'goods_id';
    protected $name = 'app_shop_integral_goods';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['cat_id', 'require|number', '请输入分类id|分类id必须是数字'],
        //['goods_sn', 'require|max:60', '请输入商品编号|商品编号最多不能超过60个字符'],
        ['goods_name', 'require|max:120', '请输入商品名称|商品名称最多不能超过120个字符'],
        ['comment_count', 'number', '商品评论数必须是数字'],
        ['market_price', 'number|min:1', '市场价数最低0.01元|市场价数最低0.01元'],
        ['shop_price', 'number', '兑换价必须是数字'],
        ['integral', 'number|min:1', '积分最低1积分|积分最低1积分'],
        ['comment_count', 'number', '商品评论数必须是数字'],
        ['comment_count', 'number', '商品评论数必须是数字'],
        ['keywords', 'max:255', '商品关键词最多不能超过255个字符'],
        ['goods_content', 'max:65535', '商品详细描述最多不能超过65535个字符'],
        ['photo', 'require|max:255', '请输入商品上传原始图|商品上传原始图最多不能超过255个字符'],
        ['is_online', 'number', '是否上架必须是数字'],
        ['is_free_shipping', 'number', '包邮类型不同'],
        ['sort', 'number', '商品排序必须是数字'],
        ['is_recommend', 'number', '是否推荐必须是数字'],
        ['sales_sum', 'number', '商品销量必须是数字'],
        ['is_commission', 'number', '商品销量必须是数字'],
        ['photos', 'require', '至少上传一张相册'],
        ['seo', 'require|min:1', 'SEO信息必须填写|SEO信息必须填写'],
    ];

    public function dataFilter()
    {
        $request = request();
        $param = [
            "cat_id" => (int)$request->param("cat_id", "0"),//分类id,//分类ID
            "goods_sn" => (string)$request->param("goods_sn", ""),//商品编号
            "goods_name" => (string)$request->param("goods_name", ""),//商品名称
            "store_count" => (int)$request->param("store_count", "10"),//库存数量
            "comment_count" => (int)$request->param("comment_count", "0"),//商品评论数
            "weight" => (int)$request->param("weight", "0"),//商品重量克为单位
            "market_price" => moneyToInt($request->param("market_price", 0)),//市场价
            "shop_price" => moneyToInt($request->param("shop_price", 0)),//本店价
            "integral" => (int) $request->param("integral", "0"),//积分
            "keywords" => (string)$request->param("keywords", ""),//商品关键词
            "goods_content" => (string)$request->param("goods_content", "", "SecurityEditorHtml"),//商品详细描述
            "photo" => (string)$request->param("photo", ""),//商品缩略图
            "photos" => (string)$request->param("photos", "", "SecurityEditorHtml"),//商品相册
            "is_online" => (int)($request->param("is_online", 1) == 1), //是否上架
            "is_free_shipping" => (int)($request->param("is_free_shipping", 1) == 1),//是否包邮
            "sort" => (int)$request->param("sort", "0"),//商品排序
            "is_recommend" => (int)($request->param("is_recommend", 1) == 1),//是否推荐
            "sales_sum" => $request->param("sales_sum", 1),//商品销量
            "goods_sum" => $request->param("goods_sum", 1),//商品销量
            "shipping_area_ids" => (string)$request->param("shipping_area_ids", "", "SecurityEditorHtml"),//配送物流
            "freight_template_id" => (int)$request->param('freight_template_id',1),
            "last_update" => time(),
            "seo" => $request->param("seo", '','SecurityEditorHtml'),//商品销量
        ];
        $seo_tmp = (string) $request->param('seo','','SecurityEditorHtml');
        $seo = json_decode($seo_tmp) ? json_decode($seo_tmp, true) : [];
        if (!empty($seo)) {
            if (!$seo['title']) {
                $this->error = "请填写百度SEO标题";
                return false;
            }
            if (!$seo['keywords']) {
                $this->error = "请填写百度SEO关键词";
                return false;
            }
            if (!$seo['description']) {
                $this->error = "请填写百度SEO描述";
                return false;
            }
            if (!$seo['releaseDate']) {
                $this->error = "请选择百度SEO信息原始发布时间";
                return false;
            }
            if (empty($seo['image'])) {
                $this->error = "请上传百度SEO封面图片";
                return false;
            }
            if (count($seo['image']) > 3) {
                $seo['image'] = array_slice($seo['image'],0,3);
            }
            $param['seo'] = json_encode($seo,JSON_UNESCAPED_UNICODE);
        } else {
            $this->error = "请填写百度SEO相关信息";
            return false;
        }

        return $param;
    }


    /**
     * 验证商品价格
     * @return array|bool
     */
    public function checkPrice($appId){
        $param = $this->dataFilter();
        //验证商品价格
        $goodsSpecData = $showPrice = $showVipPrice = $showShopPrice = [];
        if ($param['sku_type'] == 1) { //有SKU
            $goodsSpec = json_decode($param['goods_spec']);
            if (empty($goodsSpec->itemPrice)) {
                return false;
            }
            foreach ($goodsSpec->itemPrice as $key => $val) {
                if ($val->invalid == 1) {
                    continue;
                }
                if (empty($val->shop_price) || empty($val->weight) || empty($val->market_price) || empty($val->store_count)) {
                    return false;
                }
                if ($param['is_plus_vip'] == 1 && empty($val->plus_vip_price)) {
                    return false;
                }
                if ($param['is_commission'] == 1 && empty($val->commission)) {
                    return false;
                }
                if (empty($val->key) || empty($val->key_name)) {
                    return false;
                }
                $goodsSpecData[] = [
                    'app_id' => $appId,
                    'key' => $val->key,
                    'key_name' => $val->key_name,
                    'image' => $val->image,
                    'weight' => $val->weight,
                    'store_count' => $val->store_count,
                    'sku_type' => 1,
                    'bar_code' => $val->bar_code,
                    'shop_price' => moneyToInt($val->shop_price),
                    'market_price' => moneyToInt($val->market_price),
                ];
                $showPrice[] = moneyToInt($val->market_price);
                $showShopPrice[] = moneyToInt($val->shop_price);
            }
            sort($showPrice);
            sort($showShopPrice);
        } else { //无sku
            if (empty($param['shop_price']) || empty($param['weight']) || empty($param['market_price']) || empty($param['store_count'])) {
                return false;
            }
            $goodsSpecData = [
                'app_id' => $appId,
                'key' => "",
                'key_name' => "",
                'image' => $param['photo'],
                'weight' => $param['weight'],
                'store_count' => $param['store_count'],
                'sku_type' => 0,
                'bar_code' => $param['goods_sn'],
                'shop_price' => moneyToInt($param['shop_price']),
                'market_price' => moneyToInt($param['market_price']),
            ];
        }

        return [
            'goods_spec_data' => $goodsSpecData,
            'shop_price' => $param['sku_type'] == 1 ? $showShopPrice[0] : moneyToInt($param['shop_price']),
            'market_price' => $param['sku_type'] == 1 ? $showPrice[0] : moneyToInt($param['market_price']),
        ];
    }


    /**
     * 验证物流参数
     * @param $appId
     * @return bool
     */
    public function checkShipping($appId,$param = [])
    {
        $param =  empty($param) ?  $this->dataFilter() : $param;
        if ($param['is_free_shipping'] == 0) {
            $shippingAreaIds = json_decode($param['shipping_area_ids']);
            if (empty($shippingAreaIds)) {
                return false;
            }
            $ShippingAreaModel = new ShippingAreaModel();
            $datas = $ShippingAreaModel->whereIn("shipping_area_id", $shippingAreaIds)->select();
            foreach ($datas as $val) {
                if ($val->app_id != $appId) {
                    return false;
                }
            }
        }
        return true;
    }


    /**
     * 商品编码
     */
    public function goodsSn($goods_sn,$appId){
        if(empty($goods_sn)){ //生成商品编码
            return date("Ymd") . $this->getAutoMaxId();
        }else{ //验证商品编码
            if($detail = $this->where("app_id",$appId)->where("goods_sn",$goods_sn)->find()){
                return false;
            }
            return $goods_sn;
        }
    }



    /**
     * 验证商品物流
     */
    public function checkFreight($tmpId,$appId){
        $FreightTemplateModel = new FreightTemplateModel();
        if(!$detail = $FreightTemplateModel->find($tmpId)){
            return false;
        }
        if($detail->app_id != $appId){
            return false;
        }
        return true;
    }


}
