<?php

namespace app\common\model\app;

use app\common\model\CommonModel;

class PagesModel extends CommonModel
{
    protected $pk = 'page_id';
    protected $name = 'app_pages';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['title', 'require|max:64', '请输入标题|标题最多不能超过64个字符'],
        ['photo', 'require|max:512', '请输入缩略图|缩略图最多不能超过512个字符'],
        ['plugins', 'max:16777215', '请输入页面配置|页面大小已超出做大存储'],
        ['is_default', 'number', '请输入首页|首页必须是数字'],
    ];

    public function dataFilter($appId,$appType = -1){
        $request = request();
        $param = [
            "app_type" => (int)$appType,//小程序类型
            "title" => (string)    $request->param("title", ""),//标题
            "photo" => (string)    $request->param("photo", ""),//缩略图
            "footer_type" => (int) $request->param("footer_type", "0"),//底部菜单 0没有底部菜单 1使用全局菜单 2自定义菜单
            "is_theme" => (int)    $request->param("is_theme", "0"),//缩略图
            "plugins" => (string)  $request->param("plugins", "","SecurityEditorHtml"),//页面配置
            "theme" => (string)    $request->param("theme", "","SecurityEditorHtml"),//主题配置
            "footer" => (string)   $request->param("footer", "","SecurityEditorHtml"),//底部菜单配置
            "last_time" =>         $request->time(),
        ];
        $param['app_id'] = $appId;
        if($appType > -1){
            $param['app_type'] = $appType;
        }
        return $param;
    }




    /**
     * 获取默认样式
     */
    public function getDefaultThem(){
        $AppThemeModel = new AppThemeModel();
    }

}
