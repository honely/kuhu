<?php

namespace app\common\model\setting;
use app\common\model\CommonCacheModel;
use think\Cache;

class  SettingModel extends CommonCacheModel
{
    protected $pk = 'k';
    protected $name = 'setting';

    protected $fetchAllCache = 'WYU_SETTING';
    /**
     * @var array  setting 数据库  对应 的 键值对 缓存
     */
    protected $settingMap = [
        //腾讯云短信
        'tx_sms'       => ['appid'=> '','appkey'=> '','regtemplateid'=> '','regtemplate' => ''],
        //七牛云存储
        'qiniu_oss'    => ['accesskey'=> '','secretkey'=> '','bucket'=> '','imgUrl' => '','is_open'=> 0],
        //极验
        'geetest'      => ['captcha_id'=> '','private_key'=> '','is_open'=> 0],
        'wyu_auth'     => ['account_id' => '','account_token' => ''],

        //apps是所有已经安装的APP缓存，APP_INSTALL 是当前想安装的APP指令（当前请求的时间，服务器也会验证如果时间是在1分钟以内为正常），点击安装的时候更新，远程接口会调用
        'app_type'     => ['apps' => [],'vote_num'=>0,'app_install' => 0,'app_id' => 0], 
        
        'banner'       => ['banners'=>[]],
        'link'         => ['links'=>[]],
        'setting'      => [
                        'sitename'  => '',
                        'app_type'  => '' ,//指定首页进入到某个小程序的专题    
                        'title'     => '',
                        'logo'      => '', 
                        'qrcode'    => '',
                        'qq'        => '',
                        'weixin'    => '',
                        'tel'       => '',
                        'desc'      => '',
                        'keyword'   => '',
                        'about'     => '',
                        'email'     => '',
                        'icp'       => '',
                        'company'   => '',
                        'addr'      => '',
                        'map'       => '',
                        'postcode'   => '',   
        ],
    ];





}
