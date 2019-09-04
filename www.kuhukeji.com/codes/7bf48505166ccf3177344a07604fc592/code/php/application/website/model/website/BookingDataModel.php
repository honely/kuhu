<?php

namespace app\website\model\website;

use app\website\model\CommonModel;

class BookingDataModel extends CommonModel
{
    protected $pk = 'booking_id';
    protected $name = 'app_website_booking_data';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['form_id', 'require|min:1', '参数不正确|参数不正确'],
        ['app_id', 'require|min:1', '参数不正确|参数不正确'],
        ['details', 'require|max:65535', '请输入表单配置|表单配置最多不能超过65535个字符'],
    ];

    public function dataFilter($appId){
        $request = request();
        $param = [
            "form_id" => (int)$request->param("form_id", 0),
            "app_id" => $appId,
            "details" => (string)$request->param("details", "","SecurityEditorHtml"),//表单配置
        ];
        return $param;
    }


}
