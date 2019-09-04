<?php
namespace app\website\model\website;

use app\website\model\CommonModel;

class NewsModel extends CommonModel
{
    protected $pk = 'news_id';
    protected $name = 'app_website_news';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['title', 'require|max:255', '标题必须填写|标题最大255个字符'],
        ['photo', 'max:255', '封面图片格式不正确'],
        ['description', 'require|max:256', '摘要必须填写|摘要最大255个字符'],
        ['category_id', 'number|min:1', '分类必须选择'],
        ['detail', 'require', '正文必须填写'],
        ['news_type', 'number', '新闻类型必须选择'],
        ['orderby', 'number', '排序必须是数字'],
        ['seo', 'require|min:1', 'SEO信息必须填写|SEO信息必须填写'],
    ];


    public function dataFilter($app_id = 0,$seo)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "seo" => (string)$seo,
            "news_id" => (int) $request->param("news_id", ""),//新闻ID
            "title" => (string)$request->param("title", ""),//标题
            "photo" => (string)$request->param("photo", ""),//标题
            "category_id" => (int)$request->param("category_id", 0),//标题
            "detail" => (string)$request->param("detail", "",'SecurityEditorHtml'),//正文
            "description" => (string)$request->param("description", ""),//摘要
            "keywords" => (string)$request->param("keywords", ""),//关键词
            "news_type" => (int)$request->param("news_type", "0"),//新闻类型
            "orderby" => (int)$request->param("orderby", "0"),//新闻类型
        ];
        if(!((int) $request->param("news_id", ""))){
            $param['add_time'] = $request->time();//创建时间
            $param['add_ip'] = $request->ip();//创建IP
        }
        return $param;
    }


}
