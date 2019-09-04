<?php

namespace app\common\logic\shop;

use app\shop\logic\shop\goods\FreightLogic;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\GoodsRepertoryModel;
use app\shop\model\shop\GroupBuyItemJoinModel;
use app\shop\model\shop\GroupBuyItemModel;
use app\shop\model\shop\GroupBuyModel;
use app\shop\model\shop\UserModel;
use think\Exception;

/**
 * 拼团处理逻辑
 * Class CalculateGoods
 * @package app\common\library\shopcount
 */
class GroupBuyOrderLogic
{

    //处理了好的商品
    private $goods;
    //
    private $joinId;
    //
    private $goodsId;
    //
    private $groupbuy;

    private $groupbuyItem;

    private $groupbuyItemJoin;

    private $appId;

    private $groupbuyId;

    private $groupbuyItemId;

    private $itemUserId;

    private $groupBuyPrice;

    private $vipGroupBuyPrice;

    private $thisSpec;

    private $specKey;

    private $address;

    private $itemJoinData;

    private $shippingPrice;


    public function setAppId($appId) {
        $this->appId = $appId;
    }

    public function setGoodsId($goods_id) {
        $this->goodsId = $goods_id;
    }


    public function setGroupBuyId($groupbuy_id) {
        $this->groupbuyId = $groupbuy_id;
    }

    public function setGroupBuyItemId($groupbuy_item_id) {
        $this->groupbuyItemId = $groupbuy_item_id;
    }

    public function setItemUserId($item_user_id) {
        $this->itemUserId = $item_user_id;
    }

    public function setItemJoinId($join_id) {
        $this->joinId = $join_id;
    }

    //商品信息
    public function setGoods($check=false) {
        $GoodsModel = new GoodsModel();
        if (!$goods = $GoodsModel->find($this->goodsId)) {
            throw new Exception("参数不正确！");
        }
        if ($goods->app_id != $this->appId) {
            throw new Exception("参数不正确！");
        }
        if ($check == true) {
            if ($goods->is_delete == 1 || $goods->is_online == 0) {
                throw new Exception("商品已下架！");
            }

            if ($goods->prom_type != getMean("shop_prom_type","k")['pt'] || $goods->prom_id != $this->groupbuyId) {
                throw new Exception("参数不正确！");
            }
        }

        $this->goods = $goods;
        return $this;
    }

    //团信息
    public function setGroupBuy() {
        $GroupBuyModel = new GroupBuyModel();
        if (!$groupbuy = $GroupBuyModel->find($this->groupbuyId)) {
            throw new Exception("参数不正确！");
        }
        if ($groupbuy->app_id != $this->appId) {
            throw new Exception("参数不正确！");
        }
        if (!$groupbuy->is_online) {
            throw new Exception("拼团已下线！");
        }

        $this->groupbuy = $groupbuy;
        $this->setGoodsId($groupbuy->goods_id);
        return $this;
    }

    //开团信息
    public function setGroupBuyItem() {
        $GroupBuyItemModel = new GroupBuyItemModel();
        if (!$item = $GroupBuyItemModel->find($this->groupbuyItemId)) {
            throw new Exception("参数不正确！");
        }
        $this->groupbuyItem = $item;
        return $this;
    }

    //团长信息
    public function getGroupBuyUserInfo() {
        $UserModel = new UserModel();
        $UserModel->findUser($this->groupbuyItem->user_id);
        return $UserModel->getUser();
    }


    //已参团信息
    public function setGroupBuyItemJoin() {
        $GroupBuyItemJoinModel = new GroupBuyItemJoinModel();
        if (!$item_join = $GroupBuyItemJoinModel->find($this->joinId)) {
            throw new Exception("参数不正确！");
        }
        if ($item_join->app_id != $this->appId) {
            throw new Exception("参数不正确！");
        }
        $this->groupbuyItemJoin = $item_join;
        return $this;
    }


