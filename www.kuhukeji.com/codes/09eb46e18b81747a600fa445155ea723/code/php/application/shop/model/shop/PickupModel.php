<?php
namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class PickupModel extends CommonModel
{
    protected $pk = 'pickup_id';
    protected $name = 'app_shop_pickup';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['title', 'require|max:100', '自提点名称必须填写|自提点名称长度超过限制！'],
        ['tel', 'require', '联系电话不能为空！'],
        ['mobile', 'require', '联系电话不能为空！'],
        ['photo', 'require', '自提点照片必须上传！'],
        ['lat', 'require', '经纬度必须填写!'],
        ['lng', 'require', '经纬度必须填写！'],
        ['address', 'require', '地址必须填写！'],
    ];

    public function dataFilter($app_id = 0)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "title" => (string)$request->param("title", ""),//标题
            "tel" => (string)$request->param("tel", ""),//固定电话
            "mobile" => (string)$request->param("mobile", ""),//手机
            "photo" => (string)$request->param("photo", ""),//照片
            "lat" => (string)$request->param("lat", ""),//经纬度
            "lng" => (string)$request->param("lng", ""),//经纬度
            "address" => (string)$request->param("address", ""),//详细地址
        ];

        return $param;
    }
}
