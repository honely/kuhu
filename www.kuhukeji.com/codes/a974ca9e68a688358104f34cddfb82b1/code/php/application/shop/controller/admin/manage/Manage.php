<?php
namespace app\shop\controller\admin\manage;

use app\shop\controller\admin\Common;
use app\shop\model\ManageModel;


class Manage  extends Common{
    public function create(){
        $ManageModel = new ManageModel();
        $data['manage_name'] = (string) $this->request->param('manage_name');
        $data['password'] = (string) $this->request->param('password','','md5');
        $data['remark'] = (string) $this->request->param('remark');
        $data['is_lock'] = (int) ($this->request->param('is_lock') == 1);
        $data['app_ip'] = (string) $this->request->ip();
        $data['app_id'] = $this->appId;
        if ($ManageModel->where(['manage_name'=>$data['manage_name']])->find()) {
            $this->warning("已存在用户名{$data['manage_name']},换一个吧!");
        }
        $res = $ManageModel->save($data);
        if ($res == false) {
            $this->warning($ManageModel->getError());
        }
    }

    public function edit(){
        $data['manage_id'] = (int) $this->request->param("manage_id");
        $ManageModel = new ManageModel();
        if (!$detail = $ManageModel->find($data['manage_id'])) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $password = (string) $this->request->param('password');
        if ($password) {
            $data['password'] = md5($password);
        }

        $data['manage_name'] = (string) $this->request->param('manage_name');
        $data['remark'] = (string) $this->request->param('remark');
        $data['is_lock'] = (int) ($this->request->param('is_lock') == 1);
        $data['app_id'] = $this->appId;

        if ($manager = $ManageModel->where(['manage_name'=>$data['manage_name']])->find()) {
            if ($manager->manage_id != $data['manage_id']) {
                $this->warning("用户名不可修改!");
            }
        }
        $res = $ManageModel->isUpdate(true)->save($data);
        if ($res == false) {
            $this->warning($ManageModel->getError());
        }
    }


    public function del(){
        $manage_id = (int) $this->request->param("manage_id");
        $ManageModel = new ManageModel();
        if (!$detail = $ManageModel->find($manage_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $ManageModel->where("manage_id",   $manage_id)->delete();
    }

    public function detail() {
        $manage_id = (int) $this->request->param("manage_id");
        $ManageModel = new  ManageModel();
        if (!$detail = $ManageModel->find($manage_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'manage_id'  =>  $detail->manage_id,
            'manage_name'  =>  $detail->manage_name,
            'password'  =>  $detail->password,
            'remark'  =>  $detail->remark,
            'is_lock'  =>  $detail->is_lock,
            'app_ip'  =>  $detail->app_ip,
            'last_time'  =>  $detail->last_time,
            'last_ip'  =>  $detail->last_ip,
        ];
    }

    public function index(){
        $ManageModel = new ManageModel();
        $where['app_id'] = $this->appId;

        $manage_name = (string) $this->request->param("manage_name");
        if(!empty($manage_name)){
            $where["manage_name"] = ["LIKE","%{$manage_name}%"];
        }
        $end_add_time = (int) $this->request->param("end_add_time",0,"strtotime");
        $bg_add_time = (int) $this->request->param("bg_add_time",0,"strtotime");
        if($end_add_time > 0 && $bg_add_time > 0){
            $where["add_time"] = ["between",[$bg_add_time,$end_add_time]];
        }
        $is_lock = (int) ($this->request->param('is_lock',0) == 1);
        if ($is_lock) {
            $where['is_lock'] = $is_lock;
        }
        $list = $ManageModel->where($where)->order("manage_id desc")->page($this->page, $this->limit)->select();
        $count = $ManageModel->where($where)->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'manage_id'  =>  $val->manage_id,
                'manage_name'  =>  $val->manage_name,
                'password'  =>  $val->password,
                'remark'  =>  $val->remark,
                'is_lock'  =>  $val->is_lock,
                'last_time'  =>  $val->last_time ? date('Y-m-d H:i',$val->last_time) : '--',
                'last_ip'  =>  $val->last_ip,
                'add_time'  =>  $val->add_time ? date('Y-m-d H:i',$val->add_time) : '--',
                'app_ip'  =>  $val->app_ip,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    public function lock(){
        $manage_id = (int) $this->request->param("manage_id");
        $ManageModel = new ManageModel();
        if (!$detail = $ManageModel->find($manage_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $is_lock = (int)(!$detail->is_lock);
        $res = $ManageModel->isUpdate(true)->save(['is_lock'=>$is_lock],['manage_id'=>$manage_id]);
        if ($res == false) {
            $this->warning($ManageModel->getError());
        }
    }

}
