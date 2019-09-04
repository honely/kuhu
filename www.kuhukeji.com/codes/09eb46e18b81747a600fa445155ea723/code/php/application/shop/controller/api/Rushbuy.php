<?php

namespace app\shop\controller\api;

use app\shop\logic\shop\goods\RushBuyLogic;
use app\shop\logic\shop\order\OrderSaveLogic;
use app\shop\logic\shop\TongjiLogic;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\RushBuyGoodsModel;
use app\shop\model\shop\RushBuyModel;
use app\shop\model\shop\SettingModel;
use app\shop\model\shop\UserModel;
use think\Exception;


class Rushbuy extends ShopCommon
{
    protected $checkLogin = false;

    public function index()
    {
        $is_vip = $this->request->param("is_vip", -999);
        if ($is_vip >= 0) {
            $where['is_vip'] = $is_vip;
        }

        $where['app_id'] = $this->appId;
        $where['is_online'] = 1;
        $RushBuyModel = new RushBuyModel();
        $listTmp = $RushBuyModel->where($where)->order("orderby desc")->page($this->page, $this->limit)->select();

        $list = [];
        foreach ($listTmp as $val) {
            $list[] = [
                'rushbuy_id' => (int)$val->rushbuy_id,
                'name' => (string)$val->name,
                'prom_img' => (string)$val->prom_img,
                'buy_limit' => (int)$val->buy_limit,
                'order_num' => (int)$val->order_num,
                'orderby' => (int)$val->orderby,
                'start_time' => date("Y-m-d H:i:s", $val->start_time),
                'end_time' => date("Y-m-d H:i:s", $val->end_time),
                'expire_time' => ($val->end_time - time() > 0) ? $val->end_time - time() : 0,
                'is_vip' => (int)$val->is_vip,
                'is_online' => (int)$val->is_online,
            ];
        }
        $this->datas['list'] = $list;
        $this->datas['isMore'] = (int)($this->limit == count($list));
        $this->datas['seo'] = $this->default_seo;
    }

    public function getList()
    {
        $rushbuy_id = (int)$this->request->param("rushbuy_id", 0);
        $is_vip = (int)$this->request->param("is_vip", 0);
        $RushBuyModel = new RushBuyModel();
        if ($rushbuy_id > 0) {
            if (!$rushbuy = $RushBuyModel->find($rushbuy_id)) {
                $this->noPage('当前不存在任何抢购活动！');
            }
            if ($rushbuy->app_id != $this->appId) {
                $this->noPage('当前不存在任何抢购活动！');
            }
            if ($rushbuy->is_online == 0) {
                $this->noPage('当前不存在任何抢购活动！');
            }
        } else {
            $_where = [
                'app_id' => $this->appId,
                'is_online' => 1,
            ];
            if ($is_vip) {
                $_where['is_vip'] = 1;
            }
            $rushbuy = $RushBuyModel->where($_where)->order('orderby desc,rushbuy_id desc')->find();
        }
        if ($rushbuy_id > 0 && empty($rushbuy)) {
            $this->noPage('当前不存在任何抢购活动！');
        }

        $RushBuyGoodsModel = new RushBuyGoodsModel();
        $where = [
            'rushbuy_id' => $rushbuy_id ? $rushbuy_id : $rushbuy->rushbuy_id,
            'is_online' => 1,
        ];
        $keywords = (string) $this->request->param('keywords','');
        if(!empty($keywords)){
            $GoodsModel = new GoodsModel();
            $godosIds =  $GoodsModel->where("app_id",$this->appId)
                ->whereLike("goods_name","%{$keywords}%")
                ->column("goods_id","goods_id");
           $where['goods_id'] = ["In",$godosIds];
        }


        $rushbuy_goods_tmp = $RushBuyGoodsModel->where($where)->order('orderby desc')->page($this->page, $this->limit)->select();
        $count = $RushBuyGoodsModel->where($where)->count();
        $goods_ids = [];
        foreach ($rushbuy_goods_tmp as $v) {
            $goods_ids[$v->goods_id] = $v->goods_id;
            $rushbuy_goods[$v->goods_id] = $v;
        }
        $goods_ids = empty($goods_ids) ? '' : $goods_ids;
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->itemsByIds($goods_ids);
        $list = [];
        foreach ($goods as $v) {
            $list[] = [
                'rushbuy_goods_id' => $rushbuy_goods[$v->goods_id]->rushbuy_goods_id,
                'goods_id' => $goods[$v->goods_id]['goods_id'],
                'goods_sn' => $goods[$v->goods_id]['goods_sn'],
                'goods_name' => $goods[$v->goods_id]['goods_name'],
                'shop_price' => moneyFormat($goods[$v->goods_id]['shop_price'], true),
                'rushbuy_price' => moneyFormat($rushbuy_goods[$v->goods_id]['rushbuy_price'], true),
                'photo' => (string)$goods[$v->goods_id]['photo'],
                'goods_num' => $rushbuy_goods[$v->goods_id]['goods_num'],
                'surplus_num' => $rushbuy_goods[$v->goods_id]['goods_num'],
                'percent' => round(($rushbuy_goods[$v->goods_id]['buy_num']) / ($rushbuy_goods[$v->goods_id]['goods_num'] + $rushbuy_goods[$v->goods_id]['buy_num']), 2)
            ];
        }
        $data = [
            'count' => $count,
            'rushbuy_id' => $rushbuy_id,
            'name' => (string)$rushbuy->name,
            'prom_img' => (string)$rushbuy->prom_img,
            'start_time' => date("Y-m-d H:i:s", $rushbuy->start_time),
            'end_time' => date("Y-m-d H:i:s", $rushbuy->end_time),
            'expire_time' => ($rushbuy->end_time - time() > 0) ? $rushbuy->end_time - time() : 0,
        ];
        $this->datas = [
            'list' => $list,
            'data' => $data,
            'isMore' => (int)(count($list) == $this->limit),
            'seo' => $this->default_seo,
        ];
    }

