<?php
namespace app\shop\model\shop;
use app\shop\model\CommonModel;

class ShippingAreaModel extends CommonModel{
    protected $pk = 'shipping_area_id';
    protected $name = 'app_shop_shipping_area';


    /**
     * 计算根据商品重量计算物流运费
     * @param $province  int  省ID
     * @param $city      int  城市ID
     * @param $district  int  地区 ID
     * @param $weight  int  重量 单位克
     * @param $shipping_id  int 物流ID
     * @return float|int  -1 当前地区不发货
     */
    public function getFreight ($province,$city,$district,$weight,$shipping_id){

        if ($weight == 0) return 0; // 商品没有重量 返回0元
        if ($shipping_id <= 0) return -1; //返回 不发货

        // 先根据 镇 县 区找 shipping_area_id\
        $ShippingAreaRegionModel = new ShippingAreaRegionModel();
        $tableName = $this->getTable();
        if ($district != 0) {
            $shipping_area_id = $ShippingAreaRegionModel->where("shipping_area_id in (select shipping_area_id from  {$tableName} where shipping_id = :shipping_id) and region_id = :region_id")->bind(['shipping_id'=>$shipping_id,'region_id'=>$district])->column('shipping_area_id');
        }

        // 先根据市区找 shipping_area_id
        if ($shipping_area_id == false && $city != 0) {
            $shipping_area_id = $ShippingAreaRegionModel->where("shipping_area_id in (select shipping_area_id from {$tableName}  where shipping_id = :shipping_id) and region_id = :region_id")->bind(['shipping_id'=>$shipping_id,'region_id'=>$city])->column('shipping_area_id');
        }

        // 市区找不到 根据省份找shipping_area_id
        if ($shipping_area_id == false && $province != 0) {
            $shipping_area_id = $ShippingAreaRegionModel->where("shipping_area_id in (select shipping_area_id from  {$tableName}  where shipping_id = :shipping_id) and region_id = :region_id")->bind(['shipping_id'=>$shipping_id,'region_id'=>$province])->column('shipping_area_id');
        }

        // 省份找不到 找默认配置全国的物流费
        if ($shipping_area_id == false) {
            // 如果市和省份都没查到, 就查询 tp_shipping_area 表 is_default = 1 的  表示全国的  select * from `tp_plugin`  select * from  `tp_shipping_area` select * from  `tp_area_region`
            $shipping_area_id = $ShippingAreaRegionModel->where("shipping_area_id in (select shipping_area_id from  {$tableName}  where shipping_id = :shipping_id) and is_default = 1")->bind(['shipping_id'=>$shipping_id,'region_id'=>$province])->column('shipping_area_id');
//            $shipping_area_id = $this->where(['shipping_id'=>$shipping_id,'is_default'=>1])->column('shipping_area_id');
        }

        if ($shipping_area_id == false) {
            return -1;
        }
        /// 找到了 shipping_area_id  找config
        $shipping = $this->find($shipping_area_id);

        $shipping_config = json_decode($shipping->config,true);
        $shipping_config['money'] = $shipping_config['money'] ? $shipping_config['money'] : 0;
        // 1000 克以内的 只算个首重费
        if ($weight < $shipping_config['first_weight']) {
            return $shipping_config['money'];
        }
        //超过 1000 克的计算方法
        $weight = $weight - $shipping_config['first_weight']; // 续重
        $weight = ceil($weight / $shipping_config['second_weight']); // 续重不够取整
        $freight = $shipping_config['money'] + $weight * $shipping_config['add_money']; // 首重 + 续重 * 续重费
        return $freight;
    }

}
