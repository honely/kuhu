<?php

namespace app\shop\controller\api;

use app\shop\logic\shop\goods\BargainLogic;
use app\shop\logic\shop\goods\FreightLogic;
use app\shop\logic\shop\miniapp\Miniapp;
use app\shop\logic\shop\TongjiLogic;
use app\shop\model\shop\AddressModel;
use app\shop\model\shop\BargainItemModel;
use app\shop\model\shop\BargainModel;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\GoodsRepertoryModel;
use app\shop\model\shop\OrderActivityModel;
use app\shop\model\shop\OrderGoodsModel;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\SettingModel;
use app\shop\model\shop\UserModel;
use think\Exception;

class Bargain extends ShopCommon
{
    protected $checkLogin = false;

    public function index()
    {
        $where['app_id'] = $this->appId;
        $where['is_online'] = 1;
        $keywords = (string) $this->request->param('keywords','');
        if(!empty($keywords)){
            $GoodsModel = new GoodsModel();
            $godosIds =  $GoodsModel->where("app_id",$this->appId)
                ->whereLike("goods_name","%{$keywords}%")
                ->column("goods_id","goods_id");
            $where['goods_id'] = ["In",$godosIds];
        }
        $BargainModel = new BargainModel();
        $GoodsModel = new GoodsModel();
        $listTmp = $BargainModel->where($where)->order("orderby desc")->page($this->page, $this->limit)->select();
        $goodsIds = [];
        foreach ($listTmp as $v) {
            $goodsIds[$v->goods_id] = $v->goods_id;
        }
        $goodsIds = empty($goodsIds) ? '' : $goodsIds;
        $goods = $GoodsModel->itemsByIds($goodsIds);
        $list = [];
        foreach ($listTmp as $val) {
            $list[] = [
                'bargain_id' => (int)$val->bargain_id,
                'goods_id' => (int)$val->goods_id,
                'need_num' => (int)$val->need_num,
                'sold_num' => (int)$val->sold_num,
                'init_price' => moneyFormat($val->init_price, true),
                'bargain_price' => moneyFormat($val->bargain_price, true),
                'bargain_price_btn' => moneyFormat($val->bargain_price),
                'is_vip_more_bargain' => (int)$val->is_vip_more_bargain,
                'goods_name' => isset($goods[$val->goods_id]) ? $goods[$val->goods_id]['goods_name'] : '--',
                'photo' => isset($goods[$val->goods_id]) ? $goods[$val->goods_id]['photo'] : '--',
            ];
        }
        $this->datas['list'] = $list;
        $this->datas['isMore'] = (int)($this->limit == count($list));
        $this->datas['seo'] = $this->default_seo;
    }

    public function detail()
    {
        $bargain_id = (int)$this->request->param("bargain_id", 0);
        $BargainLogic = new BargainLogic();
        try {
            $detail = $BargainLogic->setAppId($this->appId)->setBargainId($bargain_id)->getGoods();
        } catch (Exception $exception) {
            $this->noPage($exception->getMessage());
        }
        if ($BargainLogic->checkOnline() == false) {
            $this->noPage("产品已下架");
        }
        //获取商品评论
        $comment_type = (int)$this->request->param("comment_type");
        $comment = $BargainLogic->getComment($comment_type, $this->page, $this->limit);
        $this->datas['comment'] = [
            'isMore' => (int)($this->limit == count($comment)),
            'comment' => $comment
        ];
        //page 》 1 不反回 详情
        if ($this->page > 1) return;
        //我的砍价信息
        $kanjiaInfo = $BargainLogic->checkUserKan($this->userId);
        //获取商品规格
        $spec = $BargainLogic->getSpec();
        //获取商品价格
        $spec_goods_price = $BargainLogic->getSpecPrice();
        //获取商品属性
        $SettingModel = new SettingModel();
        $rule = $SettingModel->where("app_id", $this->appId)->value("kanjia_rule");
        $attr = (array)json_decode($detail->goods_attr, true);
        $attr = empty($attr['attr']) ? [] : $attr['attr'];
        $this->datas['detail'] = [
            'is_kan' => empty($kanjiaInfo) ? 0 : 1,
            'bargain_item_id' => empty($kanjiaInfo) ? 0 : $kanjiaInfo->bargain_item_id,
            'kan_surplus_time' => empty($kanjiaInfo) ? 0 : $kanjiaInfo->end_time - time(),
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
            'shipping_price' => moneyFormat($BargainLogic->getShippingPrice(), true),
            'is_plus_vip' => $detail->is_plus_vip,
            'is_coupon' => $detail->is_coupon,
            'comment_count' => $detail->comment_count,
            'bad_comment_count' => $detail->bad_comment_count,
            'middle_comment_num' => $detail->middle_comment_num,
            'views' => $detail->views,
            'cat_id' => $detail->cat_id,
            'kj_sold_num' => $detail->kj_sold_num,
            'kj_is_vip_more_bargain' => $detail->kj_is_vip_more_bargain,
            'kj_init_price' => moneyFormat($detail->kj_init_price),
            'kj_bargain_price' => moneyFormat($detail->kj_bargain_price),
            'spec' => $spec,
            'spec_goods_price' => $spec_goods_price,
            'kanjia_rule' => (array)json_decode($rule, true),
            'seo' => json_decode($detail->seo) ? json_decode($detail->seo,true) : $this->default_seo,
        ];
        $TongjiLogic = new TongjiLogic();
        $TongjiLogic
            ->setAppId($this->appId)
            ->setUserId($this->userId)
            ->tongjiGoods($detail->goods_id, $detail->goods_name, $detail->goods_sn, $detail->photo, 2);
    }

