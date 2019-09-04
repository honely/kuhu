<?php

namespace app\shop\controller\api;

use app\common\model\app\AppThemeModel;
use app\common\model\app\PagesModel;
use app\common\model\app\TemplatesModel;
use app\shop\logic\ShopCallData;
use app\shop\model\shop\GoodsModel;

class Page extends Common
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
        $WebsiteCallData = new ShopCallData($this->appId);
        $WebsiteCallData->getData($plugins);
        $this->datas = [
            'is_page' => 1,
            'title' => $page->title,
            'photo' => $page->photo,
            'is_theme' =>   $page->is_default == 1 ? 0 : $page->is_theme,
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
        if($detail->app_type != 2){
            $this->noPage("该页面去谈恋爱了(*^▽^*)");
        }
        $plugins = (array) json_decode($detail->plugins, true);
        $ShopCallData = new ShopCallData($this->appId);
        $ShopCallData->getData($plugins);
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

    public function goods(){
        $cat_id   = (int) $this->request->param("cat_id");
        $num  = (int) $this->request->param("num");
        $order = (int) $this->request->param("order");
        $num = $num > 0 ? $num : 8;
        $orderby = [];
        switch ($order) {
            case 1:
                $orderby = ['shop_price' => 'asc'];
                break;
            case 2:
                $orderby = ['sales_sum' => 'desc'];
                break;
            case 3:
                $orderby = ['goods_id' => 'desc'];
                break;
            case 4:
                $orderby = ['orderby' => 'desc'];
                break;
            default:
                $orderby = ['orderby' => 'desc', 'sales_sum' => 'desc', 'views' => 'desc'];
                break;
        }
        $where = ['app_id' => $this->appId, 'is_online' => 1, 'is_delete' => 0];
        if($cat_id > 0){
            $where['cat_id|p_cat_id'] = $cat_id;
        }
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->where($where)->order($orderby)->limit(0, $num)->select();
        $hdTitles = $GoodsModel->getActivityTitle($goods);
        $return = [];
        foreach ($goods as $val) {
            $return  [] = [
                'goods_id' => $val['goods_id'],
                'photo' => $val['photo'],
                'goods_name' => $val['goods_name'],
                'market_price' => moneyFormat($val['market_price']),
                'shop_price' => moneyFormat($val['shop_price']),
                'hd_title' => isset($hdTitles[$val['goods_id']]) ? $hdTitles[$val['goods_id']]['hd_title'] : '',
            ];
        }
        $this->datas['list'] = $return;
    }
}
