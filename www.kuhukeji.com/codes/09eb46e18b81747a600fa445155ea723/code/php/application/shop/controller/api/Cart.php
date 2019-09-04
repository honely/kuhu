<?php

namespace app\shop\controller\api;

use app\shop\logic\shop\goods\GoodsLogic;
use app\shop\model\shop\CartModel;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\GoodsRepertoryModel;
use app\shop\model\shop\UserModel;
use think\Exception;

class Cart extends ShopCommon
{
    protected $checkLogin = true;

    /**
     * 加入购物车
     */
    public function addCart()
    {
        $goods_id = (int)$this->request->param("goods_id");
        $num = (int)$this->request->param("num", 1);
        $spec_key = (string)$this->request->param("spec_key");
        if ($num <= 0) {
            $this->warning("请选择商品个数");
        }
        //获取商品信息
        try {
            $GoodsLogic = new GoodsLogic();
            $detail = $GoodsLogic->setAppId($this->appId)
                ->setGoodsId($goods_id)
                ->getGoods();
        } catch (Exception $exception) {
            $this->noPage($exception->getMessage());
        }
        if ($GoodsLogic->checkOnline() == false) {
            $this->noPage("产品已下架");
        }

        $goods = $GoodsLogic->getGoods();
        //验证规格 并查询库存
        $surplus_num = $GoodsLogic->checkSpec($spec_key);
        if ($surplus_num == false) {
            $this->warning("不存在规格");
        }
        //验证库存简单验证
        if ($surplus_num->goods_num < $num) {
            $this->warning("库存不足");
        }
        //加入购物车
        $CartModel = new CartModel();
        $cart_where['goods_id'] = $goods_id;
        $cart_where['user_id'] = $this->userId;
        $GoodsLogic->getGoods()->sku_type == 1 && $cart_where['spec_key'] = $spec_key;
        $have = $CartModel->where($cart_where)->order('is_pay asc,is_delete asc,cart_id desc')->find();
        //如果购物已存在则更新库存
        if ($have && $have->is_delete == 0 && $have->is_pay == 0) {
            $CartModel->where(['cart_id' => $have->cart_id])->setInc('goods_num', $num);
        } else {
            //已删除未支付  或已支付未删除 则加入购物车
            $cart_count = $CartModel->where("user_id", $this->userId)->count();
            $max_cart_count = config("limitnum.app_shop_cart_count");
            if ($max_cart_count <= $cart_count) {
                $this->warning("您最多添加{$cart_count}件商品");
            }
            $CartModel->save([
                'app_id' => $this->appId,
                'user_id' => $this->userId,
                'goods_id' => $goods_id,
                'spec_key' => $spec_key,
                'sku_type' => $GoodsLogic->getGoods()->sku_type,
                'selected' => 1,
                'goods_num' => $num,
                'cat_id' => $goods->p_cat_id,
            ]);
        }

    }

    /**
     * 修改数量规格
     */
    public function editCart()
    {
        $cart_id = (int)$this->request->param("cart_id");
        $num = (int)$this->request->param("num", 1);

        $CartModel = new CartModel();

        if (!$detail = $CartModel->find($cart_id)) {
            $this->warning("参数错误");
        }
        if ($detail->user_id != $this->userId) {
            $this->warning();
        }

        if ($num <= 0) {
            $this->warning("请选择商品个数");
        }
        $goods_id = $detail->goods_id;
        //获取商品信息

        try {
            $GoodsLogic = new GoodsLogic();
            $goods = $GoodsLogic->setAppId($this->appId)
                ->setGoodsId($goods_id)
                ->getGoods();
        } catch (Exception $exception) {
            $this->noPage($exception->getMessage());
        }
        if ($GoodsLogic->checkOnline() == false) {
            $this->noPage("产品已下架");
        }
        $goods = $GoodsLogic->getGoods();
        //验证规格 并查询库存
        $surplus_num = $GoodsLogic->checkSpec($detail->spec_key);
        if ($surplus_num == false) {
            $this->warning("不存在规格");
        }
        //验证库存简单验证
        if ($surplus_num->goods_num < $num) {
            $this->warning("库存不足");
        }
        $CartModel->save([
            'goods_num' => $num,
            'spec_key' => $detail->spec_key,
            'cat_id' => $goods->p_cat_id,
        ], ['cart_id' => $cart_id]);

    }

    /**
     * 删除购物车
     */
    public function delCart()
    {
        $cart_id = (int)$this->request->param("cart_id");
        $CartModel = new CartModel();
        if (!$detail = $CartModel->find($cart_id)) {
            $this->warning("参数错误");
        }
        if ($detail->user_id != $this->userId) {
            $this->warning();
        }
        $CartModel->isUpdate(true)->save(['is_delete' => 1, 'delete_time' => time()], ["cart_id" => $cart_id]);
    }

    /**
     * 选中购物车
     */
    public function selectCart()
    {
        $cart_id = (int)$this->request->param("cart_id");
        $CartModel = new CartModel();
        $CartModel->where("cart_id", $cart_id)->exp('selected', 'selected ^ 1')->update();
    }

    /**
     * 选中购物车
     */
    public function selectCartAll()
    {
        $is_select = (int) ($this->request->param("is_select") == 1);
        $CartModel = new CartModel();
        $CartModel->isUpdate(true)->save(['selected'=>$is_select],["user_id"=>$this->userId]);
    }

