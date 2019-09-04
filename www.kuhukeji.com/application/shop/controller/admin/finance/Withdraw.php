<?php

namespace app\shop\controller\admin\finance;

use app\shop\controller\admin\Common;
use app\shop\model\shop\UserModel;
use app\shop\model\shop\UserMoneyLogModel;
use app\shop\model\shop\WithdrawApplyModel;

class Withdraw extends Common
{
    /**
     * 提现申请
     */
    public function index() {
        $type = (int) $this->request->param('type',1);
        $status = (int) $this->request->param('status',-999);
        $user_id = (int) $this->request->param('user_id',-999);
        if (!isset(getMean('shop_withdraw_type')[$type])) {
            $this->warning("参数不正确!");
        }
        $where['app_id'] = $this->appId;
        if ($status >= 0) {
            $where['status'] = $status;
        }
        if ($type) {
            $where['type'] = $type;
        }
        if ($user_id) {
            $where['user_id'] = $user_id;
        }

        $bg_add_time = (int)$this->request->param('bg_add_time','','strtotime');
        $end_add_time = (int)$this->request->param('end_add_time','','strtotime');
        if ($bg_add_time && $end_add_time) {
            $where['add_time'] = ['between',"$bg_add_time,$end_add_time"];

        } elseif ($bg_add_time && !$end_add_time) {
            $where['add_time'] = ['>',$bg_add_time];
        } elseif (!$bg_add_time && $end_add_time) {
            $where['add_time'] = ['<',$end_add_time];
        }

        $WithdrawApplyModel = new WithdrawApplyModel();
        $list_tmp = $WithdrawApplyModel->where($where)->order('status asc,apply_id desc')->page($this->page,$this->limit)->select();
        $count = $WithdrawApplyModel->where($where)->count();
        $userIds = [];
        foreach ($list_tmp as $v) {
            $userIds[$v->user_id] = $v->user_id;
        }
        $userIds = empty($userIds) ? '' : $userIds;
        $UserModel = new UserModel();
        $users = $UserModel->itemsByIds($userIds);
        $list = [];
        foreach ($list_tmp as $v) {
            $list[] = [
                'apply_id' => $v->apply_id,
                'user_id' => $v->user_id,
                'nickname' => $users[$v->user_id]['nickname'],
                'face' => $users[$v->user_id]['face'],
                'mobile' => $users[$v->user_id]['mobile'],
                'money' => moneyFormat($v->money,true),
                'status' => $v->status,
                'status_mean' => getMean('shop_withdraw_status')[$v->status],
                'remark' => $v->remark,
                'add_time' => date("Y-m-d H:i",$v->add_time),
                'add_ip' => $v->add_ip,
            ];
        }
        $status_mean = statusToMap(getMean('shop_withdraw_status'));
        $this->datas = [
            'withdraw_status_mean' => $status_mean,
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    /**
     * 处理提现，同意或拒绝
     * 同意或拒绝都需要填写备注
     */
    public function handle() {
        $apply_id = (int) $this->request->param('apply_id',0);
        $status = (int) $this->request->param('status',0);
        if (!isset(getMean('shop_withdraw_status')[$status])) {
            $this->warning("参数不正确!");
        }
        $remark = (string) $this->request->param('remark','','SecurityEditorHtml');
        if (!$remark) {
            $this->warning("备注必须填写!");
        }
        $WithdrawApplyModel = new WithdrawApplyModel();
        if (!$apply = $WithdrawApplyModel->find($apply_id)) {
            $this->warning("参数不正确！");
        }
        if ($apply->app_id != $this->appId) {
            $this->warning("参数不正确！");
        }
        if ($apply->status > 0) {
            $this->warning("提现申请已处理！请勿重复操作！");
        }
        $updateData = [
            'apply_id' => $apply_id,
            'status' => $status,
            'remark' => $remark,
            'handle_time' => time(),
        ];
        $WithdrawApplyModel->isUpdate(true)->save($updateData);
    }



    /**
     * 提现记录
     */
    public function log() {
        $date_time = (int) $this->request->param('date_time','','strtotime');
        $type = (int) $this->request->param('type',0);
        if (!isset(getMean('shop_withdraw_type','key')[$type])) {
            $this->warning("参数不正确!");
        }
        $UserMoneyLogModel = new UserMoneyLogModel();
        $where = [
            'app_id' => $this->appId,
            'status' => 1,
        ];
        if ($date_time) {
            $where['add_time'] = ['>',$date_time];
        }
        $list_tmp = $UserMoneyLogModel->where($where)->order('apply_id desc')->page($this->page,$this->limit)->select();
        $count = $UserMoneyLogModel->where($where)->count();
        $userIds = $list = [];
        $UserModel = new UserModel();
        $users = $UserModel->itemsByIds($userIds);

        foreach ($list_tmp as $v)  {
            $list[] = [
                'apply_id' => $v->apply_id,
                'user_id' => $v->user_id,
                'nickname' => $users[$v->user_id]['nickname'],
                'face' => $users[$v->user_id]['face'],
                'mobile' => $users[$v->user_id]['mobile'],
                'money' => moneyFormat($v->money),
                'remark' => (string)$v->remark,
                'add_time' => date("Y-m-d H:i",$v->add_time),
                'add_ip' => (string) $v->add_ip,
            ];
        }

        $this->datas = [
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }
}
