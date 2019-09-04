<?php

namespace app\shop\controller\api;

use app\shop\model\shop\AddressModel;
use app\shop\model\shop\RegionModel;

class Address extends ShopCommon
{
    protected $checkLogin = true;


    public function getDefault()
    {
        $AddressModel = new AddressModel();

        $detail = $AddressModel->where("user_id", $this->userId)->order("is_default desc,address_id desc")->find();
        if (empty($detail)) {
            return;
        }
        $datas = $areaIds = [];
        $areaIds[$detail->province_id] = $detail->province_id;
        $areaIds[$detail->city_id] = $detail->city_id;
        $areaIds[$detail->division_id] = $detail->division_id;
        $RegionModel = new RegionModel();
        $areas = $RegionModel->itemsByIds($areaIds);
        $this->datas = [
            'address_id' => $detail->address_id,
            'address' => (string)$detail->address,
            'is_default' => (int)$detail->is_default,
            'name' => (string)$detail->name,
            'mobile' => (string)$detail->mobile,
            'province_id' => $detail->province_id,
            'city_id' => $detail->city_id,
            'division_id' => $detail->division_id,
            'province' => isset($areas[$detail->province_id]) ? $areas[$detail->province_id]['name'] : '--',
            'city' => isset($areas[$detail->city_id]) ? $areas[$detail->city_id]['name'] : '--',
            'division' => isset($areas[$detail->division_id]) ? $areas[$detail->division_id]['name'] : '--',
            'street' => (string)$detail->street,
        ];
    }

    public function getIndex()
    {
        $AddressModel = new AddressModel();
        $num = config("limitnum.app_shop_address_num");
        $list = $AddressModel->where("user_id", $this->userId)->order("is_default desc,address_id desc")->limit(0, $num)->select();
        $datas = $areaIds = [];
        foreach ($list as $val) {
            $areaIds[$val->province_id] = $val->province_id;
            $areaIds[$val->city_id] = $val->city_id;
            $areaIds[$val->division_id] = $val->division_id;
        }
        $RegionModel = new RegionModel();
        $areas = $RegionModel->itemsByIds($areaIds);
        foreach ($list as $val) {
            $datas[] = [
                'address_id' => $val->address_id,
                'address' => (string)$val->address,
                'is_default' => (int)$val->is_default,
                'name' => (string)$val->name,
                'mobile' => (string)$val->mobile,
                'province_id' => $val->province_id,
                'city_id' => $val->city_id,
                'division_id' => $val->division_id,
                'province' => isset($areas[$val->province_id]) ? $areas[$val->province_id]['name'] : '--',
                'city' => isset($areas[$val->city_id]) ? $areas[$val->city_id]['name'] : '--',
                'division' => isset($areas[$val->division_id]) ? $areas[$val->division_id]['name'] : '--',
                'street' => (string)$val->street,
            ];
        }
        $this->datas['list'] = $datas;


    }


    /**
     * 新增我的收货地址
     */
    public function addAddress()
    {
        $province_id = (int)$this->request->param("province_id");
        $city_id = (int)$this->request->param("city_id");
        $division_id = (int)$this->request->param("division_id");
        $street = (string)$this->request->param("street");

        $num = config("limitnum.app_shop_address_num");
        $AddressModel = new AddressModel();
        $count = $AddressModel->where("user_id", $this->userId)->count();
        if ($num <= $count) {
            $this->warning("您最多添加{$count}个收货地址");
        }
        $areaIds[] = $province_id;
        $areaIds[] = $city_id;
        $areaIds[] = $division_id;
        $RegionModel = new RegionModel();
        $areas = $RegionModel->itemsByIds($areaIds);


        if ($areas[$city_id]->parent_id != $areas[$province_id]->region_id) {
            $this->warning("参数错误");
        }

        if ($areas[$division_id]->parent_id != $areas[$city_id]->region_id) {
            $this->warning("参数错误");
        }
        empty($street) && $this->warning("请输入街道地址");
        $name = (string)$this->request->param("name");
        empty($name) && $this->warning("请输入名称");
        $mobile = (string)$this->request->param("mobile");
        empty($mobile) && $this->warning("请输入手机号");
        if (!isMobile($mobile)) {
            $this->warning('请输入合法手机号码');
        }
        $is_default = (int)($this->request->param("is_default", 0) == 1);
        if ($is_default == 1) {
            $AddressModel->isUpdate(true)->save(['is_default' => 0], ['user_id' => $this->userId]);
        }
        $address = isset($areas[$province_id]) ? $areas[$province_id]['name'] : '--';
        $address .= isset($areas[$city_id]) ? $areas[$city_id]['name'] : '--';
        $address .= isset($areas[$division_id]) ? $areas[$division_id]['name'] : '--';
        $address .= (string)$street;
        $AddressModel = new AddressModel();
        $AddressModel->save([
            'app_id' => $this->appId,
            'user_id' => $this->userId,
            'address' => $address,
            'street' => $street,
            'is_default' => $is_default,
            'city_id' => $city_id,
            'division_id' => $division_id,
            'province_id' => $province_id,
            'mobile' => $mobile,
            'name' => $name,
        ]);
    }