    /**
     * 我的购物车
     */
    public function index()
    {
        $CartModel = new CartModel();
        $catIds = $CartModel->where("user_id", $this->userId)->column("cat_id");
        $goods_where = [
            'app_id' => $this->appId,
            'is_delete' => 0,
            'is_online' => 1,
        ];
        if (!empty($catIds)) {
            $goods_where['cat_id|p_cat_id'] = ["IN", $catIds];
        }
        $GoodsModel = new GoodsModel();
        $goods_list_tmp = $GoodsModel->where($goods_where)->order('orderby desc')->page($this->page, $this->limit)->select();
        //购物车一直推荐商品
        if (empty($goods_list_tmp)) {
            unset($goods_where['cat_id|p_cat_id']);
            $goods_list_tmp = $GoodsModel->where($goods_where)->order('orderby desc')->page($this->page, $this->limit)->select();
        }
        $tuijian = [];
        foreach ($goods_list_tmp as $val) {
            $tuijian[] = [
                'goods_id' => $val->goods_id,
                'goods_name' => $val->goods_name,
                'photo' => $val->photo,
                'market_price' => moneyFormat($val->market_price, true),
                'shop_price' => moneyFormat($val->shop_price, true),
            ];
        }
        $this->datas['tuijian'] = $tuijian;
        $this->datas['isMore'] = (int)($this->limit == count($tuijian));
        //如果 有分页 说明 获取推荐列表
        if ($this->page > 1) return;
        //--------------------------------我的购物车列表分割线 -----------------------------
        $where = ['user_id' => $this->userId, 'is_delete' => 0, 'is_pay' => 0];
        $max_cart_count = config("limitnum.app_shop_cart_count");
        //购物车所有商品
        $catListTmp = $CartModel->where($where)->limit(0, $max_cart_count)->select();
        $goodsIds = [];
        foreach ($catListTmp as $val) {
            $goodsIds[$val->goods_id] = $val->goods_id;
        }
        $whereGoodsIds = empty($goodsIds) ? 0 : $goodsIds;
        //所有商品
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->itemsByIds($goodsIds);
        //所有商品Item
        $GoodsRepertoryModel = new GoodsRepertoryModel();
        $goodsItemTmp = $GoodsRepertoryModel->whereIn("goods_id", $whereGoodsIds)->select();
        //分离有无规格
        $skuGoods = $noSkuGoods = [];
        foreach ($goodsItemTmp as $val) {
            if ($val->sku_type == 1) {
                $skuGoods[$val->spec_key] = $val;
            } else {
                $noSkuGoods[$val->goods_id] = $val;
            }
        }
        $UserModel = new UserModel();
        $user = $UserModel->findUser($this->userId)->getUser();
        if(empty($user)){
            $this->warning("操作错误");
        }
        $isVip  = $UserModel->checkVip();
        //拼接购物车
        $myCatList = [];
        foreach ($catListTmp as $val) {
            //过滤下架
            if (empty($goods[$val->goods_id]) || $goods[$val->goods_id]->is_online == 0 || $goods[$val->goods_id]->is_delete == 1) {
                continue;
            }
            //可变模型
            $skuTypeName = $val->sku_type == 0 ? $noSkuGoods : $skuGoods;
            $skuTypeNameKey = $val->sku_type == 0 ? $val->goods_id : $val->spec_key;
            $priceFormat = empty($skuTypeName[$skuTypeNameKey]->shop_price) ? 0 : moneyFormat($skuTypeName[$skuTypeNameKey]->shop_price, true);
            $price = empty($skuTypeName[$skuTypeNameKey]->shop_price) ? 0 : moneyFormat($skuTypeName[$skuTypeNameKey]->shop_price);
            if($isVip && $goods[$val->goods_id]->is_plus_vip == 1){
                $priceFormat = empty($skuTypeName[$skuTypeNameKey]->plus_vip_price) ? 0 : moneyFormat($skuTypeName[$skuTypeNameKey]->plus_vip_price, true);
                $price = empty($skuTypeName[$skuTypeNameKey]->plus_vip_price) ? 0 : moneyFormat($skuTypeName[$skuTypeNameKey]->plus_vip_price);
            }
            $myCatList[] = [
                'cart_id' => $val->cart_id,
                'goods_id' => $val->goods_id,
                'goods_num' => $val->goods_num,
                'selected' => $val->selected,
                'sku_type' => (int)$val->sku_type,
                'spec_key_name' => empty($skuTypeName[$skuTypeNameKey]) ? '无规格' : $skuTypeName[$skuTypeNameKey]->key_name,
                'photo' => empty($skuTypeName[$skuTypeNameKey]->photo) ? $goods[$val->goods_id]->photo : $skuTypeName[$skuTypeNameKey]->photo,
                'goods_name' => $goods[$val->goods_id]->goods_name,
                'goods_sn' => $goods[$val->goods_id]->goods_sn,
                'kucun' => empty($skuTypeName[$skuTypeNameKey]->goods_num) ? 0 : $skuTypeName[$skuTypeNameKey]->goods_num,
                'price' => $price,
                'price_format' => $priceFormat,
            ];
        }
        $this->datas['list'] = $myCatList;
    }

}
