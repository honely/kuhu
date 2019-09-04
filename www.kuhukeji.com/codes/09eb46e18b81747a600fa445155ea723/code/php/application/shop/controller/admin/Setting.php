<?php

namespace app\shop\controller\admin;


use app\shop\model\shop\PickupModel;
use app\shop\model\shop\SettingModel;

class Setting extends Common
{

    public function getSetting()
    {
        $SettingModel = new SettingModel();
        $default = $SettingModel->getDefault();
        $withdraw_default = $SettingModel->getWithdrawDefault();
        $seo_default = $SettingModel->getSeoDefault();
        if (!$detail = $SettingModel->find($this->appId)) {
            $datas = [
                'app_id' => $this->appId,
                'company_name'  =>  '',
                'banner'  =>  '',
                'introduce'  =>  '',
                'address'  =>  '',
                'lat'  =>  '',
                'lng'  =>  '',
                'tel'  =>  '',
                'mobile'  =>  '',
                'fax'  =>  '',
                'email'  =>  '',
                'qrcode'  =>  '',
                'vip_price' => 18800,
                'vip_huaxian_price' => 38800,
                'vip_expire_time' => 31536000,
                'kdniao' => "",
//                'is_open' => 0,
//                'usinessid' => '',
//                'appkey' => '',
                'stock_setting' => "",
                'user_withdraw_limit' => $withdraw_default['user_withdraw_limit'],
                'agent_withdraw_limit' => $withdraw_default['agent_withdraw_limit'],
                'seo' => $seo_default,
            ];
            $SettingModel->save($datas);
        }else{
            $kdniao = json_decode($detail->kdniao,true);
            $stockSetting = json_decode($detail->stock_setting,true);
            $datas = [
                'company_name'  =>  $detail->company_name,
                'banner'  => $detail->banner,
                'introduce'  =>  json_decode($detail->introduce) ? json_decode($detail->introduce,true) : [],
                'address'  =>  $detail->address,
                'lat'  =>  $detail->lat,
                'lng'  =>  $detail->lng,
                'tel'  =>  $detail->tel,
                'mobile'  =>  $detail->mobile,
                'fax'  =>  $detail->fax,
                'email'  =>  $detail->email,
                'qrcode'  =>  $detail->qrcode,
                'vip_price' => $detail->vip_price ? moneyFormat($detail->vip_price) : 0,
                'vip_huaxian_price' => $detail->vip_huaxian_price ? moneyFormat($detail->vip_huaxian_price) : 0,
                'vip_expire_time' => $detail->vip_expire_time ? $detail->vip_expire_time/86400 : 0,
                'is_open' => isset($kdniao['is_open']) ? $kdniao['is_open'] : 0,
                'usinessid' => isset($kdniao['usinessid']) ? $kdniao['usinessid'] : 0,
                'appkey' => isset($kdniao['appkey']) ? $kdniao['appkey'] : 0,
                'sold_out' => isset($stockSetting['sold_out']) ? $stockSetting['sold_out'] : $default['sold_out'],
                'critical' => isset($stockSetting['critical']) ? $stockSetting['critical'] : $default['critical'],
                'danger' => isset($stockSetting['danger']) ? $stockSetting['danger'] : $default['danger'],
                'safe' => isset($stockSetting['safe']) ? $stockSetting['safe'] : $default['safe'],
                'is_fenxiao' => (int)$detail->is_fenxiao,
                'user_withdraw_limit' => $detail->user_withdraw_limit ? moneyFormat($detail->user_withdraw_limit, true) : 0,
                'agent_withdraw_limit' => $detail->agent_withdraw_limit ? moneyFormat($detail->agent_withdraw_limit, true) : 0,
                'seo' => json_decode($detail->seo) ? json_decode($detail->seo,true) : $seo_default,
            ];
        }
        $this->datas['detail'] = $datas;
    }



    public function setSetting()
    {
        $SettingModel = new SettingModel();
        if (!$detail = $SettingModel->find($this->appId)) {
            $res = $SettingModel->setData($SettingModel->dataFilter($this->appId));
            if ($res === false) {
                $this->warning($SettingModel->getError());
            }
        } else {
            $res = $SettingModel->setData($SettingModel->dataFilter($this->appId), $this->appId);
            if ($res === false) {
                $this->warning($SettingModel->getError());
            }
        }
    }



