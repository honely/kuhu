<?php
namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class GoodscategoryModel extends CommonModel
{
    protected $pk = 'cat_id';
    protected $name = 'app_shop_goods_category';

    protected $rules = [
        ['name', 'require|max:90', '分类名称必须填写|分类名称长度超过限制！'],
        ['parent_id', 'require|number', '必须选择一个上级分类！'],
        ['app_id', 'require|number', '参数不正确|参数不正确！'],
        ['orderby', 'number', '排序必须是数字！'],
        ['is_show', 'number', '必选选择是否展示！'],
        ['image', 'require|max:255', '图片必须上传|图片上传不正确！'],
        ['is_hot', 'number', '是否热门必须选择！'],
    ];

    public function dataFilter($app_id = 0)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "parent_id" => (int)$request->param("parent_id", ""),
            "name" => (string)$request->param("name", ""),//标题
            "orderby" => (int)$request->param("orderby", 0),//排序
            "is_show" => (int)$request->param("is_show", 0),//是否显示
            "image" => (string)$request->param("image", ""),//照片
            "is_hot" => (int)$request->param("is_hot", 0),//热门推荐
        ];
        return $param;
    }

    /**
     * 获取分类列表 二级树
     */
    public function getCatTree($appId,$isShow = true){
        $cats = $this->where("app_id",$appId)->order("orderby desc")->select();
        $tree = $child = [];
        foreach ($cats as $val){
            if($val->is_show == 0 && $isShow){
                continue;
            }
            $_cat = [
                'cat_id' => $val->cat_id,
                'name' => $val->getAttr('name'),
                'parent_id' => $val->parent_id,
                'image' => $val->image,
                'is_show' => $val->is_show,
                'is_hot' => $val->is_hot,
                'orderby' => $val->orderby,
                'is_delete' => false,
            ];
            if($val['parent_id'] == 0){
                $tree[] = $_cat;
            }else{
                $child[$val->parent_id][] = $_cat;
            }
        }
        foreach ($tree as &$val){
            $val['child'] = empty($child[$val['cat_id']]) ? [] : $child[$val['cat_id']];
        }
        return $tree;
    }




}
