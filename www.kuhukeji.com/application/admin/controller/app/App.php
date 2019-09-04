<?php

namespace app\admin\controller\app;

use app\admin\controller\Common;
use app\common\library\token\AppToken;
use app\common\model\app\AppModel;
use app\common\model\member\MemberModel;
use app\common\library\AppInstall;
use app\common\model\sms\SmsTmpModel;

class App extends Common
{



    public function edit()
    {
        $app_id = (int)$this->request->param("app_id");
        $AppModel = new AppModel();
        if (!$detail = $AppModel->find($app_id)) {
            $this->warning("不存在数据");
        }
        $res = $AppModel->setData($AppModel->dataFilter($app_id), $app_id);
        if ($res === false) {
            $this->warning($AppModel->getError());
        }
    }

    public function del()
    {
        $app_id = (int)$this->request->param("app_id");
        $AppModel = new AppModel();
        if (!$detail = $AppModel->find($app_id)) {
            $this->warning("不存在数据");
        }
        $AppModel->where("app_id", $app_id)->delete();
    }

    public function detail()
    {
        $app_id = (int)$this->request->param("app_id");
        $AppModel = new  AppModel();
        if (!$detail = $AppModel->find($app_id)) {
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'app_id' => $detail->app_id,
            'app_name' => $detail->app_name,
            'app_type' => $detail->app_type,
            //'money' => $detail->money,
            'sms_num' => $detail->sms_num,
            'appType' => $this->appType,
            'expire_time' => date("Y-m-d H:i:s",$detail->expire_time),
        ];
    }

    public function index()
    {
        $AppModel = new AppModel();
        $where = [];
        $app_type = (int)$this->request->param("app_type");
        $where["app_type"] = $app_type;

        $AppInstall = new AppInstall();
        $appTypeInfo = $AppInstall->getAppByAppid($app_type);
        if(empty($appTypeInfo)){
            $this->warning('该应用您暂未安装');
        }
        $app_name = (string)$this->request->param("app_name");
        if (!empty($app_name)) {
            $where["app_name"] = ["LIKE", "%{$app_name}%"];
        }
        $member_id = (int)$this->request->param("member_id");
        if ($member_id) {
            $where["member_id"] = $member_id;
        }

        $end_add_time = (int)$this->request->param("end_add_time", 0, "strtotime");
        $bg_add_time = (int)$this->request->param("bg_add_time", 0, "strtotime");
        if ($end_add_time > 0 && $bg_add_time > 0) {
            $where["add_time"] = ["between", [$bg_add_time, $end_add_time]];
        }
        $list = $AppModel->where($where)->order("app_id desc")->page($this->page, $this->limit)->select();
        $count = $AppModel->where($where)->count();
        $memberIds = [];
        foreach ($list as $v) {
            $memberIds[$v->member_id] = $v->member_id;
        }
        $MemberModel = new MemberModel();
        $memberIds = empty($memberIds) ? '' : $memberIds;
        $members = $MemberModel->itemsByIds($memberIds);
        $datas = [];
        $CodeAuth = new AppToken();
        foreach ($list as $val) {
            $datas[] = [
                'app_id' => $val->app_id,
                'app_name' => $val->app_name,
                'app_type' => $val->app_type,
                'app_type_mean' => isset($this->appType[$val->app_type]) ? $this->appType[$val->app_type] : '--',
                //'money' => $val->money,
                'sms_num' => $val->sms_num,
                'expire_time' => date("Y-m-d H:i:s",$val->expire_time),
                'member_id' => $val->member_id,
                'mobile' => isset($members[$val->member_id]['mobile']) ? $members[$val->member_id]['mobile'] : '--',
                'url' => $appTypeInfo['store_url'].$val->app_id.'/'.urlencode($CodeAuth->getMemberAuthCode($val->member_id)),
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
            'appTypeInfo' => $appTypeInfo,
        ];
    }


    public function delAppByIds()
    {
        $appIds = (string) $this->request->param('appIds');
        $appIds = json_decode($appIds, true);
        if (empty($appIds)) {
            $this->warning('参数不正确!');
        }
        $appIds = empty($appIds) ? '' : $appIds;
        $AppModel = new AppModel();
        $AppModel->whereIn('app_id', $appIds)->delete();
    }

    protected $appTag=[
        1=>'website',
        2=>'shop',
        3=>'o2o',
    ];


    public function getSmsTemplate() {
        $_app_type = (int) $this->request->param('app_type',1);
        $app_type = $this->appTag[$_app_type];
        $SmsTmpModel = new SmsTmpModel();
        $template_tmp = $SmsTmpModel->where(['app_type'=>$app_type])->page($this->page,$this->limit)->select();
        $count = $SmsTmpModel->where(['app_type'=>$app_type])->count();
        $template = [];
        $smsType = getMean('sms_tmp_type');
        foreach ($template_tmp as $v) {
            $template[] = [
                'k' => $v->k,
                'use_type' => $v->use_type,
                'app_type' => $v->app_type,
                'tmp_id' => $v->tmp_id,
                'text' => $v->text,
                'params' => $v->params,
                'type' => $v->type,
                'type_mean' => isset($smsType[$v->type]) ? $smsType[$v->type] : '未知类型',
            ];
        }

        $this->datas = [
            'list' => $template,
            'count' => $count,
        ];
    }


    public function setSmsTemplateId() {
        $tmp_id = (string) $this->request->param('tmp_id','');
        $k = (string) $this->request->param('k');
        if (!$tmp_id) {
            $this->warning("必须填写短信模板ID");
        }
        $SmsTmpModel = new SmsTmpModel();
        if (!$tmp = $SmsTmpModel->find($k)) {
            $this->warning("参数不正确！");
        }
        $SmsTmpModel->isUpdate(true)->save(['tmp_id'=>$tmp_id],['k'=>$k]);
    }

}
