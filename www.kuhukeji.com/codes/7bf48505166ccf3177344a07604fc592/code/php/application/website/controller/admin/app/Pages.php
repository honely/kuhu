<?php

namespace app\website\controller\admin\app;

use app\website\controller\admin\Common;
use app\common\model\app\AppThemeModel;
use app\common\model\app\PagesModel;
use app\common\model\app\TemplatesModel;
use think\Config;

class Pages extends Common
{

    public function getTheme()
    {
        $AppThemeModel = new AppThemeModel();
        $detail = $AppThemeModel->find($this->appId);
        if (empty($detail)) {
            $this->datas['detail'] = [
                'theme' => [],
                'footer' => [],
            ];
        } else {
            $this->datas['detail'] = [
                'theme' => (array)json_decode($detail->theme, true),
                'footer' => (array)json_decode($detail->footer, true),
            ];
        }
    }

    /**
     * 设置默认页面
     */
    public function setDefault()
    {
        $page_id = (int)$this->request->param("page_id");
        $PagesModel = new  PagesModel();
        if (!$detail = $PagesModel->find($page_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $PagesModel->save(['is_default' => 0], ['app_id' => $this->appId]);
        $PagesModel->save(['is_default' => 1], ['page_id' => $page_id]);
    }

    public function create()
    {

        $tmpId = (int)$this->request->param("tmp_id/d");
        $data = [
            'app_type' => $this->app->app_type,
            'app_id' => $this->appId,
            'title' => "未定义页面",
        ];
        if ($tmpId > 0) {
            $TemplatesModel = new TemplatesModel();
            if (!$tmp = $TemplatesModel->find($tmpId)) {
                $this->warning("请选择正确的模板");
            };
            if ($tmp->app_type != $this->app->app_type) {
                $this->warning("请选择正确的模板");
            }
            $data['is_theme'] = $tmp->is_theme;
            $data['theme'] = $tmp->theme;
            $data['plugins'] = $tmp->plugins;
            $data['footer_type'] = $tmp->footer_type;
            $data['footer'] = $tmp->footer;
        }
        $PagesModel = new PagesModel();
        $count = $PagesModel->where("app_id", $this->appId)->count();

        if ($count > config('limitnum.app_template_num')) {
            $limit_num = config('limitnum.app_template_num');
            $this->warning("您最多创建{$limit_num}个页面");
        }

        if ($count <= 0) {
            $data['is_default'] = 1;
        }

        $PagesModel->save($data);
        $this->datas['page_id'] = $PagesModel->page_id;
    }

    public function edit()
    {
        $page_id = (int)$this->request->param("page_id");
        $PagesModel = new PagesModel();
        if (!$detail = $PagesModel->find($page_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $res = $PagesModel->setData($PagesModel->dataFilter($this->appId), $page_id);
        if ($res === false) {
            $this->warning($PagesModel->getError());
        }
    }

    public function del()
    {
        $page_id = (int)$this->request->param("page_id");
        $PagesModel = new PagesModel();
        if (!$detail = $PagesModel->find($page_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $PagesModel->where("page_id", $page_id)->delete();
    }

    public function detail()
    {
        $page_id = (int)$this->request->param("page_id");
        $PagesModel = new  PagesModel();
        if (!$detail = $PagesModel->find($page_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'page_id' => $detail->page_id,
            'app_type' => $detail->app_type,
            'title' => $detail->title,
            'photo' => $detail->photo,
            'page_name' => $detail->page_name,
            'is_default' => $detail->is_default,
            'plugins' => (array)json_decode($detail->plugins, true),
            'theme' => (array)json_decode($detail->theme, true),
            'footer' => (array)json_decode($detail->footer, true),
            'footer_type' => (int)$detail->footer_type,
            'is_theme' => (int)$detail->is_theme,
        ];
    }

    public function index()
    {
        $PagesModel = new PagesModel();
        $where['app_id'] = $this->appId;
        $is_default = (int)$this->request->param("is_default");
        if (!empty($is_default)) {
            $where["is_default"] = $is_default;
        }
        $title = (int)$this->request->param("title");
        if (!empty($is_default)) {
            $where["title"] = ["LIKE", "%{$title}%"];
        }
        $list = $PagesModel->where($where)->order("page_id desc")->page($this->page, $this->limit)->select();
        $default = $PagesModel->where(['app_id' => $this->appId, 'is_default' => 1])->find();
        $count = $PagesModel->where($where)->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'page_id' => $val->page_id,
                'app_type' => $val->app_type,
                'title' => $val->title,
                'photo' => $val->photo,
                'is_default' => (int)$val->is_default,
                'last_time' => date("Y-m-d H:i:s", $val->last_time),
                'add_time' => date("Y-m-d H:i:s", $val->add_time)
            ];
        }
        $this->datas = [
            'app_template_limit' => config('limitnum.app_template_num'),
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
            'default' => empty($default) ? [] : $default,
        ];
    }

    /**
     * 保存页面
     */
    public function savePage()
    {
        $pageId = (int)$this->request->param("page_id");
        $PagesModel = new PagesModel();
        if (!$detail = $PagesModel->find($pageId)) {
            $this->warning("参数错误");
        }
        if ($detail->app_id != $this->appId || $detail->app_type != $this->app->app_type) {
            $this->warning("参数错误");
        }
        $data['page_name'] = (string)$this->request->param("page_name");
        if (empty($data['page_name'])) {
            $this->warning("请输入页面名称");
        }
        $data['title'] = (string)$this->request->param("title");
        if (empty($data['title'])) {
            $this->warning("请输入标题");
        }
        $data['photo'] = (string)$this->request->param("photo");
        if (empty($data['photo'])) {
            $this->warning("请上传缩略图");
        }


        $data['is_theme'] = (int)$this->request->param('is_theme');
        $theme = (string)$this->request->param("theme", "", "SecurityEditorHtml");
        //公用主题和底部
        $appTheme = [
            'theme' => '',
            'footer' => '',
        ];
        if ($data['is_theme'] == 1) {
            $data['theme'] = $theme;
        } else {
            $appTheme["theme"] = $theme;
        }
        $data['plugins'] = (string)$this->request->param("plugins", "", "SecurityEditorHtml");
        if (empty($data['plugins'])) {
            $this->warning("请先设计页面");
        }
        $data['footer_type'] = (int)$this->request->param("footer_type");
        $footer = (string)$this->request->param("footer", "", "SecurityEditorHtml");
        if ($data['footer_type'] == 2) {
            $data['footer'] = $footer;
        } else {
            $appTheme["footer"] = $footer;
        }
        $data['last_time'] = $this->request->time();
        $AppThemeModel = new AppThemeModel();
        $AppThemeModel->setTheme($appTheme['footer'], $appTheme['theme'], $this->appId);
        $PagesModel->save($data, ['page_id' => $pageId]);
    }

    /**
     * 分享页面
     */
    public function sharePage()
    {
        //这里直接 接收页面名称
        $data['title'] = (string)$this->request->param("page_name");
        if (empty($data['title'])) {
            $this->warning("请输入标题");
        }
        $data['photo'] = (string)$this->request->param("photo");
        if (empty($data['photo'])) {
            $this->warning("请上传缩略图");
        }
        $data['is_theme'] = (int)$this->request->param('is_theme');
        $data['theme'] = (string)$this->request->param("theme", "", "SecurityEditorHtml");
        $data['plugins'] = (string)$this->request->param("plugins", "", "SecurityEditorHtml");
        if (empty($data['plugins'])) {
            $this->warning("请先设计页面");
        }
        $data['footer_type'] = (int)$this->request->param("footer_type");
        $data['footer'] = (string)$this->request->param("footer", "", "SecurityEditorHtml");
        $data['app_type'] = $this->app->app_type;
        $data['type'] = 1;
        $data['audit'] = 0;
        $data['app_id'] = $this->appId;
        $TemplatesModel = new TemplatesModel();
        $TemplatesModel->save($data);
    }

}
