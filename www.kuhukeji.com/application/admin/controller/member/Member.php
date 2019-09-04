<?php

namespace app\admin\controller\member;

use app\admin\controller\Common;
use app\common\model\member\MemberModel;

class Member extends Common
{
    public function create()
    {
        $MemberModel = new MemberModel();
        $res = $MemberModel->setData($MemberModel->dataFilter(true, true));
        if ($res == false) {
            $this->warning($MemberModel->getError());
        }
    }

    public function edit()
    {
        $member_id = (int)$this->request->param("member_id");
        $MemberModel = new MemberModel();
        if (!$detail = $MemberModel->find($member_id)) {
            $this->warning("不存在数据");
        }
        $res = $MemberModel->setData($MemberModel->dataFilter(false, true), $member_id);
        if ($res == false) {
            $this->warning($MemberModel->getError());
        }
    }

    public function del()
    {
        $member_id = (int)$this->request->param("member_id");
        $MemberModel = new MemberModel();
        if (!$detail = $MemberModel->find($member_id)) {
            $this->warning("不存在数据");
        }
        $MemberModel->where("member_id", $member_id)->delete();
    }

    public function detail()
    {
        $member_id = (int)$this->request->param("member_id");
        $MemberModel = new  MemberModel();
        if (!$detail = $MemberModel->find($member_id)) {
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'member_id' => $detail->member_id,
            'mobile' => $detail->mobile,
            'has_app_num' => $detail->has_app_num,
            'max_app_num' => $detail->max_app_num,
            'last_time' => $detail->last_time,
            'last_ip' => $detail->last_ip,
            'add_time' => $detail->add_time,
            'add_ip' => $detail->add_ip,
            'is_lock' => $detail->is_lock,
            'agency_id' => $detail->agency_id,
        ];
    }

    public function index()
    {
        $MemberModel = new MemberModel();
        $where = [];
        $mobile = (string)$this->request->param("mobile");
        if (!empty($mobile)) {
            $where["mobile"] = ["LIKE", "%{$mobile}%"];
        }
        $agency_id = (int)$this->request->param("agency_id");
        if (!empty($agency_id)) {
            $where["agency_id"] = $agency_id;
        }
        $is_lock = (int)$this->request->param("is_lock");
        if ($is_lock >= 0) {
            $where["is_lock"] = $is_lock;
        }
        $end_add_time = (int)$this->request->param("end_add_time", 0, "strtotime");
        $bg_add_time = (int)$this->request->param("bg_add_time", 0, "strtotime");
        if ($end_add_time > 0 && $bg_add_time > 0) {
            $where["add_time"] = ["between", [$bg_add_time, $end_add_time]];
        }
        $end_last_time = (int)$this->request->param("end_last_time", 0, "strtotime");
        $bg_last_time = (int)$this->request->param("bg_last_time", 0, "strtotime");
        if ($end_last_time > 0 && $bg_last_time > 0) {
            $where["last_time"] = ["between", [$bg_last_time, $end_last_time]];
        }
        $list = $MemberModel->where($where)->order("member_id desc")->page($this->page, $this->limit)->select();
        $count = $MemberModel->where($where)->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'member_id' => $val->member_id,
                'mobile' => $val->mobile,
                'has_app_num' => $val->has_app_num,
                'max_app_num' => $val->max_app_num,
                'last_time' => $val->last_time ? date('Y-m-d H:i', $val->last_time) : '--',
                'last_ip' => $val->last_ip,
                'add_time' => $val->add_time ? date('Y-m-d H:i', $val->add_time) : '--',
                'add_ip' => $val->add_ip,
                'is_lock' => $val->is_lock,
                'agency_id' => $val->agency_id,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    public function delMember()
    {
        $member_id = (int)$this->request->param('member_id');
        if (!$member_id) {
            $this->warning('参数不正确!');
        }
        $MemberModel = new MemberModel();
        if (!$member = $MemberModel->find($member_id)) {
            $this->warning('不存在的用户');
        }
        $MemberModel->where(['member_id' => $member_id])->delete();
    }


    public function delMemberByIds()
    {
        $memberIds = (string)$this->request->param('memberIds');
        $memberIds = json_decode($memberIds, true);
        if (empty($memberIds)) {
            $this->warning('参数不正确!');
        }
        $memberIds = empty($memberIds) ? '' : $memberIds;
        $MemberModel = new MemberModel();
        $MemberModel->whereIn('member_id', $memberIds)->delete();
    }


    public function lock()
    {
        $member_id = (int)$this->request->param('member_id');
        $is_lock = (int)($this->request->param('is_lock') == 1);
        if (!$member_id) {
            $this->warning('参数不正确!');
        }
        $MemberModel = new MemberModel();
        if (!$member = $MemberModel->find($member_id)) {
            $this->warning('不存在的用户');
        }
        $MemberModel->save(['is_lock' => $is_lock], ['member_id' => $member_id]);
    }


    public function lockMemberByIds()
    {
        $memberIds = (string)$this->request->param('memberIds');
        $is_lock = (int)($this->request->param('is_lock') == 1);
        $memberIds = json_decode($memberIds, true);
        if (empty($memberIds)) {
            $this->warning('参数不正确!');
        }
        $memberIds = empty($memberIds) ? '' : $memberIds;
        $MemberModel = new MemberModel();
        $MemberModel->whereIn('member_id', $memberIds)->update(['is_lock' => $is_lock]);
    }

}
