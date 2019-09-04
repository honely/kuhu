<?php
namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class StockModel extends CommonModel
{
    protected $pk = 'log_id';
    protected $name = 'app_shop_stock_log';
    protected $insert = ['add_time', 'add_ip'];

    protected $rules = [
        ['goods_id', 'require|number', '商品id必须存在！|商品id必须是数字！'],
        ['app_id', 'require|number', '参数不正确|参数不正确！'],
        ['goods_name', 'string|max:100', '商品名称长度不得超过100|商品名称长度不得超过100！'],
        ['goods_spec', 'string|max:50', '商品规格长度不得超过100|点商品规格长度不得超过50！'],
        ['order_sn', 'string|max:30', '订单编号长度不得超过30|订单编号长度不得超过30！'],
        ['order_id', 'number|min:1', '订单商品id必须是数字|订单商品id必须大于1！'],
        ['muid', 'number', '用户ID必须是数字！'],
        ['stock', 'number|min:1', '更改库存数量至少是1！'],
        ['change_type', 'number', '类型必须是INT型！'],
    ];

    public function dataFilter($app_id = 0)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "goods_id" => (int)$request->param("goods_id", 0),
            "order_id" => (int)$request->param("order_id", 0),
            "user_id" => (int)$request->param("user_id", 0),
            "goods_name" => (string)$request->param("goods_name", ""),//用户名
            "goods_spec" => (string)$request->param("goods_spec", ""),//用户名
            "order_sn" => (string)$request->param("order_sn", ""),//用户名
            "muid" => (int)$request->param("muid", 0),
            "stock" => (int)$request->param("stock", 0),
            "change_type" => (int)$request->param("change_type", 0),
        ];
        return $param;
    }


}