    /**
     * 砍第一刀
     */
    public function openBargain()
    {
        $this->checkUser(true);
        $bargain_id = (int)$this->request->param("bargain_id", 0);
        $address_id = (int)$this->request->param("address_id");
        $AddressModel = new AddressModel();
        $address = $AddressModel->checkAddress($address_id, $this->userId);
        if ($address == false) {
            $this->warning("请选择地址");
        }
        $BargainLogic = new BargainLogic();
        try {
            $detail = $BargainLogic->setAppId($this->appId)->setBargainId($bargain_id)->getGoods();
        } catch (Exception $exception) {
            $this->noPage($exception->getMessage());
        }
        if ($BargainLogic->checkOnline() == false) {
            $this->noPage("砍价丢了");
        }
        //查询是否砍价了
        $kanjiaInfo = $BargainLogic->checkUserKan($this->userId);
        if (!empty($kanjiaInfo)) {
            $this->warning("您已经参加过此商品了");
        }

        //验证是否可以发货
        $FreightLogic = new FreightLogic();
        $FreightLogic->setGoodsModel($detail);
        $FreightLogic->setRegionId($address->division_id);
        if ($FreightLogic->checkShipping() == false) {
            $this->warning("当前选择地区无法发货");
        }
        //获取商品价格
        $spec_goods_price = $BargainLogic->getSpecPrice();
        $spec_key = (string)$this->request->param("spec_key");
        $spec = $BargainLogic->checkSpec($spec_key);
        if ($spec == false) {
            $this->warning("请选择规格");
        }
        if ($spec->goods_num <= 0) {
            $this->warning("商品无货了");
        }

        if ($detail->sku_type == 1 && empty($spec_goods_price[$spec_key])) {
            $this->warning("请选择规格");
        }

        $UserModel = new UserModel();
        $user = $UserModel->findUser($this->userId)->getUser();
        $bargain_log = $BargainLogic->createBargainLog();
        $bargain_log[0]['nickname'] = $user->nickname;
        $bargain_log[0]['face'] = $user->face;
        $bargain_log[0]['user_id'] = $user->user_id;
        $BargainItemModel = new BargainItemModel();
        $BargainItemModel->save([
            'app_id' => $this->appId,
            'bargain_id' => $bargain_id,
            'user_id' => $this->userId,
            'goods_id' => $detail->goods_id,
            'spec_key' => $spec_key,
            'key_name' => $spec->key_name,
            'goods_name' => $detail->goods_name,
            'photo' => $detail->photo,
            'market_price' => $detail->market_price,
            'shop_price' => $detail->shop_price,
            'init_price' => $detail->kj_init_price,
            'bargain_price' => $detail->kj_bargain_price,
            'now_price' => $bargain_log[0]['price'],
            'need_num' => $detail->kj_need_num,
            'now_num' => 1,
            'bargain_log' => json_encode($bargain_log),
            'end_time' => $this->request->time() + $detail->kj_end_time,
            'province_id' => $address->province_id,
            'city_id' => $address->city_id,
            'division_id' => $address->division_id,
            'street' => $address->street,
            'address' => $address->address,
            'name' => $address->name,
            'mobile' => $address->mobile,
        ]);
        $this->datas = [
            'bargain_item_id' => $BargainItemModel->bargain_item_id,
            'kan_price' => moneyFormat($bargain_log[0]['price']),
        ];
    }

