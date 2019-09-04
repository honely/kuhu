<?php

namespace app\shop\controller\admin;


use app\shop\model\shop\RegionModel;
use app\shop\model\shop\ShippingAreaModel;
use app\shop\model\shop\ShippingAreaRegionModel;
use app\shop\model\shop\ShippingModel;

class Region extends Common
{

    /**
     * 获取城市列表
     */
    public function index()
    {
        $RegionModel = new RegionModel();
        $this->datas["list"] = $RegionModel->getRegion();
    }

    /**
     * 获取快递区域列表
     */
    public function getArea()
    {
        $shipping_id = (int)$this->request->param("shipping_id");
        $ShippingModel = new ShippingModel();
        if (!$detail = $ShippingModel->find($shipping_id)) {
            $this->warning("非法操作");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("非法操作");
        }
        $shipping_area_num = config("limitnum.shipping_area_num");

        $ShippingAreaModel = new ShippingAreaModel();
        $list = $ShippingAreaModel->where("shipping_id", $shipping_id)->limit(0, $shipping_area_num)->select();

        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'shipping_area_id' => $val->shipping_area_id,
                'shipping_area_name' => $val->shipping_area_name,
                'update_time' => $val->update_time,
                'is_default' => $val->is_default,
            ];
        }

        $this->datas = [
            'shipping_name' => $detail->shipping_name,
            'list' => $datas,
        ];
    }

    /**
     * 创建区域模板
     */
    public function create()
    {
        $regionsStr = (string)$this->request->param("region_ids", "", "SecurityEditorHtml");
        $regionsIds = json_decode($regionsStr);
        if (empty($regionsIds)) {
            $this->warning("请选择区域");
        }
        $shipping_id = (int)$this->request->param("shipping_id");
        $ShippingModel = new ShippingModel();
        if (!$shipping = $ShippingModel->find($shipping_id)) {
            $this->warning("操作错误");
        }
        if ($shipping->app_id != $this->appId) {
            $this->warning("操作错误");
        }
        $shipping_area_num = config("limitnum.shipping_area_num");
        $ShippingAreaModel = new ShippingAreaModel();
        $count = $ShippingAreaModel->where("app_id", $this->appId)->count();
        if ($count > $shipping_area_num) {
            $this->warning("您做多添加{$shipping_area_num}区域运费");
        }
        $config['first_weight'] = (int)$this->request->param("first_weight");
        $config['money'] = $this->request->param("money", 0, "moneyToInt");
        $config['second_weight'] = $this->request->param("second_weight");
        $config['add_money'] = $this->request->param("add_money", 0, "moneyToInt");
        if ($config['first_weight'] <= 0 || $config['money'] <= 0 || $config['second_weight'] <= 0 || $config['add_money'] <= 0) {
            $this->warning("请配置价格模板");
        }
        $data['shipping_area_name'] = (string)$this->request->param("shipping_area_name");
        if (empty($data['shipping_area_name'])) {
            $this->warning("请输入区域名称");
        }
        $data['app_id'] = $this->appId;
        $data["shipping_code"] = $shipping->shipping_code;
        $data["update_time"] = time();
        $data["shipping_id"] = $shipping_id;
        $data["config"] = json_encode($config);
        $ShippingAreaModel->save($data);
        $shipping_area_id = $ShippingAreaModel->shipping_area_id;
        $data2 = [];
        foreach ($regionsIds as $val) {
            $data2[] = [
                'shipping_area_id' => $shipping_area_id,
                'region_id' => $val,
            ];
        }
        $ShippingAreaRegionModel = new ShippingAreaRegionModel();
        $ShippingAreaRegionModel->saveAll($data2, false);
    }

    /**
     * 修改区域模板
     */
    public function edit()
    {
        $shipping_area_id = (int)$this->request->param("shipping_area_id");
        $ShippingAreaModel = new ShippingAreaModel();
        if (!$detail = $ShippingAreaModel->find($shipping_area_id)) {
            $this->warning();
        }
        if ($detail->app_id != $this->appId) {
            $this->warning();
        }
        $config['first_weight'] = (int)$this->request->param("first_weight");
        $config['money'] = $this->request->param("money", 0, "moneyToInt");
        $config['second_weight'] = $this->request->param("second_weight");
        $config['add_money'] = $this->request->param("add_money", 0, "moneyToInt");
        if ($config['first_weight'] <= 0 || $config['money'] <= 0 || $config['second_weight'] <= 0 || $config['add_money'] <= 0) {
            $this->warning("请配置价格模板");
        }
        if ($detail->is_default == 0) {
            $data['shipping_area_name'] = (string)$this->request->param("shipping_area_name");
            if (empty($data['shipping_area_name'])) {
                $this->warning("请输入区域名称");
            }
        }

        $data['app_id'] = $this->appId;
        $data["update_time"] = time();
        $data["config"] = json_encode($config);
        $ShippingAreaModel->save($data, ['shipping_area_id' => $shipping_area_id]);

        //非全国地区
        if ($detail->is_default == 0) {
            $regionsStr = (string)$this->request->param("region_ids", "", "SecurityEditorHtml");
            $regionsIds = json_decode($regionsStr);
            if (empty($regionsIds)) {
                $this->warning("请选择区域");
            }
            $data2 = [];
            foreach ($regionsIds as $val) {
                $data2[] = [
                    'shipping_area_id' => $shipping_area_id,
                    'region_id' => $val,
                ];
            }
            $ShippingAreaRegionModel = new ShippingAreaRegionModel();
            $ShippingAreaRegionModel->where("shipping_area_id", $shipping_area_id)->delete();
            $ShippingAreaRegionModel->saveAll($data2, false);
        }

    }

    /**
     * 获取区域模板详情
     */
    public function detail(){
        $shipping_area_id = (int)$this->request->param("shipping_area_id");
        $ShippingAreaModel = new ShippingAreaModel();
        if (!$detail = $ShippingAreaModel->find($shipping_area_id)) {
            $this->warning();
        }
        if ($detail->app_id != $this->appId) {
            $this->warning();
        }
        $ShippingAreaRegionModel = new ShippingAreaRegionModel();
        $regions  = $ShippingAreaRegionModel->where("shipping_area_id",$shipping_area_id)->select();
        $regionIds = [];
        foreach ($regions as $val){
            $regionIds[] = $val->region_id;
        }
        $confg = json_decode($detail->config);
        $this->datas['detail'] = [
            'shipping_area_name' => $detail->shipping_area_name,
            'shipping_code' => $detail->shipping_code,
            'first_weight' => $confg->first_weight,
            'money' => moneyFormat($confg->money),
            'second_weight' => $confg->second_weight,
            'add_money' => moneyFormat($confg->add_money),
            'is_default' => $detail->is_default,
            'region_ids' => $regionIds,
        ];
    }


    /**
     * 删除模板
     */
    public function delete(){
        $shipping_area_id = (int)$this->request->param("shipping_area_id");
        $ShippingAreaModel = new ShippingAreaModel();
        if (!$detail = $ShippingAreaModel->find($shipping_area_id)) {
            $this->warning();
        }
        if ($detail->app_id != $this->appId) {
            $this->warning();
        }
        if($detail->is_default == 1){
            $this->warning();
        }
        $ShippingAreaModel->where("shipping_area_id",$shipping_area_id)->delete();
        $ShippingAreaRegionModel = new ShippingAreaRegionModel();
        $ShippingAreaRegionModel->where("shipping_area_id",$shipping_area_id)->delete();
    }
}


