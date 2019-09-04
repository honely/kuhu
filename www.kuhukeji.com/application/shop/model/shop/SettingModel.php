<?php
namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class SettingModel extends CommonModel
{
    protected $pk = 'app_id';
    protected $name = 'app_shop_setting';
    public $default = [
        'sold_out' => 0,
        'critical' => 10,
        'danger' => 30,
        'safe' => 100,
    ];
    public $integral_default = [
        'integral' => 5000,
        'integral_exptime' => 31536000,
        'integral_five_stars_comment' => 50,
        'integral_whith_photo_comment' => 50,
        'integral_vip_combo' => 2,
    ];
    public $withdraw_default = [
        'user_withdraw_limit' => 10000,
        'agent_withdraw_limit' => 10000,
    ];

    public $default_seo = [
        'title' => '',
        'keywords' => '',
        'description' => '',
        'releaseDate' => '',
        'image' => []
    ];

    public function getDefault() {
        return $this->default;
    }

    public function getWithdrawDefault() {
        return $this->withdraw_default;
    }

    public function getSeoDefault() {
        return $this->default_seo;
    }


    protected $rules = [
        ['company_name', 'require|max:64', '公司名称必须填写 | 公司名称长度超过限制'],
        ['banner', 'require', 'logo必须上传'],
        ['introduce', 'require', '图片必须上传'],
        ['address', 'require|max:255', '地址不能为空 | 地址长度超过限制'],
        ['lat', 'require|max:15', '经度不能为空 | 经纬度长度不合法'],
        ['lng', 'require|max:15', '维度不能为空 | 经纬度长度不合法'],
        ['tel', 'require|max:15', '联系电话方式不能为空 | 电话号码长度不合法'],
        ['mobile', 'require|max:20', '联系手机方式不能为空 | 手机号码长度不合法'],
        ['email', 'require|max:64', '邮箱不能为空 | 邮箱长度不合法'],
        ['qrcode', 'require|max:255', '二维码不能为空！| 二维码格式错误!'],
        ['seo', 'require|min:1', 'SEO信息必须填写！| SEO信息必须填写!'],
    ];

    public function dataFilter($app_id = 0)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "company_name" => (string)$request->param("company_name", ""),//公司名称
            "banner" => (string)$request->param("banner", ''),//logo
            "introduce" => (string)$request->param("introduce", "",'SecurityEditorHtml'),//介绍
            "address" => (string)$request->param("address", ""),//地址
            "lat" => (string)$request->param("lat", ""),//经度
            "lng" => (string)$request->param("lng", ""),//维度
            "tel" => (string)$request->param("tel", ""),//电话
            "mobile" => (string)$request->param("mobile", ""),//手机
            "fax" => (string)$request->param("fax", ""),//手机
            "email" => (string)$request->param("email", ""),//邮件
            "qrcode" => (string)$request->param("qrcode", "",'SecurityEditorHtml'),//二维码
            "vip_price" => (int)$request->param("vip_price", 18800,"moneyToInt"),//公司名称
            "vip_huaxian_price" => (int)$request->param("vip_huaxian_price", 38800,"moneyToInt"),//公司名称
            "vip_expire_time" => (int)$request->param("vip_expire_time", 0) == 0 ? 31536000 : $request->param("vip_expire_time", 0) * 86400,//公司名称
            "is_fenxiao" => (int) ($request->param('is_fenxiao',0) == 1),
        ];

        $banner = json_decode($param['banner']) ? json_decode($param['banner'],true) : [];
        $introduce = json_decode($param['introduce']) ? json_decode($param['introduce'],true) : [];
        if (empty($banner)) {
            $param['banner'] = [""];
        }
        if (empty($introduce)) {
            $param['introduce'] = [""];
        }
        $data['is_open'] = (int) $request->param('is_open',0);
        $data['usinessid'] = (string) $request->param('usinessid','');
        $data['appkey'] = (string) $request->param('appkey','');
        if ($data['is_open']) {
            if (!$data['usinessid'] || !$data['appkey']) {
                $this->error = '要启用快递鸟必须填写usinessid和appkey';
                return false;
            }
        }
        $param['kdniao'] = json_encode($data);

        $data1['sold_out'] = (int) $request->param('sold_out',0);
        $data1['critical'] = (int) $request->param('critical',0);
        $data1['danger'] = (int) $request->param('danger',0);
        $data1['safe'] = (int) $request->param('safe',0);
        if (!$data1['critical'] || !$data1['danger'] || !$data1['safe']) {
            $this->error = '请设置合理库存预警';
            return false;
        }
        $data1['sold_out'] = $data1['sold_out'] ? $data1['sold_out'] : $this->default['sold_out'];
        $data1['critical'] = $data1['critical'] ? $data1['critical'] : $this->default['critical'] ;
        $data1['danger'] = $data1['danger'] ? $data1['danger'] : $this->default['danger'];
        $data1['safe'] = $data1['safe'] ? $data1['safe'] : $this->default['safe'];


        $param['user_withdraw_limit'] = (int) $request->param('user_withdraw_limit',$this->withdraw_default['user_withdraw_limit'],"moneyToInt");
        $param['agent_withdraw_limit'] = (int) $request->param('agent_withdraw_limit',$this->withdraw_default['agent_withdraw_limit'],"moneyToInt");
        if (!$param['user_withdraw_limit'] || !$param['agent_withdraw_limit']) {
            $this->error = '请设置最低提现金额';
            return false;
        }
        if ($param['vip_price'] < 1 || $param['vip_huaxian_price'] < 1) {
            $this->error = '开通会员价格最低0.01元';
            return false;
        }
        $param['stock_setting'] = json_encode($data1);

        $seo_tmp = (string)request()->param("seo",'','SecurityEditorHtml');
        $seo = json_decode($seo_tmp) ? json_decode($seo_tmp, true) : [];
        if (!empty($seo)) {
            if (!$seo['title']) {
                $this->error = '请填写百度SEO标题';
                return false;
            }
            if (!$seo['keywords']) {
                $this->error = '请填写百度SEO关键词';
                return false;
            }
            if (!$seo['description']) {
                $this->error = '请填写百度SEO描述';
                return false;
            }

            if (count($seo['image']) > 3) {
                $seo['image'] = array_slice($seo['image'],0,3);
            }
            $param['seo'] = json_encode($seo,JSON_UNESCAPED_UNICODE);
        } else {
            $this->error = '请填写百度SEO相关信息';
            return false;
        }
        return $param;
    }




    /**
     * 获取快递鸟信息
     */
    static public function getKdnInfo($appId){
        $SettingModel = new SettingModel();
        $kdniaoTmp = $SettingModel->where(['app_id'=>$appId])->value('kdniao');
        $kdniao = json_decode($kdniaoTmp,true);
        $datas = [
            'is_open' => isset($kdniao['is_open']) ? $kdniao['is_open'] : 0,
            'usinessid' => isset($kdniao['usinessid']) ? $kdniao['usinessid'] : 0,
            'appkey' => isset($kdniao['appkey']) ? $kdniao['appkey'] : 0,
        ];
        return $datas;
    }


    /**
     * 积分价格
     * @param $money
     */
    static public function getJIfen($appId){
         $setting =  self::where(['app_id'=>$appId])->find();
         return [
             'integral' => empty($setting) ? 5000 : $setting['integral'],
             'integral_exptime' => empty($setting) ? 31536000 : $setting['integral_exptime'],
             'integral_vip_combo' => empty($setting) ? 2 : $setting['integral_vip_combo'],
             'integral_five_stars_comment' => empty($setting) ? 50 : $setting['integral_five_stars_comment'],
             'integral_whith_photo_comment' => empty($setting) ? 50 : $setting['integral_whith_photo_comment'],
         ];
    }


    /**
     * 快速获得会员价格
     */
    static public function getVipPrice($appId) {
        $setting =  self::where(['app_id'=>$appId])->find();
        return [
            'vip_price' => empty($setting) ? 299 : $setting['vip_price'],
            'vip_expire_time' => empty($setting) ? 31536000 : $setting['vip_expire_time'],
        ];
    }



}
