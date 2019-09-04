<?php
namespace app\admin\controller\setting;
use app\admin\controller\Common;
use app\common\library\AppInstall;
use app\common\library\token\AppToken;
session_write_close(); //关闭写的功能  因为部分函数要 set_time_limit(0) 设置不超时操作
class Apps extends Common
{
    
    //检查版本是否有更新
    public function checkV(){
       $AppInstall = new AppInstall();
       if($AppInstall->checkV()){
           $this->datas['is_new'] = 1;
       }else{
           $this->datas['is_new'] = 0;
       } 
    }
    
    public function downloadMain(){
        $AppInstall = new AppInstall();
        $AppInstall->downloadMain();
    }
    
    public function unzipMain(){
        $AppInstall = new AppInstall();
        $AppInstall->unzipMain();
    }
    
    
    public function install(){
        $appid = (int)$this->request->param('app_id');
        $code =  $this->request->param('code');
        $AppInstall = new AppInstall();
        if(false == $AppInstall->install($appid,$code)){
           $this->warning($AppInstall->getErrors());     
        } 
    }
    
     public function installSqlMain(){
        $AppInstall = new AppInstall();        
        if(!$AppInstall->installSqlMain()){
            $this->warning('数据库安装失败！');
        }
    }

    public function installSql(){
        $update_v = $this->request->param('update_v');
        $appid = (int)$this->request->param('app_id');
        $AppInstall = new AppInstall();
        
        if(!$AppInstall->installSql($appid,$update_v)){
            $this->warning('数据库安装失败！');
        }

    }
    
    public function installFileMain(){
         $AppInstall = new AppInstall();
         $AppInstall->installFileMain();
    }

    public function installFile(){
        $update_v = $this->request->param('update_v');

        $appid = (int)$this->request->param('app_id');
        $AppInstall = new AppInstall();
        $AppInstall ->installFile($appid,$update_v);
    }

    public function unzip(){
        //echo $appid;die;
        $update_v = $this->request->param('update_v');

        $appid = (int)$this->request->param('app_id');
        $AppInstall = new AppInstall();
        $AppInstall->unzipFile($appid,$update_v);
    }

    public function getApps(){
        $AppInstall = new AppInstall();

        $CodeAuth = new AppToken();

        if($datas = $AppInstall->getApps()){
            foreach($datas['apps'] as $key=>$val){ //后台的管理地址URL组合 前台的逻辑前台判断
                if($val['app_type'] == 1){ //如果是 SAAS小程序
                    $datas['apps'][$key]['admin_url'] = $val['admin_url'].$val['app_id'];
                }else{ //如果是自营平台
                    $datas['apps'][$key]['admin_url'] = $val['admin_url'].urlencode($CodeAuth->getAppAdminAuthCode($val['app_dir'],0));
                }
            }
            $this->datas['apps'] = $datas['apps'];
            $this->datas['vote_num'] = $datas['vote_num'];
        }else{
            $this->warning('获取数据失败');
        }
    }
    
    public function installYesMain(){
         $AppInstall = new AppInstall();
         $AppInstall->installYesMain();
    }
    
    public function installYes(){
        $appid = (int)$this->request->param('app_id');
        $AppInstall = new AppInstall();
        if($datas = $AppInstall->installYes($appid)){
            $this->datas['apps'] = $datas['apps'];
            $this->datas['vote_num'] = $datas['vote_num'];
        }else{
            $this->warning('初始化失败');
        }
    }
    public function updateYes(){
        $appid = (int)$this->request->param('app_id');
        $updateId = (int)$this->request->param('updateId');

        $AppInstall = new AppInstall();
        if($datas = $AppInstall->updateYes($appid,$updateId)){
            $this->datas['apps'] = $datas['apps'];
            $this->datas['vote_num'] = $datas['vote_num'];
        }else{
            $this->warning('初始化失败');
        }
    }

    public function download(){
        $update_v = $this->request->param('update_v');
        $updateId = (int)$this->request->param('updateId');
        $appid = (int)$this->request->param('app_id');
        $AppInstall = new AppInstall();
        $AppInstall->download($appid,$updateId,$update_v);
    }

    

}
