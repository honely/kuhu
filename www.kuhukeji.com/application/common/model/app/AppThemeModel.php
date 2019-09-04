<?php

namespace app\common\model\app;

use app\common\model\CommonModel;

class AppThemeModel extends CommonModel
{
    protected $pk = 'app_id';
    protected $name = 'app_theme';

    public function setTheme($footer, $theme, $appId)
    {
        $detail = $this->find($appId);
        $data = [];
        if (!empty($footer)) {
            $data['footer'] = $footer;
        }
        if (!empty($theme)) {
            $data['theme'] = $theme;
        }
        if (empty($detail)) {
            $data['app_id'] = $appId;
            $this->save($data);
        } else {
            $this->save($data, ['app_id' => $appId]);
        }
    }

    public function getTheme($appId){
        $detail = $this->find($appId);
        $defaultThem = [
            'navigationBarBackgroundColor' => '#000000',//顶部导航的背景颜色
            'navigationBarFrontColor' => '#ffffff', //顶部导航的字体颜色只能黑色和白色
            'mainColor' => '#00B5DE',//主要颜色
            'secondaryColor' => '#1ADCF1',//第二颜色
            'tipsColor' => '#FFAE19', //提示性的颜色
            'statusColor' => '#FF3200',//状态颜色
            'bgColor' => '#f2f2f2',//页面背景颜色
        ];
        $defaultFooter = [
            'selectColor ' => '#00B5DE',
            'list' => [],
        ];
        return [
            'theme' => empty($detail->theme) ? $defaultThem : json_decode($detail->theme,true),
            'footer' => empty($detail->footer) ? $defaultFooter : json_decode($detail->footer,true),
        ];
    }
}