    public function getRule() {
        $SettingModel = new SettingModel();
        $ruleTmp = $SettingModel->find($this->appId);
        $this->datas = [
            'pintuan_rule' => json_decode($ruleTmp->pintuan_rule,true) ? json_decode($ruleTmp->pintuan_rule,true) : [],
            'kanjia_rule' => json_decode($ruleTmp->kanjia_rule,true) ? json_decode($ruleTmp->kanjia_rule,true) : [],
            'qianggou_rule' => json_decode($ruleTmp->qianggou_rule,true) ? json_decode($ruleTmp->qianggou_rule,true) : [],
        ];
    }

    public function setRule() {
        $pintuan_rule = (string) $this->request->param('pintuan_rule','',"SecurityEditorHtml");
        $kanjia_rule = (string) $this->request->param('kanjia_rule','',"SecurityEditorHtml");
        $qianggou_rule = (string) $this->request->param('qianggou_rule','',"SecurityEditorHtml");
        $SettingModel = new SettingModel();
        if (!$setting = $SettingModel->find($this->appId)){
            $SettingModel->save(['pintuan_rule'=>$pintuan_rule,'kanjia_rule'=>$kanjia_rule,'qianggou_rule'=>$qianggou_rule,'app_id'=>$this->appId]);
        } else {
            $SettingModel->save(['pintuan_rule'=>$pintuan_rule,'kanjia_rule'=>$kanjia_rule,'qianggou_rule'=>$qianggou_rule],['app_id'=>$this->appId]);
        }
    }




    public function getIntegral() {
        $SettingModel = new SettingModel();
        $Setting = $SettingModel->find($this->appId);
        $default = $SettingModel->integral_default;
        $this->datas = [
            'integral' => $Setting['integral'] ? moneyFormat($Setting['integral']) : moneyFormat($default['integral']),
            'integral_rule' => json_decode($Setting['integral_rule']) ? json_decode($Setting['integral_rule'],true) : [],
            'integral_exptime' => $Setting['integral_exptime'] ? ($Setting['integral_exptime']/86400) : ($default['integral_exptime']/86400),
            'integral_five_stars_comment' => $Setting['integral_five_stars_comment'] ?  $Setting['integral_five_stars_comment'] : $default['integral_five_stars_comment'],
            'integral_whith_photo_comment' => $Setting['integral_whith_photo_comment'] ?  $Setting['integral_whith_photo_comment'] : $default['integral_whith_photo_comment'],
            'integral_vip_combo' => $Setting['integral_vip_combo'] ? round($Setting['integral_vip_combo']/100,2) : round($default['integral_vip_combo']/100,2),
        ];
    }


    public function setIntegral() {
        $integral =  $this->request->param('integral',0,"moneyToInt");
        $integral_rule = (string) $this->request->param('integral_rule','');
        $integral_exptime = (int) $this->request->param('integral_exptime',0);
        $integral_five_stars_comment = (int) $this->request->param('integral_five_stars_comment',0);
        $integral_whith_photo_comment = (int) $this->request->param('integral_whith_photo_comment',0);
        $integral_vip_combo = moneyToInt((int) $this->request->param('integral_vip_combo',0));

        if ($integral < 0 || !$integral_rule) {
            $this->warning('参数不正确');
        }
        if (!$rule = json_decode($integral_rule,true)) {
            $this->warning('参数不正确');
        }
        if (!$integral_exptime) {
            $this->warning('参数不正确');
        }
        $integral_exptime = $integral_exptime * 86400;

        $SettingModel = new SettingModel();
        $default = $SettingModel->integral_default;
        $save_data = [
            'integral'=>$integral ? $integral : $default['integral'],
            'integral_rule'=>$integral_rule,
            'integral_exptime'=>$integral_exptime ? $integral_exptime : $default['integral_exptime'],
            'integral_five_stars_comment'=>$integral_five_stars_comment ? $integral_five_stars_comment : $default['integral_five_stars_comment'],
            'integral_whith_photo_comment'=>$integral_whith_photo_comment ? $integral_whith_photo_comment : $default['integral_whith_photo_comment'],
            'integral_vip_combo'=>$integral_vip_combo ? $integral_vip_combo : $default['integral_vip_combo'],
        ];
        if ($detail = $SettingModel->find($this->appId)) {
            $SettingModel->save($save_data,['app_id'=>$this->appId]);
        } else {
            $save_data['app_id'] = $this->appId;
            $SettingModel->save($save_data);
        }
    }


























