<?php

namespace app\shop\controller\admin\finance;

use app\shop\controller\admin\Common;
use app\shop\model\shop\IntegralOrderModel;
use app\shop\model\shop\OrderGoodsModel;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\RechargeModel;
use app\shop\model\shop\VipOrderModel;

use think\Exception;

class Shop extends Common
{

    //简单数据统计
    public function Index() {
        $date_begin = (int) ($this->request->param('date_begin','','strtotime'));
        $date_end = (int) ($this->request->param('date_end','','strtotime'));
        $device = (string) $this->request->param('device','');
        if (!$date = checkSevenDays($date_begin,$date_end)) {
            $this->warning('统计时间跨度不得超过7天,并且开始时间不得大于结束时间');
        } else {
            $date_begin = $date['date_begin'];
            $date_end = $date['date_end'];
        }
        $where = [
            'app_id' => $this->appId,
            'pay_status' => 1,
            'pay_time' => ['between',[$date_begin,$date_end]],
        ];
        $fahuo_where = [
            'app_id' => $this->appId,
            'shipping_status' => 0,
            'order_status' => ['<',2],
            'pay_status' => 1,
        ];

        if ($device) {
            $where['device'] = $device;
            $fahuo_where['device'] = $device;
        }

        $tuikuan_where = [
            'app_id' => $this->appId,
            'pay_status' => 2,
            'order_status' => ['<',2],
            'device' => $device,
        ];
        $OrderModel = new OrderModel();
        $VipOrderModel = new VipOrderModel();
        $IntegralOrderModel = new IntegralOrderModel();
        $RechargeModel = new RechargeModel();

        $order_res = $OrderModel->field(["SUM(payment_price)"=>'pay_money',"SUM(user_money)"=>'use_money',"COUNT(order_id)"=>'order_num','user_id'])->where($where)->select();
        $integral_order_res = $IntegralOrderModel->field(["SUM(payment_money)"=>'pay_money',"SUM(user_money)"=>'use_money',"COUNT(order_id)"=>'order_num','user_id'])->where($where)->select();
        $vip_order_res = $VipOrderModel->field(["SUM(all_money)"=>'pay_money',"COUNT(order_id)"=>'order_num'])->where(['app_id' => $this->appId,'is_pay'=>1,'add_time'=>['between',[$date_begin,$date_end]]])->select();
        $recharge_order_res = $RechargeModel->field(["SUM(money)"=>'pay_money',"COUNT(rec_id)"=>'order_num','user_id'])->where(['app_id'=>$this->appId,'is_pay'=>1,'add_time'=>['between',[$date_begin,$date_end]]])->select();
        $order_fahuo_num = $OrderModel->where($fahuo_where)->count();
        $integral_order_fahuo_num = $IntegralOrderModel->where($fahuo_where)->count();
        $tuikuan_order_num = $OrderModel->where($tuikuan_where)->count();

        $order_money = (int)($order_res[0]['pay_money'] + $order_res[0]['use_money']);
        $integral_order_money = (int)($integral_order_res[0]['pay_money'] + $integral_order_res[0]['use_money']);
        $vip_order_money = (int)$vip_order_res[0]['pay_money'];
        $recharge_order_money = (int)$recharge_order_res[0]['pay_money'];
        $datas = [
            'order_money' => moneyFormat($order_money,true),
            'order_num' => $order_res[0]['order_num'],
            'integral_order_money' => moneyFormat($integral_order_money,true),
            'integral_order_num' => $integral_order_res[0]['order_num'],
            'vip_order_money' => moneyFormat($vip_order_money,true),
            'vip_order_num' => $vip_order_res[0]['order_num'],
            'recharge_order_money' => moneyFormat($recharge_order_money,true),
            'recharge_order_num' => $recharge_order_res[0]['order_num'],
            'order_fahuo_num' => $order_fahuo_num,
            'integral_order_fahuo_num' => $integral_order_fahuo_num,
            'tuikuan_order_num' => $tuikuan_order_num,
        ];

        $this->datas = $datas;
    }