    /**
     * 帮砍详情
     */
    public function helpBargainDetail()
    {
        $bargain_item_id = (int)$this->request->param("bargain_item_id");
        $BargainItemModel = new BargainItemModel();
        $itemDetail = $BargainItemModel->find($bargain_item_id);
        if (empty($itemDetail) || $itemDetail->app_id != $this->appId) {
            $this->noPage("商品丢了");
        }
        //推荐的砍价
        $BargainModel = new BargainModel();
        $tuijian_tmp = $BargainModel->where('bargain_id', 'neq', $itemDetail->bargain_id)->order('orderby desc')->page($this->page, $this->limit)->select();
        $tuijian = $goodsIds = [];
        foreach ($tuijian_tmp as $v) {
            $goodsIds[$v->goods_id] = $v->goods_id;
        }
        $goodsIds = empty($goodsIds) ? '' : $goodsIds;
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->itemsByIds($goodsIds);
        foreach ($tuijian_tmp as $v) {
            $tuijian[] = [
                'bargain_id' => (int)$v->bargain_id,
                'goods_id' => (int)$v->goods_id,
                'need_num' => (int)$v->need_num,
                'sold_num' => (int)$v->sold_num,
                'orderby' => (int)$v->orderby,
                'init_price' => moneyFormat($v->init_price, true),
                'bargain_price' => moneyFormat($v->bargain_price, true),
                'is_online' => (int)$v->is_online,
                'goods_name' => isset($goods[$v->goods_id]) ? $goods[$v->goods_id]['goods_name'] : '--',
                'photo' => isset($goods[$v->goods_id]) ? $goods[$v->goods_id]['photo'] : '--',
            ];
        }
        $this->datas['tuijian'] = $tuijian;
        $this->datas['isMore'] = (int)($this->limit == count($tuijian));

        if ($this->page > 1) return;
        $itemDetail->setAttr("this_user_id", $this->userId);
        $type = $itemDetail->type;
        if ($type == 6) {
            $itemDetail->is_invalid = 1;
            $itemDetail->allowField(true)->save();
        }
        $UserModel = new UserModel();
        $user = $UserModel->findUser($itemDetail->user_id);
        $bargain_log = json_decode($itemDetail->bargain_log);
        foreach ($bargain_log as $key => $val) {
            $bargain_log[$key]->price = moneyFormat($bargain_log[$key]->price, true);
            if ($val->user_id == 0) unset($bargain_log[$key]);
        }
        $this->datas['detail'] = [
            'bargain_item_id' => $itemDetail->bargain_item_id,
            'bargain_id' => $itemDetail->bargain_id,
            'nickname' => $user->getUser()->nickname,
            'face' => $user->getUser()->face,
            'goods_id' => $itemDetail->goods_id,
            'goods_name' => $itemDetail->goods_name,
            'photo' => $itemDetail->photo,
            'init_price' => moneyFormat($itemDetail->init_price),
            'bargain_price' => moneyFormat($itemDetail->bargain_price),
            'now_price' => moneyFormat(($itemDetail->init_price - $itemDetail->bargain_price  - $itemDetail->now_price)),
            'kan_price' => moneyFormat(($itemDetail->now_price)),
            'expire_time' => ($itemDetail->end_time) - time() > 0 ? $itemDetail->end_time - time() : 0,
            'type' => $type,
            'bargain_log' => $bargain_log,
        ];
    }

