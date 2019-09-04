<?php

namespace app\shop\logic\shop\goods;

use app\shop\logic\shop\goods\FreightLogic;
use app\shop\logic\shop\goods\GoodsBase;
use app\shop\model\shop\GroupBuyItemJoinModel;
use app\shop\model\shop\GroupBuyItemModel;
use app\shop\model\shop\GroupBuyModel;
use think\Exception;


/**
 * 拼团逻辑类
 * Class GroupBuyLogic
 * @package app\shop\logic\shop
 */
class GroupBuyLogic extends GoodsBase
{

    protected $groupbuyId;
    protected $groupItem = [];
    protected $groupModel;
    protected $group;

    /**
     * 开放类
     * GroupBuyLogic constructor.
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * 设置拼团ID
     */
    public function setGroupbuyId($groupbuyId)
    {
        $this->groupbuyId = $groupbuyId;
        $this->groupModel = new GroupBuyModel();
        $this->group = $this->groupModel->find($this->groupbuyId);
        if (empty($this->group) || $this->group->is_online == 0) {
            throw  new Exception("该拼团已下架");
        }
        try {
            $this->setGoodsId($this->group->goods_id);
        } catch (Exception $exception) {
            throw  new Exception($exception->getMessage());
        }
        $this->setGroupDetail();
        return $this;
    }

    /**
     * 合并拼团信息
     */
    private function setGroupDetail()
    {
        $this->setAttr("pt_need_num", $this->group->need_num);
        $this->setAttr("pt_success_num", $this->group->success_num);
        $this->setAttr("pt_orderby", $this->group->orderby);
        $this->setAttr("pt_end_time", $this->group->end_time);
        $this->setAttr("pt_add_time", $this->group->add_time);
        $this->setAttr("pt_add_ip", $this->group->add_ip);
        $this->setAttr("pt_spec", $this->group->spec);
        $this->setAttr("pt_groupbuy_price", $this->group->groupbuy_price);
        $this->setAttr("pt_vip_groupbuy_price", $this->group->vip_groupbuy_price);
        $this->setAttr("pt_num", $this->group->num);
        $this->setAttr("pt_is_vip", $this->group->is_vip);
        $this->setAttr("pt_sold_num", $this->group->sold_num);
    }

    /**
     * 获取商品正在进行的拼团
     */
    public function groupList()
    {
        $GroupBuyItemModel = new GroupBuyItemModel();
        $this->groupItem = $GroupBuyItemModel->where("groupbuy_id", $this->groupbuyId)
            ->where("end_time", ">", time())
            ->where("is_invalid", 0)
            ->where("is_success", 0)
            ->where("is_pay",1)
            ->order("groupbuy_id desc")
            ->limit(0, 100)
            ->select();
        return $this->groupItem;
    }

    /**
     * 是否参与拼团 是返回 tuanID
     */
    public function isJoin($userId,$checkUser = true)
    {
        if ($userId <= 0) return false;
        $GroupBuyItemJoinModel = new GroupBuyItemJoinModel();
        //当前拼团 用户最新参加一期 的 拼团 在判断是否结束
        $itemId = $GroupBuyItemJoinModel->where("groupbuy_id", $this->groupbuyId)
            ->where("user_id", $userId)->order("join_id desc")->value("groupbuy_item_id");
        $GroupItemLogic = new GroupItemLogic();
        try {
            if($checkUser){
                $res = $GroupItemLogic->setItemId($itemId)
                    ->checkItem()
                    ->checkUser($userId);
            }else{
                $res = $GroupItemLogic->setItemId($itemId)
                    ->checkItem();
            }

            return $res ? $itemId : false;
        } catch (Exception $exception) {
            return false;
        }
    }

    /**
     * 重载商品规格
     */
    public function getSpecPrice($moneyFormat = true)
    {
        $groupSpecTmp =  (array) json_decode($this->group->spec, true);
        $groupSpec = [];
        foreach ($groupSpecTmp as $val){
            $groupSpec[$val['spec_key']] = $val;
        }
        $specPrice = parent::getSpecPrice();
        $return = [];
        foreach ($specPrice as $key=>$val){
            if(empty($groupSpec[$key])){
                continue;
            }
            if($moneyFormat) {
                $val['shop_price'] =  moneyFormat($groupSpec[$key]['groupbuy_price'],true);
                $val['plus_vip_price'] = moneyFormat($groupSpec[$key]['vip_groupbuy_price'],true);
            }else{
                $val['shop_price'] =  $groupSpec[$key]['groupbuy_price'];
                $val['plus_vip_price'] = $groupSpec[$key]['vip_groupbuy_price'];
            }

            $return[$key] = $val;
        }
        return $return;
    }


}
