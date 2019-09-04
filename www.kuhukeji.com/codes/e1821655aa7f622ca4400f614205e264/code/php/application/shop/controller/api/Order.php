<?php

namespace app\shop\controller\api;

use app\shop\logic\shop\order\OrderUserLogic;
use app\shop\model\shop\CommentModel;
use app\shop\model\shop\OrderGoodsModel;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\OrderRejectModel;
use app\shop\model\shop\SettingModel;
use think\Exception;


class Order extends ShopCommon
{
    protected $checkLogin = true;

    /**
     * 我的订单列表
     * $type 0 全部 1待付款 2待发货 3待收货 4待评价
     */
    public function index()
    {
        $type = (int)$this->request->param('type', 0);
        $where = [
            'user_id' => $this->userId,
            'user_deleted' => 0,
        ];
        switch ($type) {
            case 1: //待付款
                $where['pay_status'] = 0;
                $where['end_time'] = [">", time()];
                break;
            case 2: //代发货
                $where['pay_status'] = 1;
//                $where['order_status'] = 1;
                $where['shipping_status'] = 0;
                break;
            case 3: //
                $where['order_status'] = 1;
                $where['shipping_status'] = 1;
                break;
            case 4:
                $where['order_status'] = 2;
                $where['is_comment'] = 0;
                break;
            case 5:
                $where['pay_status'] = 2;
                break;
        }

        $OrderModel = new OrderModel();
        $list = $OrderModel->where($where)->order("order_id desc")->page($this->page, $this->limit)->select();
        $orderIds = [];
        foreach ($list as $val) {
            $orderIds[$val->order_id] = $val->order_id;
        }
        $OrderGoodsModel = new OrderGoodsModel();
        $whereOrderIds = empty($orderIds) ? '' : $orderIds;
        $goodsList = $OrderGoodsModel->whereIn("order_id", $whereOrderIds)->select();
        $goods = [];
        foreach ($goodsList as $val) {
            $goods[$val->order_id][] = [
                'goods_id' => $val->goods_id,
                'goods_name' => $val->goods_name,
                'goods_num' => $val->goods_num,
                'goods_price' => moneyFormat($val->goods_price, true),
                'vip_price' => moneyFormat($val->vip_price, true),
                'spec_key_name' => $val->spec_key_name,
                'goods_photo' => $val->goods_photo,
            ];
        }
        $datas = [];
        $invalid_order = [];
        foreach ($list as $val) {
            $goods_num = 0;
            foreach ($goods[$val->order_id] as $v) {
                $goods_num = $v['goods_num'] + $goods_num;
            }
            $datas[] = [
                'order_id' => $val->order_id,
                'order_sn' => $val->order_sn,
                'order_goods' => $goods[$val->order_id],
                'all_price' => moneyFormat($val->payment_price + $val->user_money , true),
                'expire_time' =>  $val->end_time > time() ? $val->end_time - time()  : 0,
                'order_status' => $val->orderStatusDetail['order_type'],
                'order_status_mean' => $val->orderStatusDetail['order_type_mean'],
                'goods_num' => $goods_num,
                'shipping_price' => moneyFormat($val->shipping_price, true),
            ];
        }
        if (!empty($invalid_order)) {
            $OrderModel->isUpdate(true)->saveAll($invalid_order);
        }
        $this->datas = [
            'list' => $datas,
            'isMore' => (int)count($datas) == $this->limit,
        ];

    }


