<?php
namespace app\web\controller;
use app\common\library\token\AppToken as CodeAuth ;
use app\common\model\member\MemberModel;
use app\common\model\setting\SettingModel;
use think\Controller;

class Common extends Controller{
    protected $checkLogin = false;
    protected $memberId = 0;
    protected $member = [];
    protected $apps = [];
    protected $app_key = 'app_type';
    protected $selectIndex = 0;
    protected $siteInfo = [];

    protected function _initialize(){
        parent::_initialize();
        $this->checkLogin($this->checkLogin);
        $SettingModel = new SettingModel();
        
        $this->apps = $SettingModel->getCache($this->app_key,false,true); //因为下面要改变 所以 用数组来返回
        
        if(empty($this->apps['apps'])){
           $this->error('请先进入后台设置','/admin');
        }
        
        $this->siteInfo = $SettingModel->getCache('setting',false,true);
        $this->assign('siteinfo',$this->siteInfo);
        $this->assign('apps',$this->apps['apps']);
        $this->assign('selectIndex',$this->selectIndex);
    }
    
   

    public function logout(){
        cookie("wyuMemberToken",null);
        $this->success('退出登录成功','/web/passport/login');
    }
    public function checkLogin($checkLogin){
        $token  = cookie("wyuMemberToken");
        $CodeAuth = new CodeAuth();
        $memberCode  = $CodeAuth->getMemberAuthDeCode($token);
        $url = $this->request->controller();
        if(strtolower($url)  == "passport" ){
            return ;
        }
        if($memberCode == false && $this->checkLogin == false  ){
            return ;
        }
        if($memberCode == false){
            $this->redirect(url("/web/passport/login"));
        }
        $member = MemberModel::get($memberCode['member_id']);
        if(empty($member) || $member->is_lock != 0){
            $this->redirect(url("/web/passport/login"));
        }
        $this->member = $member;
        $this->memberId = $member->member_id;
        $this->assign("member",$member);
    }
}
