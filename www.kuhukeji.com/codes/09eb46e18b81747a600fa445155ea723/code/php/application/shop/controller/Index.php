<?php
namespace app\shop\controller;
use app\common\library\token\AppToken as CodeAuth ;
use app\common\model\member\MemberModel;
use app\common\model\setting\SettingModel;
use app\common\model\app\TemplatesModel;
use app\common\model\app\TemplateCatsModel;

use think\Controller;
class Index  extends Controller{
    protected $checkLogin = false;
    protected $memberId = 0;
    protected $member = [];
    protected $apps = [];
    protected $app_key = 'app_type';
    protected $selectIndex = 0;
    

    protected function _initialize()
    {
        $this->checkLogin($this->checkLogin);
        $SettingModel = new SettingModel();
        $this->apps = $SettingModel->getCache($this->app_key,false,true); //因为下面要改变 所以 用数组来返回
        $this->assign('siteinfo',$SettingModel->getCache('setting',false,true));
        $this->assign('apps',$this->apps['apps']);
        $this->assign('selectIndex',$this->selectIndex);
    }

    /**
     * webview
     */
    public function web(){
        return "<a href='https:\/\/wx.tenpay.com\/cgi-bin\/mmpayweb-bin\/checkmweb?prepay_id=wx151830219606888ebf046e702293225229&package=2965656186'>跳转</a>";
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



    public function index(){
        $app_type = '';
        $apps = [];
        foreach($this->apps['apps'] as $val){
            $apps[$val['app_id']] = $val;
            if($val['app_dir'] == 'shop'){
                $app_type = $val['app_id'];
            }
        }
        $TemplatesModel = new  TemplatesModel();
        $datas = $TemplatesModel->where(['audit'=>1,'app_type' => $app_type])->order(['template_id'=>'desc'])->limit(0,6)->select();
        $temps = [];
        foreach($datas as $v){
          $temps[] = [
            'template_id' => (int) $v->template_id,
            'is_theme' => (int) $v->is_theme,
            'audit' => (int) $v->audit,
            'type' => (int) $v->type,
            'url'   => 'https://'.$_SERVER['HTTP_HOST'].'/h5/'.$apps[$v->app_type]['app_dir'].'#/pages/plugin/index?tmp_id='.$v->template_id.'&app_id='.$v->app_id,
            'title' => (string) $v->title,
            'photo' => (string) $v->photo,
          ];
        }
        $this->assign('temps',$temps);

        return $this->fetch();
    }

    public function template(){
    
        $where = [
            'audit' => 1,
        ];
        $cat = (int)$this->request->param('cat');
        $cats = [];
        $apps = [];
        $app = [];
        foreach($this->apps['apps'] as $val){
            $apps[$val['app_id']] = $val;
            if($val['app_dir'] == 'shop'){
                $app = $val;
            }
        }   
        
        if(!empty($app)){
            $this->assign('appname',$app['app_name']);
            $where['app_type'] = $app['app_id'];
            $cats = TemplateCatsModel::where(['app_type'=>$app['app_id']])->order(['orderby'=>'desc'])->select();
            foreach($cats as $val){
                if($cat == $val['cat_id']){
                    $where['cat_id'] = $val['cat_id'];
                    $this->assign('catname',$val['cat_name']);
                }
            }
        }
        $count = TemplatesModel::where($where)->count();
        $list = TemplatesModel::where($where)->order(['template_id' => 'desc'])->paginate(8, $count);
        $page = $list->render();
        $temps = [];
        foreach($list as $v){
            $temps[] = [
              'template_id' => (int) $v->template_id,
              'is_theme' => (int) $v->is_theme,
              'audit' => (int) $v->audit,
              'type' => (int) $v->type,
              'url'   => 'https://'.$_SERVER['HTTP_HOST'].'/h5/'.$apps[$v->app_type]['app_dir'].'#/pages/plugin/index?tmp_id='.$v->template_id.'&app_id='.$v->app_id,
              'title' => (string) $v->title,
              'photo' => (string) $v->photo,
            ];
          }
        $this->assign('page',$page);  
        $this->assign('temps',$temps);
        $this->assign('cat',$cat);
        $this->assign('cats',$cats);
        return $this->fetch();
    }

}