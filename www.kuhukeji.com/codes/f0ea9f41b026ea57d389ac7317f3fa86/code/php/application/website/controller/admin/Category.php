<?php

namespace app\website\controller\admin;


use app\website\model\website\CategoryModel;

class Category extends Common
{
    public function create()
    {
        $CategoryModel = new CategoryModel();
        $res = $CategoryModel->setData($CategoryModel->dataFilter($this->appId));
        $count = $CategoryModel->where("app_id", $this->appId)->count();
        if ($count >= 20) {
            $this->warning("您最多添加20个分类");
        }
        if ($res == false) {
            $this->warning($CategoryModel->getError());
        }
    }

    public function edit()
    {
        $category_id = (int)$this->request->param("category_id");
        $CategoryModel = new CategoryModel();
        if (!$detail = $CategoryModel->find($category_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $res = $CategoryModel->setData($CategoryModel->dataFilter($this->appId), $category_id);
        if ($res === false) {
            $this->warning($CategoryModel->getError());
        }
    }

    public function del()
    {
        $category_id = (int)$this->request->param("category_id");
        $CategoryModel = new CategoryModel();
        if (!$detail = $CategoryModel->find($category_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $CategoryModel->where("category_id", $category_id)->delete();
    }

    public function detail()
    {
        $category_id = (int)$this->request->param("category_id");
        $CategoryModel = new  CategoryModel();
        if (!$detail = $CategoryModel->find($category_id)) {
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

    public function index()
    {
        $CategoryModel = new CategoryModel();
        $where['app_id'] = $this->appId;
        $title = (string)$this->request->param("title");
        if (!empty($title)) {
            $where["title"] = ["LIKE", "%{$title}%"];
        }
        $list = $CategoryModel->where($where)->order("category_id desc")->page(0,20)->select();
        $count = $CategoryModel->where($where)->count();
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
        ];
    }

}
