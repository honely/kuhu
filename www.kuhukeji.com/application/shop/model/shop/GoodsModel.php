<?php

namespace app\shop\model\shop;

use app\shop\logic\shop\GoodsPromFactory;
use app\shop\model\CommonModel;
use think\Db;

class GoodsModel extends CommonModel
{
    protected $pk = 'goods_id';
    protected $name = 'app_shop_goods';
    protected $insert = ["add_time", "add_ip"];
    protected $rules = [
        ['cat_id', 'require|number', '请输入分类id|分类id必须是数字'],
        ['p_cat_id', 'require|number', '请输入父级分类ID|父级分类ID必须是数字'],
        ['goods_sn', 'require|max:60', '请输入商品编号|商品编号最多不能超过60个字符'],
        ['goods_name', 'require|max:120', '请输入商品名称|商品名称最多不能超过120个字符'],
        ['comment_count', 'number', '商品评论数必须是数字'],
        ['keywords', 'max:255', '商品关键词最多不能超过255个字符'],
        ['goods_content', 'max:65535', '商品详细描述最多不能超过65535个字符'],
        ['photo', 'require|max:255', '请输入商品上传原始图|商品上传原始图最多不能超过255个字符'],
        ['is_online', 'number', '是否上架必须是数字'],
        ['is_free_shipping', 'number', '包邮类型不同'],
        ['orderby', 'number', '商品排序必须是数字'],
        ['is_recommend', 'number', '是否推荐必须是数字'],
        ['is_new', 'number', '是否新品必须是数字'],
        ['is_hot', 'number', '是否热卖必须是数字'],
        ['give_integral', 'number', '购买商品赠送积分必须是数字'],
        ['sales_sum', 'number', '商品销量必须是数字'],
        ['is_commission', 'number', '商品销量必须是数字'],
        ['is_plus_vip', 'number', '商品销量必须是数字'],
        ['type_id', 'require|number', '请选择商品模型|模型类型错误'],
        ['sku_type', 'number', '商品销量必须是数字'],
        ['photos', 'require', '至少上传一张相册'],
        ['is_plus_vip', 'number', '是否开启VIP会员专享价必须是数字'],
        ['is_coupon', 'number', '是否可用优惠券必须是数字'],
        ['views', 'number', '是否可用优惠券必须是数字'],
        ['seo', 'require|min:1', 'SEO信息必须设置1|SEO信息必须设置2'],
    ];


    protected $goods ;//当前商品


