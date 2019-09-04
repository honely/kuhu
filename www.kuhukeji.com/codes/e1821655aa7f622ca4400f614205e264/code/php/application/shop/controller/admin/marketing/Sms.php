<?php

namespace app\shop\controller\admin\marketing;

use app\common\model\app\AppModel;
use app\shop\controller\admin\Common;
use app\shop\model\sms\SendSmsLogModel;
use app\shop\logic\ShopSendSmsLogic;
use app\shop\logic\ShopYxSendSmsLogic;
use app\shop\model\sms\ShopSmsLogModel;
use app\shop\model\sms\SmsSendLogModel;
use app\shop\model\sms\SmsTmpModel;

class Sms extends Common{

    /*
     * 获取短信模板
     */
    public function getIndex(){
        $SmsTmpModel = new SmsTmpModel();
        $list = $SmsTmpModel->where("type",2)
            ->where("app_type","shop")
            ->page($this->page, $this->limit)->select();
        $count = $SmsTmpModel->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'id' => $val->k,
                'title' => $val->use_type,
                'params' => json_decode($val->params),
                'text' => $val->text,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'limit' => $this->limit,
            'count' => $count,
        ];
    }

    /**
     * 获取短信日志
     */
    public function getSmsLog(){
        $smsType = getMean('sms_tmp_type');
        $cat = (int)$this->request->param('cat',-999);
        $bgTime = (int)($this->request->param('bgTime','','strtotime'));
        $endTime = (int)($this->request->param('endTime','','strtotime'));
        $SmsSendLogModel = new SmsSendLogModel();
        $this->where['app_id'] = $this->appId;
        if($cat >= 0){
            $this->where['cat'] = $cat;
        }
        if($bgTime && $endTime){
            $this->where['add_time'] = ['between',"{$bgTime},{$endTime}"];
        }else{
            if($bgTime && !$endTime){
                $this->where['add_time'] = ['>',"{$bgTime}"];
            }elseif(!$bgTime && $endTime){
                $this->where['add_time'] = ['<',"{$endTime}"];
            }
        }

        $list = $SmsSendLogModel->where($this->where)->page($this->page,$this->limit)->order("log_id desc")->select();
        $count = $SmsSendLogModel->where($this->where)->count();
        $datas = [];
        foreach ($list as $val){
            $tels = json_decode($val->tels,true);
            $tels = implode(",", $tels);
            $datas[] = [
                'log_id' => $val->log_id,
                'app_id' => $val->app_id,
                'tels' => $tels,
                'text' => (string)$val->text,
                'each_num' => (int)$val->each_num,
                'size' => (int)$val->size,
                'num' => (int)$val->num,
                'cat' => isset($smsType[$val->cat]) ? $smsType[$val->cat] : '--',
                'add_time' => $val->add_time ? date('Y-m-d H:i',$val->add_time):'--',
            ];
        }
        $AppModel = new AppModel();
        $app = $AppModel->find($this->appId);


        $this->datas = [
            'sms_num' => $app->sms_num,
            'list'  => $datas,
            'count' => $count,
            'limit' => $this->limit,
            'smsType' => $smsType,
        ];
    }


    /**
     * 发送短信
     */
    public function senSms(){
        $k = (string) $this->request->param("k");
        $params = (array) $this->request->param("params/a");
        $mobile = (array) $this->request->param("mobile/a");
        try{
            (new ShopYxSendSmsLogic())
                ->setAppId($this->appId) //设置应用ID
                ->setMobile($mobile)    //要发送的手机号
                ->setK($k)         //模板库的KEY
                ->setParam($params)     //对应模板参数
                ->send();                //发送短信
        }catch (\Exception $exception){
            $this->warning();
        }
    }



    /**
     * 活动短信剩余变化记录
     */
    public function smsNumChangeLog() {
        $typeMap = [
            1 => '充值',
            20 => '消耗',
        ];
        $ShopSmsLogModel = new ShopSmsLogModel();
        $date_start = (int) ($this->request->param('bgTime','','strtotime'));
        $date_end = (int) ($this->request->param('endTime','','strtotime'));
        $where['app_id'] = $this->appId;
        if ($date_start && $date_end) {
            if ($date_end < $date_start) {
                $this->warning('搜索的开始时间不得大于结束时间');
            }
            $where['add_time'] = ['between',[$date_start,$date_end]];
        }
        if ($date_start && !$date_end) {
            $where['add_time'] = ['>=',$date_start];
        }
        if (!$date_start && $date_end) {
            $where['add_time'] = ['<=',$date_end];
        }
        $type = (int) $this->request->param('type',0);
        if ($type > 0) {
            if (!isset($typeMap[$type])) {
                $this->warning('参数不正确!');
            }
            $where['type'] = $type;
        }
        
        $log_tmp = $ShopSmsLogModel->where($where)->page($this->page,$this->limit)->order('log_id desc')->select();
        $count = $ShopSmsLogModel->where($where)->count();

        $log = [];
        foreach ($log_tmp as $v) {
            $log[] = [
                'log_id' => $v['log_id'],
                'num' => $v['num'],
                'this_num' => $v['this_num'],
                'type' => $v->type,
                'type_mean' => $typeMap[$v->type],
                'add_time' => date("Y-m-d",$v->add_time),
            ];
        }



        $this->datas = [
            'typeMap' => statusToMap($typeMap),
            'list' => $log,
            'count' => $count,
        ];
    }
}
