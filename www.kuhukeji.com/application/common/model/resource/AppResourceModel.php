<?php

namespace app\common\model\resource;

use app\common\model\CommonModel;

class AppResourceModel extends CommonModel
{
    protected $pk = 'resource_id';
    protected $name = 'app_resource';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['category_id', 'require|number', '请输入分类|分类必须是数字'],
        ['photo', 'require|max:255', '请输入图片|图片最多不能超过255个字符'],
        ['size', 'require|number', '请输入图片大小|图片大小必须是数字'],
        ['title', 'require|max:64', '请输入标题|标题最多不能超过64个字符'],
        ['w', 'require|number', '请输入图片宽度|图片宽度必须是数字'],
        ['h', 'require|number', '请输入图片高度|图片高度必须是数字'],
    ];


    public function dataFilter($appId){
        $request = request();
        $param = [
            "category_id" => (int)$request->param("category_id", "0"),//分类
            "photo" => (string)$request->param("photo", ""),//图片
            "size" => (int)$request->param("size", "0"),//图片大小
            "title" => (string)$request->param("title", ""),//标题
            "w" => (int)$request->param("w", "0"),//图片宽度
            "h" => (int)$request->param("h", "0"),//图片高度
        ];
        $param['app_id'] = $appId;
        return $param;
    }


}
