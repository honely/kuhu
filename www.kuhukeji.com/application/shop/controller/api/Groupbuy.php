<?php

namespace app\shop\controller\api;

use app\common\logic\shop\GroupBuyOrderLogic;
use app\shop\logic\shop\goods\FreightLogic;
use app\shop\logic\shop\goods\GoodsLogic;
use app\shop\logic\shop\goods\GroupBuyLogic;
use app\shop\logic\shop\goods\GroupItemLogic;
use app\shop\logic\shop\miniapp\Miniapp;
use app\shop\logic\shop\TongjiLogic;
use app\shop\model\shop\AddressModel;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\GoodsRepertoryModel;
use app\shop\model\shop\GroupBuyItemJoinModel;
use app\shop\model\shop\GroupBuyItemModel;
use app\shop\model\shop\GroupBuyModel;
use app\shop\model\shop\SettingModel;
use app\shop\model\shop\UserModel;
use think\Exception;


class Groupbuy extends ShopCommon
{


    public function index()
    {
        $is_vip = $this->request->param("is_vip", -999);
        $keywords = (string)$this->request->param("keywords");
        if ($is_vip >= 0) {
            $where['is_vip'] = $is_vip;
        }
        $where['app_id'] = $this->appId;
        $where['is_online'] = 1;
        if (!empty($keywords)) {
            if (is_numeric($keywords)) {
                $where['goods_id'] = $keywords;
            } else {
                $where['goods_name'] = ['like',"%$keywords%"];
            }
        }
        $GroupBuyModel = new GroupBuyModel();
        $listTmp = $GroupBuyModel->where($where)->order("orderby desc")->page($this->page, $this->limit)->select();
        $list = [];
        foreach ($listTmp as $val) {
            $list[] = [
                'groupbuy_id' => (int)$val->groupbuy_id,
                'goods_id' => (int)$val->goods_id,
                'goods_name' => (string)$val->goods_name,
                'photo' => (string)$val->photo,
                'need_num' => (int)$val->need_num,
                'success_num' => (int)$val->success_num,
                'orderby' => (int)$val->orderby,
                'end_time' => (int)($val->end_time / 3600),
                'groupbuy_price' => moneyFormat($val->groupbuy_price, true),
                'vip_groupbuy_price' => moneyFormat($val->vip_groupbuy_price, true),
                'is_vip' => (int)$val->is_vip,
                'is_online' => (int)$val->is_online,
                'num' => (int)$val->num,
            ];
        }

        $this->datas['list'] = $list;
        $this->datas['isMore'] = (int)($this->limit == count($list));
        $this->datas['seo'] = $this->default_seo;

    }


