<?php
namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class IntegralCategoryModel extends CommonModel
{
    protected $pk = 'cat_id';
    protected $name = 'app_shop_integral_category';

    protected $rules = [
        ['name', 'require|max:90', '分类名称必须填写|分类名称长度超过限制！'],
        ['app_id', 'require|number', '参数不正确|参数不正确！'],
        ['orderby', 'number', '排序必须是数字！'],
        ['is_show', 'number', '必选选择是否展示！'],
        ['is_hot', 'require|number', '是否热门必须选择！'],
    ];

    public function dataFilter($app_id = 0)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "name" => (string)$request->param("name", ""),//标题
            "orderby" => (int)$request->param("orderby", 0),//排序
            "is_show" => (int)$request->param("is_show", 0),//是否显示
            "is_hot" => (int)$request->param("is_hot", 0),//热门推荐
        ];
        return $param;
    }


}