    /**
     * 自提点详情
     */
    public function pickUpDetail() {
        $pickup_id = (int)$this->request->param("pickup_id");
        $PickupModell = new PickupModel();
        if (!$detail = $PickupModell->find($pickup_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $datas = [
            'pickup_id' => (int)$detail->pickup_id,
            'title' => (string)$detail->title,
            'tel' => $detail->tel,
            'photo' => $detail->photo,
            'mobile' => $detail->mobile,

        ];
        $this->datas = [
            'datas' => $datas,
            'addressInfo' => [
                'lat' => $detail->lat,
                'lng' => $detail->lng,
                'address' => $detail->address,
            ],
        ];
    }



    /**
     * 编辑自提点
     */
    public function editPickUp() {
        $pickup_id = (int)$this->request->param("pickup_id");
        $PickupModell = new PickupModel();
        if (!$detail = $PickupModell->find($pickup_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $res = $PickupModell->setData($PickupModell->dataFilter($this->appId), $pickup_id);
        if ($res === false) {
            $this->warning($PickupModell->getError());
        }
    }




    /**
     * 添加自提点
     */
    public function addPickUp() {
        $PickupModel = new PickupModel();
        $res = $PickupModel->setData($PickupModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($PickupModel->getError());
        }
    }



    /**
     * 自提点列表
     */
    public function pickUpList() {
        $PickupModel = new PickupModel();
        $where['app_id'] = $this->appId;
        $title = (string)$this->request->param("title");
        if (!empty($title)) {
            $where["title"] = ["LIKE", "%{$title}%"];
        }
        $list = $PickupModel->where($where)->page($this->page, $this->limit)->select();
        $count = $PickupModel->where($where)->count();

        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'pickup_id' => (int)$val->pickup_id,
                'title' => (string)$val->title,
                'tel' => $val->tel,
                'photo' => $val->photo,
                'mobile' => $val->mobile,
                'address' => $val->address,
            ];
        }

        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }




    public function getCoupon() {
        $SettingModel = new SettingModel();
        $Setting = $SettingModel->find($this->appId);

        $this->datas = [
            'coupon_popup' => $Setting['coupon_popup'] ?  $Setting['coupon_popup'] : 0,
            'coupon_direction' => json_decode($Setting['coupon_direction']) ? json_decode($Setting['coupon_direction'],true) : [],
            'coupon_interval' => $Setting['coupon_interval'] ? ($Setting['coupon_interval']/3600) : 0,
        ];
    }


    public function setCoupon() {
        $coupon_popup = (int) $this->request->param('coupon_popup',0);
        $coupon_interval = (int) $this->request->param('coupon_interval',0);
        $coupon_direction = (string) $this->request->param('coupon_direction',0);

        if ($coupon_popup) {
            if ($coupon_interval  < config('limitnum.app_shop_coupon_interval')) {
                $warning = "弹出间隔不得小于" . config('limitnum.app_shop_coupon_interval'). '小时!';
                $this->warning($warning);
            }
        }
        $coupon_interval = $coupon_interval * 3600;

        if (json_decode($coupon_direction,true) == false) {
            $this->warning('参数不正确!');
        }

        $SettingModel = new SettingModel();
        if ($detail = $SettingModel->find($this->appId)) {
            $SettingModel->save(['coupon_popup'=>$coupon_popup,'coupon_interval'=>$coupon_interval,'coupon_direction'=>$coupon_direction],['app_id'=>$this->appId]);
        } else {
            $SettingModel->save(['coupon_popup'=>$coupon_popup,'coupon_interval'=>$coupon_interval,'coupon_direction'=>$coupon_direction,'app_id'=>$this->appId]);
        }
    }







}
