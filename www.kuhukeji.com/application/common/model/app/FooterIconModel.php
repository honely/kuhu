<?php
namespace app\common\model\app;
use app\common\model\CommonModel;

class FooterIconModel extends CommonModel
{
    protected $pk = 'icon_id';
    protected $name = 'app_footer_icon';
    protected $insert = ["add_time","add_ip"];

    protected $rules = [
     ['title','require|max:64','请输入标题|标题最多不能超过64个字符'],
     ['unchecked','require|max:255','请输入未选中|未选中最多不能超过255个字符'],
     ['checked','require|max:255','请输入已选中|已选中最多不能超过255个字符'],
     ['orderby','require|number','请输入排序|排序必须是数字'],
    ];

    public function dataFilter($appId){
        $request = request();
        $param = [
            "title" => (string) $request->param("title",""),//标题
            "unchecked" => (string) $request->param("unchecked",""),//未选中
            "checked" => (string) $request->param("checked",""),//已选中
            "orderby" => (int) $request->param("orderby","0"),//排序
        ];
        $param['app_id'] = $appId;
        return $param;
    }


}
