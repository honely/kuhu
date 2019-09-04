<?php

namespace app\shop\logic\shop\order;

use app\shop\model\shop\ShippingModel;
use think\Exception;

/**
 * 管理员订单处理逻辑
 * Class OrderAdminLogic
 * @package app\shop\logic\shop\order
 */
class IntegralOrderAdminLogic extends IntegralOrderBasic
{


    //开放类
    public function __construct()
    {
        parent::__construct();
    }


    public function setAppId($appId)
    {
        $this->appId = $appId;
        if ($this->getOrderDetail()->app_id != $this->appId) {
            throw new Exception("系统异常1");
        }
        if($this->getOrderDetail()->admin_delete == 1){
            throw new Exception("系统异常2");
        }
        return $this;
    }




    /**
     * 设为未支付
     * @param int $status 0 设为未支付  1设为已支付
     */
    public function setNoPay(){
        if($this->getOrderDetail()->order_status != 0){
            throw new Exception("非法操作");
        }
        if($this->getOrderDetail()->pay_status != 1){
            throw new Exception("非法操作");
        }
        $this->setPayStatus(0);
    }

    /**
     * 设为已支付
     */
    public function setYesPay(){
        if($this->getOrderDetail()->order_status != 0){
            throw new Exception("非法操作");
        }
        if($this->getOrderDetail()->pay_status != 0){
            throw new Exception("非法操作");
        }
        $this->setPayStatus(1);
    }

    /**
     *  确认订单
     */
    public function setYesOrder(){
        if($this->getOrderDetail()->order_status != 0){
            throw new Exception("非法操作");
        }
        if($this->getOrderDetail()->pay_status != 1){
            throw new Exception("非法操作");
        }
        if($this->getOrderDetail()->shipping_status != 0){
            throw new Exception("非法操作");
        }
        $this->setOrderStatus(1);
    }

    /**
     *  取消确认订单
     */
    public function setNoOrder(){
        if($this->getOrderDetail()->order_status != 1){
            throw new Exception("非法操作");
        }
        if($this->getOrderDetail()->pay_status != 1){
            throw new Exception("非法操作");
        }
        if($this->getOrderDetail()->shipping_status != 0){
            throw new Exception("非法操作");
        }
        $this->setOrderStatus(0);
    }

    /**
     * 设为无效订单
     */
    public function setInvalid(){
        $this->setOrderStatus(5);
    }


    /**
     * 设置管理员留言
     */
    public function setAdminNote($note){
        $this->setOrderInfo("admin_note",$note);
    }

    /**
     * 删除订单
     */
    public function deleteAdmin(){
      $isInvalid = $this->getOrderDetail()->pay_status == 0 && $this->getOrderDetail()->end_time < time();
      if($isInvalid == false && $this->getOrderDetail()->order_status != 5){
          throw new Exception("非法操作");
      }
      $this->setOrderInfo("admin_delete",1);
    }

    /**
     * 订单发货
     */
    public function deliver($shippingId,$shippingNum){
        if($this->getOrderDetail()->order_status != 1){
            throw new Exception("非法操作");
        }
        if($this->getOrderDetail()->pay_status != 1){
            throw new Exception("非法操作");
        }
        if($this->getOrderDetail()->shipping_status != 0){
            throw new Exception("非法操作");
        }
        $ShippingModel  = new ShippingModel();
        $detail  =  $ShippingModel->find($shippingId);
        if(empty($detail) || $detail->app_id != $this->appId){
            throw new Exception("非法操作");
        }
        $this->setOrderInfo("shipping_id",$shippingId);
        $this->setOrderInfo("shipping_name",$detail->shipping_name);
        $this->setOrderInfo("shipping_code",$detail->shipping_code);
        $this->setOrderInfo("shipping_num",$shippingNum);
        $this->setOrderInfo("shipping_time",time());
        $this->setShippingStatus(1);
    }

    /**
     * 设为已支付
     */
    public function payCallback($payType,$orderInfo)
    {
        if ($this->getOrderDetail()->order_status != 0) {
            throw new Exception("非法操作");
        }
        if ($this->getOrderDetail()->pay_status != 0) {
            throw new Exception("非法操作");
        }
        $this->setOrderInfo("pay_type",$payType);
        $this->setOrderInfo("pay_time",time());
        $this->setOrderInfo("pay_info",json_encode($orderInfo));
        $this->setPayStatus(1);
    }


    /**
     * 修改用户地址
     */
    public function editAddress($name,$mobile,$address){

    }
}
