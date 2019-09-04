<?php

namespace app\admin\controller\resource;

use app\admin\controller\Common;
use app\common\model\resource\CategoryModel;

class Category extends Common
{
    public function create()
    {
        $CategoryModel = new CategoryModel();
        $count = $CategoryModel->count();
        if ($count > 20) {
            $this->warning("您做多添加20个分类");
        }

        $res = $CategoryModel->setData($CategoryModel->dataFilter());
        if ($res == false) {
            $this->warning($CategoryModel->getError());
        }
        $this->datas['id'] = (int)$CategoryModel->category_id;            
    }

    public function edit()
    {
        $category_id = (int)$this->request->param("category_id");
        $CategoryModel = new CategoryModel();
        if (!$detail = $CategoryModel->find($category_id)) {
            $this->warning("不存在数据");
        }
        $res = $CategoryModel->setData($CategoryModel->dataFilter(), $category_id);
        if ($res == false) {
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
        $CategoryModel->where("category_id", $category_id)->delete();
    }

    public function detail()
    {
        $category_id = (int)$this->request->param("category_id");
        $CategoryModel = new  CategoryModel();
        if (!$detail = $CategoryModel->find($category_id)) {
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'category_id' => $detail->category_id,
            'title' => $detail->title,
        ];
    }

    public function index(){
        $CategoryModel = new CategoryModel();
        $list = $CategoryModel->order("category_id desc")->page(1, 20)->select();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'category_id' => $val->category_id,
                'title' => $val->title,
            ];
        }
        $this->datas = [
            'list' => $list,
        ];
    }

}
