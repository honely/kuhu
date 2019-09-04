<?php

namespace app\shop\controller\admin\user;

use app\shop\controller\admin\Common;
use app\shop\model\shop\AgentApplyModel;
use app\shop\model\shop\CouponModel;
use app\shop\model\shop\IntegralModel;
use app\shop\model\shop\UserCouponModel;
use app\shop\model\shop\UserModel;

class User extends Common
{

    public function detail()
    {
        $userId = (int)$this->request->param("user_id");
        $UserModel = new UserModel();
        $user = $UserModel->findUser($userId)->getUser();
        if (empty($user) || $user->app_id != $this->appId) {
            $this->warning("用户不存在");
        }
        $pids = [$user->pid => $user->pid, $user->pid2 => $user->pid2];
        $pid = $UserModel->itemsByIds($pids);
        $IntegralModel = new IntegralModel();
        $UserCouponModel = new UserCouponModel();
        $agent_group = getMean("agent_group");
        $user_sex = getMean("user_sex");
        $datas = [
            'detail' => [
                'add_time' => date("Y/m/d H:i:s", $user->add_time),
                'last_time' => date("Y/m/d H:i:s", $user->last_time),
                'device' => $user->device,
                'face' => $user->face,
                'order_num' => $user->order_num,
                'integral' => $IntegralModel->getUserGold($userId, 2),
                'nickname' => $user->nickname,
                'money' => moneyFormat($user->money, true),
                'mobile' => $user->mobile,
                'coupon_num' => $UserCouponModel->where("user_id", $userId)->count(),
                'is_agent' => $UserModel->checkAgent(),
                'agent_lock' => $user->agent_lock,
                'agent_group_mean' => empty($agent_group[$user->agent_group]) ? '' : $agent_group[$user->agent_group],
                'agent_group' => $user->agent_group,
                'last_device' => $user->last_device,
                'is_lock' => (int)$user->is_lock,
                'sex' => $user->sex,
                'pid' => $user->pid,
                'pid2' => $user->pid2,
                'pid_name' => empty($pid[$user->pid]) ? '无' : $pid[$user->pid]->nickname,
                'pid2_name' => empty($pid[$user->pid2]) ? '无' : $pid[$user->pid]->nickname,
                'sex_mean' => empty($user_sex[$user->sex]) ? '保密' : $user_sex[$user->sex],
                'birthday' => empty($user->birthday) ? '2000/01/01' : $user->birthday,
                'is_plus_vip' => (int)($user->plus_vip_time > request()->time()),
                'plus_vip_time' => date("Y/m/d H:i:s", $user->plus_vip_time),
            ],
            'status' => [
                'integral_status' => statusToMap(getMean("integral_log_type")),
                'money_status' => statusToMap(getMean("user_money_type")),
            ],

        ];
        $this->datas = $datas;
    }

