<?php

namespace app\website\controller\admin\app;

use app\website\controller\admin\Common;
use app\common\model\app\FooterIconModel;
use app\common\model\resource\FooterIconModel as AdminFooterIconModel;

class Footericon extends Common{

    /**
     * 获取系统的ICON
     */
    public function index()
    {
        $FooterIconModel = new AdminFooterIconModel();
        $where = [];
        $title = (string)$this->request->param("title");
        if (!empty($title)) {
            $where["title"] = ["LIKE", "%{$title}%"];
        }
        $list = $FooterIconModel->where($where)->order("icon_id desc")->page($this->page, $this->limit)->select();
        $count = $FooterIconModel->where($where)->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'icon_id' => $val->icon_id,
                'title' => $val->title,
                'unchecked' => $val->unchecked,
                'checked' => $val->checked,
                'orderby' => $val->orderby,
            ];
        }

        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }

    /**
     * 获取我的ICON
     */
    public function myIndex()
    {
        $FooterIconModel = new FooterIconModel();
        $where['app_id'] = $this->appId;
        $title = (string)$this->request->param("title");
        if (!empty($title)) {
            $where["title"] = ["LIKE", "%{$title}%"];
        }
        $list = $FooterIconModel->where($where)->order("icon_id desc")->page($this->page, $this->limit)->select();
        $count = $FooterIconModel->where($where)->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'icon_id' => $val->icon_id,
                'title' => $val->title,
                'unchecked' => $val->unchecked,
                'checked' => $val->checked,
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
        $FooterIconModel = new FooterIconModel();
        $res = $FooterIconModel->setData($FooterIconModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($FooterIconModel->getError());
        }
    }

    public function edit()
    {
        $icon_id = (int)$this->request->param("icon_id");
        $FooterIconModel = new FooterIconModel();
        if (!$detail = $FooterIconModel->find($icon_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $res = $FooterIconModel->setData($FooterIconModel->dataFilter($this->appId), $icon_id);
        if ($res === false) {
            $this->warning($FooterIconModel->getError());
        }
    }

    public function del()
    {
        $icon_id = (int)$this->request->param("icon_id");
        $FooterIconModel = new FooterIconModel();
        if (!$detail = $FooterIconModel->find($icon_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $FooterIconModel->where("icon_id", $icon_id)->delete();
    }

    public function detail()
    {
        $icon_id = (int)$this->request->param("icon_id");
        $FooterIconModel = new  FooterIconModel();
        if (!$detail = $FooterIconModel->find($icon_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'icon_id' => $detail->icon_id,
            'title' => $detail->title,
            'unchecked' => $detail->unchecked,
            'checked' => $detail->checked,
            'orderby' => $detail->orderby,
        ];
    }



}
