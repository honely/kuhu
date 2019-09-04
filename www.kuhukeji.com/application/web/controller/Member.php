<?php
namespace app\web\controller;

use app\common\model\app\AppModel;
use app\common\library\token\AppToken as CodeAuth ;
use app\common\model\member\MemberModel;
class Member extends Common
{
    protected $checkLogin = true;


    public function index()
    {


        return $this->fetch();
    }


    public function createApp(){


        $AppModel = new AppModel();
        $data['app_type'] = (int)$this->request->param("app_type");
        $data['app_name'] = (string)$this->request->param("app_name");
        $data['member_id'] = $this->memberId;
        $data['expire_time'] = time() + 86400 * 30;
        $is_has = false;
        $apps = [];
        foreach($this->apps['apps'] as $val){
            if($val['app_id'] == $data['app_type']) $is_has = true;
            $apps[$val['app_id']] = $val;
        }
        if(!$is_has){
            $this->error('没有该小程序！');
        }
        if(empty($data['app_name'])){
            $this->error('请输入小程序名称');
        }
        if($this->member['has_app_num'] >= $this->member['max_app_num']){
            $this->error('已超过最大创建数，可联系管理员升级');
        }
        $AppModel->save($data);
        $MemberModel = new  MemberModel();
        $MemberModel->IncDecCol($this->memberId,'has_app_num');

        $url = $apps[$data['app_type']]['store_url'].$AppModel->app_id.'/'.urlencode(cookie("wyuMemberToken"));


        $this->success('创建小程序成功',$url);
    }



    public function delApp(){
        $AppModel = new AppModel();
        $appId = (int)$this->request->param('app_id');
        if(empty($appId)){
            $this->error('要删除的APP不能为空');
        }
        if(!$detail = $AppModel->get($appId)){
            $this->error('要删除的APP不能为空');
        }
        if($detail['member_id'] != $this->memberId){
            $this->error('要删除的APP不能为空');
        }
        $AppModel->where(['app_id'=>$appId])->delete();
        $this->success('删除成功！');
    }

    public function getApp(){
        $AppModel = new AppModel();
        $page = $this->request->param('page');
        $page = $page > 0 ? $page : 1;
        $bgNum = ($page-1) * 8;
        $where = ['member_id'=>$this->memberId];
        $app_type = (int)$this->request->param('app_type');
        if($app_type){
            $where['app_type'] = $app_type;
        }
        $count =  $AppModel->where($where)->count();
        $list = $AppModel->where($where)->limit($bgNum,8)->select();

        $apps = [];
        foreach($this->apps['apps'] as $val){
            $apps[$val['app_id']] = $val;
        }

        $return  = [];
        foreach ($list as $val) {
            $return[] = [
                'app_id' => $val->app_id,
                'app_name' => $val->app_name,
                'app_type' => $val->app_type,
                'app_type_mean' =>$apps[$val->app_type]['app_name'],
                'sms_num' => $val->sms_num,
                'member_id' => $val->member_id,
                'url' => $apps[$val->app_type]['store_url'].$val->app_id.'/'.urlencode(cookie("wyuMemberToken")),
            ];
        }

        $datas = [
            'count' => $count,
            'apps'  => $return,
            'limit' => 8,
        ];
        $this->success('获取数据成功',null,$datas);
    }



}