    //订单详情
    public function getDetail()
    {
        $order_id = (int)$this->request->param('order_id');
        $OrderModel = new OrderModel();
        $OrderGoodsModel = new OrderGoodsModel();
        if (!$order = $OrderModel->find($order_id)) {
            $this->noPage('参数不正确！');
        }
        if (!$order_goods_tmp = $OrderGoodsModel->where(['order_id' => $order_id])->select()) {
            $this->noPage('订单信息不正确！');
        }
        if ($order->user_id != $this->userId) {
            $this->noPage("订单信息不正确！");
        }

        $CommentModel = new CommentModel();
        $comments_tmp = $CommentModel->where(['order_id' => $order_id])->select();
        $is_comment = 1;
        $order_goods = [];
        foreach ($order_goods_tmp as $v) {
            $goods_comment = [];
            foreach ($comments_tmp as $val) {
                if ($val->goods_id == $v->goods_id && $val->is_comment == 0) {
                    $is_comment = 0;
                    $goods_comment[$v->goods_id] = $val->comment_id;
                }
            }
            $order_goods[] = [
                'rec_id' => $v->rec_id,
                'order_id' => $v->order_id,
                'goods_id' => $v->goods_id,
                'goods_name' => $v->goods_name,
                'goods_num' => $v->goods_num,
                'spec_key_name' => $v->spec_key_name,
                'goods_photo' => $v->goods_photo,
                'can_comment' => (int)(!$is_comment && $order->order_status == 4),
                'comment_id' => isset($goods_comment[$v->goods_id]) ? (int)$goods_comment[$v->goods_id] : 0,
            ];
        }
        $final_price = $order->payment_price + $order->user_money;
        $data = [
            'order_status' => $order->orderStatusDetail['order_type'],
            'order_status_mean' => $order->orderStatusDetail['order_type_mean'],
            'prom_type' => $order->prom_id > 0 ? getMean('shop_prom_type')[$order->prom_id] : '',
            'name' => $order->getAttr('name'),
            'address' => $order->address,
            'mobile' => $order->mobile,
            'goods_price' => moneyFormat($order->goods_price, true),
            'user_money' => moneyFormat($order->user_money, true),
            'coupon_price' => moneyFormat($order->coupon_price,true),
            'youhui_price' => moneyFormat($order->youhui_price,true),
            'payment_price' => moneyFormat($order->payment_price, true),
            'shipping_price' => moneyFormat($order->shipping_price, true),
            'final_price' => moneyFormat($final_price, true),
            'pay_type' => $order->pay_type,
            'shipping_name' => (string) $order->shipping_name,
            'shipping_num' => (string) $order->shipping_num,
            'pay_type_mean' => $order->pay_type ? getMean('order_payment_method')[$order->pay_type] : '--',
            'order_goods' => $order_goods,
            'order_sn' => $order->order_sn,
            'add_time' => date("Y-m-d H:i:s", $order->add_time),
            'expire_time' => $order->end_time - time() > 0 ? $order->end_time - time() : 0,
        ];

        if ($order->pay_status > 1) {
            $OrderRejectModel = new OrderRejectModel();
            if ($order_reject = $OrderRejectModel->find($order_id)) {
                $data['reject_goods_status'] = $order_reject->reject_goods_status;
                $data['reject_goods_status_mean'] = getMean('user_goods_status')[$order_reject->reject_goods_status];
            }
        }
        $this->datas = $data;
    }

