<?php

namespace app\shop\logic;

use app\common\model\sms\SmsTmpModel;

/**
 * 发送营销短信
 */
class ShopYxSendSmsLogic
{
    //模板库
    private $tmp;
    //模板库模板ID
    private $tmpId;
    //短信参数
    private $param;
    //用户数量
    private $mobiles;
    //应用ID
    private $appId;
    //单条短信小号次数；
    private $num = 1;

    public function setAppId($appid){
        $this->appId = $appid;
        return $this;
    }

    public function setK($k)
    {
        $SmsTmpModel = new SmsTmpModel();
        if(!$tmp =  $SmsTmpModel->find($k)){
            \exception("系统错误");
        };
        if($tmp->app_type != 'shop'){
            \exception("系统错误");
        }
        if (!$tmp->tmp_id) {
            \exception("短信模板尚未配置对应的腾讯云短信模板ID");
        }
        $this->tmp = $tmp;
        $this->tmpId = $tmp->tmp_id;
        return $this;
    }

    /**
     * 设置对应模板的参数
     * @param $param array 键值对 应与 数据库 wyu_sms_tmp  字段 params 保持一致
     * @return $this
     * @throws \Exception
     */
    public function setParam($param)
    {
        $_param = (array) json_decode($this->tmp->params,true);
        if(empty($_param)){
            exception("系统错误");
        }
        $check_param = [];
        foreach ($param as $value){
            $check_param[$value['key']] = $value['val'];
        }
        $this->param = [];
        $param_num = 0;
        foreach ($_param as $value){
            if(empty($check_param[$value['key']])){
                exception("发送模板参数不正确");
            }
            $param_num += mb_strlen($check_param[$value['key']],"utf-8");
            $this->param[] = $check_param[$value['key']];
        }
        $num =  mb_strlen($this->tmp->text,"utf-8");
        $num = $param_num + $num - (3*count($this->param));
        $this->num = ceil($num/70);
        return $this;
    }

    /**
     * 设置要发送的手机号
     * @param $mobile
     * @return $this
     */
    public function setMobile($mobile)
    {
        $this->mobiles = $mobile;
        return $this;
    }

    /**
     * 短信发送
     */
    public function send()
    {
        try{
            $ShopSendSmsLogic = new ShopSendSmsLogic();
            $ShopSendSmsLogic->setAppId($this->appId)
                ->setMobile($this->mobiles)
                ->setTmpId($this->tmpId)
                ->setSmsNumTimes($this->num)
                ->sendSms($this->param);
        }catch (\Exception $exception){
            exception($exception->getMessage());
        }
    }

}