    //营收统计
    public function revenue() {
        $date_end = (int) ($this->request->param('date_end','','strtotime'));
        if (!$date_end) {
            $date_end = strtotime(date("Y-m-d",time())) + 86400;
            $date_start = strtotime(date("Y-m-d",time())) - (6*86400);
        } else {
            $date_end = $date_end + 86400;
            $date_start = strtotime(date("Y-m-d",time())) - (6*86400);
        }

        $where = [
            'app_id' => $this->appId,
            'pay_status' => 1,
//            'pay_time' => ['between',[$date_start,$date_end]],
        ];
        $vip_where = [
            'app_id' => $this->appId,
            'is_pay' => 1,
        ];

        $OrderModel = new OrderModel();
        $IntegralOrderModel = new IntegralOrderModel();
        $VipOrderModel = new VipOrderModel();
        $RechargeModel = new RechargeModel();

        $order_res_1 = $OrderModel->field(["SUM(payment_price)"=>'pay_money',"SUM(user_money)"=>'use_money',"COUNT(order_id)"=>'order_num','user_id'])->where($where)->where(['pay_time'=>['between',[$date_end-86400,$date_end]]])->select();
        $order_res_2 = $OrderModel->field(["SUM(payment_price)"=>'pay_money',"SUM(user_money)"=>'use_money',"COUNT(order_id)"=>'order_num','user_id'])->where($where)->where(['pay_time'=>['between',[$date_end-172800,$date_end-86400]]])->select();
        $order_res_3 = $OrderModel->field(["SUM(payment_price)"=>'pay_money',"SUM(user_money)"=>'use_money',"COUNT(order_id)"=>'order_num','user_id'])->where($where)->where(['pay_time'=>['between',[$date_end-259200,$date_end-172800]]])->select();
        $order_res_4 = $OrderModel->field(["SUM(payment_price)"=>'pay_money',"SUM(user_money)"=>'use_money',"COUNT(order_id)"=>'order_num','user_id'])->where($where)->where(['pay_time'=>['between',[$date_end-345600,$date_end-259200]]])->select();
        $order_res_5 = $OrderModel->field(["SUM(payment_price)"=>'pay_money',"SUM(user_money)"=>'use_money',"COUNT(order_id)"=>'order_num','user_id'])->where($where)->where(['pay_time'=>['between',[$date_end-432000,$date_end-345600]]])->select();
        $order_res_6 = $OrderModel->field(["SUM(payment_price)"=>'pay_money',"SUM(user_money)"=>'use_money',"COUNT(order_id)"=>'order_num','user_id'])->where($where)->where(['pay_time'=>['between',[$date_end-518400,$date_end-432000]]])->select();
        $order_res_7 = $OrderModel->field(["SUM(payment_price)"=>'pay_money',"SUM(user_money)"=>'use_money',"COUNT(order_id)"=>'order_num','user_id'])->where($where)->where(['pay_time'=>['between',[$date_end-604800,$date_end-518400]]])->select();

        $integral_order_res_1 = $IntegralOrderModel->field(["SUM(payment_money)"=>'pay_money'])->where($where)->where(['pay_time'=>['between',[$date_end-86400,$date_end]]])->select();
        $integral_order_res_2 = $IntegralOrderModel->field(["SUM(payment_money)"=>'pay_money'])->where($where)->where(['pay_time'=>['between',[$date_end-172800,$date_end-86400]]])->select();
        $integral_order_res_3 = $IntegralOrderModel->field(["SUM(payment_money)"=>'pay_money'])->where($where)->where(['pay_time'=>['between',[$date_end-259200,$date_end-172800]]])->select();
        $integral_order_res_4 = $IntegralOrderModel->field(["SUM(payment_money)"=>'pay_money'])->where($where)->where(['pay_time'=>['between',[$date_end-345600,$date_end-259200]]])->select();
        $integral_order_res_5 = $IntegralOrderModel->field(["SUM(payment_money)"=>'pay_money'])->where($where)->where(['pay_time'=>['between',[$date_end-432000,$date_end-345600]]])->select();
        $integral_order_res_6 = $IntegralOrderModel->field(["SUM(payment_money)"=>'pay_money'])->where($where)->where(['pay_time'=>['between',[$date_end-518400,$date_end-432000]]])->select();
        $integral_order_res_7 = $IntegralOrderModel->field(["SUM(payment_money)"=>'pay_money'])->where($where)->where(['pay_time'=>['between',[$date_end-604800,$date_end-518400]]])->select();

        $vip_order_res_1 = $VipOrderModel->field(["SUM(all_money)"=>'pay_money'])->where($vip_where)->where(['pay_time'=>['between',[$date_end-86400,$date_end]]])->select();
        $vip_order_res_2 = $VipOrderModel->field(["SUM(all_money)"=>'pay_money'])->where($vip_where)->where(['pay_time'=>['between',[$date_end-172800,$date_end-86400]]])->select();
        $vip_order_res_3 = $VipOrderModel->field(["SUM(all_money)"=>'pay_money'])->where($vip_where)->where(['pay_time'=>['between',[$date_end-259200,$date_end-172800]]])->select();
        $vip_order_res_4 = $VipOrderModel->field(["SUM(all_money)"=>'pay_money'])->where($vip_where)->where(['pay_time'=>['between',[$date_end-345600,$date_end-259200]]])->select();
        $vip_order_res_5 = $VipOrderModel->field(["SUM(all_money)"=>'pay_money'])->where($vip_where)->where(['pay_time'=>['between',[$date_end-432000,$date_end-345600]]])->select();
        $vip_order_res_6 = $VipOrderModel->field(["SUM(all_money)"=>'pay_money'])->where($vip_where)->where(['pay_time'=>['between',[$date_end-518400,$date_end-432000]]])->select();
        $vip_order_res_7 = $VipOrderModel->field(["SUM(all_money)"=>'pay_money'])->where($vip_where)->where(['pay_time'=>['between',[$date_end-604800,$date_end-518400]]])->select();

        $recharge_order_res_1 = $RechargeModel->field(["SUM(money)"=>'pay_money'])->where($vip_where)->where(['add_time'=>['between',[$date_end-86400,$date_end]]])->select();
        $recharge_order_res_2 = $RechargeModel->field(["SUM(money)"=>'pay_money'])->where($vip_where)->where(['add_time'=>['between',[$date_end-172800,$date_end-86400]]])->select();
        $recharge_order_res_3 = $RechargeModel->field(["SUM(money)"=>'pay_money'])->where($vip_where)->where(['add_time'=>['between',[$date_end-259200,$date_end-172800]]])->select();
        $recharge_order_res_4 = $RechargeModel->field(["SUM(money)"=>'pay_money'])->where($vip_where)->where(['add_time'=>['between',[$date_end-345600,$date_end-259200]]])->select();
        $recharge_order_res_5 = $RechargeModel->field(["SUM(money)"=>'pay_money'])->where($vip_where)->where(['add_time'=>['between',[$date_end-432000,$date_end-345600]]])->select();
        $recharge_order_res_6 = $RechargeModel->field(["SUM(money)"=>'pay_money'])->where($vip_where)->where(['add_time'=>['between',[$date_end-518400,$date_end-432000]]])->select();
        $recharge_order_res_7 = $RechargeModel->field(["SUM(money)"=>'pay_money'])->where($vip_where)->where(['add_time'=>['between',[$date_end-604800,$date_end-518400]]])->select();


        $order_shouru = [
            moneyFormat($order_res_7[0]['pay_money'] + $order_res_1[0]['use_money']),
            moneyFormat($order_res_6[0]['pay_money'] + $order_res_1[0]['use_money']),
            moneyFormat($order_res_5[0]['pay_money'] + $order_res_1[0]['use_money']),
            moneyFormat($order_res_4[0]['pay_money'] + $order_res_1[0]['use_money']),
            moneyFormat($order_res_3[0]['pay_money'] + $order_res_1[0]['use_money']),
            moneyFormat($order_res_2[0]['pay_money'] + $order_res_1[0]['use_money']),
            moneyFormat($order_res_1[0]['pay_money'] + $order_res_1[0]['use_money']),
        ];

        $integral_order_shouru = [
            moneyFormat($integral_order_res_7[0]['pay_money']),
            moneyFormat($integral_order_res_6[0]['pay_money']),
            moneyFormat($integral_order_res_5[0]['pay_money']),
            moneyFormat($integral_order_res_4[0]['pay_money']),
            moneyFormat($integral_order_res_3[0]['pay_money']),
            moneyFormat($integral_order_res_2[0]['pay_money']),
            moneyFormat($integral_order_res_1[0]['pay_money']),
        ];

        $vip_order_shouru = [
            moneyFormat($vip_order_res_7[0]['pay_money']),
            moneyFormat($vip_order_res_6[0]['pay_money']),
            moneyFormat($vip_order_res_5[0]['pay_money']),
            moneyFormat($vip_order_res_4[0]['pay_money']),
            moneyFormat($vip_order_res_3[0]['pay_money']),
            moneyFormat($vip_order_res_2[0]['pay_money']),
            moneyFormat($vip_order_res_1[0]['pay_money']),
        ];

        $recharge_order_shouru = [
            moneyFormat($recharge_order_res_7[0]['pay_money']),
            moneyFormat($recharge_order_res_6[0]['pay_money']),
            moneyFormat($recharge_order_res_5[0]['pay_money']),
            moneyFormat($recharge_order_res_4[0]['pay_money']),
            moneyFormat($recharge_order_res_3[0]['pay_money']),
            moneyFormat($recharge_order_res_2[0]['pay_money']),
            moneyFormat($recharge_order_res_1[0]['pay_money']),
        ];

        $dates = [
            date("m-d",$date_end-604800),
            date("m-d",$date_end-518400),
            date("m-d",$date_end-432000),
            date("m-d",$date_end-345600),
            date("m-d",$date_end-259200),
            date("m-d",$date_end-172800),
            date("m-d",$date_end-86400),
        ];

        $this->datas = [
            'date' => $dates,
            'order_shouru' => $order_shouru,
            'integral_order_shouru' => $integral_order_shouru,
            'vip_order_shouru' => $vip_order_shouru,
            'recharge_order_shouru' => $recharge_order_shouru,
        ];
    }