    //判断能否参团
    public function checkGroupBuyItemCanJoin($user_id) {
        if ($this->groupbuyItem->end_time <= time() || $this->groupbuyItem->is_invalid == 1) {
            throw new Exception("拼团已过期！");
        }
        if ($this->groupbuyItem->is_success) {
            throw new Exception("拼团已成功！");
        }
        if ($this->groupbuyItem->need_num <= $this->groupbuyItem->now_num) {
            GroupBuyItemJoinModel::save(['is_success'=>1],['groupbuy_item_id'=>$this->groupbuyItem->groupbuy_item_id]);
            throw new Exception("拼团已满员啦！");
        }
        if ($user_id) {
            $where = [
                'groupbuy_item_id' => $this->groupbuyItem->groupbuy_item_id,
                'user_id' => $user_id,
                'is_pay' => 1,
            ];
            $GroupBuyItemJoinModel = new GroupBuyItemJoinModel();
            if ($GroupBuyItemJoinModel->where($where)->find()) {
                throw new Exception("您已参加过啦,请不要重复参团！");
            }

        }
        return $this;
    }


    public function checkCanOpenGroupBuy($user_id) {
        if ($this->checkSelfGroupBuyItem($user_id)) {
            throw new Exception("已存在未过期开团，请不要重复开团！");
        }
        return $this;
    }


    //判断是不是自己的
    public function checkSelfItemJoin($user_id) {
        if ($this->groupbuyItemJoin->user_id == $user_id) {
            return true;
        } else {
            return false;
        }
    }


    //判断自己有没有已开团且未完成/未失效
    public function checkSelfGroupBuyItem($user_id) {
        $GroupBuyItemModel = new GroupBuyItemModel();
        //检查是否存在已开团
        $where = [
            'groupbuy_id' => $this->groupbuyId,
            'user_id' => $user_id,
            'is_invalid' => 0,
            'is_success' => 0,
            'end_time' => ['<',time()-5]
        ];
        if ($item = $GroupBuyItemModel->where($where)->find()) {
            return true;
        }
        return false;
    }


    //从库存表获得价格
    public function getGroupBuyPrice($spec_key) {
        //下面接收选择的sku验证是否存在并检查库存
        $GoodsRepertoryModel = new GoodsRepertoryModel();
        if (!$spec = $GoodsRepertoryModel->checkStock($spec_key,$this->goods)) {
            throw new Exception($GoodsRepertoryModel->getError());
        }
        $groupbuy_price = moneyFormat($this->groupbuy->groupbuy_price,true);
        $vip_groupbuy_price = moneyFormat($this->groupbuy->vip_groupbuy_price,true);

        $_spec_tmp = $this->getGroupBuySpec();

        if (!empty($_spec_tmp) && $spec_key) {
            foreach ($_spec_tmp as $v) {
                if ($v['spec_key'] == $spec_key) {
                    $groupbuy_price = $v['groupbuy_price'];
                    $vip_groupbuy_price = $v['vip_groupbuy_price'];
                    $this_spec = $v;
                }
            }
        }
        $this->groupBuyPrice = $groupbuy_price;
        $this->vipGroupBuyPrice = $vip_groupbuy_price;
        $this->thisSpec = $this_spec;
        $this->specKey = $spec_key;
        return $this;
    }

