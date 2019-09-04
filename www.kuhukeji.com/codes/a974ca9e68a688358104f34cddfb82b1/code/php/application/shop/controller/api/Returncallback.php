<?php


namespace app\shop\controller\api;

use app\shop\logic\shop\miniapp\Miniapp;
use think\Controller;

class Returncallback extends Controller
{
  //
    private $appId = 0;
    private $orderId = 0;

    public function __construct()
    {
        $this->appId  = (int) request()->param("appid");
        $this->orderId = (int) request()->param("order_id");
    }

    public function orderCallbackReturn()
    {
        $url = request()->domain() . "/h5/shop/#/pages/mine/order/detail?app_id={$this->appId}&order_id={$this->orderId}";
        $this->redirect($url,301);
    }

    public function pintuanCallbackReturn()
    {
        $url = request()->domain() . "/h5/shop/#/pages/mine/assemble/index?app_id={$this->appId}";
        $this->redirect($url,301);
    }

    public function kanjiaCallbackReturn()
    {
        $url = request()->domain() . "/h5/shop/#/pages/mine/order/detail?app_id={$this->appId}&order_id={$this->orderId}";
        $this->redirect($url,301);
    }

    public function vipCallbackReturn()
    {
        $url = request()->domain() . "/h5/shop/#/pages/mine/index?app_id=?app_id={$this->appId}&order_id={$this->orderId}";
        $this->redirect($url,301);
    }

    public function integralCallbackReturn()
    {
        $url = request()->domain() . "/h5/shop/#/pages/mine/order/detail?app_id={$this->appId}&order_id={$this->orderId}";
        $this->redirect($url,301);
    }

    public function moneyCallbackReturn()
    {
        $url = request()->domain() . "/h5/shop/#/pages/mine/index?app_id={$this->appId}";
        $this->redirect($url,301);
    }

}