    /**
     * 抢购详情
     */
    public function detail()
    {
        $rushbuy_goods_id = (int)$this->request->param("rushbuy_goods_id");
        $RushBuyLogic = new RushBuyLogic();
        try {
            $detail = $RushBuyLogic->setAppId($this->appId)->setRushGoodsBuyId($rushbuy_goods_id)->getGoods();
            if ($RushBuyLogic->checkOnline() == false) {
                $this->warning("产品已下架");
            }
        } catch (Exception $exception) {
            $this->noPage($exception->getMessage());
        }

        //获取商品评论
        $comment_type = (int)$this->request->param("comment_type");
        $comment = $RushBuyLogic->getComment($comment_type, $this->page, $this->limit);
        $this->datas['comment'] = [
            'isMore' => (int)($this->limit == count($comment)),
            'comment' => $comment
        ];
        //page 》 1 不反回 详情
        if ($this->page > 1) return;
        //获取商品规格
        $spec = $RushBuyLogic->getSpec();
        //获取商品价格
        $spec_goods_price = $RushBuyLogic->getSpecPrice();
        //获取商品属性
        $SettingModel = new SettingModel();
        $rule = $SettingModel->where("app_id", $this->appId)->value("qianggou_rule");
        $attr = (array)json_decode($detail->goods_attr, true);
        $attr = empty($attr['attr']) ? [] : $attr['attr'];
        $this->datas['detail'] = [
            'kan_surplus_time' => empty($kanjiaInfo) ? 0 : $kanjiaInfo->end_time - time(),
            'goods_id' => $detail->goods_id,
            'goods_sn' => $detail->goods_sn,
            'rushbuy_goods_id' => $detail->rushbuy_goods_id,
            'goods_name' => $detail->goods_name,
            'market_price' => moneyFormat($detail->market_price, true),
            'shop_price' => moneyFormat($detail->shop_price, true),
            'plus_vip_price' => moneyFormat($detail->plus_vip_price, true),
            'goods_content' => (array)json_decode($detail->goods_content),
            'photos' => (array)json_decode($detail->photos, true),
            'goods_attr' => $attr,
            'is_free_shipping' => $detail->is_free_shipping,
            'sales_sum' => $detail->sales_sum,
            'goods_num' => $detail->goods_num,
            'sku_type' => $detail->sku_type,
            'shipping_price' => moneyFormat($RushBuyLogic->getShippingPrice(), true),
            'is_plus_vip' => $detail->is_plus_vip,
            'is_coupon' => $detail->is_coupon,
            'comment_count' => $detail->comment_count,
            'bad_comment_count' => $detail->bad_comment_count,
            'middle_comment_num' => $detail->middle_comment_num,
            'views' => $detail->views,
            'cat_id' => $detail->cat_id,
            'spec' => $spec,
            'spec_goods_price' => $spec_goods_price,
            'qg_rushbuy_price' => moneyFormat($detail->qg_rushbuy_price),
            'qg_vip_rushbuy_price' => moneyFormat($detail->qg_vip_rushbuy_price),
            'qg_is_vip' => $detail->qg_is_vip,
            'qg_goods_num' => $detail->qg_goods_num,
            'qg_buy_num' => $detail->qg_buy_num,
            'qg_surplus_num' => $detail->qg_surplus_num,
            'qg_end_time' => $detail->qg_end_time - time(),
            'qg_rule' => $rule,
            'seo' => json_decode($detail->seo) ? json_decode($detail->seo,true) : $this->ddefault_seo,
        ];
        $TongjiLogic = new TongjiLogic();
        $TongjiLogic
            ->setAppId($this->appId)
            ->setUserId($this->userId)
            ->tongjiGoods($detail->goods_id, $detail->goods_name, $detail->goods_sn, $detail->photo, 4);
    }