    //保存开团
    public function saveGroupBuyItem($user_id, $kaituan = false) {
        //如果是开团   保存开团信息
        if ($kaituan == true) {
            $GroupBuyItemModel = new GroupBuyItemModel();
            $item_data = [
                'groupbuy_id' => $this->groupbuy->groupbuy_id,
                'app_id' => $this->appId,
                'user_id' => $user_id,
                'goods_id' => $this->goods->goods_id,
                'goods_name' => $this->goods->goods_name,
                'market_price' => $this->goods->market_price,
                'shop_price' => $this->goods->shop_price,
                'photo' => $this->goods->photo,
                'need_num' => $this->groupbuy->need_num,
                'now_num' => 1,
                'end_time' => time() + $this->groupbuy->end_time,
            ];
            $GroupBuyItemModel->save($item_data);
            $groupbuy_item_id = $GroupBuyItemModel->groupbuy_item_id;
        } else {
            $groupbuy_item_id = $this->groupbuyItemId;
        }


        //保存开团/参团
        $GroupBuyItemJoinModel = new GroupBuyItemJoinModel();
        $UserModel = new UserModel();
        $UserModel->findUser($user_id);
        $price = $UserModel->checkVip() ? $this->vipGroupBuyPrice : $this->groupBuyPrice;

        $item_join_data = [
            'user_id' => $user_id,
            'app_id' => $this->appId,
            'face' => $UserModel->getUser()->face,
            'nickname' => $UserModel->getUser()->nickname,
            'groupbuy_item_id' => $groupbuy_item_id,
            'groupbuy_id' => $this->groupbuy->groupbuy_id,
            'goods_id' => $this->goods->goods_id,
            'goods_name' => $this->goods->goods_name,
            'spec_key' => $this->specKey,
            'key_name' => $this->thisSpec['key_name'],
            'photo' => isset($this->thisSpec['photo']) ? $this->thisSpec['photo'] : $this->goods->photo,
            'market_price' => $this->goods->market_price,
            'shop_price' => $this->goods->shop_price,
            'groupbuy_price' => moneyToInt($this->thisSpec['groupbuy_price']),
            'vip_groupbuy_price' => moneyToInt($this->thisSpec['vip_groupbuy_price']),
            'shipping_price' => $this->shippingPrice,
            'goods_price' => $price,
            'address_id' => $this->address->address_id,
            'province_id' => $this->address->province_id,
            'city_id' => $this->address->city_id,
            'division_id' => $this->address->division_id,
            'street' => $this->address->street,
            'address' => $this->address->address,
            'name' => $this->address->name,
            'mobile' => $this->address->mobile,
        ];
        $GroupBuyItemJoinModel->save($item_join_data);
        $this->joinId = $GroupBuyItemJoinModel->getLastInsID();
        $this->itemJoinData = $item_join_data;
        return $this;
    }

    public function getShippingPrice($address) {
        $FreightLogic = new FreightLogic();
        $FreightLogic->setGoodsModel($this->goods);
        $FreightLogic->setRegionId($address->division_id);
        $FreightLogic->setGoodsNum(1);
        $FreightLogic->doCalculation();
        $this->address = $address;
        $this->shippingPrice = $FreightLogic->getFreight();
        return $this;
    }

    public function getMoney($user_id) {
        $UserModel = new UserModel();
        $UserModel->findUser($user_id);
        $user_money = $UserModel->getUserMoney();
        if ($user_money > $this->itemJoinData['goods_price'] + $this->itemJoinData['shipping_price']) {
            $money = 0;
        } else {
            $money = $this->itemJoinData['goods_price'] + $this->itemJoinData['shipping_price'] - $user_money;
        }
        return $money;
    }


    public function getJoinId() {
        return $this->joinId;
    }

    //
    public function getGroupBuySpec() {
        return json_decode($this->groupbuy->spec, true) ? json_decode($this->groupbuy->spec, true) : [];
    }


    public function getGroupBuy() {
        return $this->groupbuy;
    }

    public function getGroupBuyItem() {
        return $this->groupbuyItem;
    }

    public function getGroupBuyItemJoin() {
        return $this->groupbuyItemJoin;
    }

    public function getGoodsId() {
        if (!$this->goodsId) {
            throw new Exception("参数不正确！");
        }
        return $this->goodsId;
    }

    public function getGoods() {
        return $this->goods;
    }

    public function returnShippingPrice() {
        return $this->shippingPrice;
    }

}