    public function detail()
    {
        $groupbuy_id = (int)$this->request->param("groupbuy_id", 0);
        $GroupBuyLogic = new GroupBuyLogic();
        try {
            $detail = $GroupBuyLogic->setAppId($this->appId)->setGroupbuyId($groupbuy_id)->getGoods();
        } catch (Exception $exception) {
            $this->noPage($exception->getMessage());
        }
        if ($GroupBuyLogic->checkOnline() == false) {
            $this->noPage("拼团不存在");
        }
        //获取商品评论
        $comment_type = (int)$this->request->param("comment_type");
        $comment = $GroupBuyLogic->getComment($comment_type, $this->page, $this->limit);
        $this->datas['comment'] = [
            'isMore' => (int)($this->limit == count($comment)),
            'comment' => $comment
        ];
        //page 》 1 不反回 详情
        if ($this->page > 1) return;
        $joinTmp = $GroupBuyLogic->groupList();
        $userIds = [];
        foreach ($joinTmp as $val) {
            $userIds[$val->user_id] = $val->user_id;
        }
        $UserModel = new UserModel();
        $users = $UserModel->itemsByIds($userIds);
        $join = [];
        foreach ($joinTmp as $val) {
            if (empty($users[$val->user_id])) {
                continue;
            }
            $join[] = [
                'groupbuy_item_id' => $val->groupbuy_item_id,
                'face' => $users[$val->user_id]['face'],
                'nickname' => $users[$val->user_id]['nickname'],
                'cha_num' => $val->need_num - $val->now_num
            ];
        }
        $this->datas['join'] = $join;
        //获取商品规格
        $spec = $GroupBuyLogic->getSpec();
        //获取商品价格
        $spec_goods_price = $GroupBuyLogic->getSpecPrice();
        //获取商品属性
        $attr = (array)json_decode($detail->goods_attr, true);
        $attr = empty($attr['attr']) ? [] : $attr['attr'];
        $SettingModel = new SettingModel();
        $rule = $SettingModel->where("app_id", $this->appId)->value("pintuan_rule");
        $itemId = $GroupBuyLogic->isJoin($this->userId);

        $this->datas['detail'] = [
            'is_join' => (int)($itemId !== false),
            'item_id' => (int)$itemId,
            'goods_id' => $detail->goods_id,
            'goods_sn' => $detail->goods_sn,
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
            'shipping_price' => moneyFormat($GroupBuyLogic->getShippingPrice(), true),
            'is_plus_vip' => $detail->is_plus_vip,
            'is_coupon' => $detail->is_coupon,
            'comment_count' => $detail->comment_count,
            'bad_comment_count' => $detail->bad_comment_count,
            'middle_comment_num' => $detail->middle_comment_num,
            'views' => $detail->views,
            'cat_id' => $detail->cat_id,
            'spec' => $spec,
            'spec_goods_price' => $spec_goods_price,
            'pt_sold_num' => $detail->pt_sold_num,
            'pt_is_vip' => $detail->pt_is_vip,
            'pt_vip_groupbuy_price' => moneyFormat($detail->pt_vip_groupbuy_price),
            'pt_groupbuy_price' => moneyFormat($detail->pt_groupbuy_price),
            'pt_need_num' => $detail->pt_need_num,
            'pt_success_num' => $detail->pt_success_num,
            'pt_rule' => (array)json_decode($rule, true),
            'seo' => json_decode($detail->seo) ? json_decode($detail->seo,true) : $this->default_seo,
        ];
        $TongjiLogic = new TongjiLogic();
        $TongjiLogic
            ->setAppId($this->appId)
            ->setUserId($this->userId)
            ->tongjiGoods($detail->goods_id, $detail->goods_name, $detail->goods_sn, $detail->photo, 3);
    }

    /**
     * 拼团验证订单
     */
    public function getGroupBuyPrice()
    {
        $this->checkUser(true);
        $groupbuy_id = (int)$this->request->param('groupbuy_id');
        $address_id = (int)$this->request->param('address_id', -1);
        $spec_key = (string)$this->request->param('spec_key');
        $use_money = (int)$this->request->param("use_money");
        $item_id = (int)$this->request->param("item_id");
        $AddressModel = new AddressModel();
        $address = $AddressModel->find($address_id);
        if (!empty($address) && $address->user_id != $this->userId) {
            $this->warning("地址信息不正确");
        }
        $GroupBuyLogic = new GroupBuyLogic();
        try {
            $detail = $GroupBuyLogic->setAppId($this->appId)->setGroupbuyId($groupbuy_id)->getGoods();
            if ($item_id > 0) {
                $GroupItemLogic = new GroupItemLogic();
                $item = $GroupItemLogic->setItemId($item_id)->checkItem()->getItem();
            }
        } catch (Exception $exception) {
            $this->noPage($exception->getMessage());
        }
        if ($GroupBuyLogic->checkOnline() == false) {
            $this->noPage("拼团不存在");
        }
        $UserModel = new UserModel();
        $user = $UserModel->findUser($this->userId);
        $isVip = $UserModel->checkVip();
        //获取商品价格
        $price = $detail->pt_groupbuy_price;
        $isVip && $price = $detail->pt_vip_groupbuy_price;
        $key_name = "";
        $spec_goods_price = $GroupBuyLogic->getSpecPrice(false);
        if ($detail->sku_type == 1 && empty($spec_goods_price[$spec_key])) {
            $this->warning("请选择规格");
        }
        if ($detail->sku_type == 1) {
            $key_name = $spec_goods_price[$spec_key]['key_name'];
            $price = $spec_goods_price[$spec_key]['shop_price'];
            $isVip && $price = $spec_goods_price[$spec_key]['plus_vip_price'];
        }
        //计算邮费
        $r_id = empty($address) ? 1 : $address->division_id;
        $FreightLogic = new FreightLogic();
        $FreightLogic->setGoodsModel($detail);
        $FreightLogic->setRegionId($r_id);
        $unableGoods = [];
        if($FreightLogic->checkShipping() == false){
            $unableGoods = $detail;
        }

        $FreightLogic->setGoodsNum(1);
        $FreightLogic->doCalculation();
        $shipping_price = $FreightLogic->getFreight();

        $total_price = $shipping_price + $price;
        $tuanInfo = [];
        if (!empty($item)) {
            $usersTmp = $GroupItemLogic->getUsers();
            $users = [];
            $tuanzhang = [];
            foreach ($usersTmp as $val) {
                if ($val->user_id == $item->user_id) {
                    $tuanzhang = [
                        'face' => $val->face,
                        'nickname' => $val->nickname,
                    ];
                } else {
                    $users[] = [
                        'face' => $val->face,
                    ];
                }
            }
            $tuanInfo = [
                'tuanzhang' => $tuanzhang,
                'users' => $users,
                'cha' => $item->need_num - $item->now_num,
            ];
        }
        $this->datas = [
            'tuan_info' => $tuanInfo,
            'goods_info' => [
                'goods_name' => $detail->goods_name,
                'groupbuy_price' => moneyFormat($detail->pt_groupbuy_price),
                'vip_groupbuy_price' => moneyFormat($detail->pt_vip_groupbuy_price),
                'is_vip' => $detail->pt_is_vip,
                'need_num' => $detail->pt_need_num,
                'goods_photo' => $detail->photo,
                'key_name' => $key_name,
            ],
            'unableGoods' => $unableGoods,
            'this_user_face' => $user->getUser()->face,
            'tital_price' => moneyFormat($total_price),
            'shipping_price' => moneyFormat($shipping_price),
            'price' => moneyFormat($price),
            '_tital_price' => moneyFormat($total_price, true),
            '_shipping_price' => moneyFormat($shipping_price, true),
            '_price' => moneyFormat($price, true),
        ];

    }


