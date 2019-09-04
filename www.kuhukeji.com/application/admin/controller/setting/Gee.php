<?php
namespace app\admin\controller\setting;
use app\admin\controller\Common;
use app\common\model\setting\SettingModel;

class Gee extends Common
{
    protected $k = 'geetest';

    public function getGee()
    {
        $SettingModel = new SettingModel();
        $geetest = $SettingModel->getCache($this->k);
        $this->datas['geetest'] = $geetest;
    }


    public function setGee()
    {
        $SettingModel = new SettingModel();
        $SettingModel->setCache($this->k);
    }


}
