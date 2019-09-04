<?php

namespace app\website\controller\admin;


use app\website\model\website\ProductCategoryModel;
use app\website\model\website\ProductModel;

class Product extends Common
{
    protected $cat;

    protected $default_seo = ['title' => '', 'keywords' => '', 'description' => '', 'releaseDate' => '', 'image' => []];

    public function getCat()
    {
        $ProductCategoryModel = new ProductCategoryModel();
        $catTmp = $ProductCategoryModel->where(['app_id'=>$this->appId])->select();
        $cat = [];
        foreach ($catTmp as $v) {
            $cat[$v->category_id] = [
                'category_id' => $v->category_id,
                'title' => $v->title,
                'orderby' => $v->orderby,
            ];
        }
        $this->cat = $cat;

        $this->datas['list'] = $cat;
    }

    public function catCreate()
    {
        $ProductCategoryModel = new ProductCategoryModel();
        $res = $ProductCategoryModel->setData($ProductCategoryModel->dataFilter($this->appId));
        $count = $ProductCategoryModel->where("app_id", $this->appId)->count();
        if ($count >= 20) {
            $this->warning("您最多添加20个分类");
        }
        if ($res == false) {
            $this->warning($ProductCategoryModel->getError());
        }
    }

    public function catEdit()
    {
        $category_id = (int)$this->request->param("category_id");
        $ProductCategoryModel = new ProductCategoryModel();
        if (!$detail = $ProductCategoryModel->find($category_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $res = $ProductCategoryModel->setData($ProductCategoryModel->dataFilter($this->appId), $category_id);
        if ($res === false) {
            $this->warning($ProductCategoryModel->getError());
        }
    }

    public function catDel()
    {
        $category_id = (int)$this->request->param("category_id");
        $ProductCategoryModel = new ProductCategoryModel();
        if (!$detail = $ProductCategoryModel->find($category_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $ProductCategoryModel->where("category_id", $category_id)->delete();
    }

    public function catDetail()
    {
        $category_id = (int)$this->request->param("category_id");
        $ProductCategoryModel = new  ProductCategoryModel();
        if (!$detail = $ProductCategoryModel->find($category_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'category_id' => $detail->category_id,
            'title' => $detail->title,
            'orderby' => $detail->orderby,
        ];
    }




    public function catIndex()
    {
        $ProductCategoryModel = new ProductCategoryModel();
        $where['app_id'] = $this->appId;
        $title = (string)$this->request->param("title");
        if (!empty($title)) {
            $where["title"] = ["LIKE", "%{$title}%"];
        }
        $list = $ProductCategoryModel->where($where)->order("category_id desc")->page(1,20)->select();
        $count = $ProductCategoryModel->where($where)->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'category_id' => $val->category_id,
                'title' => $val->title,
                'orderby' => $val->orderby,
            ];
        }
        $this->datas = [
            'limit' => $this->limit,
            'list' => $datas,
            'count' => $count,
        ];
    }



    public function create()
    {
        $ProductModel = new ProductModel();
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
        $res = $ProductModel->setData($ProductModel->dataFilter($this->appId,$seo));
        if ($res == false) {
            $this->warning($ProductModel->getError());
        }
    }

    public function edit()
    {
        $product_id = (int)$this->request->param("product_id");
        $ProductModel = new ProductModel();
        if (!$detail = $ProductModel->find($product_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
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
        $res = $ProductModel->setData($ProductModel->dataFilter($this->appId,$seo), $product_id);
        if ($res === false) {
            $this->warning($ProductModel->getError());
        }
    }

    public function del()
    {
        $product_id = (int)$this->request->param("product_id");
        $ProductModel = new ProductModel();
        if (!$detail = $ProductModel->find($product_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $ProductModel->where("product_id", $product_id)->delete();
    }

    public function delByIds()
    {
        $productIds = (string)$this->request->param("productIds",'','SecurityEditorHtml');
        $productIds = json_decode($productIds, true);
        $productIds = empty($productIds) ? '' : $productIds;
        $ProductModel = new ProductModel();
        $ProductModel->where(['app_id'=>$this->appId])->whereIn("product_id", $productIds)->delete();
    }

    public function detail()
    {
        $product_id = (int)$this->request->param("product_id");
        $ProductModel = new  ProductModel();
        if (!$detail = $ProductModel->find($product_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'product_id' => $detail->product_id,
            'title' => $detail->title,
            'sub_title' => $detail->sub_title,
            'category_id' => $detail->category_id,
            'photos' => json_decode($detail->photos, true),
            'photo' => $detail->photo,
            'price' => round($detail->price / 100, 2),
            'original_price' => round($detail->original_price / 100, 2),
            'notice' => $detail->notice,
            'detail' => json_decode($detail->detail, true),
            'is_online' => $detail->is_online,
            'mobile' => $detail->mobile,
            'orderby' => $detail->orderby,
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
                $orderby = ' product_id  desc ';
            break;
            case 3:
                $orderby = ' orderby desc ';
            break;
            default:
                $orderby = 'orderby desc , product_id desc ';
            break;
        }
        $ProductModel = new ProductModel();

        $list = $ProductModel->where($where)->order($orderby)->limit(0,$num)->select();
        $this->getCat();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'product_id' => $val->product_id,
                'title' => $val->title,
                'sub_title' => $val->sub_title,
                'category_id' => $val->category_id,
                'photo' => $val->photo,
                'photos' => json_decode($val->photos, true),
                'price' => $val->price ? round($val->price / 100, 2) : '面议',
                'original_price' => $val->original_price ? round($val->original_price / 100, 2) : '面议',
                'notice' => $val->notice,
                'detail' => json_decode($val->detail, true),
                'is_online' => $val->is_online,
                'mobile' => $val->mobile,
                'category_name' => isset($this->cat[$val->category_id]) ? $this->cat[$val->category_id]['title'] : '--',
                'add_time' => isset($val->add_time) ? date("Y-m-d H:i",$val->add_time) : '--',
                'add_ip' => $val->add_ip,
                'orderby' => $val->orderby,
            ];
        }

        $this->datas['lists'] = $datas;
    }


    public function index()
    {
        $ProductModel = new ProductModel();
        $where['app_id'] = $this->appId;
        $title = (string)$this->request->param("title");
        if (!empty($title)) {
            $where["title"] = ["LIKE", "%{$title}%"];
        }
        $category_id = (int)$this->request->param("category_id");
        if (!empty($category_id)) {
            $where["category_id"] = $category_id;
        }
        $is_online = (int)$this->request->param("is_online");
        if (!empty($is_online)) {
            $where["is_online"] = $is_online - 1;
        }
        $mobile = (string)$this->request->param("mobile");
        if (!empty($mobile)) {
            $where["mobile"] = ["LIKE", "%{$mobile}%"];
        }
        $end_add_time = (int)$this->request->param("end_add_time", 0, "strtotime");
        $bg_add_time = (int)$this->request->param("bg_add_time", 0, "strtotime");
        if ($end_add_time > 0 && $bg_add_time > 0) {
            $where["add_time"] = ["between", [$bg_add_time, $end_add_time]];
        }
        $list = $ProductModel->where($where)->order("orderby desc,product_id desc")->page($this->page, $this->limit)->select();
        $count = $ProductModel->where($where)->count();
        $this->getCat();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'product_id' => $val->product_id,
                'title' => $val->title,
                'sub_title' => $val->sub_title,
                'category_id' => $val->category_id,
                'photo' => $val->photo,
                'photos' => json_decode($val->photos, true),
                'price' => $val->price ? round($val->price / 100, 2) : '面议',
                'original_price' => $val->original_price ? round($val->original_price / 100, 2) : '面议',
                'notice' => $val->notice,
                'detail' => json_decode($val->detail, true),
                'is_online' => $val->is_online,
                'mobile' => $val->mobile,
                'category_name' => isset($this->cat[$val->category_id]) ? $this->cat[$val->category_id]['title'] : '--',
                'add_time' => isset($val->add_time) ? date("Y-m-d H:i",$val->add_time) : '--',
                'add_ip' => $val->add_ip,
                'orderby' => $val->orderby,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }

}