    /**
     * 开团或者参团
     */
    public function GroupBuyOrder()
    {
        $this->checkUser(true);
        $groupbuy_id = (int)$this->request->param('groupbuy_id');
        $address_id = (int)$this->request->param('address_id', -1);
        if($address_id <= 0){
            $this->warning("请选择地址");
        }

        $spec_key = (string)$this->request->param('spec_key');
        $use_money = (int)$this->request->param("use_money");
        $item_id = (int)$this->request->param("item_id");
        $AddressModel = new AddressModel();
        $address = $AddressModel->find($address_id);
        if (empty($address) || $address->user_id != $this->userId) {
            $this->warning("地址信息不正确");
        }
        $is_open = true; //是否开团
        $GroupBuyLogic = new GroupBuyLogic();
        try {
            $detail = $GroupBuyLogic->setAppId($this->appId)->setGroupbuyId($groupbuy_id)->getGoods();
            if ($GroupBuyLogic->checkOnline() == false) {
                $this->noPage("拼团不存在");
            }
            $isJoin = $GroupBuyLogic->isJoin($this->userId, false);
            if ($isJoin != false) {
                $this->warning("您有正在进行的团未完成");
            }
            $UserModel = new UserModel();
            $user = $UserModel->findUser($this->userId);
            $isVip = $UserModel->checkVip();
            //        计算邮费
            $r_id = empty($address) ? 1 : $address->division_id;
            $FreightLogic = new FreightLogic();
            $FreightLogic->setGoodsModel($detail);
            $FreightLogic->setRegionId($r_id);
            if($FreightLogic->checkShipping() == false){
                $this->warning("存在不可发货商品");
            }
            $FreightLogic->setGoodsNum(1);
            $FreightLogic->doCalculation();
            $shipping_price = $FreightLogic->getFreight();
            if ($item_id > 0) {
                $is_open = false;
                $GroupItemLogic = new GroupItemLogic();
                $GroupItemLogic->setItemId($item_id)->checkItem();
            } else {
                $is_open = true;
                $GroupBuyItemModel = new GroupBuyItemModel();
                 $GroupBuyItemModel->save([
                    'groupbuy_id' => $groupbuy_id,
                    'app_id' => $this->appId,
                    'user_id' => $this->userId,
                    'goods_id' => $detail->goods_id,
                    'goods_name' => $detail->goods_name,
                    'vip_groupbuy_price' => $detail->pt_vip_groupbuy_price,
                    'groupbuy_price' => $detail->pt_groupbuy_price,
                    'is_vip' => $detail->pt_is_vip,
                    'photo' => $detail->photo,
                    'need_num' => $detail->pt_need_num,
                    'now_num' => 1,
                    'is_pay' => 0,
                    'end_time' => $this->request->time() + $detail->pt_end_time,
                ]);
                $item_id = $GroupBuyItemModel->groupbuy_item_id;
            }

        } catch (Exception $exception) {
            $this->noPage($exception->getMessage());
        }
        //获取商品价格
        $price = $detail->pt_groupbuy_price;
        $grpup_price = $detail->pt_groupbuy_price;
        $vip_grpup_price = $detail->pt_vip_groupbuy_price;
        $isVip && $price = $detail->pt_vip_groupbuy_price;
        $spec_goods_price = $GroupBuyLogic->getSpecPrice(false);

        if ($detail->sku_type == 1 && empty($spec_goods_price[$spec_key])) {
            $this->warning("请选择规格");
        }
        if ($detail->sku_type == 1) {
            $grpup_price = $spec_goods_price[$spec_key]['shop_price'];
            $vip_grpup_price = $spec_goods_price[$spec_key]['plus_vip_price'];
            $price = $spec_goods_price[$spec_key]['shop_price'];
            $isVip && $price = $spec_goods_price[$spec_key]['plus_vip_price'];
        }
        $spec = $GroupBuyLogic->checkSpec($spec_key);
        $total_price = $shipping_price + $price;
        $user_money = 0;
        $isPay = true;
        if ($use_money == 1 && $user->getUserMoney() > 0) {
            $use_money = $user->getUserMoney();
            if ($use_money >= $total_price) {
                $isPay = false;
                $use_money = $total_price;
            }
        }
        $payment_price = $total_price - $use_money;
        if ($use_money > 0) {
            $user->userMoney($use_money, getMean("user_money_type", 'k')['xf']);
        }
        $user_note = (string)$this->request->param("user_note");
        $GroupBuyItemJoinModel = new GroupBuyItemJoinModel();
        $GroupBuyItemJoinModel->save([
            'user_id' => $this->userId,
            'app_id' => $this->appId,
            'groupbuy_item_id' => $item_id,
            'groupbuy_id' => $groupbuy_id,
            'goods_id' => $detail->goods_id,
            'goods_name' => $detail->goods_name,
            'spec_key' => $spec->spec_key,
            'key_name' => $spec->key_name,
            'photo' => $detail->photo,
            'market_price' => $detail->market_price,
            'shop_price' => $detail->shop_price,
            'groupbuy_price' => $grpup_price,
            'vip_groupbuy_price' => $vip_grpup_price,
            'payment_price' => $payment_price,
            'user_money' => $use_money,
            'shipping_price' => $shipping_price,
            'pay_price' => $price,
            'address_id' => $address->address_id,
            'province_id' => $address->province_id,
            'city_id' => $address->city_id,
            'division_id' => $address->division_id,
            'street' => $address->street,
            'address' => $address->address,
            'name' => $address->getAttr('name'),
            'mobile' => $address->mobile,
            'pay_type' => $isPay ? 0 : 4,
            'is_pay' => $isPay ? 0 : 1,
            'pay_time' => $isPay ? 0 : time(),
            'device' => $this->device,
            'buy_role' => (int)$user->checkVip(),
            'user_note' => $user_note,
            'goods_sn' => $detail->goods_sn,
            'sku_type' => $detail->sku_type,
            'bar_code' => $spec->bar_code,
            'goods_photo' => $detail->photo,
//            'pay_end_time' => 0, //
        ]);
        $this->datas['item_id'] = $item_id;
        if ($isPay) {
            $pay_type = (string)$this->request->param("pay_type",'wyu');
            empty($pay_type) && $pay_type = "wyu";
            //支付
            $param = [
                'title' => getMean('shop_prom_type')[getMean('shop_prom_type', 'key')['pt']],
                'subject' => $detail->goods_name,
                'openid' => $this->openId,
                'notify_url' => config('callbackUrl.pintuan_payment_notify_callback').'/appid/'.$this->appId . '/device/' . $this->device . '/pay_type/' . $pay_type . '/order_id/' . $GroupBuyItemJoinModel->join_id,
                'return_url' => request()->domain() . config('callbackUrl.pintuan_payment_return_callback').'/appid/'.$this->appId . '/device/' . $this->device. '/pay_type/' . $pay_type . '/order_id/' . $GroupBuyItemJoinModel->join_id,
                'order_id' => $GroupBuyItemJoinModel->join_id,
                'money' => $payment_price,
                'pay_type' => $pay_type,
                'goods_id' => $detail->goods_id,
                'order_type' => 2,
            ];
            try {
                $res = Miniapp::makeModule($this->device, $this->appId)->createOrder($param);
                $this->datas['order_info'] = $res['order_info'];
                $this->datas['is_pay'] = 1;
            } catch (Exception $exception) {
                $warning = $exception->getMessage();
                $this->warning($warning);
            }
        } else {
            if ($is_open == false) {
                $GroupItemLogic->setTuanNum();
            } else {
                $GroupBuyItemModel = new GroupBuyItemModel();
                $GroupBuyItemModel->isUpdate(true)->save(['is_pay'=>1],['groupbuy_item_id'=>$item_id]);
            }
            $this->datas['order_info'] = [];
            $this->datas['is_pay'] = 0;
        }

    }