    //获得物流信息
    public function getShippingInfo()
    {
        $order_id = (int)$this->request->param('order_id');
        $OrderUserLogic = new OrderUserLogic();
        try {
            $OrderUserLogic->setOrderId($order_id);
            $res = $OrderUserLogic->getOrderTrail();
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
        $order_detail = $OrderUserLogic->getOrderDetail();
        $this->datas = [
            'data' => $res['data'],
            'is_open' => $res['is_open'],
            'shipping_status' => getMean('order_shipping_status')[$order_detail['shipping_status']],
            'shipping_num' => $order_detail['shipping_num'],
            'shipping_name' => $order_detail['shipping_name'],
        ];
    }

    //准备评价订单
    public function orderComment()
    {
        $SettingModel = new SettingModel();
        $setting = $SettingModel->find($this->appId);

        $rec_id = (int)$this->request->param('rec_id');
        $OrderGoodsModel = new OrderGoodsModel();
        if (!$order_goods = $OrderGoodsModel->find($rec_id)) {
            $this->warning("参数不正确");
        }
//        if ($order_goods->is_send == 0) {
//            $this->warning("商品尚未发货，无法评价！");
//        }
        $OrderModel = new OrderModel();
        if (!$order = $OrderModel->find()) {
            $this->warning("参数不正确！");
        }
        if ($order->app_id != $this->appId) {
            $this->warning("参数不正确！");
        }
        if ($order->user_id != $this->userId) {
            $this->noPage("订单信息不正确！");
        }
        $CommentModel = new CommentModel();
        $no_comment_tmp = $CommentModel->where(['rec_id' => $rec_id, 'is_comment' => 0])->find();
        $no_comment = [
            'comment_id' => (int)$no_comment_tmp->comment_id,
            'order_id' => (int)$no_comment_tmp->order_id,
            'title' => (string)$no_comment_tmp->title,
            'photo' => (string)$no_comment_tmp->photo,
            'desc' => "5星好评赠送{$setting->integral_five_stars_comment}积分，带图评论再送{$setting->integral_whith_photo_comment}积分。(评论审核通过后生效)",
        ];
        $this->datas = $no_comment;
    }

    //评价订单
    public function setOrderComment()
    {
        $SettingModel = new SettingModel();
        $setting = $SettingModel->find($this->appId);

        $comment_id = (int)$this->request->param('comment_id', '', 0);
        $content = (string)$this->request->param('content', '', 'SecurityEditorHtml');
        $rank = (int)$this->request->param('rank', 5);

        if ($rank < 1 || $rank > 5) {
            $this->warning('请在1-5星中选择一个!');
        }

        $photos = (string)$this->request->param('photos', '', 'SecurityEditorHtml');
        $photos_array = json_decode($photos) ? json_decode($photos, true) : [];
        $integral = 0;
        if ($rank == 5) {
            $integral = $integral + $setting->integral_five_stars_comment;
            if (!empty($photos_array)) {
                $integral = $integral + $setting->integral_whith_photo_comment;
            }
        }

        $CommentModel = new CommentModel();
        if (!$comment = $CommentModel->find($comment_id)) {
            $this->warning('参数不正确！');
        }
        if ($comment->user_id != $this->userId) {
            $this->noPage("订单信息不正确！");
        }
        if ($comment->is_comment == 1) {
            $this->noPage("订单已评价！");
        }
        $data = [
            'comment_id' => $comment->comment_id,
            'content' => $content,
            'img' => $photos,
            'goods_rank' => $rank,
            'integral' => $integral,
            'is_comment' => 1,
        ];
        $CommentModel->isUpdate(true)->save($data);

        if ($CommentModel->where(['order_id' => $comment->order_id, 'goods_rank' => 0])->count() == 0) {
            $OrderModel = new OrderModel();
            $OrderModel->isUpdate(true)->save(['is_comment' => 1], ['order_id' => $comment->order_id]);
        }

    }

    //申请退款(获得选项)
    public function applyRefund()
    {
        $this->datas = [
            'goods_status' => statusToMap(getMean('goods_status')),
            'no_goods_reject_reason' => statusToMap(getMean('no_goods_reject_reason')),
            'has_goods_reject_reason' => statusToMap(getMean('has_goods_reject_reason')),
        ];
    }

    //申请退款提交
    public function applyRefundSub()
    {
        $order_id = (int)$this->request->param('order_id', 0);
        $reject_goods_status = (int)$this->request->param('reject_goods_status', 0);
        $reject_reason = (int)$this->request->param('reject_reason', 0);
        $reject_content = (string)$this->request->param('reject_content', '', 'SecurityEditorHtml');
        $reject_photos = (string)$this->request->param('reject_photos', '', 'SecurityEditorHtml');
        $OrderModel = new OrderModel();
        if (!$order = $OrderModel->find($order_id)) {
            $this->warning('参数不正确！');
        }
        if ($order->user_id != $this->userId) {
            $this->warning('参数不正确');
        }
        if ($order->pay_status > 1) {
            $this->warning('当前订单已退款或已申请退款，请不要重复操作！');
        }

        $OrderRejectModel = new OrderRejectModel();
        if ($reject = $OrderRejectModel->where(['order_id'=>$order_id])->find()) {
            $this->warning('当前订单已申请退款，请不要重复操作！');
        }
        $data = [
            'order_id' => $order_id,
            'app_id' => $this->appId,
            'user_id' => $this->userId,
            'name' => $order->getAttr('name'),
            'mobile' => $order->mobile,
            'reject_goods_status' => $reject_goods_status,
            'reject_reason' => $reject_reason,
            'reject_content' => $reject_content,
            'reject_photos' => $reject_photos,
        ];
        $OrderRejectModel->save($data);
        $OrderModel->isUpdate(true)->save(['pay_status' => 2], ['order_id' => $order_id]);
    }


    /**
     * 确认收货
     */
    public function confirmOrder()
    {
        $order_id = (int)$this->request->param('order_id');
        $OrderModel = new OrderModel();
        if (!$order = $OrderModel->find($order_id)) {
            $this->warning("参数错误！");
        }
        if ($order->user_id != $this->userId) {
            $this->warning("参数错误！");
        }
        if($order->order_status != 1){
            $this->warning("该状态不可提交");
        }
        //确认收货  写评论表
        $comment_data = [];
        $OrderGoodsModel = new OrderGoodsModel();
        $orderGoods = $OrderGoodsModel->where(['order_id' => $order_id])->select();
        if (empty($orderGoods)) {
            $this->warning("订单商品为空!");
        }
        foreach ($orderGoods as $v) {
            $comment_data[] = [
                'goods_id' => $v->goods_id,
                'app_id' => $this->appId,
                'order_id' => $v->order_id,
                'user_id' => $order->user_id,
                'username' => $order->getAttr('name'),
                'title' => $v->goods_name,
                'photo' => $v->goods_photo,
                'rec_id' => $v->rec_id,
                'goods_rank' => 5,
                'is_comment' => 0,
            ];
        }
        $CommentModel = new CommentModel();
        $CommentModel->saveAll($comment_data);
        $OrderModel->isUpdate(true)->save(['order_status' => 2], ['order_id' => $order_id]);
    }



    public function delOrder() {
        $order_id = (int) $this->request->param('order_id',0);
        $OrderModel = new OrderModel();
        if (!$order = $OrderModel->find($order_id)) {
            $this->warning('订单不存在！');
        }
        if ($order->user_id != $this->userId) {
            $this->warning('参数不正确!');
        }
        $OrderModel->isUpdate(true)->save(['user_deleted'=>1],['order_id'=>$order_id]);
    }


    public function getCommnet(){
        $where['user_id']  = $this->userId;
        $where['is_comment'] = 0;
        $CommentModel = new CommentModel();
        $list = $CommentModel->where($where)->order("comment_id desc")->page($this->page,$this->limit)->select();
        $datas = [];
        $goodsIds = [];
        foreach ($list as $val){
            $goodsIds[$val->goods_id] = $val->goods_id;
        }
        foreach ($list as $value){
            $datas[] = [
                'comment_id' => $value->comment_id,
                'goods_id' => $value->goods_id,
                'title' => $value->title,
                'photo' => $value->photo,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'isMore' => (int) ($this->limit == count($list)),
        ];
    }


    /**
     *  继续支付
     */
    public function continuePay() {
        $order_id = (int) $this->request->param('order_id',0);
        $payType = (string) $this->request->param("pay_type","wyu");
        empty($payType) && $payType = "wyu";
        $OrderUserLogic = new OrderUserLogic();
        try {
            $order = $OrderUserLogic->setOrderId($order_id)->setUserId($this->userId)->getOrderDetail();
            if ($order->pay_status != 0) {
                $this->warning('当前订单状态不支持继续支付!');
            }
            if ($order->order_status != 0) {
                $this->warning('当前订单状态不支持继续支付!');
            }

            $res = $OrderUserLogic->getPayOrderInfo($order,$this->openId, $this->device, $payType);
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }

        $this->datas = $res;



    }
}




