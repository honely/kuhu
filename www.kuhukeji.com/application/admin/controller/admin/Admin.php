<?php

namespace app\admin\controller\admin;

use app\admin\controller\Common;
use app\common\model\admin\AdminModel;

class Admin  extends Common
{

    public function create()
    {
        $AdminModel = new AdminModel();
        $res = $AdminModel->setData($AdminModel->dataFilter());
        if ($res == false) {
            $this->warning($AdminModel->getError());
        }
    }

    public function edit()
    {
        $admin_id = (int)$this->request->param("admin_id");
        $AdminModel = new AdminModel();
        if (!$detail = $AdminModel->find($admin_id)) {
            $this->warning("不存在数据");
        }
        $res = $AdminModel->setData($AdminModel->dataFilter(), $admin_id);
        if ($res == false) {
            $this->warning($AdminModel->getError());
        }
    }

    public function del()
    {
        $admin_id = (int)$this->request->param("admin_id");
        $AdminModel = new AdminModel();
        if (!$detail = $AdminModel->find($admin_id)) {
            $this->warning("不存在数据");
        }
        $AdminModel->where("admin_id", $admin_id)->delete();
    }

    public function detail()
    {
        $admin_id = (int)$this->request->param("admin_id");
        $AdminModel = new  AdminModel();
        if (!$detail = $AdminModel->find($admin_id)) {
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'admin_id' => $detail->admin_id,
            'username' => $detail->username,
            'real_name' => $detail->real_name,
            'mobile' => $detail->mobile,
            'last_time' => $detail->last_time,
            'is_lock' => $detail->is_lock,
            'face' => $detail->face,
        ];
    }

    public function index()
    {
        $AdminModel = new AdminModel();
        $where = [];
        $username = (string)$this->request->param("username");
        if (!empty($username)) {
            $where["username"] = ["LIKE", "%{$username}%"];
        }
        $real_name = (string)$this->request->param("real_name");
        if (!empty($real_name)) {
            $where["real_name"] = ["LIKE", "%{$real_name}%"];
        }
        $mobile = (string)$this->request->param("mobile");
        if (!empty($mobile)) {
            $where["mobile"] = ["LIKE", "%{$mobile}%"];
        }
        $is_lock = (int)$this->request->param("is_lock");
        if (!empty($is_lock)) {
            $where["is_lock"] = $is_lock;
        }
        $end_add_time = (int)$this->request->param("end_add_time", 0, "strtotime");
        $bg_add_time = (int)$this->request->param("bg_add_time", 0, "strtotime");
        if ($end_add_time > 0 && $bg_add_time > 0) {
            $where["add_time"] = ["between", [$bg_add_time, $end_add_time]];
        }
        $list = $AdminModel->where($where)->order("admin_id desc")->page($this->page, $this->limit)->select();
        $count = $AdminModel->where($where)->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'admin_id' => $val->admin_id,
                'username' => $val->username,
                'real_name' => $val->real_name,
                'mobile' => $val->mobile,
                'last_time' => $val->last_time,
                'is_lock' => $val->is_lock,
                'face' => $val->face,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }



    public function lock()
    {
        $admin_id = (int)$this->request->param('admin_id');
        $AdminModel = new AdminModel();
        if (!$admin = $AdminModel->find($admin_id)) {
            $this->warning('管理员不存在');
        }
        $is_lock = (int)($admin->is_lock == 0);
        $AdminModel->save(['is_lock' => $is_lock], ['admin_id' => $admin_id]);
    }




}
