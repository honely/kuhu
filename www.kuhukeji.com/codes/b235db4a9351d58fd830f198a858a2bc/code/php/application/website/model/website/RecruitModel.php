<?php
namespace app\website\model\website;

use app\website\model\CommonModel;

class RecruitModel extends CommonModel
{
    protected $pk = 'recruit_id';
    protected $name = 'app_website_recruit';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['title', 'require|max:255', '标题必须填写|标题长度超过了限制'],
        ['working_place', 'require|max:30', '工作地点必须填写|工作地点长度超过了限制'],
        ['experience', 'require|max:30', '工作经验必须填写|工作经验长度超过了限制'],
        ['education', 'require|max:30', '学历必须填写|学历长度超过了限制'],
        ['salary', 'require|max:30', '薪资必须填写|薪资长度超过了限制'],
        ['detail', 'require', '职位介绍必须填写'],
        ['qualify', 'require', '任职资格必须填写'],
        ['welfare', 'require', '福利待遇必须填写'],
    ];

    public function dataFilter($app_id = 0)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "recruit_id" => (int) $request->param('recruit_id',0),
            "title" => (string)$request->param("title", ""),//标题
            "working_place" => (string)$request->param("working_place", ""),//工作地点
            "experience" => (string)$request->param("experience", ""),//工作经验
            "education" => (string)$request->param("education", ""),//学历
            "salary" => (string)$request->param("salary", ""),//薪资
            "detail" => (string)$request->param("detail", ""),//职位教室
            "qualify" => (string)$request->param("qualify", ""),//任职资格
            "welfare" => (string)$request->param("welfare", ""),//福利待遇
        ];

        if ($request->param('recruit_id') == 0) {
            $param['add_time'] = $request->time();
            $param['add_ip'] = $request->ip();
        }
        return $param;
    }


}