    //热销商品榜
    public function hotGoods() {
        $date_begin = (int) ($this->request->param('date_begin','','strtotime'));
        $date_end = (int) ($this->request->param('date_end','','strtotime'));
        if (!$date = checkSevenDays($date_begin,$date_end)) {
            $this->warning('统计时间跨度不得超过7天,并且开始时间不得大于结束时间');
        } else {
            $date_begin = $date['date_begin'];
            $date_end = $date['date_end'];
        }

        $OrderModel = new OrderModel();
        $order_where = [
            'app_id' => $this->appId,
            'pay_status' => 1,
            'pay_time' => ['between',[$date_begin,$date_end]],
        ];

        $device = (string) $this->request->param('device','');
        if ($device) {
            $order_where['device'] = $device;
        }



        $orderIds = $OrderModel->where($order_where)->column('order_id');
        $orderIds = empty($orderIds) ? '' : $orderIds;
        $OrderGoodsModel = new OrderGoodsModel();
        $order_goods_where = [
            'order_id' => ['in',$orderIds]
        ];
        $order_goods_tmp = $OrderGoodsModel->field(["count(goods_id)"=>'order_num','goods_id','goods_name','goods_num','goods_photo'])->where($order_goods_where)->group('goods_id')->order('order_num desc')->limit(0,5)->select();

        $hot_goods = [];
        foreach ($order_goods_tmp as $v) {
            $hot_goods[] = [
                'goods_id' => $v->goods_id,
                'goods_name' => $v->goods_name,
                'order_num' => $v->order_num,
                'goods_photo' => $v->goods_photo,
            ];
        }
        $this->datas = $hot_goods;
    }


