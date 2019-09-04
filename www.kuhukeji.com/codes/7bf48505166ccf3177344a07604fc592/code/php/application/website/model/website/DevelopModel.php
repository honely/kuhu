<?php
namespace app\website\model\website;

use app\website\model\CommonModel;

class DevelopModel extends CommonModel
{
    protected $pk = 'develop_id';
    protected $name = 'app_website_develop';


    protected $rules = [
        ['title', 'require|max:256', '标题必须填写'],
        ['detail', 'require', '摘要必须填写'],
        ['date', 'require|max:50', '日期必须选择|日期格式不正确'],
    ];

    public function dataFilter($app_id = 0)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "title" => (string)$request->param("title", ""),//标题
            "detail" => (string)$request->param("detail", ""),//正文
            "date" => (string)$request->param("date", ""),//摘要
            "add_time" => $request->time(),//关键词
            "add_ip" => $request->ip(),//关键词
        ];
        return $param;
    }


}
