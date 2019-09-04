<?php
namespace app\website\controller\admin;


use app\website\model\website\ExampleCategoryModel;
use app\website\model\website\ExampleModel;


class Example  extends Common{
    protected $exampleType;

    protected $default_seo = ['title' => '', 'keywords' => '', 'description' => '', 'releaseDate' => '', 'image' => []];

    public function getCat()
    {
        $ExampleCategoryModel = new ExampleCategoryModel();
        $listTmp = $ExampleCategoryModel->where(['app_id'=>$this->appId])->select();
        $list = $data = [];
        foreach ($listTmp as $v) {
            $data[] = [
                'category_id' => $v->category_id,
                'title' => $v->title,
                'orderby' => $v->orderby,
            ];
            $list[$v->category_id] = [
                'category_id' => $v->category_id,
                'title' => $v->title,
                'orderby' => $v->orderby,
            ];
        }
        $this->exampleType = $list;
        $this->datas['list'] = $list;
    }


    public function catCreate(){
        $ExampleCategoryModel = new ExampleCategoryModel();
        $res = $ExampleCategoryModel->setData($ExampleCategoryModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($ExampleCategoryModel->getError());
        }
    }

    public function catEdit(){
        $category_id = (int) $this->request->param("category_id");
        $ExampleCategoryModel = new ExampleCategoryModel();
        if (!$detail = $ExampleCategoryModel->find($category_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $res = $ExampleCategoryModel->setData($ExampleCategoryModel->dataFilter($this->appId),  $category_id);
        if ($res === false) {
            $this->warning($ExampleCategoryModel->getError());
        }
    }


    public function catDel(){
        $category_id = (int) $this->request->param("category_id");
        $ExampleCategoryModel = new ExampleCategoryModel();
        if (!$detail = $ExampleCategoryModel->find($category_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $ExampleCategoryModel->where("category_id",   $category_id)->delete();
    }


    public function catDetail() {
        $category_id = (int) $this->request->param("category_id");
        $ExampleCategoryModel = new  ExampleCategoryModel();
        if (!$detail = $ExampleCategoryModel->find($category_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'category_id'  =>  $detail->category_id,
            'title'  =>  $detail->title,
            'orderby'  =>  $detail->orderby,
        ];
    }


    public function catIndex(){
        $ExampleCategoryModel = new ExampleCategoryModel();
        $where['app_id'] = $this->appId;
        $title = (string) $this->request->param("title");
        if($title){
            $where["title"] = ["LIKE","%{$title}%"];
        }
        $list = $ExampleCategoryModel->where($where)->order("category_id desc")->page($this->page, $this->limit)->select();
        $count = $ExampleCategoryModel->where($where)->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'category_id'  =>  $val->category_id,
                'title'  =>  $val->title,
                'orderby'  =>  $val->orderby,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    public function exampleCreate(){
        $category_id = (int) $this->request->param("category_id");
        $ExampleModel = new ExampleModel();
        $ExampleCategoryModel = new ExampleCategoryModel();
        if(!$cat = $ExampleCategoryModel->where(['app_id'=>$this->appId,'category_id'=>$category_id])->find()){
            $this->warning('不存在的分类！');
        }
        $seo_tmp = (string)$this->request->param("seo",'','SecurityEditorHtml');
        $seo = json_decode($seo_tmp) ? json_decode($seo_tmp, true) : [];
        if (!empty($seo)) {
            if (!$seo['title']) {
                $this->warning("请填写百度SEO标题");
            }
            if (!$seo['keywords']) {
                $this->warning("请填写百度SEO关键词");
            }
            if (!$seo['description']) {
                $this->warning("请填写百度SEO描述");
            }
            if (!$seo['releaseDate']) {
                $this->warning("请选择百度SEO信息原始发布时间");
            }
            $seo['releaseDate'] = date("Y-m-d H:i:s",strtotime($seo['releaseDate']));
            if (empty($seo['image'])) {
                $this->warning("请上传百度SEO封面图片");
            }
            if (count($seo['image']) > 3) {
                $seo['image'] = array_slice($seo['image'],0,3);
            }
            $seo = json_encode($seo,JSON_UNESCAPED_UNICODE);
        } else {
            $this->warning("请填写百度SEO相关信息");
        }
        $res = $ExampleModel->setData($ExampleModel->dataFilter($this->appId,$seo));
        if ($res == false) {
            $this->warning($ExampleModel->getError());
        }
    }


    public function exampleEdit(){
        $example_id = (int) $this->request->param("example_id");
        $category_id = (int) $this->request->param("category_id");
        $ExampleModel = new ExampleModel();
        if (!$detail = $ExampleModel->find($example_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $ExampleCategoryModel = new ExampleCategoryModel();
        if(!$cat = $ExampleCategoryModel->where(['app_id'=>$this->appId,'category_id'=>$category_id])->find()){
            $this->warning('不存在的分类！');
        }
        $seo_tmp = (string)$this->request->param("seo",'','SecurityEditorHtml');
        $seo = json_decode($seo_tmp) ? json_decode($seo_tmp, true) : [];
        if (!empty($seo)) {
            if (!$seo['title']) {
                $this->warning("请填写百度SEO标题");
            }
            if (!$seo['keywords']) {
                $this->warning("请填写百度SEO关键词");
            }
            if (!$seo['description']) {
                $this->warning("请填写百度SEO描述");
            }
            if (!$seo['releaseDate']) {
                $this->warning("请选择百度SEO信息原始发布时间");
            }
            $seo['releaseDate'] = date("Y-m-d H:i:s",strtotime($seo['releaseDate']));
            if (empty($seo['image'])) {
                $this->warning("请上传百度SEO封面图片");
            }
            if (count($seo['image']) > 3) {
                $seo['image'] = array_slice($seo['image'],0,3);
            }
            $seo = json_encode($seo,JSON_UNESCAPED_UNICODE);
        } else {
            $this->warning("请填写百度SEO相关信息");
        }
        $res = $ExampleModel->setData($ExampleModel->dataFilter($this->appId,$seo),  $example_id);
        if ($res === false) {
            $this->warning($ExampleModel->getError());
        }
    }


    public function exampleDel(){
        $example_id = (int) $this->request->param("example_id");
        $ExampleModel = new ExampleModel();
        if (!$detail = $ExampleModel->find($example_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $ExampleModel->where(['app_id'=>$this->appId,"example_id"=>$example_id])->delete();
    }


    public function exampleDetail() {
        $example_id = (int) $this->request->param("example_id");
        $ExampleModel = new  ExampleModel();
        if (!$detail = $ExampleModel->find($example_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'example_id'  =>  $detail->example_id,
            'title'   =>  $detail->title,
            'category_id' => (int)$detail->category_id,
            'photo'   =>  $detail->photo,
            'photos'  =>  json_decode($detail->photos, true) ? json_decode($detail->photos, true) : $detail->photos,
            'info'    =>    json_decode($detail->info,true),
            'detail'  =>  json_decode($detail->detail, true),
            'seo' => json_decode($detail->seo) ? json_decode($detail->seo,true) : $this->default_seo,
        ];
    }


    public function getCalldata(){
        $where['app_id'] = $this->appId;
        $num = (int)$this->request->param('num');
        $cateId = (int) $this->request->param('cateId');
        if($cateId){
            $where['category_id'] = $cateId;
        }
        $order = (int) $this->request->param('order');
        $orderby = '';
        switch($order){
            case 1:
                $orderby = 'views desc';
            break;
            case 2:
                $orderby = 'example_id  desc';
            break;
            case 3:
                $orderby = 'orderby desc';
            break;
            default:
                $orderby = 'orderby desc,example_id desc';
            break;
        }
        $ExampleModel = new ExampleModel();

        $list = $ExampleModel->where($where)->order($orderby)->limit(0,$num)->select();
        $this->getCat();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'example_id'  =>  $val->example_id,
                'category_id' => $val->category_id,
                'category_name' => isset($this->exampleType[$val->category_id]) ? $this->exampleType[$val->category_id]['title'] : '',
                'title'  =>  $val->title,
                'photo'  =>  $val->photo,
                'photos'  =>  json_decode($val->photos, true) ? json_decode($val->photos, true) : $val->photos,
                'info'  =>  json_decode($val->info, true),
                'detail'  =>  json_decode($val->detail, true),
                'add_time' => $val->add_time ? date('Y-m-d H:i', $val->add_time) : '--',
                'add_ip' => $val->add_ip,
            ];
        }

        $this->datas['lists'] = $datas;
    }

    public function exampleIndex(){
        $ExampleModel = new ExampleModel();
        $where['app_id'] = $this->appId;
        $title = (string) $this->request->param("title");
        $category_id = (int) $this->request->param("category_id");
        if($title){
            $where["title"] = ["LIKE","%{$title}%"];
        }
        if($category_id){
            $where["category_id"] = $category_id;
        }

        $list = $ExampleModel->where($where)->order("example_id desc")->page($this->page, $this->limit)->select();
        $count = $ExampleModel->where($where)->count();
        $this->getCat();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'example_id'  =>  $val->example_id,
                'category_id' => $val->category_id,
                'category_name' => isset($this->exampleType[$val->category_id]) ? $this->exampleType[$val->category_id]['title'] : '',
                'title'  =>  $val->title,
                'photo'  =>  $val->photo,
                'photos'  =>  json_decode($val->photos, true) ? json_decode($val->photos, true) : $val->photos,
                'info'  =>  json_decode($val->info, true),
                'detail'  =>  json_decode($val->detail, true),
                'add_time' => $val->add_time ? date('Y-m-d H:i', $val->add_time) : '--',
                'add_ip' => $val->add_ip,
            ];
        }

        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    public function deleteExampleByIds()
    {
        $exampleIds = (string) $this->request->param('exampleIds');
        $exampleIds = json_encode($exampleIds, true);
        $exampleIds = empty($exampleIds) ? '' : $exampleIds;
        $ExampleModel = new ExampleModel();
        $ExampleModel->where(['app_id'=>$this->appId])->whereIn('example_id', $exampleIds)->delete();
    }




}