    public function dataFilter()
    {
        $request = request();
        $param = [
            "cat_id" => (int)$request->param("cat_id", "0"),//分类id,//分类ID
            "p_cat_id" => (int)$request->param("p_cat_id", "0"),//父级分类ID
            "goods_sn" => (string)$request->param("goods_sn", ""),//商品编号
            "goods_name" => (string)$request->param("goods_name", ""),//商品名称
            "goods_num" => (int)$request->param("goods_num", "10"),//库存数量
            "comment_count" => (int)$request->param("comment_count", "0"),//商品评论数
            "weight" => (int)$request->param("weight", "0"),//商品重量克为单位
            "market_price" => (int)$request->param("market_price", "0"),//市场价
            "shop_price" => (int)$request->param("shop_price", "0"),//本店价
            "keywords" => (string)$request->param("keywords", ""),//商品关键词
            "goods_content" => (string)$request->param("goods_content", "", "SecurityEditorHtml"),//商品详细描述
            "photo" => (string)$request->param("photo", ""),//商品缩略图
            "photos" => (string)$request->param("photos", "", "SecurityEditorHtml"),//商品相册
            "is_online" => (int)($request->param("is_online", 1) == 1), //是否上架
            "is_free_shipping" => (int)($request->param("is_free_shipping", 1) == 1),//是否包邮
            "orderby" => (int)$request->param("orderby", "0"),//商品排序
            "is_recommend" => (int)($request->param("is_recommend", 1) == 1),//是否推荐
            "is_new" => (int)($request->param("is_new", 1) == 1),//是否是新品
            "is_hot" => (int)($request->param("is_hot", 1) == 1),//是否是热卖
            "sales_sum" => $request->param("sales_sum", 1),//商品销量
            "commission" => (int)$request->param("commission", 0),//分佣提成
            "shipping_area_ids" => (string)$request->param("shipping_area_ids", "", "SecurityEditorHtml"),//配送物流
            "plus_vip_price" => (int)$request->param("plus_vip_price", 0),//会员专享价格
            "views" => (int)$request->param("views", 0),//会员专享价格
            "goods_attr" => (string)$request->param("goods_attr", "", "SecurityEditorHtml"),//商品属性
            "goods_spec" => (string)$request->param("goods_spec", "", "SecurityEditorHtml"),//商品属性
            "sku_type" => (int)($request->param("sku_type", 1) == 1),//商品模型
            "type_id" => (int)$request->param("type_id", 0),//商品模型
            "is_plus_vip" => (int)($request->param("is_plus_vip", 1) == 1),//是否有会员优惠
            "is_commission" => (int)($request->param("is_commission", 1) == 1),//是否有佣金
            "is_coupon" => (int)($request->param("is_coupon", 1) == 1),//是否有佣金
            "freight_template_id" => (int) $request->param("freight_template_id"),//是否有佣金
            "seo" => (string) $request->param('seo','','SecurityEditorHtml'),
            "last_update" => time(),
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
     * 验证商品价格
     * @return array|bool
     */
    public function checkPrice($appId, $param = [],$checkSn=true)
    {
        $param = empty($param) ? $this->dataFilter() : $param;
        //验证商品价格
        $goodsSpecData = $showPrice = $showVipPrice = $showShopPrice = [];
        $barCode = [];
        $spec_map = [];
        if ($param['sku_type'] == 1) { //有SKU
            $goodsSpec = json_decode($param['goods_spec']);
            if (empty($goodsSpec->itemPrice)) {
                return false;
            }

            foreach ($goodsSpec->itemPrice as $key => $val) {
                $spec_map[] =  [
                    'spec_key' => $val->spec_key,
                    'key_name' => $val->key_name,
                ];
                if ($val->invalid == 1) {
                    continue;
                }

                if (empty($val->shop_price)  || empty($val->market_price) || empty($val->goods_num)) {
                    return false;
                }

                if ($param['is_plus_vip'] == 1 && empty($val->plus_vip_price)) {
                    return false;
                }

                if ($param['is_commission'] == 1 && empty($val->commission)) {
                    return false;
                }

                if (empty($val->spec_key) || empty($val->key_name)) {
                    return false;
                }

                if(!empty($val->bar_code)){
                    $barCode[] =$val->bar_code;
                }

                $goodsSpecData[] = [
                    'app_id' => $appId,
                    'spec_key' => $val->spec_key,
                    'key_name' => $val->key_name,
                    'photo' => empty($val->photo) ? $param['photo'] :$val->photo ,
                    'goods_num' => $val->goods_num,
                    'sku_type' => 1,
                    'bar_code' => empty($val->bar_code) ? $param['goods_sn'] . $key :  $val->bar_code,
                    'goods_sn' => $param['goods_sn'],
                    'shop_price' => moneyToInt($val->shop_price),
                    'commission' => moneyToInt($val->commission),
                    'market_price' => moneyToInt($val->market_price),
                    'plus_vip_price' => moneyToInt($val->plus_vip_price),
                ];

                $showPrice[] = moneyToInt($val->market_price);
                $showVipPrice[] = moneyToInt($val->plus_vip_price);
                $showShopPrice[] = moneyToInt($val->shop_price);
            }
            sort($showPrice);
            sort($showVipPrice);
            sort($showShopPrice);
        } else { //无sku
            if (empty($param['shop_price'])  || empty($param['market_price']) || empty($param['goods_num'])) {
                return false;
            }
            if ($param['is_plus_vip'] == 1 && empty($param['plus_vip_price'])) {
                return false;
            }
            if ($param['is_commission'] == 1 && empty($param['commission'])) {
                return false;
            }

            $barCode[] =$param['goods_sn'] . "0";
            $goodsSpecData = [
                'app_id' => $appId,
                'spec_key' => "",
                'key_name' => "",
                'photo' => $param['photo'],
                'goods_num' => $param['goods_num'],
                'goods_sn' => $param['goods_sn'],
                'sku_type' => 0,
                'bar_code' => $param['goods_sn'],
                'shop_price' => moneyToInt($param['shop_price']),
                'commission' => moneyToInt($param['commission']),
                'market_price' => moneyToInt($param['market_price']),
                'plus_vip_price' => moneyToInt($param['plus_vip_price']),
            ];
        }
        if(!empty($barCode) && $checkSn){
            $GoodsRepertoryModel = new GoodsRepertoryModel();
            $datas = $GoodsRepertoryModel->where('app_id',$appId)->whereIn("bar_code",$barCode)->select();
            if(!empty($datas)){
                return false;
            }
        }
        return [
            'goods_spec_data' => $goodsSpecData,
            'spec_map' => json_encode($spec_map),
            'shop_price' => $param['sku_type'] == 1 ? $showShopPrice[0] : moneyToInt($param['shop_price']),
            'market_price' => $param['sku_type'] == 1 ? $showPrice[0] : moneyToInt($param['market_price']),
            'plus_vip_price' => $param['sku_type'] == 1 ? $showVipPrice[0] : moneyToInt($param['plus_vip_price']),
        ];
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


    /**
     * 依赖类 模型返回的结果
     * 暂时只返回 会员
     * @param GoodsModel $goods
     */
    public function getActivityTitle( $goods){
        $return = [];
        foreach ($goods as $val){
            $return[$val->goods_id]['hd_title']  = '';
            if($val->is_plus_vip == 1 && $val->plus_vip_price > 0){
                $price = moneyFormat($val->plus_vip_price);
                $return[$val->goods_id]['hd_title']  = "VIP会员价￥{$price}";
            }
        }
        return $return;
    }

}
