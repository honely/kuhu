<?php

namespace app\shop\logic\shop;

use app\shop\library\Curl;
use app\shop\model\shop\GoodsTongjiModel;
use app\shop\model\shop\SettingModel;
use app\shop\model\shop\ShippingModel;

/**
 * Class KuaidiniaoApi
 * @package app\shop\logic\shop
 */
class TongjiLogic
{
    private $appId;
    private $userId = 0;


    /**
     * 设置应用ID
     * @param $appId
     * @return $this
     */
    public function setAppId($appId)
    {
        $this->appId = $appId;
        return $this;
    }

    /**
     * 设置用户ID
     * @param $userId
     * @return $this
     */
    public function setUserId($userId)
    {
        $this->userId = $userId;
        return $this;
    }

    /**
     * 统计商品
     * @param $goodsId
     * @param $goodsName
     * @param $goodsSn
     * @param $goodsPhoto
     * @param $type
     */
    public function tongjiGoods($goodsId, $goodsName, $goodsSn, $goodsPhoto, $type)
    {
        $GoodsTongjiModel = new GoodsTongjiModel();
        $detail = $GoodsTongjiModel->where("app_id", $this->appId)
            ->where("goods_id", $goodsId)
            ->where("user_id", $this->userId)
            ->find();
        if (empty($detail)) {
            $GoodsTongjiModel->save([
                'user_id' => $this->userId,
                'app_id' => $this->appId,
                'type' => $type,
                'goods_id' => $goodsId,
                'num' => 1,
                'goods_name' => $goodsName,
                'goods_sn' => $goodsSn,
                'goods_photo' => $goodsPhoto,
                'orderby' => time(),
                'last_time' => time(),
            ]);
        } else {
            $GoodsTongjiModel->save([
                'num' => $detail->num + 1,
                'type' => $type,
                'orderby' => time(),
                'last_time' => time(),
            ], ['log_id' => $detail->log_id]);
        }
    }

}