    /**
     * 修改我的收货地址
     */
    public function editAddress()
    {
        $address_id = (int)$this->request->param("address_id");
        $AddressModel = new AddressModel();
        if (!$address = $AddressModel->find($address_id)) {
            $this->warning("参数错误");
        }
        if ($address->user_id != $this->userId) {
            $this->warning("参数错误");
        }
        $province_id = (int)$this->request->param("province_id");
        $city_id = (int)$this->request->param("city_id");
        $division_id = (int)$this->request->param("division_id");
        $street = (string)$this->request->param("street");

        $AddressModel = new AddressModel();
        $areaIds[] = $province_id;
        $areaIds[] = $city_id;
        $areaIds[] = $division_id;
        $RegionModel = new RegionModel();
        $areas = $RegionModel->itemsByIds($areaIds);
        if ($areas[$city_id]->parent_id != $areas[$province_id]->region_id) {
            $this->warning("参数错误");
        }
        if ($areas[$division_id]->parent_id != $areas[$city_id]->region_id) {
            $this->warning("参数错误");
        }
        empty($street) && $this->warning("请输入街道地址");
        $name = (string)$this->request->param("name");
        empty($name) && $this->warning("请输入名称");
        $mobile = (string)$this->request->param("mobile");
        empty($mobile) && $this->warning("请输入手机号");
        if (!isMobile($mobile)) {
            $this->warning('请输入合法手机号码');
        }
        $is_default = (int)($this->request->param("is_default", 0) == 1);
        if ($is_default == 1) {
            $AddressModel->isUpdate(true)->save(['is_default' => 0], ['user_id' => $this->userId]);
        }
        $address = isset($areas[$province_id]) ? $areas[$province_id]['name'] : '--';
        $address .= isset($areas[$city_id]) ? $areas[$city_id]['name'] : '--';
        $address .= isset($areas[$division_id]) ? $areas[$division_id]['name'] : '--';
        $address .= (string)$street;
        $AddressModel = new AddressModel();
        $AddressModel->save([
            'street' => $street,
            'address' => $address,
            'is_default' => $is_default,
            'city_id' => $city_id,
            'division_id' => $division_id,
            'province_id' => $province_id,
            'mobile' => $mobile,
            'name' => $name,
        ], ['address_id' => $address_id]);
    }

    /**
     * 删除我的收货地址
     */
    public function delAddress()
    {
        $address_id = (int)$this->request->param("address_id");
        $AddressModel = new AddressModel();
        if (!$address = $AddressModel->find($address_id)) {
            $this->warning("参数错误");
        }
        if ($address->user_id != $this->userId) {
            $this->warning("参数错误");
        }
        $AddressModel->where("address_id", $address_id)->delete();
    }

    /**
     * 设置默认收货地址
     */
    public function setDefault()
    {
        $address_id = (int)$this->request->param("address_id");
        $AddressModel = new AddressModel();
        if (!$address = $AddressModel->find($address_id)) {
            $this->warning("参数错误");
        }
        if ($address->user_id != $this->userId) {
            $this->warning("参数错误");
        }
        if ($address->is_default == 1) {
            return;
        }
        $AddressModel->isUpdate(true)->save(['is_default' => 0], ['user_id' => $this->userId]);
        $AddressModel->isUpdate(true)->save(['is_default' => 1], ['user_id' => $this->userId]);
    }

    /**
     * 查询区域
     */
    public function queryRegion()
    {
        $parent_id = (int)$this->request->param("parent_id");
        $where['parent_id'] = $parent_id;
        $RegionModel = new RegionModel();
        $level = $RegionModel->where("parent_id", $parent_id)->select();
        $data = [];
        foreach ($level as $val) {
            $data[] = [
                'region_id' => $val->region_id,
                'label' => $val->getAttr('name'),
                'level' => $val->level,
                'parent_id' => $val->parent_id,
            ];
        }
        $this->datas['list'] = $data;
    }

    /**
     * 获取所有地址
     */
    public function getRegion()
    {
        $RegionModel = new RegionModel();
        $this->datas["list"] = $RegionModel->getRegion();
    }


}

