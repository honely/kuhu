<?php
namespace app\website\controller\admin\app;

use app\common\library\AppInstall;

use app\common\model\app\PagesModel;
use app\website\controller\admin\Common;
use app\common\model\setting\SettingModel;
class App extends Common {

    public function index(){
        $AppInstall = new AppInstall();
        $appTypeInfo = $AppInstall->getAppByAppid($this->app->app_type);
        if(empty($appTypeInfo)){
            $this->warning('该应用您暂未安装');
        }
        $PagesModel = new PagesModel();
        $PagesModel->getDefaultThem();
        $url = 'https://'.$_SERVER['HTTP_HOST'].'/h5/'.$appTypeInfo['app_dir'].'#/pages/index/index?app_id=' . $this->appId;
        $downloadUrl = 'https://'.$_SERVER['HTTP_HOST'].'/website/admin.app.app/download?appToken='.urlencode($this->request->param("appToken"));

        $SettingModel = new SettingModel();
        $qinniu = $SettingModel->getCache('qiniu_oss',false,true);

        $this->datas['url'] = $url;
        $this->datas['downloadurl'] = $downloadUrl;
        $this->datas['request'] = 'https://'.$_SERVER['HTTP_HOST'];
        $this->datas['socket'] = 'wss://'.$_SERVER['HTTP_HOST'];
        $this->datas['uploadFile'] = 'https://'.$_SERVER['HTTP_HOST'];
        if(!empty($qinniu) && $qinniu['is_open'] == 1){
            $this->datas['downloadFile'] = 'https://'.$_SERVER['HTTP_HOST'].'；'.$qinniu['imgUrl'];
        }else{
             $this->datas['downloadFile'] = 'https://'.$_SERVER['HTTP_HOST'];
        }
    }

    public function download(){
        $type = $this->request->param('type');
        if(empty($type)) {
            $this->warning('类型不正确');
        }
        $AppInstall = new AppInstall();
        $appTypeInfo = $AppInstall->getAppByAppid($this->app->app_type);
        if(empty($appTypeInfo)){
            $this->warning('该应用您暂未安装');
        }

        $this->isReturn = true;//不使用析构
        $AppInstall->getMiniappZip($this->appId,$this->app->app_type,$type);
    }
}
