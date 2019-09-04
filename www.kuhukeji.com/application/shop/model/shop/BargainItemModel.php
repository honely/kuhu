<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;
use think\Exception;

class BargainItemModel extends CommonModel
{
    protected $pk = 'bargain_item_id';
    protected $name = 'app_shop_bargain_item';
    protected $insert = ["add_time", "add_ip"];


    /**
     * 砍价类型获取器
     * type: 1,分享给好友 多看一刀  2,帮好友砍一刀  3,我也要免费拿  4,尊贵VIP在砍一刀 ,5立即下单（请18:00之前下单） 6 砍价失败
     * @return int
     */
    public function getTypeAttr($key,$value){
        $itemDetail = json_decode(json_encode($value));
        $bargain_log = json_decode($itemDetail->bargain_log);
        $UserModel = new UserModel();
        if(!isset($itemDetail->this_user_id)){
            throw new  Exception("系统错误");
        }
        $thisUser = $UserModel->findUser($itemDetail->this_user_id);
        //先查询当前用户是否砍过
        $isKan = false;
        $kanNum = 0;
        foreach ($bargain_log as $val){
            if($itemDetail->this_user_id == $val->user_id){
                $isKan = true;
                $kanNum += 1;
            }
        }
        //假设 这是自己砍价
        $type = 1;
        //好友进来帮砍
        if(!empty($itemDetail->this_user_id) && $itemDetail->user_id != $itemDetail->this_user_id){
            $type = 2;
            $isKan && $type = 3;
        };
        //vip再砍一次
        $thisUser->checkVip() && $kanNum == 1 &&  $type = 4;
        //立即支付
        if($itemDetail->is_success == 1 && $itemDetail->pay_end_time > time() && $itemDetail->user_id == $itemDetail->this_user_id){
            $type = 5;
        }
        if(
            ($itemDetail->end_time < time() && $itemDetail->is_success == 0) ||
            ($itemDetail->is_success == 1 && $itemDetail->pay_end_time < time() )
        ){
            $type = 6;
        }
      return $type;
    }
}
