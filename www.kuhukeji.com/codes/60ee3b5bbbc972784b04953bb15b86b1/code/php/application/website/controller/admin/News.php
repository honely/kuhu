<?php
namespace app\website\controller\admin;
use app\website\model\website\NewsCategoryModel;
use app\website\model\website\NewsModel;


class News  extends Common {
    protected $newsType;

    protected $default_seo = ['title' => '', 'keywords' => '', 'description' => '', 'releaseDate' => '', 'image' => []];


    public function getCat()
    {
        $NewsCategoryModel = new NewsCategoryModel();
        $listTmp = $NewsCategoryModel->where(['app_id'=>$this->appId])->select();
        $list = [];
        foreach ($listTmp as $v) {
            $list[$v->category_id] = [
                'category_id' => $v->category_id,
                'title' => $v->title,
                'orderby' => $v->orderby,
            ];
        }
        $this->newsType = $list;
        $this->datas['list'] = $list;
    }


    public function catCreate(){
        $NewsCategoryModel = new NewsCategoryModel();
        $res = $NewsCategoryModel->setData($NewsCategoryModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($NewsCategoryModel->getError());
        }
    }

    public function catEdit(){
        $category_id = (int) $this->request->param("category_id");
        $NewsCategoryModel = new NewsCategoryModel();
        if (!$detail = $NewsCategoryModel->find($category_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $res = $NewsCategoryModel->setData($NewsCategoryModel->dataFilter($this->appId),  $category_id);
        if ($res === false) {
            $this->warning($NewsCategoryModel->getError());
        }
    }


    public function catDel(){
        $category_id = (int) $this->request->param("category_id");
        $NewsCategoryModel = new NewsCategoryModel();
        if (!$detail = $NewsCategoryModel->find($category_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $NewsCategoryModel->where("category_id",   $category_id)->delete();
    }


    public function catDetail() {
        $category_id = (int) $this->request->param("category_id");
        $NewsCategoryModel = new  NewsCategoryModel();
        if (!$detail = $NewsCategoryModel->find($category_id)) {
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
        $NewsCategoryModel = new NewsCategoryModel();
        $where['app_id'] = $this->appId;
        $title = (string) $this->request->param("title");
        if($title){
            $where["title"] = ["LIKE","%{$title}%"];
        }
        $list = $NewsCategoryModel->where($where)->order("category_id desc")->page($this->page, $this->limit)->select();
        $count = $NewsCategoryModel->where($where)->count();
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


    public function create(){
        $NewsModel = new NewsModel();
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
        $res = $NewsModel->setData($NewsModel->dataFilter($this->appId,$seo));
        if ($res == false) {
            $this->warning($NewsModel->getError());
        }
    }

    public function edit(){
        $news_id = (int) $this->request->param("news_id");
        $NewsModel = new NewsModel();
        if (!$detail = $NewsModel->find($news_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
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
            if (empty($seo['image'])) {
                $this->warning("请上传百度SEO封面图片");
            }
            $seo['releaseDate'] = date("Y-m-d H:i:s",strtotime($seo['releaseDate']));
            if (count($seo['image']) > 3) {
                $seo['image'] = array_slice($seo['image'],0,3);
            }
            $seo = json_encode($seo,JSON_UNESCAPED_UNICODE);
        } else {
            $this->warning("请填写百度SEO相关信息");
        }
        $res = $NewsModel->setData($NewsModel->dataFilter($this->appId,$seo),  $news_id);
        if ($res === false) {
            $this->warning($NewsModel->getError());
        }
    }

    public function del(){
        $news_id = (int) $this->request->param("news_id");
        $NewsModel = new NewsModel();
        if (!$detail = $NewsModel->find($news_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $NewsModel->where("news_id",   $news_id)->delete();
    }

    public function detail() {
        $news_id = (int) $this->request->param("news_id");
        $NewsModel = new  NewsModel();
        if (!$detail = $NewsModel->find($news_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'news_id'  =>  $detail->news_id,
            'title'  =>  $detail->title,
            'photo'  =>  $detail->photo,
            'description'  =>  $detail->description,
            'detail'  =>  json_decode($detail->detail, true),
            'category_id'  =>  (int)($detail->category_id),
            'news_type_mean'  =>  isset($this->newsType[$detail->category_id]) ? $this->newsType[$detail->category_id]['title'] : '--',
            'add_time'  =>  $detail->add_time ? date('Y-m-d', $detail->add_time) : '--',
            'orderby' =>$detail->orderby,
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
                $orderby = ' views desc ';
            break;
            case 2:
                $orderby = ' news_id  desc ';
            break;
            case 3:
                $orderby = ' orderby desc ';
            break;
            default:
                $orderby = 'orderby desc , news_id desc ';
            break;
        }
        $NewsModel = new NewsModel();

        $list = $NewsModel->where($where)->order($orderby)->limit(0,$num)->select();
        $this->getCat();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'news_id'  =>  $val->news_id,
                'title'  =>  $val->title,
                'photo'  =>  $val->photo,
                'description'  =>  $val->description,
                'category_id'  =>  (int)$val->category_id,
                'news_type_mean'  =>  isset($this->newsType[$val->category_id]) ? $this->newsType[$val->category_id]['title'] : '--',
                'add_time'  =>  $val->add_time ? date('Y-m-d', $val->add_time) : '--',
                'add_ip' => $val->add_ip,
                'orderby' =>$val->orderby
            ];
        }

        $this->datas['lists'] = $datas;
    }

    public function index(){
        $NewsModel = new NewsModel();
        $where['app_id'] = $this->appId;
        $title = (string) $this->request->param("title");
        if($title){
            $where["title"] = ["LIKE","%{$title}%"];
        }
        $end_add_time = (int) $this->request->param("end_add_time",0,"strtotime");
        $bg_add_time = (int) $this->request->param("bg_add_time",0,"strtotime");
        if($end_add_time > 0 && $bg_add_time > 0){
            $where["add_time"] = ["between",[$bg_add_time,$end_add_time]];
        }
        $category_id = (int) $this->request->param('category_id',0);
        if($category_id > 0){
            $where["category_id"] = $category_id;
        }
        $list = $NewsModel->where($where)->order("orderby desc,news_id desc")->page($this->page, $this->limit)->select();
        $count = $NewsModel->where($where)->count();
        $this->getCat();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'news_id'  =>  $val->news_id,
                'title'  =>  $val->title,
                'photo'  =>  $val->photo,
                'description'  =>  $val->description,
                'category_id'  =>  (int)$val->category_id,
                'news_type_mean'  =>  isset($this->newsType[$val->category_id]) ? $this->newsType[$val->category_id]['title'] : '--',
                'add_time'  =>  $val->add_time ? date('Y-m-d', $val->add_time) : '--',
                'add_ip' => $val->add_ip,
                'orderby' =>$val->orderby
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    public function deleteByIds()
    {
        $newsIds = (string) $this->request->param('newsIds');
        $newsIds = json_encode($newsIds, true);
        $newsIds = empty($newsIds) ? '' : $newsIds;
        $NewsModel = new NewsModel();
        $NewsModel->where(['app_id'=>$this->appId])->whereIn('news_id',$newsIds)->delete();
    }


    public function delete() {
        $NewsModel = new NewsModel();
        $news_id = (int) $this->request->param('news_id',0);
        if (!$news = $NewsModel->find($news_id)) {
            $this->warning('参数不正确!');
        }
        if ($news->app_id != $this->appId) {
            $this->warning('参数不正确!');
        }
        $NewsModel->where(['news_id'=>$news_id])->delete();
    }

}