    /**
     * 帮砍继续砍
     */
    public function helpBargain()
    {
        $this->checkUser(true);
        $bargain_item_id = (int)$this->request->param("bargain_item_id");
        $BargainItemModel = new BargainItemModel();
        $itemDetail = $BargainItemModel->find($bargain_item_id);
        if (empty($itemDetail) && $itemDetail->app_id != $this->appId) {
            $this->warning("砍价失败");
        }
        if ($itemDetail->end_time <= time() || $itemDetail->is_success == 1) {
            $this->warning("砍价已失效");
        }
        $bargain_id = $itemDetail->bargain_id;
        $BargainLogic = new BargainLogic();
        try {
            $detail = $BargainLogic->setAppId($this->appId)->setBargainId($bargain_id)->getGoods();
        } catch (Exception $exception) {
            $this->warning("砍价失败");
        }
        if ($BargainLogic->checkOnline() == false) {
            $this->warning("砍价失败");
        }
        $itemDetail->setAttr("this_user_id", $this->userId);
        $type = $itemDetail->type;
        if (!in_array($type, [2, 4], true)) {
            $this->warning("砍价失败");
        }
        //开始砍价
        $UserModel = new UserModel();

        $user = $UserModel->findUser($this->userId);
        $bargain_log = json_decode($itemDetail->bargain_log);
        if (empty($bargain_log[$itemDetail->now_num])) {
            $this->warning("系统异常请联系客服");
        }

        $bargain_log[$itemDetail->now_num]->nickname = $user->getUser()->nickname;
        $bargain_log[$itemDetail->now_num]->face = $user->getUser()->face;
        $bargain_log[$itemDetail->now_num]->user_id = $user->getUser()->user_id;
        $now_num = $itemDetail->now_num;
        //最后一次砍价
        if ($now_num + 1 == $itemDetail->need_num) {
            $itemDetail->is_success = 1;
            $itemDetail->pay_end_time = time() + 86400;
        }
        $itemDetail->bargain_log = json_encode($bargain_log);
        $itemDetail->now_price += $bargain_log[$itemDetail->now_num]->price;
        $itemDetail->now_num += 1;
        $itemDetail->allowField(true)->save();
        foreach ($bargain_log as $key => $val) {
            $bargain_log[$key]->price = moneyFormat($bargain_log[$key]->price, true);
            if ($val->user_id == 0) unset($bargain_log[$key]);
        }
        $this->datas = [
            'kan_price' => $bargain_log[$now_num]->price,
            'bargain_log' => $bargain_log,
        ];
    }

