<?php
namespace app\website\model\website;

use app\website\model\CommonModel;

class NewsCategoryModel extends CommonModel
{
    protected $pk = 'category_id';
    protected $name = 'app_website_news_category';

    protected $rules = [
        ['title', 'require|max:256', '标题必须填写'],
        ['orderby', 'number', '排序必须是数字'],
    ];


    public function dataFilter($app_id = 0)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "title" => (string)$request->param("title", ""),//标题
            "orderby" => (int)$request->param("orderby", ""),//排序
        ];
        return $param;
    }


}