    /**
     * 团详情
     * @param $groupbuy_id
     * @return array
     * type  1我要参团   2邀请好友来参团  3开团成功已下单 请等待发货  4拼团失败 请联系客服退款 5您已参加其他团不可参团
     */
    public function itemDetail()
    {
        $item_id = (int)$this->request->param("item_id");
        try {
            $GroupItemLogic = new GroupItemLogic();
            $item = $GroupItemLogic->setItemId($item_id)->getItem();
            $GroupBuyLogic = new GroupBuyLogic();
            $detail  =  $GroupBuyLogic->setAppId($this->appId)->setGroupbuyId($item->groupbuy_id)->getGoods();
            if($GroupBuyLogic->checkOnline() == false){
                $this->warning("商品已下架");
            }
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }


        $GroupBuyModel = new GroupBuyModel();
        $where = [
            'groupbuy_id' => ['neq', $item->groupbuy_id],
            'app_id' => $this->appId,
            'is_online' => 1,
        ];
        $tuijian_tmp = $GroupBuyModel->where($where)->order('orderby desc')->page($this->page, $this->limit)->select();
        $tuijian = [];
        foreach ($tuijian_tmp as $v) {
            $tuijian[] = [
                'groupbuy_id' => $v->groupbuy_id,
                'goods_id' => $v->goods_id,
                'need_num' => $v->need_num,
                'photo' => $v->photo,
                'goods_name' => $v->goods_name,
                'sold_num' => $v->sold_num,
                'success_num' => $v->success_num,
                'groupbuy_price' => moneyFormat($v->groupbuy_price),
                'vip_groupbuy_price' => moneyFormat($v->vip_groupbuy_price),
                'is_vip' => $v->is_vip,
            ];
        }
        $this->datas['tuijian'] = [
            'list' => $tuijian,
            'isMore' => (int) ($this->limit == count($tuijian))
        ];
        if($this->page > 1) return;

//        -——————————————————————推荐分割线————————————————
        $type = 1; //我要参加
        $usersTmp = $GroupItemLogic->getUsers();
        $users = [];
        $tuanzhang = [];
        $isJoin = $GroupBuyLogic->isJoin($this->userId, false);
        $this_join = false;
        foreach ($usersTmp as $val) {
            $this->userId == $val->user_id && $type = 2;
            if($this->userId == $val->user_id){
                $this_join = true;
            }
            if ($val->user_id == $item->user_id) {
                $tuanzhang = [
                    'face' => $val->face,
                    'nickname' => $val->nickname,
                ];
            } else {
                $users[] = [
                    'face' => $val->face,
                ];
            }
        }
        if($this_join == false  &&  $isJoin == true){
            $type = 5;
        }
        $item->is_success  && $type = 3;
        if($item->end_time < time() && $item->is_success == 0){
            $type = 4;
            //更新状态
            if($item->is_invalid == 0){
                $item->is_invalid = 1;
                $item->save();
            }
        }
        $this->datas['detail'] = [
            'groupbuy_id' => $item->groupbuy_id,
            'item_id'=> $item_id,
            'type' => $type,
            'tuanzhang' => $tuanzhang,
            'users' => $users,
            'goods_name' => $detail->goods_name,
            'groupbuy_price' => moneyFormat($detail->pt_groupbuy_price),
            'vip_groupbuy_price' => moneyFormat($detail->pt_vip_groupbuy_price),
            'is_vip' => $detail->pt_is_vip,
            'goods_photo' => $detail->photo,
            'shop_price' => moneyFormat($detail->shop_price),
            'cha' =>   $item->need_num - $item->now_num,
            'now_num' => $item->now_num,
            'need_num' => $item->need_num,
            'end_time' => $item->end_time > $this->request->time() ? $item->end_time - $this->request->time() : 0
        ];
    }


