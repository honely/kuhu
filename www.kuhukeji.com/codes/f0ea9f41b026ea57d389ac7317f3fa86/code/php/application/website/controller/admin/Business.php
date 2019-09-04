<?php

namespace app\website\controller\admin;


use app\website\model\website\BusinessModel;
use app\website\model\website\ProductModel;


class Business extends Common
{
    protected $default_seo = ['title' => '', 'keywords' => '', 'description' => '', 'releaseDate' => '', 'image' => []];

    public function create()
    {
        $BusinessModel = new BusinessModel();
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
        $res = $BusinessModel->setData($BusinessModel->dataFilter($this->appId,$seo));
        if ($res == false) {
            $this->warning($BusinessModel->getError());
        }
    }

    public function edit()
    {
        $business_id = (int)$this->request->param("business_id");
        $BusinessModel = new BusinessModel();
        if (!$detail = $BusinessModel->find($business_id)) {
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
        $res = $BusinessModel->setData($BusinessModel->dataFilter($this->appId,$seo), $business_id);
        if ($res === false) {
            $this->warning($BusinessModel->getError());
        }
    }

    public function del()
    {
        $business_id = (int)$this->request->param("business_id");
        $BusinessModel = new BusinessModel();
        if (!$detail = $BusinessModel->find($business_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $BusinessModel->where("business_id", $business_id)->delete();
    }

    public function delByIds()
    {
        $productIds = (string)$this->request->param("productIds",'','SecurityEditorHtml');
        $productIds = json_decode($productIds, true);
        $productIds = empty($productIds) ? '' : $productIds;
        $BusinessModel = new BusinessModel();
        $BusinessModel->where(['app_id'=>$this->appId])->whereIn("business_id", $productIds)->delete();
    }

    public function detail()
    {
        $business_id = (int)$this->request->param("business_id");
        $BusinessModel = new  BusinessModel();
        if (!$detail = $BusinessModel->find($business_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $productIds = json_decode($detail->product_ids, true);
        $productIds = empty($productIds) ? '' : $productIds;
        $ProductModel = new ProductModel();
        $productsTmp = $ProductModel->itemsByIds($productIds);

        $products = [];
        $i = 0;
        foreach ($productsTmp as $v) {
            $i++;
            $products[] = [
                'product_id' => $v->product_id,
                'title' => $v->title,
                'orderby' => $v->orderby
            ];
        }

        $this->datas['detail'] = [
            'business_id' => $detail->business_id,
            'title' => $detail->title,
            'sub_title' => $detail->sub_title,
            'photo' => $detail->photo,
            'photos' => json_decode($detail->photos, true),
            'detail' => json_decode($detail->detail, true),
            'product_ids' => json_decode($detail->product_ids, true),
            'orderby' => $detail->orderby,
            'products' => $products,
            'seo' => json_decode($detail->seo) ? json_decode($detail->seo, true) : $this->default_seo,
        ];
    }

    public function index()
    {
        $BusinessModel = new BusinessModel();
        $where['app_id'] = $this->appId;
        $title = (string)$this->request->param("title");
        if (!empty($title)) {
            $where["title"] = ["LIKE", "%{$title}%"];
        }
        $list = $BusinessModel->where($where)->order("orderby desc,business_id desc")->page($this->page, $this->limit)->select();
        $count = $BusinessModel->where($where)->count();

        $productIds = $products =  $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'business_id' => $val->business_id,
                'title' => $val->title,
                'sub_title' => $val->sub_title,
                'photo' => $val->photo,
                'photos' => json_decode($val->photos, true),
                'detail' => json_decode($val->detail, true),
                'product_ids' => json_decode($val->product_ids, true),
                'orderby' => $val->orderby,
                'add_time' => $val->add_time ? date("Y-m-d H:i", $val->add_time) : '--',
                'add_ip' => $val->add_ip,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }

}
