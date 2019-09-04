<?php

namespace app\common\model\resource;

use app\common\model\CommonModel;

class FooterIconModel extends CommonModel
{
    protected $pk = 'icon_id';
    protected $name = 'footer_icon';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['title', 'require|max:64', '请输入标题|标题不得超过64个字符'],
        ['unchecked', 'require|max:255', '请上传未选中图片|图片格式过长'],
        ['checked', 'require|max:255', '请上传选中图片|图片格式过长'],
        ['orderby', 'number', '排序必须是数字'],
    ];

    public function dataFilter(){
        $request = request();
        $param = [
            "title" =>  (string)   $request->param("title", ""),
            "unchecked" => (string) $request->param("unchecked", ""),
            "checked" => (string)   $request->param("checked", ""),
            "orderby" => (string)   $request->param("orderby", 0),
        ];
        return $param;
    }


}
