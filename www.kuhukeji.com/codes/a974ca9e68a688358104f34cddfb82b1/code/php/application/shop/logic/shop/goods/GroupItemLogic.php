<?php

namespace app\shop\logic\shop\goods;

use app\shop\model\shop\GroupBuyItemJoinModel;
use app\shop\model\shop\GroupBuyItemModel;
use app\shop\model\shop\OrderGoodsModel;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\UserModel;
use think\Exception;

/**
 * 拼团 团处理
 * Class GroupItemLogic
 * @package app\shop\logic\shop\goods
 */
class GroupItemLogic
{

    private $item;
    private $isUpdate = false;

    public function setItemId($itemId)
    {
        $GroupBuyItemModel = new GroupBuyItemModel();
        $this->item = $GroupBuyItemModel->find($itemId);
        if(empty($this->item) ){
            throw new Exception("系统错误");
        }
        return $this;
    }

    /**
     * 验证团
     */
    public function checkItem($checkPay = true)
    {
        if ($this->item->is_invalid == 1 ||
            $this->item->end_time <= time() ||
            ($this->item->is_pay == 0 && $checkPay) ||
            $this->item->is_success == 1) {
            throw  new Exception("该团已结束");
        }
        return $this;
    }

    public function getItem()
    {
        return $this->item;
    }

    /**
     * 获取当前团的所有用户
     */
    public function getUsers()
    {
        $GroupBuyItemJoinModel = new GroupBuyItemJoinModel();
        $users = $GroupBuyItemJoinModel->where("groupbuy_item_id", $this->item->groupbuy_item_id)
            ->where("is_pay", 1)->select();
        $userIds = [];
        foreach ($users as $val) {
            $userIds[$val->user_id] = $val->user_id;
        }
        $UserModel = new UserModel();
        return $UserModel->itemsByIds($userIds);
    }


    public function checkUser($userId)
    {
        return $this->item->user_id == $userId;
    }

    public function setTuanNum()
    {
        $this->isUpdate = true;
        $this->item->now_num += 1;
    }

    public function __destruct()
    {
        if ($this->isUpdate) {
            if ($this->item->now_num >= $this->item->need_num) {
                $this->item->is_success = 1;
                //生成订单
                $this->createOrder();
            }
            $this->item->save();
        }
    }


    /**
     * 拼团完成生成订单
     */
    private function createOrder()
    {
        $GroupBuyItemJoinModel = new GroupBuyItemJoinModel();
        $join = $GroupBuyItemJoinModel
            ->where("groupbuy_item_id", $this->item->groupbuy_item_id)
            ->where("is_pay", 1)
            ->select();
        $stockGoods = [] ;
        foreach ($join as $val) {
            $stockGoods[] = [
                'goods_id' => $val->goods_id,
                'spec_key' => $val->spec_key,
                'sku_type' => $val->sku_type,
                'goods_num' => 1,
            ];
            $OrderModel = new OrderModel();
            $order = [
                'order_sn' => date("YmdHi") . $OrderModel->getAutoMaxId(),
                'app_id' => $val->app_id,
                'user_id' => $val->user_id,
                'pay_status' => 1,
                'name' => $val->name,
                'mobile' => $val->mobile,
                'province_id' => $val->province_id,
                'city_id' => $val->city_id,
                'division_id' => $val->division_id,
                'street' => $val->street,
                'address' => $val->address,
                'pay_type' => $val->pay_type,
                'pay_info' => (string)$val->pay_info,
                'goods_price' => $val->pay_price,
                'user_money' => $val->user_money,
                'payment_price' => $val->payment_price,
                'pay_time' => $val->pay_time,
                'prom_id' => $val->groupbuy_id,
                'prom_type' => getMean("shop_prom_type", 'k')['pt'],
                'user_note' => $val->user_note,
                'buy_role' => $val->buy_role,
                'device' => $val->device,
            ];
            $OrderModel->save($order);
            $orderGoods = [
                'order_id' => $OrderModel->order_id,
                'goods_id' => $val->goods_id,
                'goods_name' => $val->goods_name,
                'goods_price' => $val->groupbuy_price,
                'vip_price' => $val->vip_groupbuy_price,
                'spec_key' => $val->spec_key,
                'spec_key_name' => $val->key_name,
                'prom_id' => $val->groupbuy_id,
                'prom_type' => getMean("shop_prom_type", 'k')['pt'],
                'goods_sn' => $val->goods_sn,
                'bar_code' => $val->bar_code,
                'sku_type' => $val->sku_type,
                'goods_photo' => $val->goods_photo,
                'goods_num' => 1,
            ];
            $OrderGoodsModel = new OrderGoodsModel();
            $OrderGoodsModel->save($orderGoods);
            unset($OrderModel);
            unset($OrderGoodsModel);
        }
        (new StockLogic())->StockOut($stockGoods);
    }
}