    //我的拼团
    public function getMyGroupBuy()
    {
        $this->checkUser(true);
        $type = (int) $this->request->param('type',0);
        $GroupBuyItemModel = new GroupBuyItemModel();
        $GroupBuyItemJoinModel = new GroupBuyItemJoinModel();
        $item_where = [
            'user_id' => $this->userId,
        ];

        $update_item_where = [
            'user_id' => $this->userId,
            'is_invalid' => 0,
            'is_success' => 0,
            'end_time' => ['<=', time()],
        ];
        //先更新一波状态
        $GroupBuyItemModel->where($update_item_where)->whereExp('now_num', '>= need_num')->update(['is_invalid' => 1]);

        $faqi_tmp_ids = $GroupBuyItemModel->where($item_where)->select();

        $my_groupbuy = $my_groupbuy_ids = [];
        foreach ($faqi_tmp_ids as $v) {
            $my_groupbuy_item_ids[$v->groupbuy_item_id] = $v->groupbuy_item_id;
            $my_groupbuy[$v->groupbuy_id] = $v;
        }
        $list = [];

        if ($type == 0) {
            $item_join_where = [
                'groupbuy_item_id' => ['in', $my_groupbuy_item_ids],
                'is_pay' => 1,
                'user_id' => $this->userId
            ];
        } elseif ($type == 1) {
            $item_join_where = [
                'groupbuy_item_id' => ['not in', $my_groupbuy_item_ids],
                'is_pay' => 1,
                'user_id' => $this->userId
            ];
        }

        $list_tmp = $GroupBuyItemJoinModel->where($item_join_where)->order('join_id desc')->page($this->page,$this->limit)->select();

        foreach ($list_tmp as $v) {
            $groupbuyitemIds[$v->groupbuy_item_id] = $v->groupbuy_item_id;
        }
        $groupbuyitemIds = empty($groupbuyitemIds) ? '' : $groupbuyitemIds;
        $groupbuyItems = $GroupBuyItemModel->itemsByIds($groupbuyitemIds);

        foreach ($list_tmp as $vv) {
            $status_mean = '拼团失败';
            if(empty($groupbuyitemIds[$vv->groupbuy_item_id])){
                continue;
            }
            if ($groupbuyItems[$vv->groupbuy_item_id]['is_success'] == 0) {
                if ($groupbuyItems[$vv->groupbuy_item_id]['is_invalid'] == 1 || $groupbuyItems[$vv->groupbuy_item_id]['end_time'] <= time() ) {
                    $status_mean = '拼团失败';
                } else {
                    $status_mean = '待成团';
                }
            } else {
                $status_mean = '拼团成功';
            }

            $list[] = [
                'join_id' => $vv->join_id,
                'groupbuy_item_id' => $vv->groupbuy_item_id,
                'groupbuy_id' => $vv->groupbuy_id,
                'goods_id' => $vv->goods_id,
                'goods_sn' => $vv->goods_sn,
                'goods_name' => $vv->goods_name,
                'key_name' => $vv->key_name,
                'photo' => $vv->photo,
                'payment_price' => moneyFormat($vv->payment_price,true),
                'shipping_price' => moneyFormat($vv->shipping_price,true),
                'is_pay' => $vv->is_pay,
                'need_num' => $groupbuyItems[$vv->groupbuy_item_id]['need_num'],
                'now_num' => $groupbuyItems[$vv->groupbuy_item_id]['now_num'],
                'is_invalid' => $groupbuyItems[$vv->groupbuy_item_id]['is_invalid'],
                'is_success' => $groupbuyItems[$vv->groupbuy_item_id]['is_success'],
                'expire_time' => ($groupbuyItems[$vv->groupbuy_item_id]['end_time'] - time() > 0) ? $groupbuyItems[$vv->groupbuy_item_id]['end_time'] - time() : 0,
                'status_mean' => $status_mean,
                'order_id' => (int)$vv->order_id,
            ];
        }


        $this->datas = [
            'list' => $list,
            'isMore' => (int)(count($list) == $this->limit),
        ];
    }


}

