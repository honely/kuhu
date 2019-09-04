<?php

namespace app\shop\logic\shop\goods;

use app\shop\model\shop\OrderGoodsModel;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\RushBuyGoodsModel;
use app\shop\model\shop\RushBuyModel;
use app\shop\model\shop\UserModel;
use think\Exception;
use think\Log;


/**
 * 抢购逻辑类
 * Class rushBuyLogic
 * @package app\shop\logic\shop
 */
class RushBuyLogic extends GoodsBase
{

    protected $rushBuyId;
    protected $rushBuyGoodsId;
    protected $rushModel;
    protected $rush;
    protected $rushGoodsModel;
    protected $rushGoods;
    protected $appId;
    protected $userId;
    protected $user;
    protected $UserModel;


    /**
     * 开放类
     * rushBuyLogic constructor.
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * 设置抢购ID
     */
    public function setRushGoodsBuyId($rushbuyGoodsId)
    {
        $this->rushBuyGoodsId = $rushbuyGoodsId;
        $this->rushModel = new RushBuyModel();
        $this->rushGoodsModel = new RushBuyGoodsModel();
        $this->rushGoods =  $this->rushGoodsModel->find($rushbuyGoodsId);
        if (empty($this->rushGoods) || $this->rushGoods->is_online == 0) {
            throw  new Exception("该活动已失效#1");
        }
        $this->rush = $this->rushModel->find($this->rushGoods->rushbuy_id);
        if (empty($this->rush)) {
            throw  new Exception("该活动已失效#2");
        }
        if ($this->rush->is_online == 0) {
            throw  new Exception("该活动已失效#3");
        }
        try {
            $this->setGoodsId($this->rushGoods->goods_id);
        } catch (Exception $exception) {
            throw  new Exception("该活动已失效#4");
        }
        $this->setrushDetail();
        return $this;
    }



    /**
     * 合并抢购信息
     */
    private function setrushDetail()
    {
        $this->setAttr("qg_rushbuy_price", $this->rushGoods->rushbuy_price);
        $this->setAttr("rushbuy_goods_id", $this->rushGoods->rushbuy_goods_id);
        $this->setAttr("qg_vip_rushbuy_price", $this->rushGoods->vip_rushbuy_price);
        $this->setAttr("qg_is_vip", $this->rushGoods->is_vip);
        $this->setAttr("qg_goods_num", $this->rushGoods->goods_num);
        $this->setAttr("qg_buy_num", $this->rushGoods->buy_num);
        $this->setAttr("qg_surplus_num", $this->rushGoods->surplus_num);
        $this->setAttr("qg_is_online", $this->rushGoods->is_online);
        $this->setAttr("qg_end_time", $this->rush->end_time);
        $this->setAttr("qg_rushbuy_id", $this->rush->rushbuy_id);
    }

    /**
     * 重载商品规格
     */
    public function getSpecPrice($moneyFormat = true)
    {
        $rushSpecTmp = (array)json_decode($this->rushGoods->spec, true);
        $rushSpec = [];
        foreach ($rushSpecTmp as $val) {
            $rushSpec[$val['spec_key']] = $val;
        }
        $specPrice = parent::getSpecPrice();
        $return = [];
        foreach ($specPrice as $key => $val) {
            if (empty($rushSpec[$key])) {
                continue;
            }
            if($moneyFormat){
                $val['shop_price'] = moneyFormat($rushSpec[$key]['rushbuy_price'], true);
                $val['plus_vip_price'] = empty($rushSpec[$key]['vip_rushbuy_price']) ? 0 :  moneyFormat($rushSpec[$key]['vip_rushbuy_price'], true);

            }else{
                $val['shop_price'] = $rushSpec[$key]['rushbuy_price'];
                $val['plus_vip_price'] = $rushSpec[$key]['vip_rushbuy_price'];
            }
            $return[$key] = $val;
        }
        return $return;
    }


    /**
     * 检查烈性
     * @param $limit int
     * @return $this
     * @throws Exception
     */
    public function checkLimit($limit) {
        if ($this->rush->buy_limit < $limit) {
            throw new Exception('已超过最大购买数量限制!');
        }
        $OrderModel = new OrderModel();
        $OrderGoodsModel = new OrderGoodsModel();
        $where = [
            'prom_type' => getMean('shop_prom_type','k')['qg'],
            'prom_id' => $this->rush->rushbuy_id,
            'goods_id' => $this->rushGoods->goods_id,
        ];
        $orderIds = $OrderModel->where($where)->column('order_id','order_id');
        $orderIds = empty($orderIds) ? '' : $orderIds;
        $order_goods_num = $OrderGoodsModel->where('order_id','in',$orderIds)->sum('goods_num');
        if ($order_goods_num >=  $this->rush->buy_limit) {
            throw new Exception('您已经购买过超过最大购买数啦!');
        }
        return $this;
    }



    public function checkExpire() {
        if ($this->rush->start_time > time()) {
            throw new Exception('抢购活动尚未开始！');
        }
        if ($this->rush->end_time < time()) {
            throw new Exception('抢购活动已结束！');
        }
        if ($this->rush->is_online == 0) {
            throw new Exception('抢购活动已下线！');
        }
        return $this;
    }


    public function checkVip($user_id) {
        $UserModel = new UserModel();
        if (!$user = $UserModel->findUser($user_id)->getUser()) {
            throw new Exception('用户不存在');
        }

        $this->UserModel = $UserModel;
        $this->user = $user;
        if (!$this->UserModel->checkVip() && $this->rush->is_vip) {
            throw new Exception('当前抢购仅限VIP专享');
        }
        return true;
    }


    public function setRushGoods($goods_id) {
        $RushBuyGoodsModel = new RushBuyGoodsModel();
        $RushBuyModel = new RushBuyModel();
        $where = [
            'goods_id' => $goods_id,
        ];
        if (!$rush_goods = $RushBuyGoodsModel->where($where)->find()) {
            throw new Exception('参数不正确1！');
        }
        if (!$rush = $RushBuyModel->find($rush_goods->rushbuy_id)) {
            throw new Exception('参数不正确2！');
        }
        $this->rush = $rush;
        $this->rushGoodsModel = $RushBuyGoodsModel;
        $this->rushModel = $RushBuyModel;
        $this->rushGoods = $rush_goods;
        return $this;
    }


    public function setDecGoodsNum($num,$goods_id,$rushbuy_id) {
        if ($num > $this->rushGoods->goods_num) {
            throw new Exception('抢购商品库存数量不足');
        }
        if ($num && $goods_id) {
            $this->rushGoodsModel->where(['goods_id'=>$goods_id])->setDec('goods_num',$num);
            $this->rushGoodsModel->where(['goods_id'=>$goods_id])->setInc('buy_num',1);
            $this->rushGoodsModel->where(['goods_id'=>$goods_id])->setInc('order_num',$num);
        }
        if ($rushbuy_id) {
            $this->rushModel->where(['rushbuy_id'=>$rushbuy_id])->setInc('order_num',1);
        }
    }
}
