<?php

namespace app\website\controller\admin\app;

use app\website\controller\admin\Common;
use app\common\model\app\TemplatesModel;

class Templates extends Common
{
    public function create()
    {
        $TemplatesModel = new TemplatesModel();
        $res = $TemplatesModel->setData($TemplatesModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($TemplatesModel->getError());
        }
    }

    public function edit()
    {
        $template_id = (int)$this->request->param("template_id");
        $TemplatesModel = new TemplatesModel();
        if (!$detail = $TemplatesModel->find($template_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $res = $TemplatesModel->setData($TemplatesModel->dataFilter($this->appId), $template_id);
        if ($res === false) {
            $this->warning($TemplatesModel->getError());
        }
    }

    public function del()
    {
        $template_id = (int)$this->request->param("template_id");
        $TemplatesModel = new TemplatesModel();
        if (!$detail = $TemplatesModel->find($template_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $TemplatesModel->where("template_id", $template_id)->delete();
    }

    public function detail()
    {
        $template_id = (int)$this->request->param("template_id");
        $TemplatesModel = new  TemplatesModel();
        if (!$detail = $TemplatesModel->find($template_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'template_id' => $detail->template_id,
            'photo' => $detail->photo,
            'title' => $detail->title,
            'plugins' => (array)json_decode($detail->plugins, true),
            'theme' => (array)json_decode($detail->theme, true),
            'footer' => (array)json_decode($detail->footer, true),
            'footer_type' => (int)$detail->footer_type,
            'is_theme' => (int)$detail->is_theme,
        ];
    }

    public function index()
    {
        $TemplatesModel = new TemplatesModel();

        $isOwn = $this->request->param('isown');
        if ($isOwn == 1) {
            $where['app_id'] = $this->appId;
        } else {
            $where['audit'] = 1;
        }
        $where['app_type'] = $this->app->app_type;
        $title = (string)$this->request->param("title");
        if (!empty($title)) {
            $where["title"] = ["LIKE", "%{$title}%"];
        }
        $is_footer = (int)$this->request->param("is_footer");
        if (!empty($is_footer)) {
            $where["is_footer"] = $is_footer;
        }
        $end_add_time = (int)$this->request->param("end_add_time", 0, "strtotime");
        $bg_add_time = (int)$this->request->param("bg_add_time", 0, "strtotime");
        if ($end_add_time > 0 && $bg_add_time > 0) {
            $where["add_time"] = ["between", [$bg_add_time, $end_add_time]];
        }
        $list = $TemplatesModel->where($where)->order("template_id desc")->page($this->page, $this->limit)->select();
        $count = $TemplatesModel->where($where)->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'template_id' => $val->template_id,
                'photo' => $val->photo,
                'title' => $val->title,
                'plugins' => (array)json_decode($val->plugins, true),
                'theme' => (array)json_decode($val->theme, true),
                'footer' => (array)json_decode($val->footer, true),
                'footer_type' => (int)$val->footer_type,
                'is_theme' => (int)$val->is_theme,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


}
