<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class GoodsRepertoryModel extends CommonModel{
    protected $pk = 'repertory_id';
    protected $name = 'app_shop_goods_repertory';





    public function checkStock($spec_key,$goods) {
        if ($spec_key) { //选择了key
            if (!$spec = $this->where('spec_key',$spec_key)->find()) {
                $this->error = '参数不正确！';
                return false;
            }
            if ($spec->goods_num == 0) {
                $this->error = '对不起，库存不足！';
                return false;
            }
        } else {    //没有key，无sku 若根据商品ID查询结果存在sku说明参数有问题
            if (!$spec = $this->where('goods_id',$goods->goods_id)->find()) {
                $this->error = '参数不正确！';
                return false;
            }
            if ($spec->spec_key) {
                $this->error = '参数不正确！';
                return false;
            }
            if ($spec->goods_num < 1) {
                $this->error = '对不起，库存不足！';
                return false;
            }
        }

        return $spec;
    }



    public function getCommissionByIds($goodsIds) {
        $where = [
            'goods_id' => ['in',$goodsIds],
        ];
        $rep_tmp = $this->where($where)->select();
        $rep = [];
        foreach ($rep_tmp as $v) {
            $rep[$v->goods_id][] = $v->commission;
        }
        foreach ($rep as $v) {
            arsort($v);
        }
        return $rep;
    }





}

