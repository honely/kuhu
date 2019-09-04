<?php
namespace app\website\model\website;

use app\website\model\CommonModel;

class BusinessModel extends CommonModel
{
    protected $pk = 'business_id';
    protected $name = 'app_website_business';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['title', 'require|max:64', '标题必须填写|标题长度不得大于64'],
        ['sub_title', 'require|max:25', '副标题必须填写|副标题长度不得大于255'],
        ['detail', 'require', '描述必须填写'],
        ['photo', 'require|max:255', '封面图片必须上传|封面图片上传不正确'],
        ['photos', 'require', '轮播图片必须上传|轮播图片上传不正确'],
        ['seo', 'require|min:1', 'SEO信息必须填写|SEO信息必须填写'],
    ];

    public function dataFilter($app_id = 0,$seo)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "seo" => (string)$seo,
            "business_id" =>(int)$request->param("business_id", 0),
            "title" => (string)$request->param("title", ""),//标题
            "sub_title" => (string)$request->param("sub_title", ""),//标题
            "detail" => (string)$request->param("detail", "",'SecurityEditorHtml'),//详情
            "photo" => (string)$request->param("photo", "",'SecurityEditorHtml'),//封面图片
            "photos" => (string)$request->param("photos", "",'SecurityEditorHtml'),//轮播图片
            "product_ids" => (string)$request->param("product_ids",'' ,"SecurityEditorHtml"),//关联的产品
        ];
        if((int)$request->param("business_id", 0)){
            $param['add_time'] = $request->time();
            $param['add_ip'] = $request->ip();
        }
        return $param;
    }


}
