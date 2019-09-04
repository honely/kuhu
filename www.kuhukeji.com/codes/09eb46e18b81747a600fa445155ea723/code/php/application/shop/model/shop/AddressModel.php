<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

//推广员的类  计算分佣等各方面统一入口类

class AddressModel extends CommonModel
{
    protected $pk = 'address_id';
    protected $name = 'app_shop_user_address';


    public function getDefaultAddress($appId,$userId,$is_default=1) {
        $where = [
            'app_id' => $appId,
            'user_id' => $userId,
            'is_default' => $is_default,
        ];
        return $this->where($where)->find();
    }


    public function checkAddress($addressId,$userId){
        $address = $this->find($addressId);
        if(empty($address) || $address->user_id != $userId) return false;
        return $address;

    }
}