    //支付设备榜
    public function hotDevice() {
        $date_begin = (int) ($this->request->param('date_begin','','strtotime'));
        $date_end = (int) ($this->request->param('date_end','','strtotime'));
        if (!$date = checkSevenDays($date_begin,$date_end)) {
            $this->warning('统计时间跨度不得超过7天,并且开始时间不得大于结束时间');
        } else {
            $date_begin = $date['date_begin'];
            $date_end = $date['date_end'];
        }

        $OrderModel = new OrderModel();
        $IntegralOrderModel = new IntegralOrderModel();
        $VipOrderModel = new VipOrderModel();
        $RechargeModel = new RechargeModel();
        $order_where = [
            'app_id' => $this->appId,
            'pay_status' => 1,
            'pay_time' => ['between',[$date_begin,$date_end]],
        ];
        $vip_order_where = [
            'app_id' => $this->appId,
            'is_pay' => 1,
            'add_time' => ['between',[$date_begin,$date_end]],
        ];

        $order_device_tmp = $OrderModel->field(["count(device)"=>'device_count','device'])->where($order_where)->group('device')->select();
        $integral_order_device_tmp = $IntegralOrderModel->field(["count(device)"=>'device_count','device'])->where($order_where)->group('device')->select();
        $vip_order_device_tmp = $VipOrderModel->field(["count(device)"=>'device_count','device'])->where($vip_order_where)->group('device')->select();
        $recharge_order_device_tmp = $RechargeModel->field(["count(device)"=>'device_count','device'])->where($vip_order_where)->group('device')->select();

        $device_map = [
            '' => '未知',
            'weixin' => '微信小程序',
            'ali' => '支付宝小程序',
            'toutiao' => '头条小程序',
            'baidu' => '百度小程序',
            'h5' => 'h5',
        ];
        $device = ['weixin'=>0,'ali'=>0,'toutiao'=>0,'baidu'=>0,'h5'=>0];
        $_device = [];
        foreach ($order_device_tmp as $v) {
            $device[$v->device] = $v->device_count;
        }
        foreach ($integral_order_device_tmp as $v) {
            $device[$v->device] = $device[$v->device] + $v->device_count;
        }

        foreach ($vip_order_device_tmp as $v) {
            $device[$v->device] = $device[$v->device] + $v->device_count;
        }
        foreach ($recharge_order_device_tmp as $v) {
            $device[$v->device] = $device[$v->device] + $v->device_count;
        }
        foreach ($device as $k=>$v) {
            $_device[$device_map[$k]] = $v;
        }

        $this->datas = $_device;

    }
}


