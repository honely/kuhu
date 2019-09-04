<?php

namespace app\common\model\app;

use app\common\model\CommonModel;

class AppModel extends CommonModel
{
    protected $pk = 'app_id';
    protected $name = 'app';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['app_name', 'require|max:64', '请输入应用名称|应用名称最多不能超过64个字符'],
       // ['app_type', 'require|number', '请输入应用类型|应用类型必须是数字'],
        ['sms_num',  'number', '短信数必须是数字'],
    ];


    public function dataFilter($appId){
        $request = request();
        $param = [
            "app_id" => $appId,
            "app_name" => (string)$request->param("app_name", ""),//应用名称
            "sms_num" => (int)$request->param("sms_num", "0"),//短信数
            "expire_time" => (int)$request->param("expire_time", "0",'strtotime'),//短信数
        ];
        return $param;

    }


}
