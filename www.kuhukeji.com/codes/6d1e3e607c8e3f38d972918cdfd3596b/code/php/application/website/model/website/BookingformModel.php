<?php

namespace app\website\model\website;

use app\website\model\CommonModel;

class BookingformModel extends CommonModel
{
    protected $pk = 'form_id';
    protected $name = 'app_website_booking_form';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['title', 'require|max:64', '请输入表单标题|表单标题最多不能超过64个字符'],
        ['details', 'require|max:65535', '请输入表单配置|表单配置最多不能超过65535个字符'],
    ];

    public function dataFilter($appId){
        $request = request();
        $param = [
            "title" => (string)$request->param("title", ""),//表单标题
            "details" => (string)$request->param("details", "","SecurityEditorHtml"),//表单配置
        ];
        $param['app_id'] = $appId;
        return $param;
    }


}
