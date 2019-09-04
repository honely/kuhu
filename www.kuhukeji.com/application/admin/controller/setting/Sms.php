<?php
namespace app\admin\controller\setting;
use app\admin\controller\Common;
use app\common\model\setting\SettingModel;

class Sms extends Common
{
    protected $k = 'tx_sms';

    public function getSms()
    {
        $SettingModel = new SettingModel();
        $tx_sms = $SettingModel->getCache($this->k);
        $this->datas['tx_sms'] = $tx_sms;
    }


    public function setSms()
    {
        $SettingModel = new SettingModel();
        $SettingModel->setCache($this->k);
    }


}
