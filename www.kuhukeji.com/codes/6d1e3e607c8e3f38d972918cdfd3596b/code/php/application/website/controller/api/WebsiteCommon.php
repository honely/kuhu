<?php

namespace app\website\controller\api;


use app\website\model\website\SettingModel;

class WebsiteCommon extends Common
{

    protected $default_seo;

    public function _initialize()
    {
        parent::_initialize();
        $SettingModel = new SettingModel();
        $setting = $SettingModel->find($this->appId);
        $this->default_seo = [
            'title' => $setting ? $setting->title : '我要有万能建站小程序',
            'keywords' => $setting ? $setting->keywords : '我要有万能建站小程序',
            'description' => $setting ? $setting->description : '我要有万能建站小程序',
        ];
    }

}
