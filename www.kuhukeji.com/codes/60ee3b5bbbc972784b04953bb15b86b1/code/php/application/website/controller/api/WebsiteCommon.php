<?php
namespace app\website\controller\api;


use app\website\model\website\SettingModel;

class WebsiteCommon extends Common {

    protected $default_seo;

    public function _initialize(){
        parent::_initialize();
        $SettingModel = new SettingModel();
        if (!$setting = $SettingModel->find($this->appId)) {
            $this->warning('请提醒管理员设置小程序参数！');
        }
        $this->default_seo = [
            'title' => $setting->title ? $setting->title : '我要有万能建站小程序',
            'keywords' => $setting->keywords ? $setting->keywords : '我要有万能建站小程序',
            'description' => $setting->description ? $setting->description : '我要有万能建站小程序',
        ];
    }

}
