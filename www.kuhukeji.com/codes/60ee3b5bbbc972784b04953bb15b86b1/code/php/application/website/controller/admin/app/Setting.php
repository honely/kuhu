<?php

namespace app\website\controller\admin\app;

use app\website\controller\admin\Common;
use app\common\model\app\OpenSettingModel;


class Setting extends Common
{
    public function getOpenSetting() {
        $type = (string) $this->request->param('type');
        $OpenSettingModel = new OpenSettingModel();
        if (!$res = $OpenSettingModel->checkType($type)) {
            $this->warning("系统错误");
        }
        $this->datas['setting'] = $OpenSettingModel->setAppId($this->appId)->getSetting($type);

    }


    public function setOpenSetting() {
        $type = (string) $this->request->param('type');
        $data = (string) $this->request->param('data','','SecurityEditorHtml');
        $OpenSettingModel = new OpenSettingModel();
        if (!$res = $OpenSettingModel->checkType($type)) {
            $this->warning("参数错误");
        }
        if (!$res = $OpenSettingModel->setAppId($this->appId)->setSetting($type,json_decode($data,true))){
            $this->warning("参数错误");
        }

    }


}
