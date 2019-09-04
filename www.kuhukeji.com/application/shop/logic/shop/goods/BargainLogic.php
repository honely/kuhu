<?php

namespace app\shop\logic\shop\goods;

use app\shop\model\shop\BargainItemModel;
use app\shop\model\shop\BargainModel;
use app\shop\model\shop\GroupBuyItemJoinModel;
use app\shop\model\shop\GroupBuyItemModel;
use app\shop\model\shop\GroupBuyModel;
use think\Exception;


/**
 * 拼团逻辑类
 * Class GroupBuyLogic
 * @package app\shop\logic\shop
 */
class BargainLogic extends GoodsBase
{

    protected $bargainId;
    protected $BargainModel;
    protected $bargain;

    /**
     * 开放类
     * BargainLogic constructor.
     */
    public function __construct()
    {
        parent::__construct();
    }


    /**
     * 设置砍价ID
     * @param $bargainId
     * @return $this
     * @throws Exception
     */
    public function setBargainId($bargainId)
    {
        $this->bargainId = $bargainId;
        $this->BargainModel = new BargainModel();
        $this->bargain = $this->BargainModel->find($this->bargainId);
        if (empty($this->bargain) || $this->bargain->is_online == 0) {
            throw  new Exception("砍价已失效");
        }
        try {
            $this->setGoodsId($this->bargain->goods_id);
        } catch (Exception $exception) {
            throw  new Exception($exception->getMessage());
        }
        $this->setData();
        return $this;
    }

    /**
     * 设置数据
     */
    private function setData()
    {
        $this->setAttr("kj_sold_num", $this->bargain->sold_num);
        $this->setAttr("kj_need_num", $this->bargain->need_num);
        $this->setAttr("kj_end_time", $this->bargain->end_time);
        $this->setAttr("kj_is_vip_more_bargain", $this->bargain->is_vip_more_bargain);
        $this->setAttr("kj_init_price", $this->bargain->init_price);
        $this->setAttr("kj_bargain_price", $this->bargain->bargain_price);
    }


    /**
     * 验证用户是否砍价了砍价是否进行中
     * 否则返回false
     */
    public function checkUserKan($userId)
    {
        if ($userId <= 0) return false;
        $BargainItemModel = new BargainItemModel();
        $userBargain = $BargainItemModel
            ->where("bargain_id",$this->bargainId)
            ->where("user_id", $userId)->find();
        if (empty($userBargain)) return false;
        if ($userBargain->is_invalid == 1) return false;
        if ($userBargain->end_time < time()) return false;
//        if ($userBargain->end_time >= time() ||
//            $userBargain->is_invalid == 1 ||
//            $userBargain->is_success == 1 ||
//            $userBargain->is_pay == 0
//        ){
//            return false;
//        }
        return $userBargain;
    }

    /**
     * 重载商品规格
     */
    public function getSpecPrice()
    {
        $groupSpecTmp = (array) json_decode($this->bargain->spec, true);
        $groupSpec = [];
        foreach ($groupSpecTmp as $key => $val) {
            $groupSpec[$val] = $val;
        }
        $specPrice = parent::getSpecPrice();
        $return = [];
        foreach ($specPrice as $key => $val) {
            if (empty($groupSpec[$key])) {
                continue;
            }
            $return[$key] = $val;
        }
        return $return;
    }


    /**
     * 生成砍价记录
     */
    public function createBargainLog()
    {
        $kan_money = $this->bargain->init_price - $this->bargain->bargain_price;
        $priceLine = lineCut($kan_money, $this->bargain->need_num);
        $return = [];
        foreach ($priceLine as $val){
            $return[] = [
                'user_id' => 0,
                'nickname' => '',
                'face'  => '',
                'price' => $val,
            ];
        }
        return $return;
    }



}
