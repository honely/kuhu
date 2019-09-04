<?php
namespace app\admin\controller\setting;
use app\admin\controller\Common;
use app\common\model\setting\SettingModel;

class Oss extends Common
{
    protected $k = 'qiniu_oss';

    public function getOss()
    {
        $SettingModel = new SettingModel();
        $qiniu_oss = $SettingModel->getCache($this->k);
        $this->datas['qiniu_oss'] = $qiniu_oss;
    }


    public function setOss(){
        $SettingModel = new SettingModel();
        $SettingModel->setCache($this->k);
    }


}
