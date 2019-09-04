<?php
namespace app\website\model\website;

use app\website\model\CommonModel;

class SettingModel extends CommonModel
{
    protected $pk = 'app_id';
    protected $name = 'app_website_setting';


    protected $rules = [
        ['company_name', 'require|max:64', '公司名称必须填写 | 公司名称长度超过限制'],
        ['banner', 'require', '轮播必须上传'],
        ['introduce', 'require', '图片必须上传'],
        ['address', 'require|max:255', '地址不能为空 | 地址长度超过限制'],
        ['lat', 'require|max:15', '经度不能为空 | 经纬度长度不合法'],
        ['lng', 'require|max:15', '维度不能为空 | 经纬度长度不合法'],
        ['tel', 'require|max:15', '联系电话方式不能为空 | 电话号码长度不合法'],
        ['mobile', 'require|max:20', '联系手机方式不能为空 | 手机号码长度不合法'],
        ['email', 'require|max:64', '邮箱不能为空 | 邮箱长度不合法'],
        ['qrcode', 'require|max:255', '二维码不能为空！| 二维码格式错误!'],
    ];

    public function dataFilter($app_id = 0)  {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "company_name" => (string)$request->param("company_name", ""),//公司名称
            "banner" => (string)$request->param("banner", "","SecurityEditorHtml"),//轮播
            "introduce" => (string)$request->param("introduce", "",'SecurityEditorHtml'),//介绍
            "address" => (string)$request->param("address", ""),//地址
            "lat" => (string)$request->param("lat", ""),//经度
            "lng" => (string)$request->param("lng", ""),//维度
            "tel" => (string)$request->param("tel", ""),//电话
            "mobile" => (string)$request->param("mobile", ""),//手机
            "fax" => (string)$request->param("fax", ""),//手机
            "email" => (string)$request->param("email", ""),//邮件
            "qrcode" => (string)$request->param("qrcode", "",'SecurityEditorHtml'),//二维码
        ];

        $banner = json_decode($param['banner']) ? json_decode($param['banner'],true) : [];
        $introduce = json_decode($param['introduce']) ? json_decode($param['introduce'],true) : [];
        if (empty($banner)) {
            $param['banner'] = [""];
        }
        if (empty($introduce)) {
            $param['introduce'] = [""];
        }
        return $param;
    }

}
