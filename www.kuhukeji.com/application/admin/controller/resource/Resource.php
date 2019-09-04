<?php

namespace app\admin\controller\resource;

use app\admin\controller\Common;
use app\common\model\resource\ResourceModel;
use Houdunwang\WeChat\Build\Curl;

class Resource extends Common{

    public function create() {
        $ResourceModel = new ResourceModel();
        $res = $ResourceModel->setData($ResourceModel->dataFilter());
        if ($res == false) {
            $this->warning($ResourceModel->getError());
        }
    }

    public function edit()
    {
        $resource_id = (int)$this->request->param("resource_id");
        $ResourceModel = new ResourceModel();
        if (!$detail = $ResourceModel->find($resource_id)) {
            $this->warning("不存在数据");
        }
        $res = $ResourceModel->setData($ResourceModel->dataFilter(), $resource_id);
        if ($res == false) {
            $this->warning($ResourceModel->getError());
        }
    }

    public function del()
    {
        $resource_id = (int)$this->request->param("resource_id");
        $ResourceModel = new ResourceModel();
        if (!$detail = $ResourceModel->find($resource_id)) {
            $this->warning("不存在数据");
        }
        $ResourceModel->where("resource_id", $resource_id)->delete();
    }

    public function detail()
    {
        $resource_id = (int)$this->request->param("resource_id");
        $ResourceModel = new  ResourceModel();
        if (!$detail = $ResourceModel->find($resource_id)) {
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'category_id' => $detail->category_id,
            'photo' => $detail->photo,
            'size' => $detail->size,
            'title' => $detail->title,
            'w' => $detail->w,
            'h' => $detail->h,
        ];
    }

    public function index()
    {
        $ResourceModel = new ResourceModel();
        $where = [];


        $category_id = (int)$this->request->param("category_id");
        if (!empty($category_id)) {
            $where["category_id"] = $category_id;
        }
        $title = (string)$this->request->param("title");
        if (!empty($title)) {
            $where["title"] = ["LIKE", "%{$title}%"];
        }
        $list = $ResourceModel->where($where)->order("resource_id desc")->page($this->page, $this->limit)->select();
        $count = $ResourceModel->where($where)->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'category_id' => $val->category_id,
                'photo' => $val->photo,
                'size' => $val->size,
                'title' => $val->title,
                'w' => $val->w,
                'h' => $val->h,
            ];
        }
        $this->datas = [
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }

}
