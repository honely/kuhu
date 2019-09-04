<?php

namespace app\shop\controller\admin\agent;

use app\shop\controller\admin\Common;
use app\shop\model\shop\AgentApplyModel;

use app\shop\model\shop\AgentModel;
use app\shop\model\shop\AgentSettingModel;
use app\shop\model\shop\UserModel;

class Agentapply extends Common{

    public function save(){
        $apply_id = (int)$this->request->param('apply_id');
        $AgentApplyModel = new AgentApplyModel();
        if(!$detail = $AgentApplyModel->get($apply_id)){
            $this->warning('没有该申请数据');
        }
        if($detail->app_id != $this->appId){
            $this->warning('没有该申请数据');
        }
        if($detail->status != 0){
            $this->warning('该信息已经审核过了');
        }
        $status = (int) $this->request->param('status');
        if($status == 1){
            $group =  (int) $this->request->param('group');
            if(empty($group)){
                $this->warning('请选择推广员分组');
            }
            if($group <1 || $group > 3){
                $this->warning('请选择推广员分组');
            }
            $AgentApplyModel->save(['status' => 1],['apply_id'=>$apply_id]);
            $UserModel =  new UserModel();
            $UserModel->isUpdate('true')->save(['agent_group'=>$group,'agent_time'=>time()],['user_id'=>$detail->user_id]);
//            $AgentSettingModel = new AgentSettingModel();
//            $agentSetting = $AgentSettingModel->find($this->appId);
//            if ($agentSetting->condition == getMean('agent_apply_audit_setting','key')['sqtg']) {
//                $apply_data['status'] = $status;
//                $UserModel = new UserModel();
//                $UserModel->save(['agent_group'=>1,'agent_time' => time()],['user_id'=>$detail->user_id]);
//            }
        }elseif($status == 2){
            $reason = $this->request->param('reason');
            if(empty($reason)){
                $this->warning('请填写拒绝理由');
            }
            $save = [
                'status' => 2,
                'reason' => $reason,
            ];
            $AgentApplyModel->save($save,['apply_id'=>$apply_id]);
        }else{
            $this->warning('请选择审核状态');
        }


    }

    public function view(){
        $apply_id = (int)$this->request->param('apply_id');
        $AgentApplyModel = new AgentApplyModel();
        if(!$detail = $AgentApplyModel->get($apply_id)){
            $this->warning('没有该申请数据');
        }
        if($detail->app_id != $this->appId){
            $this->warning('没有该申请数据');
        }
        if($detail->status != 0){
            $this->warning('该信息已经审核过了');
        }

        $UserModel = new UserModel();
        if(!$user = $UserModel->get($detail->user_id)){
            $this->warning('该用户已经被删除');
        }
        $UserModel->findUser($detail->user_id);
        $userIds = [];
        if(!empty($user->pid)){
            $userIds[] = $user->pid;
        }
        if(!empty($user->pid2)){
            $userIds[] = $user->pid2;
        }
        if(!empty($user->pid3)){
            $userIds[] = $user->pid3;
        }
        $userlist = [];
        if(!empty($userIds)){
            $userlist = $UserModel->itemsByIds($userIds);
        }

        $agentGroup = getMean('agent_group');
        $detail = [
            'apply_id' => $apply_id,
            'add_time' => date('Y-m-d H:i:s',$detail->add_time),
            'add_ip'   => $detail->add_ip,
            'status'   => $detail->status,
            'reason'   => $detail->reason,
            'mobile'   => $user->mobile,
            'nickname' => $user->nickname,
            'face'     => $user->face,
            'money'    => round($user->money/100,2),
            'vip'      => (int)$UserModel->checkVip(),
            'plus_vip_time'  => empty($user->plus_vip_time) ? '-' : date('Y-m-d H:i:s',$user->plus_vip_time),
            'agent_group' => $user->agent_group,
            'agent_group_mean' => isset($agentGroup[$user->agent_group]) ? $agentGroup[$user->agent_group] : '未开通',
            'order_num' => (int)$user->order_num,
            'agent_num' => (int)$user->agent_num,
            'agent_register' => (int)$user->agent_register,
            'agent_order'   =>(int)$user->agent_order,
            'agent_vip'     => (int)$user->agent_vip,
            'reg_time'      => empty($user->reg_time) ? '-': date('Y-m-d H:i:s',$user->reg_time),
            'last_time'     => empty($user->last_time) ? '-' :date('Y-m-d H:i:s',$user->last_time),
            'pid'           => isset($userlist[$user->pid]) ? $userlist[$user->pid]['mobile'].'('.$userlist[$user->pid]['nickname'].')' : '-',
            'pid2'           => isset($userlist[$user->pid2]) ? $userlist[$user->pid2]['mobile'].'('.$userlist[$user->pid2]['nickname'].')' : '-',
            'pid3'           => isset($userlist[$user->pid3]) ? $userlist[$user->pid3]['mobile'].'('.$userlist[$user->pid3]['nickname'].')' : '-',
        ];
        $this->datas['detail'] = $detail;
    }

    public function getLists(){
        $AgentApplyModel = new AgentApplyModel();
        $where = ['app_id'=> $this->appId];
        $status = (int)$this->request->param('status',-999);
        if($status >= 0){
            $where['status'] = $status;
        }
        $keyword  = $this->request->param('keyword');
        $count = $AgentApplyModel->userExists($keyword)->where($where)->count();
        $lists = $AgentApplyModel->userExists($keyword)->where($where)->order(['apply_id'=>'desc'])->page($this->page,$this->limit)->select();

        $userIds = [];
        foreach($lists as $k=>$v){
            $userIds[$v->user_id] = $v->user_id;
        }
        $users = [];
        if(!empty($userIds)){
            $UserModel = new UserModel();
            $users = $UserModel->itemsByIds($userIds);
        }
        $datas = [];
        foreach($lists as $val){
            $datas [] = [
                'apply_id' => $val['apply_id'],
                'user_id' => $val['user_id'],
                'status'   => $val['status'],
                'reason'   => $val['reason'],
                'mobile'   => $val['mobile'],
                'nickname' => isset($users[$val['user_id']]) ?  $users[$val['user_id']]['nickname'] : '--',
                'face' => isset($users[$val['user_id']]) ?  $users[$val['user_id']]['face'] : '',
                'add_time' => date('Y-m-d H:i:s',$val['add_time']),
            ];
        }

        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


}
