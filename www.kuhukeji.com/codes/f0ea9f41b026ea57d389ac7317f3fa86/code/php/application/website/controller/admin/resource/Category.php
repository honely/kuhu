<?php

namespace app\website\controller\admin\resource;

use app\website\controller\admin\Common;
use app\common\model\resource\AppCategoryModel as CategoryModel;
use app\common\model\resource\AppResourceModel as ResourceModel;

class Category extends Common
{

    public function create()
    {
        $CategoryModel = new CategoryModel();
        $num = config("limitnum.app_resource_category");
        $count = $CategoryModel->where("app_id", $this->appId)->count();
        if ($count >= $num) {
            $this->warning("您做多添加{$num}个分类");
        }

        $res = $CategoryModel->setData($CategoryModel->dataFilter($this->appId));
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
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $res = $CategoryModel->setData($CategoryModel->dataFilter($this->appId), $category_id);
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
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $ResourceModel = new ResourceModel();
        $ResourceModel->save(['category_id' => 0], ['category_id' => $category_id]);
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
        ];
    }


    public function index()
    {
        $CategoryModel = new CategoryModel();
        $list = $CategoryModel->where("app_id", $this->appId)->order("category_id desc")->page(0, config("limitnum.app_resource_category"))->select();
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

    public function getCatCount()
    {
        $CategoryModel = new CategoryModel();
        $num = config("limitnum.app_resource_category");
        $list = $CategoryModel
            ->field("category_id,title")
            ->where("app_id", $this->appId)
            ->order("category_id desc")->page(1, $num)->select();
        $ResourceModel = new ResourceModel();
        $count = $ResourceModel
            ->field("category_id,count(category_id) as num")
            ->where("app_id", $this->appId)
            ->where("is_delete", 0)
            ->group("category_id")
            ->select();
        $catrgoryNum = [];
        $sumNum = 0;
        foreach ($count as $val) {
            $catrgoryNum[$val->category_id] = $val->num;
            $sumNum += $val->num;
        }

        $datas = [
            [
                'category_id' => -1,
                'title' => '全部',
                'num' => $sumNum
            ],
            [
                'category_id' => 0,
                'title' => '未分类',
                'num' => empty($catrgoryNum[0]) ? 0 : $catrgoryNum[0],
            ]
        ];
        foreach ($list as $val) {
            $datas[] = [
                'category_id' => $val->category_id,
                'title' => $val->title,
                'num' => empty($catrgoryNum[$val->category_id]) ? 0 : $catrgoryNum[$val->category_id],
            ];
        }
        $this->datas = [
            'list' => $datas,
        ];
    }
}