//$order_shouru = [
//    date("m-d",$date_end-518400) => moneyFormat($order_res_7[0]['pay_money'] + $order_res_1[0]['use_money']),
//    date("m-d",$date_end-432000) => moneyFormat($order_res_6[0]['pay_money'] + $order_res_1[0]['use_money']),
//    date("m-d",$date_end-345600) => moneyFormat($order_res_5[0]['pay_money'] + $order_res_1[0]['use_money']),
//    date("m-d",$date_end-259200) => moneyFormat($order_res_4[0]['pay_money'] + $order_res_1[0]['use_money']),
//    date("m-d",$date_end-172800) => moneyFormat($order_res_3[0]['pay_money'] + $order_res_1[0]['use_money']),
//    date("m-d",$date_end -86400) => moneyFormat($order_res_2[0]['pay_money'] + $order_res_1[0]['use_money']),
//    date("m-d",$date_end) => moneyFormat($order_res_1[0]['pay_money'] + $order_res_1[0]['use_money']),
//];
//
//$integral_order_shouru = [
//    date("m-d",$date_end-518400) => moneyFormat($integral_order_res_7[0]['pay_money']),
//    date("m-d",$date_end-432000) => moneyFormat($integral_order_res_6[0]['pay_money']),
//    date("m-d",$date_end-345600) => moneyFormat($integral_order_res_5[0]['pay_money']),
//    date("m-d",$date_end-259200) => moneyFormat($integral_order_res_4[0]['pay_money']),
//    date("m-d",$date_end-172800) => moneyFormat($integral_order_res_3[0]['pay_money']),
//    date("m-d",$date_end -86400) => moneyFormat($integral_order_res_2[0]['pay_money']),
//    date("m-d",$date_end) => moneyFormat($integral_order_res_1[0]['pay_money']),
//];
//
//$vip_order_shouru = [
//    date("m-d",$date_end-518400) => moneyFormat($vip_order_res_7[0]['pay_money']),
//    date("m-d",$date_end-432000) => moneyFormat($vip_order_res_6[0]['pay_money']),
//    date("m-d",$date_end-345600) => moneyFormat($vip_order_res_5[0]['pay_money']),
//    date("m-d",$date_end-259200) => moneyFormat($vip_order_res_4[0]['pay_money']),
//    date("m-d",$date_end-172800) => moneyFormat($vip_order_res_3[0]['pay_money']),
//    date("m-d",$date_end -86400) => moneyFormat($vip_order_res_2[0]['pay_money']),
//    date("m-d",$date_end) => moneyFormat($vip_order_res_1[0]['pay_money']),
//];
//
//$recharge_order_shouru = [
//    date("m-d",$date_end-518400) => moneyFormat($recharge_order_res_7[0]['pay_money']),
//    date("m-d",$date_end-432000) => moneyFormat($recharge_order_res_6[0]['pay_money']),
//    date("m-d",$date_end-345600) => moneyFormat($recharge_order_res_5[0]['pay_money']),
//    date("m-d",$date_end-259200) => moneyFormat($recharge_order_res_4[0]['pay_money']),
//    date("m-d",$date_end-172800) => moneyFormat($recharge_order_res_3[0]['pay_money']),
//    date("m-d",$date_end -86400) => moneyFormat($recharge_order_res_2[0]['pay_money']),
//    date("m-d",$date_end) => moneyFormat($recharge_order_res_1[0]['pay_money']),
//];