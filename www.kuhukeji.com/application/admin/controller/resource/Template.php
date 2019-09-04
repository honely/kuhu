<?php
namespace app\admin\controller\resource;

use app\admin\controller\Common;
use app\common\model\app\TemplatesModel;
use  app\common\library\AppInstall;
use app\common\model\app\TemplateCatsModel;

class Template extends Common
{

    public function catList(){
        $app_type = (int) $this->request->param('app_type');
        if(empty($app_type)){
            $this->warning('访问数据不正确');
        }    
        $AppInstall = new AppInstall();
        $appTypeInfo = $AppInstall->getAppByAppid($app_type);
        if(empty($appTypeInfo)){
            $this->warning('该应用您暂未安装');
        }
        $where = [];
        $where['app_type'] = $app_type;
        $cat_name = $this->request->param('cat_name');
        if(!empty($cat_name)){
            $where['cat_name'] = ['like',"%$cat_name%"];
        }
        $TemplateCatsModel = new TemplateCatsModel();
        $listTmp = $TemplateCatsModel->where($where)->order("orderby desc")->page($this->page,$this->limit)->select();
        $count = $TemplateCatsModel->where($where)->count();

        $datas = [];

        foreach($listTmp as $val){
            $datas[] = [
                'cat_id' => $val['cat_id'],
                'cat_name' => $val['cat_name'],
                'orderby'   => $val['orderby'],
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }

    //内部使用
    private function getAllCats($app_type ){       
        $TemplateCatsModel = new TemplateCatsModel();
        $cats = $TemplateCatsModel->where(['app_type'=>$app_type])->order(['orderby'=>'desc'])->select();
        $datas = [];
        foreach($cats as $val){
            $datas[$val['cat_id']] = $val;
        }
        return $datas;
    }

    //对外
    public function  allCats(){
        $app_type = (int) $this->request->param('app_type');
        if(empty($app_type)){
            $this->warning('访问数据不正确');
        }    
        $AppInstall = new AppInstall();
        $appTypeInfo = $AppInstall->getAppByAppid($app_type);
        if(empty($appTypeInfo)){
            $this->warning('该应用您暂未安装');
        }

        $TemplateCatsModel = new TemplateCatsModel();
        $cats  = $TemplateCatsModel->where(['app_type'=>$app_type])->order(['orderby'=>'desc'])->select();
        $datas = [];
        foreach($cats as $val){
            $datas[] = [
                'cat_id' => $val['cat_id'],
                'cat_name' => $val['cat_name'],
                'orderby'  => $val['orderby'],
            ];
        }
        $this->datas['appTypeInfo'] = $appTypeInfo;
        $this->datas['cats'] = $datas;
    }

    public function delCat(){
        $cat_id = (int)$this->request->param('cat_id');
        if(empty($cat_id)){
            $this->warning('要删除的分类不存在');
        }
        $TemplateCatsModel = new TemplateCatsModel();
        if(!$detail = $TemplateCatsModel->get($cat_id)){
            $this->warning('要删除的分类不存在');
        }
        if(!$TemplateCatsModel->where(['cat_id'=>$cat_id])->delete()){
            $this->warning('要删除的分类不存在');
        }
    }

    public function createCat(){
        $app_type = (int) $this->request->param('app_type');
        if(empty($app_type)){
            $this->warning('访问数据不正确');
        }    
        $AppInstall = new AppInstall();
        $appTypeInfo = $AppInstall->getAppByAppid($app_type);
        if(empty($appTypeInfo)){
            $this->warning('该应用您暂未安装');
        }
        $cat_name = $this->request->param('cat_name');
        $orderby = $this->request->param('orderby');
        if(empty($cat_name)){
            $this->warning('分类名称不能为空');
        }
        $data = [
            'cat_name' => $cat_name,
            'app_type'  => $app_type,
            'orderby'   => $orderby
        ];
        $TemplateCatsModel = new TemplateCatsModel();
        $TemplateCatsModel->save($data);
    }

    public function editCat(){
        $cat_id = (int)$this->request->param('cat_id');
        if(empty($cat_id)){
            $this->warning('要删除的分类不存在');
        }
        $TemplateCatsModel = new TemplateCatsModel();
        if(!$detail = $TemplateCatsModel->get($cat_id)){
            $this->warning('要删除的分类不存在');
        }
        $cat_name = $this->request->param('cat_name');
        $orderby = $this->request->param('orderby');
        if(empty($cat_name)){
            $this->warning('分类名称不能为空');
        }
        $data = [
            'cat_name' => $cat_name,
            'orderby'   => $orderby,
        ];
        $TemplateCatsModel->save($data,['cat_id'=>$cat_id]);
    }

    //icon列表
    public function Index() {
        $title = (string) $this->request->param('title','');
        $audit = (int) $this->request->param('audit',-999);
        $app_type = (int) $this->request->param('app_type');
        $cat_id = (int)$this->request->param('cat_id');
        if(empty($app_type)){
            $this->warning('访问数据不正确');
        }    
        $AppInstall = new AppInstall();
        $appTypeInfo = $AppInstall->getAppByAppid($app_type);
        if(empty($appTypeInfo)){
            $this->warning('该应用您暂未安装');
        }


        $where = [];
        if ($title) {
            $where['title'] = ['like',"%$title%"];
        }
        if ($audit > 0) {
            $where['audit'] = $audit;
        }
        if($cat_id >0){
            $where['cat_id'] = $cat_id;
        }
      
    
        $where['app_type'] = $app_type;
     
        $TemplatesModel = new TemplatesModel();
        $listTmp = $TemplatesModel->where($where)->order("template_id desc")->page($this->page,$this->limit)->select();
        $count = $TemplatesModel->where($where)->count();
        $cats = $this->getAllCats($app_type);
        $list = [];
        $url = 'https://'.$_SERVER['HTTP_HOST'].'/h5/'.$appTypeInfo['app_dir'].'#/pages/plugin/index?tmp_id=';
        foreach ($listTmp as $v) {
            $list[] = [
                'template_id' => (int) $v->template_id,
                'app_type' => (int) $v->app_type,
                'cat_id'    => (int)$v->cat_id,
                'cat_name' => isset($cats[$v->cat_id]) ? $cats[$v->cat_id]['cat_name'] : '',
                'is_theme' => (int) $v->is_theme,
                'audit' => (int) $v->audit,
                'type' => (int) $v->type,
                'url'   => $url.$v->template_id.'&app_id='.$v->app_id,
                'title' => (string) $v->title,
                'photo' => (string) $v->photo,
            ];
        }
      
        $this->datas = [
            'appTypeInfo' => $appTypeInfo,
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }



    public function del()
    {
        $template_id = (int)$this->request->param("template_id");
        $TemplatesModel = new TemplatesModel();
        if (!$detail = $TemplatesModel->find($template_id)) {
            $this->warning("不存在数据");
        }
        $TemplatesModel->where("template_id", $template_id)->delete();
    }

    public function delete()
    {
        $template_id = (int)$this->request->param("template_id",0);
        $templateIds = (string)$this->request->param("templateIds");
        $templateIds = json_decode($templateIds,true) ? json_decode($templateIds,true) : [];

        if ($template_id && empty($templateIds)) {
            $templateIds[$template_id] = $template_id;
        }
        $TemplatesModel = new  TemplatesModel();
        $TemplatesModel->where(['template_id'=>['in',$templateIds]])->delete();

    }

    public function edit()
    {   
       $template_id = (int)$this->request->param('template_id');
       $TemplatesModel = new  TemplatesModel();
       if(!$detail = $TemplatesModel->get($template_id)){
           $this->warning('没有该数据');
       } 

       $audit = (int) $this->request->param('audit');
       $title = $this->request->param('title');
       $photo = $this->request->param('photo');
       $cat_id = (int)$this->request->param('cat_id');
       if(empty($title)){
           $this->warning('标题不能为空');
       }
       if(empty($photo)){
           $this->warning('请上传图片');
       }

       $TemplatesModel->save([
           'audit' => $audit ? 1  : 0,
           'title' => $title,
           'photo' => $photo,
           'cat_id' => $cat_id,
       ],['template_id'=>$template_id]);

    }


}
