<?php
namespace app\common\model\app;
use app\common\model\CommonModel;

class TemplatesModel extends CommonModel
{
    protected $pk = 'template_id';
    protected $name = 'app_templates';
    protected $insert = ["add_time","add_ip"];

    protected $rules = [
       
     ['photo','require|max:512','请输入缩略图|缩略图最多不能超过512个字符'],
     ['title','require|max:64','请输入标题|标题最多不能超过64个字符'],
     ['plugins','require|max:16777215','请输入页面配置|页面配置最多不能超过16777215个字符'],
     ['is_footer','require|number','请输入底部菜单|底部菜单必须是数字'],

    ];


    public function dataFilter($appId){
        $request = request();
        $param = [
            "app_type" => (int) $request->param('app_type', 0),//APP类型
            "is_theme" => (int) $request->param('is_theme', 0),//是否使用主题色
            "is_footer" => (int) $request->param("is_footer","0"),//底部菜单
            "footer_type" => (int) $request->param('footer_type', 0),//是否使用底部菜单
            "audit" => (int) $request->param('audit', 0),//审核
            "type" => (int) $request->param('type', 0),//费用类型
            "photo" => (string) $request->param("photo",""),//缩略图
            "title" => (string) $request->param("title",""),//标题
            "theme" => (string) $request->param("theme",""),//主题
            "footer" => (string) $request->param("footer",""),//底部
            "plugins" => (string) $request->param("plugins",""),//页面配置
        ];
        $param['app_id'] = $appId;
        return $param;
    }


}
