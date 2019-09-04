<?php

namespace app\shop\controller\api;


use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\ManjianModel;
use app\shop\model\shop\UserModel;

class Manjian extends ShopCommon
{
    protected $checkLogin = false;

    public function index()
    {
        $is_vip =  $this->request->param("is_vip",-999);
        if ($is_vip >= 0) {
            $where[ 'is_vip'] = $is_vip;
        }
        $where['app_id'] = $this->appId;
        $where['is_online'] = 1;
        $ManjianModel = new ManjianModel();
        $listTmp = $ManjianModel->where($where)->order("orderby desc")->page($this->page, $this->limit)->select();
        $list = [];
        foreach ($listTmp as $val) {
            $list[] = [
                'manjian_id' => (int) $val->manjian_id,
                'name' => (string) $val->name,
                'prom_img' => (string) $val->prom_img,
                'man' => moneyFormat($val->man),
                'jian' => moneyFormat($val->jian),
                'vip_man' => moneyFormat($val->vip_man),
                'vip_jian' => moneyFormat($val->vip_jian),
                'orderby' => (int) $val->orderby,
                'is_vip' => (int) $val->is_vip,
                'start_time' =>  date("Y-m-d H:i:s",$val->start_time),
                'end_time' =>  date("Y-m-d H:i:s",$val->end_time),
                'expire_time' => ($val->end_time - time() > 0) ? $val->end_time - time() : 0,
                'is_online' => (int) $val->is_online,
            ];
        }

        $this->datas['list'] = $list;
        $this->datas['isMore'] = (int)($this->limit == count($list));
        $this->datas['seo'] = $this->default_seo;
    }



    public function getList () {
        $manjian_id = (int)$this->request->param("manjian_id",0);
        //$is_vip = (int)$this->request->param("type",0);
        $ManjianModel = new ManjianModel();
        $GoodsModel = new GoodsModel();
        $goods = $goods_ids = [];
        if ($manjian_id > 0) {
            if (!$manjian = $ManjianModel->find($manjian_id)) {
                $this->noPage('参数不正确！');
            }
            if ($manjian->app_id != $this->appId) {
                $this->noPage('参数不正确！');
            }
            if ($manjian->is_online == 0) {
                $this->noPage('该满减活动已下线！');
            }
            $goods_ids = json_decode($manjian->goods_ids, true) ? json_decode($manjian->goods_ids, true) : '';
            $where = [
                'goods_id'=>['in',$goods_ids],
                'app_id'=>$this->appId,
            ];

            $goods = $GoodsModel->where($where)->page($this->page,$this->limit)->select();

        } else {
            $where = [
                'start_time' => ['<',time()],
                'end_time' => ['>',time()],
                'app_id' => $this->appId,
                'is_online' => 1,
            ];

            $manjian = $ManjianModel->where($where)->order('orderby desc,manjian_id desc')->find();

            if (!empty($manjian)) {
                $goods_ids = json_decode($manjian->goods_ids, true) ? json_decode($manjian->goods_ids, true) : '';
            } else {
                $this->noPage('当前没有折扣活动啦！');
            }
            $where = [
                'goods_id'=>['in',$goods_ids],
                'app_id'=>$this->appId,
            ];
            $goods = $GoodsModel->where($where)->page($this->page,$this->limit)->select();
        }

        $list = [];
        foreach ($goods as $v) {
            $list[] = [
                'goods_id' => $v['goods_id'],
                'cat_id' => $v['cat_id'],
                'p_cat_id' => $v['p_cat_id'],
                'goods_sn' => $v['goods_sn'],
                'goods_name' => $v['goods_name'],
                'photo' => (string) $v['photo'],
                'market_price' => moneyFormat($v['market_price'], true),
                'shop_price' => moneyFormat($v['shop_price'], true),
                'is_vip' => $manjian->is_vip,
                'man' => moneyFormat($manjian['man'], true),
                'jian' => moneyFormat($manjian['jian'], true),
                'vip_man' => moneyFormat($manjian['vip_man'], true),
                'vip_jian' => moneyFormat($manjian['vip_jian'], true),
            ];
        }

        $data = [
            'count' => count($goods_ids),
            'name' => (string) isset($manjian->name) ? $manjian->name : '',
            'prom_img' => (string) $manjian->prom_img,
            'start_time' =>  date("Y-m-d H:i:s",$manjian->start_time),
            'end_time' =>  date("Y-m-d H:i:s",$manjian->end_time),
            'expire_time' => ($manjian->end_time - time() > 0) ? $manjian->end_time - time() : 0,
        ];
        $this->datas = [
            'list' => $list,
            'data' => $data,
            'isMore' => (int) (count($list) == $this->limit),
            'seo' => $this->default_seo,
        ];
    }

}
