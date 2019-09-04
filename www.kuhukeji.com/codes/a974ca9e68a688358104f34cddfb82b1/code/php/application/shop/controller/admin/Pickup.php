<?php

namespace app\shop\controller\admin;




class Pickup extends Common
{
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
                'add_time' => isset($val->add_time) ? date("Y-m-d H:i", $val->add_time) : '--',
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


    public function create()
    {
        $ProductModel = new ProductModel();
        $res = $ProductModel->setData($ProductModel->dataFilter($this->appId));
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
        $res = $ProductModel->setData($ProductModel->dataFilter($this->appId), $product_id);
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
        $productIds = (string)$this->request->param("productIds", '', 'SecurityEditorHtml');
        $productIds = json_decode($productIds, true);
        $productIds = empty($productIds) ? '' : $productIds;
        $ProductModel = new ProductModel();
        $ProductModel->where(['app_id' => $this->appId])->whereIn("product_id", $productIds)->delete();
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
        ];
    }


}