    //下单
    public function createOrder()
    {
        $this->checkUser(true);
        $bargain_item_id = (int)$this->request->param('bargain_item_id', 0);
        $BargainItemModel = new BargainItemModel();
        if (!$bargain_item = $BargainItemModel->find($bargain_item_id)) {
            $this->warning("参数不正确！");
        }
        $BargainModel = new BargainModel();
        if (!$bargain = $BargainModel->find($bargain_item->bargain_id)) {
            $this->warning("参数不正确！");
        }
        if ($bargain->is_online == 0 || $bargain->num == 0) {
            $this->warning("对不起,当前砍价活动商品已售罄！");
        }
        $GoodsModel = new GoodsModel();
        if (!$goods = $GoodsModel->find($bargain->goods_id)) {
            $this->warning("参数不正确！");
        }
        if ($goods->is_online == 0 || $goods->is_delete == 1) {
            $this->warning("对不起，商品已下架！");
        }
        //是否砍完
        if ($bargain_item->is_success == 0) {
            $this->warning("未获得购买资格");
        }
        if ($bargain_item->is_pay == 1) {
            $this->warning("您已经下单了 无法继续下单");
        }
//        if ($bargain_item->pay_end_time < time()) {
//            $this->warning("对不起 该活动已失效");
//        }
        //在判断 是否已经下单
        $OrderModel = new OrderModel();
        $order = $OrderModel->where("prom_id", $bargain_item_id)
            ->where("prom_type", getMean("shop_prom_type", 'k')['kj'])
            ->where("user_id", $this->userId)->find();
        if (!empty($order)) {
            $this->warning("您已经下单了 无法继续下单");
        }

        $use_money = (int)$this->request->param("use_money");
        $UserModel = new UserModel();
        $user = $UserModel->findUser($this->userId);

        $FreightLogic = new FreightLogic();
        $FreightLogic->setGoodsModel($goods);
        $FreightLogic->setRegionId($bargain_item->division_id);
        $FreightLogic->setGoodsNum(1);
        $FreightLogic->doCalculation();
        $shipping_price = $FreightLogic->getFreight();


        $total_price = $shipping_price + $bargain_item->bargain_price;
        $user_money = 0;
        if ($use_money == 1) {
            if ($user->getUserMoney() >= $total_price) {
                $user_money = $total_price;
            } else {
                $user_money = $user->getUserMoney();
            }
        }
        $payment_price = $total_price - $user_money;
        $isPay = false;
        $payment_price > 0 && $isPay = true;
        $OrderModel = new OrderModel();
        $OrderModel->save([
            'app_id' => $this->appId,
            'order_sn' => date("YmdHis", time()) . $OrderModel->getAutoMaxId(),
            'user_id' => $this->userId,
            'pay_status' => $isPay ? 0 : 1,
            'name' => $bargain_item->getAttr('name'),
            'mobile' => $bargain_item->mobile,
            'province_id' => $bargain_item->province_id,
            'city_id' => $bargain_item->city_id,
            'division_id' => $bargain_item->division_id,
            'street' => $bargain_item->street,
            'address' => $bargain_item->address,
            'pay_type' => $isPay ? 0 : 4,
            'goods_price' => $bargain['bargain_price'],
            'user_money' => $user_money,
            'shipping_price' => $shipping_price,
            'payment_price' => $payment_price,
            'pay_time' => $isPay ? 0 : time(),
            'pid' => $user->getPid(),
            'device' => $this->device,
            'end_time' => $this->request->time() + 900,
            'buy_role' => (int)$user->checkVip(),
            'prom_id' => $bargain_item->bargain_id,
            'prom_type' => getMean('shop_prom_type', 'key')['kj'],
        ]);

        $order_id = $OrderModel->order_id;
        $OrderGoodsModel = new OrderGoodsModel();
        $OrderGoodsModel->save([
            'order_id' => $order_id,
            'goods_id' => $goods->goods_id,
            'goods_name' => $goods->goods_name,
            'goods_num' => 1,
            'goods_price' => $bargain['bargain_price'],
            'vip_price' => $bargain['bargain_price'],
            'spec_key' => $bargain_item->spec_key,
            'spec_key_name' => $bargain_item->key_name,
            'prom_type' => getMean('shop_prom_type', 'key')['kj'],
            'prom_id' => $bargain->bargain_id,
            'goods_photo' => $goods->photo,
        ]);
        $BargainItemModel->isUpdate(true)->save(['order_id' => $order_id, 'is_pay' => 1], ['bargain_item_id' => $bargain_item_id]);
        $pay_type = (string)$this->request->param("pay_type",'wyu');
        empty($pay_type) && $pay_type = "wyu";
        $U = new UserModel();
        if ($isPay) {
            $param = [
                'title' => getMean('shop_prom_type')[getMean('shop_prom_type', 'key')['kj']],
                'subject' => $goods->goods_name,
                'openid' => $this->openId,
                'notify_url' => request()->domain() . config('callbackUrl.shop_payment_notify_callback') . '/appid/' . $this->appId . '/device/' . $this->device . '/pay_type/' . $pay_type . 'order_id' . $order_id,
                'return_url' => request()->domain() .config('callbackUrl.shop_payment_return_callback') . '/appid/' . $this->appId . '/device/' . $this->device . '/pay_type/' . $pay_type . 'order_id' . $order_id,
                'order_id' => $order_id,
                'money' => $payment_price,
                'pay_type' => $pay_type,
                'goods_id' => $goods->goods_id,
                'order_type' => 1,
            ];
            try {
                $res = Miniapp::makeModule($this->device, $this->appId)->createOrder($param);
                $this->datas = [
                    'is_pay' => 0,
                    'order_info' => $res['order_info'],
                    'order_id' => $order_id,
                ];
            } catch (Exception $exception) {
                $warning = $exception->getMessage();
                $this->warning($warning);
            }
        } else {
            $this->datas = [
                'is_pay' => 0,
                'order_info' => '',
                'order_id' => $order_id,
            ];
        }

    }

