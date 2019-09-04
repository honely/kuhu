<?php

namespace app\web\controller;

use app\common\model\setting\SettingModel;
use app\home\logic\UsersLogic;
use app\o2o\common\logic\user\UserLogic;
use app\shop\logic\shop\miniapp\Miniapp;
use app\shop\logic\shop\user\AgentLogic;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\OrderModel;
use app\shop\model\sms\SmsTmpModel;
use think\Config;
use think\Db;

class Index extends Common
{
    protected $selectIndex = 1;
    private $bannerKey = 'banner';

    public function index()
    {
        $SettingModel = new SettingModel();
        $banners = $SettingModel->getCache($this->bannerKey, false, true);
        $this->assign('banners', empty($banners['banners']) ? [] : $banners['banners']);
        return $this->fetch();
    }


}