    /**
     * 抢购商品下单验证
     */
    public function getPrice()
    {
        $this->checkUser(true);
        $rushbuy_goods_id = (int)$this->request->param("rushbuy_goods_id");
        $address_id = (int)$this->request->param("address_id", -1);
        $RushBuyLogic = new RushBuyLogic();
        try {
            $detail = $RushBuyLogic->setAppId($this->appId)->setRushGoodsBuyId($rushbuy_goods_id)->getGoods();
            if ($RushBuyLogic->checkOnline() == false) {
                $this->warning("产品已下架");
            }
            $spec_key = (string)$this->request->param("spec_key");
            //计算价格
            $price = $detail->qg_rushbuy_price;
            $vip_price = $detail->qg_vip_rushbuy_price;
            //获取商品价格
            $spec_goods_price = $RushBuyLogic->getSpecPrice(false);
            $spec_key_name = "";
            if ($detail->sku_type == 1 && empty($spec_goods_price[$spec_key])) {
                $this->warning("请选择规格");
            }
            if ($detail->sku_type == 1) {
                $spec_key_name =  $spec_goods_price[$spec_key]['key_name'];
                $price = $spec_goods_price[$spec_key]['shop_price'];
                $vip_price = $spec_goods_price[$spec_key]['plus_vip_price'];
            }
            $cartGoods = $RushBuyLogic->getBuyGoodsData($spec_key, 1);

            //重置一下价格
            $cartGoods[0]['price'] = $price;
            $cartGoods[0]['vip_price'] = $vip_price;
            $cartGoods[0]['is_plus_vip'] = $detail->qg_is_vip;
            $OrderLogic = new OrderSaveLogic();
            $res = $OrderLogic->setGoods($cartGoods)//获得商品
            ->setUserId($this->userId)//设置用户ID
            ->setAppId($this->appId)//设置APPID
            ->setAddress($address_id)//设置地址ID
            ->getFreight()//计算邮费
             ->getGoodsPrice();                       //获得计算商品
            $unableGoods = $OrderLogic->getUnableGoods();
            $this->datas = [
                'goods' => [
                    'photo' => $detail->photo,
                    'goods_name' => $detail->goods_name,
                    'shop_price' => moneyFormat($detail->shop_price),
                    'qg_price' => moneyFormat($price),
                    'qg_is_vip' => $detail->qg_is_vip,
                    'qg_vip_price' => moneyFormat($vip_price),
                    'spec_key_name' => $spec_key_name,
                ],
                'total_price' => moneyFormat($res['total_price'], false),
                'need_price' => moneyFormat($res['need_price'], false),
                'freight' => moneyFormat($res['freight'], false),
                'unableGoods' => $unableGoods,
            ];
        } catch (Exception $exception) {
            $this->noPage($exception->getMessage());
        }
    }


    /**
     * 抢购商品下单
     */
    public function saveOrder()
    {
        $this->checkUser(true);
        $rushbuy_goods_id = (int)$this->request->param("rushbuy_goods_id");
        $RushBuyLogic = new RushBuyLogic();
        try {
            //检查是否有库存等等
            $detail = $RushBuyLogic->setAppId($this->appId)->setRushGoodsBuyId($rushbuy_goods_id)->checkExpire()->getGoods();
            if ($RushBuyLogic->checkOnline() == false) {
                $this->warning("产品已下架");
            }
            if($detail->qg_goods_num <= 0){
                $this->warning("产品库存不足");
            }
            //检查是否在活动期内
            $spec_key = (string)$this->request->param("spec_key");
            //计算价格
            $price = $detail->qg_rushbuy_price;
            $vip_price = $detail->qg_vip_rushbuy_price;
            //获取商品价格
            $spec_goods_price = $RushBuyLogic->getSpecPrice(false);
            if ($detail->sku_type == 1 && empty($spec_goods_price[$spec_key])) {
                $this->warning("请选择规格");
            }
            if ($detail->sku_type == 1) {
                $price = $spec_goods_price[$spec_key]['shop_price'];
                $vip_price = $spec_goods_price[$spec_key]['plus_vip_price'];
            }

            $cartGoods = $RushBuyLogic->getBuyGoodsData($spec_key, 1);
            //重置一下价格
            $cartGoods[0]['price'] = $price;
            $cartGoods[0]['vip_price'] = $vip_price;
            $cartGoods[0]['is_plus_vip'] = $detail->qg_is_vip;
            $address_id = (int) $this->request->param("address_id");
            $use_money = (int) $this->request->param("use_money");
            $user_note = (string) $this->request->param("user_note");
            $pay_type = (string)$this->request->param("pay_type",'wyu');
            empty($pay_type) && $pay_type = "wyu";
            $OrderLogic = new OrderSaveLogic();
            $this->datas = $OrderLogic->setGoods($cartGoods)//获得商品
            ->setUserId($this->userId)//设置用户ID
            ->setAppId($this->appId)//设置APPID
            ->setAddress($address_id)//设置地址ID
            ->getFreight()//计算邮费
            ->setProm($detail->qg_rushbuy_id,getMean("shop_prom_type",'k')['qg'])
            ->setUserNote($user_note)
            ->setUserMoney($use_money)
            ->saveOrder($this->device)//获得计算商品
            ->getPayOrderInfo($this->openId, $this->device, $pay_type);                       //获得计算商品
        } catch (Exception $exception) {
            $this->noPage($exception->getMessage());
        }
    }


}
