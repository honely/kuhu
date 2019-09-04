<?php
namespace app\admin\controller\setting;
use app\admin\controller\Common;
use app\common\model\setting\SettingModel;

class Setting extends Common
{
    private $settingKey = 'setting';
    private $bannerKey = 'banner';
    private $linkKey = 'link';
    private $app_key  = 'app_type';

    public function getBanner(){
        $SettingModel = new SettingModel();
        $banners = $SettingModel->getCache($this->bannerKey,false,true);
        $this->datas['banner'] = empty($banners['banners']) ? [] : $banners['banners'];
    }

    public  function setBanner(){
        $SettingModel = new SettingModel();
        $banner = $this->request->param('banner','','SecurityEditorHtml');
        $banners = json_decode($banner,true);
        if(empty($banners)){
            $this->warning('请上传banner');
        }
        $SettingModel->setCache($this->bannerKey,['banners'=>$banners]);
    }

    public function getLink(){
        $SettingModel = new SettingModel();
        $links = $SettingModel->getCache($this->linkKey,false,true);
        $this->datas['link'] = empty($links['links']) ? [] : $links['links'];
    }

    public  function setLink(){
        $SettingModel = new SettingModel();
        $link = $this->request->param('link','','SecurityEditorHtml');
        $links = json_decode($link,true);
        if(empty($links)){
            $this->warning('请填写友情链接');
        }
        $SettingModel->setCache($this->linkKey,['links'=>$links]);
    }


    public function getSetting(){
        $SettingModel = new SettingModel();
        $setting = $SettingModel->getCache($this->settingKey,false,true);
        $apps =  $SettingModel->getCache($this->app_key,false,true); 
        $this->datas['setting'] = $setting;
        if(!empty($apps['apps'])){
            $return = [];
            foreach($apps['apps'] as $val){
                if($val['is_install'] == 1){
                    $return[] = $val;
                }
            }
            
            $this->datas['apps'] = $return;
        }
    }

    public function setSetting(){
        $SettingModel = new SettingModel();
        $SettingModel->setCache($this->settingKey);
    }


}