    /**
     * 获取用户列表
     */
    public function getUserList()
    {
        $UserModel = new UserModel();
        $where = [
            'app_id' => $this->appId,
        ];
        $keyword = $this->request->param('keyword');
        if (!empty($keyword)) {
            $where['mobile|nickname'] = ['LIKE', '%' . $keyword . '%'];
        }
        $status = (int)$this->request->param('status', 0);
        if ($status > 0) {
            $where['is_lock'] = $status - 1;
        }
        $vip = (int)$this->request->param('vip', 0);
        if ($vip > 0) {
            $where['vip'] = $vip - 1;
        }
        $bgTime = $this->request->param('bgTime');
        $endTime = $this->request->param('endTime');
        if (!empty($bgTime) && !empty($endTime)) {
            $where['reg_time'] = ['BETWEEN', [strtotime($bgTime), strtotime($endTime)]];
        } else {
            if (!empty($bgTime)) {
                $where['reg_time'] = ['EGT', strtotime($bgTime)];
            }
            if (!empty($endTime)) {
                $where['reg_time'] = ['ELT', strtotime($endTime)];
            }
        }
        $device = (string)$this->request->param('device', '');
        if ($device) {
            $where['device'] = $device;
        }
        $last_device = (string)$this->request->param('last_device', '');
        if ($last_device) {
            $where['last_device'] = $last_device;
        }
        $user = $UserModel->where($where)->order('user_id desc')->page($this->page, $this->limit)->select();
        $count = $UserModel->where($where)->count();
        $datas = [];
        foreach ($user as $val) {
            $datas[] = [
                'user_id' => $val->user_id,
                'mobile' => $val->mobile,
                'nickname' => $val->nickname,
                'face' => $val->face,
                'money' => round($val->money / 100, 2),
                'plus_vip_time' => empty($val->plus_vip_time) ? '-' : date('Y-m-d H:i:s', $val->plus_vip_time),
                'vip_tips' => $val->plus_vip_time > time() + 86400 * 15 ? 0 : 1,
                'device' => $val->device,
                'last_device' => $val->last_device,
                'order_num' => $val->order_num,
                'reg_time' => empty($val->reg_time) ? '-' : date('Y-m-d H:i:s', $val->reg_time),
                'last_time' => empty($val->last_time) ? '-' : date('Y-m-d H:i:s', $val->last_time),
                'is_lock' => $val->is_lock,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }

    /**
     * 修改用户基本信息
     */
    public function editInfo()
    {
        $user_id = (int)$this->request->param("user_id");
        $data['nickname'] = (string)$this->request->param("nickname");
        $data['face'] = (string)$this->request->param("face");
        $data['sex'] = (int)$this->request->param("sex");
        $data['birthday'] = (string)$this->request->param("birthday");
        $data['mobile'] = (string)$this->request->param("mobile");

        $UserModel = new UserModel();
        if (!$user = $UserModel->find($user_id)) {
            $this->warning('参数不正确');
        }
        if ($user->app_id != $this->appId) {
            $this->warning('参数不正确');
        }
        if (empty($data['nickname']) || empty($data['face'])) {
            $this->warning('参数不正确');
        }
        if (!isMobile($data['mobile'])) {
            $this->warning('请输入合法的手机号码');
        }
        $UserModel->save($data, ['user_id' => $user_id]);
    }

    /**
     * 余额操作
     */
    public function money()
    {
        $UserModel = new UserModel();
        $user_id = (int)$this->request->param("user_id");
        $type = (int)$this->request->param("type");
        $money = (int)$this->request->param("money", "0", "moneyToInt");
        if (!$user = $UserModel->findUser($user_id)->getUser()) {
            $this->warning();
        }
        if ($user->app_id != $this->appId) {
            $this->warning();
        }
        if ($money <= 0 || $type <= 0) {
            $this->warning("请输入操作余额数");
        }
        if ($UserModel->userMoney($money, $type) == false) {
            $this->warning($UserModel->getError());
        }
    }

    /**
     * 积分操作
     */
    public function jifen()
    {
        $UserModel = new UserModel();
        $user_id = (int)$this->request->param("user_id");
        $type = (int)$this->request->param("type");
        $integral = (int)$this->request->param("integral", "0");
        if (!$user = $UserModel->findUser($user_id)->getUser()) {
            $this->warning("参数错误");
        }
        if ($user->app_id != $this->appId) {
            $this->warning("参数错误");
        }
        if ($integral <= 0 || $type <= 0) {
            $this->warning("请输入操作数");
        }
        if ($UserModel->userIntegral($integral, $type) == false) {
            $this->warning($UserModel->getError());
        }
    }

    /**
     * 赠送优惠券
     */
    public function addCoupon()
    {
        $coupon_id = (int)$this->request->param("coupon_id");
        $CouponModel = new CouponModel();

        if (!$detail = $CouponModel->find($coupon_id)) {
            $this->warning();
        }

        if ($detail->app_id != $this->appId) {
            $this->warning();
        }

        if ($detail->is_online == 0) {
            $this->warning("优惠券未发放");
        }

        if ($detail->send_num >= $detail->create_num) {
            $this->warning("该优惠券发完了");
        }
        if($detail->expire_end_time < time()){
            $this->warning("该优惠券已过期");
        }
        $UserCouponModel = new UserCouponModel();
        $UserCouponModel->save([
            'app_id' => $this->appId,
            'user_id' => $detail->user_id,
            'name' => $detail->name,
            'money' => $detail->money,
            'condition' => $detail->condition,
            'expire_start_time' => $detail->expire_start_time,
            'expire_end_time' => $detail->expire_end_time,
            'type' => $detail->type,
            'userarea' => $detail->userarea,
            'is_used' => $detail->is_used,
            'cat_id' => $detail->cat_id,
            'p_cat_id' => $detail->p_cat_id,
            'get_type' => 1,
        ]);
    }

    /**
     * 这里只支持快速开通
     * 可以指定开通等级
     */
    public function agent()
    {
        $user_id = (int)$this->request->param("user_id");
        $agent_group = (int)$this->request->param("agent_group",0);
        $agent_groups = getMean('agent_group');
        if (!$agent_groups[$agent_group]) {
            $this->warning("请选择正确的参数");
        }
        $UserModel = new UserModel();
        $user = $UserModel->findUser($user_id)->getUser();
        if (empty($user)) {
            $this->warning("用户不存在！");
        }
        if ($UserModel->checkAgent(false)) {
            $this->warning("");
        };
        $AgentApplyModel = new AgentApplyModel();
        $apply = $AgentApplyModel->where("user_id", $user_id)->find();
        if (empty($apply)) {
            $AgentApplyModel->save([
                'app_id' => $this->appId,
                'user_id' => $user_id,
                'mobile' => $user->mobile,
                'status' => 1,
            ]);
        }
        if (!empty($apply) && $apply->status == 0) {
            $AgentApplyModel->save([
                'status' => 1,
            ], ['apply_id' => $apply->apply_id]);
        }
        $UserModel->save([
            'agent_group' => $agent_group,
        ], ['user_id' => $user_id]);
    }

    /**
     * 会员操作
     */
    public function vip()
    {
        $vip_time = (int)$this->request->param("vip_time", 0, 'strtotime');
        $is_vip = (int) $this->request->param("is_vip");
        if($is_vip == 1 && $vip_time < $this->request->time()){
            $this->warning();
        }
        if($is_vip == 0){
            $vip_time = 0;
        }
        $user_id = (int)$this->request->param("user_id");
        $UserModel = new UserModel();
        if (!$user = $UserModel->find($user_id)) {
            $this->warning();
        }
        if ($user->app_id != $this->appId) {
            $this->warning();
        }
        $UserModel->save([
            'plus_vip_time' => $vip_time
        ], ['user_id' => $user_id]);
    }

    /**
     * 锁定
     */
    public function lock()
    {
        $user_id = (int)$this->request->param("user_id");
        $UserModel = new UserModel();
        if (!$user = $UserModel->find($user_id)) {
            $this->warning('参数不正确');
        }
        if ($user->app_id != $this->appId) {
            $this->warning('参数不正确');
        }
        $UserModel->save([
            'is_lock' => $user->is_lock ^ 1
        ], ['user_id' => $user_id]);
    }



    /**
     *  设置上级
     */
    public function setpuser() {
        $user_id = (int) $this->request->param('user_id',0);
        $pid = (int) $this->request->param('pid',0);
        if ($user_id && $pid && ($user_id == $pid)) {
            $this->warning('参数不正确');
        }
        $UserModel = new UserModel();
        if (!$user = $UserModel->find($user_id)) {
            $this->warning('参数不正确');
        }
        if ($user->app_id != $this->appId) {
            $this->warning('参数不正确');
        }
        if ($user->pid) {
            $this->warning('用户已存在上级顾问，不可操作！');
        }
        if (!$puser = $UserModel->find($pid)) {
            $this->warning('顾问参数不正确');
        }
        if ($puser->app_id != $this->appId) {
            $this->warning('顾问参数不正确');
        }
        if (!$puser->agent_group || ($puser->agent_group && $puser->agent_lock == 1)) {
            $this->warning('顾问参数不正确');
        }
        $data = [
            'pid' => $pid,
            'pid2' => $puser->pid,
            'pid3' => $puser->pid2,
        ];
        $UserModel->isUpdate(true)->save($data,['user_id'=>$user_id]);
    }


}
