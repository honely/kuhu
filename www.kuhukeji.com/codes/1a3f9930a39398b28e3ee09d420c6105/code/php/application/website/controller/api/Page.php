<?php

namespace app\website\controller\api;

use app\common\model\app\AppThemeModel;
use app\common\model\app\PagesModel;
use app\common\model\app\TemplatesModel;
use app\website\logic\WebSiteCallData;

class Page extends WebsiteCommon
{

    /**
     *  获取编辑页详情
     */
    public function getPage()
    {
        $pageId = (int)$this->request->param("page_id");
        $PagesModel = new PagesModel();
        if ($pageId > 0) {
            if (!$page = $PagesModel->find($pageId)) {
                $this->noPage("该页面去谈恋爱了(*^▽^*)");
            }
            if ($page->app_id != $this->appId) {
                $this->noPage("该页面去谈恋爱了(*^▽^*)");
            }
        } else {
            $page = $PagesModel->where("app_id", $this->appId)->order("is_default desc")->find();
        }
        if (empty($page)) {
            $this->datas = [
                'is_page' => 0,
                'title' => "",
                'photo' => "",
                'is_theme' => 0,
                'theme' => [],
                'plugins' => [],
                'footer_type' => 0,
                'footer' => [],
            ];
            return;
        }
        $plugins = (array)json_decode($page->plugins, true);
        $WebsiteCallData = new WebSiteCallData($this->appId);
        $WebsiteCallData->getData($plugins);
        $this->datas = [
            'is_page' => 1,
            'title' => $page->title,
            'photo' => $page->photo,
            'is_theme' =>  $page->is_default == 1 ? 0 : $page->is_theme,
            'theme' => (array)json_decode($page->theme, true),
            'plugins' => $plugins,
            'footer_type' =>   $page->footer_type,
            'footer' => (array)json_decode($page->footer, true),
            'seo' => $this->default_seo,
        ];
    }

    public function getTmpDetail(){
        $tmpId = (int)$this->request->param("tmp_id");
        $AppThemeModel = new AppThemeModel();
        $TemplatesModel = new TemplatesModel();
        if (!$detail = $TemplatesModel->find($tmpId)) {
            $this->noPage("该页面去谈恋爱了(*^▽^*)");
        }

        if($detail->app_type != 1){
            $this->noPage("该页面去谈恋爱了(*^▽^*)");
        }

        $plugins = (array) json_decode($detail->plugins, true);
        $WebsiteCallData = new WebsiteCallData($this->appId);
        $WebsiteCallData->getData($plugins);
        $this->datas = [
            'public_style' => $AppThemeModel->getTheme($detail->app_id),
            'title' => $detail->title,
            'photo' => $detail->photo,
            'is_theme' => $detail->is_theme,
            'theme' => (array) json_decode($detail->theme, true),
            'plugins' => $plugins,
            'footer_type' => $detail->footer_type,
            'footer' => (array) json_decode($detail->footer, true),
        ];
    }
}
