<?php

namespace app\shop\logic\shop\goods;

use app\shop\model\shop\BargainModel;
use app\shop\model\shop\DiscountModel;
use app\shop\model\shop\GroupBuyModel;
use app\shop\model\shop\ManjianModel;
use app\shop\model\shop\RushBuyModel;

class GoodsPromFactory
{

    /**
     *
     * @param $promType
     * @return BargainModel|DiscountModel|GroupBuyModel|ManjianModel|RushBuyModel
     */
   public function makeModule($promType)
    {
        switch ($promType) {
            case 1:
                return new BargainModel();
            case 2:
                return new GroupBuyModel();
            case 3:
                return new RushBuyModel();
            case 4:
                return new DiscountModel();
            case 5:
                return new ManjianModel();
        }
    }


    /**
     * 检测是否符合商品活动工厂类的使用
     * @param $promType int 活动类型
     * @return bool
     */
    public function checkPromType($promType)
    {
        return in_array($promType, array_values([1, 2, 3, 4, 5]));
    }
}
