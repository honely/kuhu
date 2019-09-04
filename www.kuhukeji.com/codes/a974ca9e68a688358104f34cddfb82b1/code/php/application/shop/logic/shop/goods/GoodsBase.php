<?php

namespace app\shop\logic\shop\goods;

use app\shop\model\shop\CommentModel;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\GoodsRepertoryModel;
use app\shop\model\shop\SpecItemModel;
use app\shop\model\shop\SpecModel;
use think\Exception;

/**
 * 商品基类
 * Class CalculateModel
 * @package app\shop\model\shop
 */
class GoodsBase
{

    /**
     * @var int 商品ID
     */
    private $goodsId;

    /**
     * @var int 商品Id
     */
    private $appId;

    /**
     * @var object 当前商品
     */
    private $goods;

    /**
     * 当前设置的商品规格
     */
    private $spec;

    /**
     * 禁止实例化
     * GoodsLogic constructor.
     * @param $appId  int appid
     * @param $goodsId int  商品ID
     */
    protected function __construct()
    {

    }

    /**
     * 设置商品ID
     * @param $goodsId int 商品ID
     */
    public function setGoodsId($goodsId){
        $this->goodsId = $goodsId;
        $GoodsModel = new GoodsModel();
        $this->goods = $GoodsModel->find($this->goodsId);
        if(empty($this->goods) || $this->goods->is_delete == 1 || $this->goods->app_id != $this->appId){
            throw new Exception("商品已下架");
        }
        return $this;
    }


    /**
     * 设置应用ID
     */
    public function setAppId($appId){
          $this->appId = $appId;
          return $this;
    }

    /**
     * 是否上架
     */
    public function checkOnline(){
        return $this->goods->is_online == 1;
    }

    /**
     * 获取查询的商品
     * @return object 商品
     */
    public function getGoods()
    {
        return $this->goods;
    }

    /**
     * 验证商品&&并返回库存
     * @param $specKey string 规格key
     */
    public function checkSpec($specKey)
    {
        $GoodsspecrepertoryModel = new GoodsRepertoryModel();
        $where['goods_id'] = $this->goodsId;
        $this->goods->sku_type == 1 && $where['spec_key'] = $specKey; //多规格
        $spec = $GoodsspecrepertoryModel->where($where)->find();
        $this->spec = $spec;
        return empty($spec) ? false : $spec;
    }

    /**
     * 获取商品规格
     * @param $goods_id |商品id
     * @return array
     */
    public function getSpec()
    {
        //商品规格 价钱 库存表 找出 所有 规格项id
        $GoodsrepertoryModel = new GoodsRepertoryModel();
        $keys = $GoodsrepertoryModel->where("goods_id", $this->goodsId)->column("GROUP_CONCAT(`spec_key` SEPARATOR '_') ");
        if (empty($keys[0])) {
            return [];
        }
        $keys = $keys[0];
        $filter_spec = [];
        $SpecModel = new SpecModel();
        $SpecItemModel = new SpecItemModel();
        if ($keys) {
            $keys = str_replace('_', ',', $keys);
            $sql = "SELECT a.name,a.orderby,b.* FROM {$SpecModel->getTable()} AS a INNER JOIN {$SpecItemModel->getTable()} AS b ON a.spec_id = b.spec_id WHERE b.item_id IN({$keys}) ORDER BY b.item_id";
            $filter_spec2 = \think\Db::query($sql);
            foreach ($filter_spec2 as $key => $val) {
                $filter_spec[$val['name']][] = [
                    'item_id' => $val['item_id'],
                    'item' => $val['item'],
                ];
            }
        }
        return $filter_spec;
    }

    /**
     * 获取商品的活动
     * @param $prom_id
     * @param $prom_type
     */
    public function getActivity()
    {
        $GoodsPromFactory = new GoodsPromFactory();

        if ($GoodsPromFactory->checkPromType($this->goods->prom_type) == false) {
            return [];
        }

        return $GoodsPromFactory->makeModule($this->goods->prom_type)->checkActivity($this->goods->prom_id);
    }

