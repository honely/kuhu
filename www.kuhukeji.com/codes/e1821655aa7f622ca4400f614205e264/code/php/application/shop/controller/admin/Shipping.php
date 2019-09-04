<?php

namespace app\shop\controller\admin;


use app\shop\model\shop\ShippingAreaModel;
use app\shop\model\shop\ShippingAreaRegionModel;
use app\shop\model\shop\ShippingModel;

class Shipping extends Common
{
    public function create()
    {

        $ShippingModel = new ShippingModel();
        $res = $ShippingModel->setData($ShippingModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($ShippingModel->getError());
        }
        $shipping_id =  $ShippingModel->shipping_id;
        if($ShippingModel->dataFilter($this->appId)['is_default'] == 1){
            $ShippingModel->update(['is_default'=>0],[
                'shipping_id' => ['<>',$shipping_id],
                'app_id' => $this->appId,
            ]);
        }
        //添加成功创建一个默认全国的物流模板
        $config = [
            'first_weight' => 1000,
            'money' => 1000,
            'second_weight' => 1000,
            'add_money' => 200,
        ];
        $ShippingAreaModel = new ShippingAreaModel();
        $ShippingAreaModel->save([
            'app_id' => $this->appId,
            'shipping_area_name' => "全国及其他地区",
            "shipping_code" => $ShippingModel->dataFilter($this->appId)["shipping_code"],
            "config" => json_encode($config),
            'update_time' => time(),
            'is_default' => 1,
            'shipping_id' => $shipping_id,
        ]);


    }

    public function edit()
    {
        $shipping_id = (int)$this->request->param("shipping_id");
        $ShippingModel = new ShippingModel();
        if (!$detail = $ShippingModel->find($shipping_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $res = $ShippingModel->setData($ShippingModel->dataFilter($this->appId), $shipping_id);
        if ($res === false) {
            $this->warning($ShippingModel->getError());
        }
        //如果更改快递编码
        $_shipping_code = $ShippingModel->dataFilter($this->appId)['shipping_code'];
        if($detail->shipping_code != $_shipping_code){
            $ShippingAreaModel = new ShippingAreaModel();
            $ShippingAreaModel->save(['shipping_code'=>$_shipping_code],['shipping_id'=>$shipping_id]);
        }

        if($ShippingModel->dataFilter($this->appId)['is_default'] == 1){
            $ShippingModel->update(['is_default'=>0],[
                'shipping_id' => ['<>',$shipping_id],
                'app_id' => $this->appId,
            ]);
        }
    }

    public function del() {
        $shipping_id = (int)$this->request->param("shipping_id");
        $ShippingModel = new ShippingModel();
        $ShippingAreaRegionModel = new ShippingAreaRegionModel();
        $ShippingAreaModel = new ShippingAreaModel();
        if (!$detail = $ShippingModel->find($shipping_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $region =  $ShippingAreaModel->where("shipping_id",$shipping_id)->select();
        $regionIds = [];
        foreach ($region as $val){
                $regionIds[] = $val->shipping_area_id;
        }
        //删除物流公司
        $ShippingModel->where("shipping_id", $shipping_id)->delete();
        //删除区域模板
        $ShippingAreaModel->where("shipping_id",$shipping_id)->delete();
        //删除 区域map
        $ShippingAreaRegionModel->whereIn("shipping_area_id",$regionIds)->delete();

    }



    public function index(){
        $ShippingModel = new ShippingModel();
        $where['app_id'] = $this->appId;
        $shipping_name = (string)$this->request->param("shipping_name");
        if (!empty($shipping_name)) {
            $where["shipping_name"] = ["LIKE", "%{$shipping_name}%"];
        }
        $list = $ShippingModel->where($where)->order("shipping_id desc")->page($this->page, $this->limit)->select();
        $count = $ShippingModel->where($where)->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'shipping_id' => $val->shipping_id,
                'shipping_code' => $val->shipping_code,
                'shipping_name' => $val->shipping_name,
                'shipping_desc' => $val->shipping_desc,
                'enabled' => $val->enabled,
                'is_default' => $val->is_default,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    public function getDetail(){
      $ShippingModel = new ShippingModel();
      $shoppingTmp = $ShippingModel->where("app_id",$this->appId)->select();
      $ShippingAreaModel = new ShippingAreaModel();
      $shoppingAreaTmp = $ShippingAreaModel->where("app_id",$this->appId)->select();
      $shoppingArea = [];
      foreach ($shoppingAreaTmp as $val){
          $shoppingArea[$val->shipping_id][] = [
              'shipping_area_id' => $val->shipping_area_id,
              'shipping_area_name' => $val->shipping_area_name,
          ];
      }
      $datas = [];
      foreach ($shoppingTmp as $val){
          $datas[] = [
              'shipping_id' => $val->shipping_id,
              'shipping_name' => $val->shipping_name,
              'area' => empty($shoppingArea[$val->shipping_id]) ? [] : $shoppingArea[$val->shipping_id],
          ];
      }
      $this->datas['list'] = $datas;

    }
}

