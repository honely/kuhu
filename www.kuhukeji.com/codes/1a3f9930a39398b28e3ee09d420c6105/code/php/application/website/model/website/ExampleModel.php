<?php
namespace app\website\model\website;

use app\website\model\CommonModel;

class ExampleModel extends CommonModel
{
    protected $pk = 'example_id';
    protected $name = 'app_website_example';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['title', 'require|max:64', '标题长度超过限制！'],
        ['category_id', 'number|min:1', '分类必须是数字！|必须选择一个分类！'],
        ['photos', 'require', '图片必须上传'],
        ['photo', 'require', '图片必须上传'],
        ['info', 'require', '案例信息必须填写'],
        ['detail', 'require', '案例详情必须填写'],
        ['orderby', 'number', '排序必须是数字'],
        ['seo', 'require|min:1', 'SEO信息必须填写|SEO信息必须填写'],
    ];

    public function dataFilter($app_id = 0,$seo)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "seo" => (string)$seo,
            "title" => (string)$request->param("title", ""),//标题
            "category_id" => (int)$request->param("category_id", 0),//标题
            "detail" => (string)$request->param("detail", ""),//正文
            "photos" => (string)$request->param("photos", ""),//图片
            "photo" => (string)$request->param("photo", ""),//图片
            "info" => (string)$request->param("info", ""),//信息
            "orderby" => (string)$request->param("orderby", ""),//信息
        ];
        $example_id = (int) $request->param("example_id", 0);
        if ($example_id <= 0) {
            $param['add_time'] = $request->time();//创建时间
            $param['add_ip'] = $request->ip();//创建IP
        }
        return $param;
    }


    /**
     * 获取数量
     * @param $where
     * @param $order
     * @param $num
     */
    public function getCalldata($where,$order,$num){

    }



}