    /**
     * 获取商品评论
     * @param $goodsId
     * @param $commentType // 1全部 2好评 3中评 4差评
     * @param $page
     * @param $limit
     */
    public function getComment($commentType, $page, $limit)
    {
        if ($commentType <= 0 || $commentType >= 6) {
            $commentType = 5;
        }
        $where = ['is_show' => 1, 'goods_id' => $this->goodsId];
        if ($commentType == 5) {
            $where['img'] = ['<>', ''];
        } else {
            $typeArr = ['1' => '0,1,2,3,4,5', '2' => '4,5', '3' => '3', '4' => '0,1,2'];
            $where['goods_rank'] = ['in', $typeArr[$commentType]];
        }
        $CommentModel = new CommentModel();
        $list = $CommentModel->where($where)->order("add_time desc")->page($page, $limit)->select();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'user_id' => $val->user_id,
                'username' => $val->username,
                'face' => $val->face,
                'add_time' => date("Y-m-d H:i:s",$val->add_time),
                'content' => $val->content,
                'img' => (array)json_decode($val->img, true),
                'goods_rank' => $val->goods_rank,
                'reply' => $val->reply,
            ];
        }
        return $datas;

    }

    /**
     * @param int $num      商品个数
     * @param int $regionId 区域ID
     * @return int  返回-1  则表示该地区无货
     */
    public function getShippingPrice($num = 1, $regionId = 1)
    {
        $FreightLogic = new FreightLogic();
        $FreightLogic->setGoodsModel($this->goods);
        $FreightLogic->setGoodsNum($num);
        $FreightLogic->setRegionId($regionId);
        $FreightLogic->doCalculation();
        return $FreightLogic->getFreight();
    }

    /**
     * 获取商品价格
     * @return array 商品价格
     */
    public function getSpecPrice(){
        $GoodsrepertoryModel = new GoodsrepertoryModel();

        $spec_goods_price = $GoodsrepertoryModel->where("goods_id", $this->goodsId)->column("spec_key,key_name,shop_price,goods_num,photo,market_price,plus_vip_price"); // 规格 对应 价格 库存表
        if(empty($spec_goods_price)){
            return [];
        }

        $goodsNum = 0;
        foreach ($spec_goods_price as &$val) {
            $val['shop_price'] = moneyFormat($val['shop_price'], true);
            $val['market_price'] = moneyFormat($val['market_price'], true);
            $val['plus_vip_price'] = moneyFormat($val['plus_vip_price'], true);
            $val['photo'] = empty($val['photo']) ? $this->goods->photo : '';
            $goodsNum += $val['goods_num'];
        }

        $this->goods->setAttr("goods_num",$goodsNum);
        $spec_goods_price_keys = array_keys($spec_goods_price);
        if(count($spec_goods_price_keys) == 1 &&  $spec_goods_price_keys[0] == ''){
            $spec_goods_price = $spec_goods_price[''];
        }

        return $spec_goods_price;
    }

    /**
     * 外部修改属性
     */
    public function setAttr($key,$value){
        $this->goods->setAttr($key,$value);
    }


    /**
     * 返回即购买标准格式
     * @param $specKey string 要处理的规格
     */
    public function getBuyGoodsData($specKey,$num=1){
        $spec = $this->checkSpec($specKey);
        if(empty($spec) || $spec->goods_num <= 0){
            throw new Exception("库存不足");
        }
        $returnData[] = [
            'app_id' =>    $this->goods->app_id,
            'goods_id' => $this->goods->goods_id,
            'goods_name' =>  $this->goods->goods_name,
            'goods_sn' => $this->goods->goods_sn,
            'bar_code' => $spec->bar_code,
            'is_coupon' => $this->goods->is_coupon,
            'cat_id' => $this->goods->cat_id,
            'p_cat_id' => $this->goods->p_cat_id,
            'goods_img' => $this->goods->sku_type == 1 ? $this->goods->photo : $spec->photo,
            'spec_key' => $spec->spec_key,
            'key_name' => $spec->key_name,
            'sku_type' => $this->goods->sku_type,
            'is_plus_vip' => $this->goods->is_plus_vip,
            'goods_num' => $num,
            'price' => $spec->shop_price,
            'is_free_shipping' => $this->goods->is_free_shipping,
            'prom_id' => $this->goods->prom_id,
            'prom_type' => $this->goods->prom_type,
            'weight' => $this->goods->weight,
            'freight_template_id' => $this->goods->freight_template_id,
            'vip_price' => $this->goods->is_plus_vip == 1 ? $spec->plus_vip_price : $spec->shop_price,
            'commission' => $this->goods->is_commission == 1 ? $spec->commission : 0,
        ];
        return $returnData;
    }

}