    public function getPrice()
    {
        $this->checkUser(true);
        $bargain_item_id = (int)$this->request->param('bargain_item_id', 0);
        $BargainItemModel = new BargainItemModel();
        if (!$bargain_item = $BargainItemModel->find($bargain_item_id)) {
            $this->warning("参数不正确！");
        }
        $BargainModel = new BargainModel();
        if (!$bargain = $BargainModel->find($bargain_item->bargain_id)) {
            $this->warning("参数不正确！");
        }
        if ($bargain->is_online == 0 || $bargain->num == 0) {
            $this->warning("对不起,当前砍价活动商品已售罄！");
        }
        $GoodsModel = new GoodsModel();
        if (!$goods = $GoodsModel->find($bargain->goods_id)) {
            $this->warning("参数不正确！");
        }
        if ($goods->is_online == 0 || $goods->is_delete == 1) {
            $this->warning("对不起，商品已下架！");
        }
        //是否砍完
        if ($bargain_item->is_success == 0) {
            $this->warning("未获得购买资格");
        }
        if ($bargain_item->is_pay == 1) {
            $this->warning("您已经下单了 无法继续下单");
        }
        if ($bargain_item->pay_end_time < time()) {
            $this->warning("对不起 该活动已失效");
        }
        //在判断 是否已经下单
        $OrderModel = new OrderModel();
        $order = $OrderModel->where("prom_id", $bargain_item_id)
            ->where("prom_type", getMean("shop_prom_type", 'k')['kj'])
            ->where("user_id", $this->userId)->find();
        if (!empty($order)) {
            $this->warning("您已经下单了 无法继续下单");
        }

        $use_money = (int)$this->request->param("use_money");
        $UserModel = new UserModel();
        $user = $UserModel->findUser($this->userId);
        $FreightLogic = new FreightLogic();
        $FreightLogic->setGoodsModel($goods);
        $FreightLogic->setRegionId($bargain_item->division_id);
        $FreightLogic->setGoodsNum(1);
        $FreightLogic->doCalculation();
        $shipping_price = $FreightLogic->getFreight();
        $total_price = $shipping_price + $bargain_item->bargain_price;
        $user_money = 0;
        if ($use_money == 1) {
            if ($user->getUserMoney() >= $total_price) {
                $user_money = $total_price;
            } else {
                $user_money = $user->getUserMoney();
            }
        }
        $payment_price = $total_price - $user_money;
        $this->datas = [
            'goods_name' => $goods->goods_name,
            'key_name' => $bargain_item->key_name,
            'photo' => $goods->photo,
            'shop_price' => moneyFormat($bargain_item->shop_price),
            'bargain_price' => moneyFormat($bargain_item->bargain_price),
            'shipping_price' => moneyFormat($payment_price),
            'address' => $bargain_item->address,
            'name' => $bargain_item->name,
            'mobile' => $bargain_item->mobile,
        ];
    }

    //个人中心我的砍价
    public function getMyBargain()
    {
        $this->checkUser(true);
        $BargainItemModel = new BargainItemModel();
        $where = [
            'user_id' => $this->userId,
        ];
        $bargain_item_tmp = $BargainItemModel->where($where)->select();
        $list = [];
        foreach ($bargain_item_tmp as $v) {
            $list[] = [
                'bargain_item_id' => $v->bargain_item_id,
                'bargain_id' => $v->bargain_id,
                'goods_id' => $v->goods_id,
                'spec_key' => $v->spec_key,
                'key_name' => $v->key_name,
                'goods_name' => $v->goods_name,
                'photo' => $v->photo,
                'shop_price' => moneyFormat($v->shop_price, true),
                'bargain_price' => moneyFormat($v->bargain_price, true),
                'now_price' => moneyFormat($v->now_price, true),
                'surplus_price' => moneyFormat(($v->init_price - $v->bargain_price - $v->now_price), true),
                'kan_price' => moneyFormat(($v->init_price - $v->bargain_price), true),
                'end_time' => $v->end_time - time() > 0 ? $v->end_time - time() : 0,
                'is_invalid' => $v->is_invalid,
                'is_pay' => $v->is_pay,
                'is_success' => $v->is_success,
            ];
        }
        $this->datas = [
            'list' => $list,
            'isMore' => (int)(count($list) == $this->limit),
        ];
    }


}
