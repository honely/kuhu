<?php

namespace app\shop\controller\admin\user;


use app\shop\model\shop\AddressModel;
use app\shop\model\shop\RegionModel;
use app\shop\model\shop\UserModel;
use app\shop\controller\admin\Common;

class Address extends Common
{

    public function add()
    {
        $data = $this->request->param('datas/a');
        if (empty($data['mobile'])) {
            $this->warning('请填写正确的手机号码');
        }
        if (!isMobile($data['mobile'])) {
            $this->warning('请填写正确的手机号码');
        }
        $isHas = UserModel::where(['app_id' => $this->appId, 'mobile' => $data['mobile']])->count();
        if ($isHas) {
            $this->warning('手机号已经存在');
        }
        if (empty($data['face'])) {
            $this->warning('用户头像不能为空');
        }
        if (empty($data['nickname'])) {
            $this->warning('用户昵称不能为空');
        }
        $save = [
            'app_id' => $this->appId,
            'open_id' => empty($data['open_id']) ? '' : $data['open_id'],
            'is_lock' => empty($data['is_lock']) ? 0 : 1,
            'mobile' => $data['mobile'],
            'password' => '',//不设置密码手机上以短信验证登录,
            'face' => $data['face'],
            'nickname' => $data['nickname'],
            'reg_time' => $_SERVER['REQUEST_TIME'],
            'reg_ip' => $this->request->ip(),
        ];
        $UserModel = new UserModel();
        $UserModel->save($save);
    }


    public function edit()
    {
        $user_id = (int)$this->request->param('user_id');
        $UserModel = new UserModel();
        if (!$detail = $UserModel->get($user_id)) {
            $this->warning('用户不存在');
        }
        if ($detail['app_id'] != $this->appId) {
            $this->warning('用户不存在');
        }
        $data = $this->request->param('datas/a');
        if (empty($data['face'])) {
            $this->warning('用户头像不能为空');
        }
        if (empty($data['nickname'])) {
            $this->warning('用户昵称不能为空');
        }
        $data['is_lock'] = (int)$this->request->param('is_lock');
        $data['is_manage'] = (int)$this->request->param('is_manage');
        $save = [
            'open_id' => empty($data['open_id']) ? '' : $data['open_id'],
            'is_lock' => $data['is_lock'],
            'is_manage' => $data['is_manage'],
            'face' => $data['face'],
            'nickname' => $data['nickname'],
        ];
        $UserModel->save($save, ['user_id' => $user_id]);
    }


    public function detail()
    {
        $user_id = (int)$this->request->param('user_id');
        $UserModel = new UserModel();
        if (!$detail = $UserModel->get($user_id)) {
            $this->warning('用户不存在');
        }
        if ($detail['app_id'] != $this->appId) {
            $this->warning('用户不存在');
        }

        $userIds = [];
        if (!empty($detail->pid)) {
            $userIds[] = $detail->pid;
        }
        if (!empty($detail->pid2)) {
            $userIds[] = $detail->pid2;
        }
        if (!empty($detail->pid3)) {
            $userIds[] = $detail->pid3;
        }
        $userlist = [];
        if (!empty($userIds)) {
            $userlist = $UserModel->itemsByIds($userIds);
        }


        //查询游币
//        $GoldModel = new GoldModel();
//        $where = [
//            'app_id' => $this->appId,
//            'user_id' => $user_id,
//        ];
//        $gold = $GoldModel->where($where)->where('expire_time', '>=', time())->sum('surplus_num');
//
//        //查询可用优惠券
//        $couponWhere = [
//            'is_used' => 0,
//            'expire_time' => ['>', time()],
//        ];
//        $UserCouponModel = new UserCouponModel();
//        $coupon = $couponTmp = $UserCouponModel->where($where)->where($couponWhere)->count();
        $agentGroup = getMean('agent_group');

        $this->datas['detail'] = [
            'user_id' => $user_id,
            'mobile' => $detail->mobile,
            'open_id' => $detail->open_id,
            'is_lock' => $detail->is_lock,
            'is_manage' => $detail->is_manage,
            'face' => $detail->face,
            'nickname' => $detail->nickname,
            'money' => round($detail->money / 100, 2),
//            'gold' => $gold,
//            'coupon' => $coupon,
            'vip' => (int)$detail->vip,
            'vip_time' => empty($detail->vip_time) ? '-' : date('Y-m-d H:i:s', $detail->vip_time),
            'exemption_num' => (int)$detail->exemption_num,
            'agent_group' => $detail->agent_group,
            'agent_group_mean' => isset($agentGroup[$detail->agent_group]) ? $agentGroup[$detail->agent_group] : '未开通',
            'agent_rate' => round($detail->agent_rate / 10, 1),
            'order_num' => (int)$detail->order_num,
            'agent_num' => (int)$detail->agent_num,
            'agent_register' => (int)$detail->agent_register,
            'agent_order' => (int)$detail->agent_order,
            'agent_vip' => (int)$detail->agent_vip,
            'reg_time' => empty($detail->reg_time) ? '-' : date('Y-m-d H:i:s', $detail->reg_time),
            'last_time' => empty($detail->last_time) ? '-' : date('Y-m-d H:i:s', $detail->last_time),
            'pid' => isset($userlist[$detail->pid]) ? $userlist[$detail->pid]['mobile'] . '(' . $userlist[$detail->pid]['nickname'] . ')' : '-',
            'pid2' => isset($userlist[$detail->pid2]) ? $userlist[$detail->pid2]['mobile'] . '(' . $userlist[$detail->pid2]['nickname'] . ')' : '-',
            'pid3' => isset($userlist[$detail->pid3]) ? $userlist[$detail->pid3]['mobile'] . '(' . $userlist[$detail->pid3]['nickname'] . ')' : '-',
        ];

    }


    /**
     * 获取用户列表
     */
    public function getAddressList()
    {
        $user_id = (int) $this->request->param('user_id',0);
        if (!$user_id) {
            $this->warning('参数不正确');
        }
        $AddressModel = new AddressModel();
        $where = [
            'app_id' => $this->appId,
            'user_id' => $user_id,
        ];

        $listTmp = $AddressModel->where($where)->page($this->page, $this->limit)->select();
        $count = $AddressModel->where($where)->count();
        $list = $areaIds = [];
        foreach ($listTmp as $v) {
            $areaIds[$v->province_id] = $v->province_id;
            $areaIds[$v->city_id] = $v->city_id;
            $areaIds[$v->division_id] = $v->division_id;
            $areaIds[$v->street_id] = $v->street_id;
        }
        $areaIds = empty($areaIds) ? '' : $areaIds;
        $RegionModel = new RegionModel();
        $areas = $RegionModel->itemsByIds($areaIds);
        foreach ($listTmp as $val) {
            $list[] = [
                'address_id' => $val->address_id,
                'address' => (string)$val->address,
                'lat' => (string)$val->lat,
                'lng' => (string)$val->lng,
                'is_default' => (int)$val->is_default,
                'name' => (string)$val->name,
                'mobile' => (string)$val->mobile,
                'address_desc' => (string)$val->address_desc,
                'province' => isset($areas[$val->province_id]) ? $areas[$val->province_id]['name'] : '--',
                'city' => isset($areas[$val->city_id]) ? $areas[$val->city_id]['name'] : '--',
                'division' => isset($areas[$val->division_id]) ? $areas[$val->division_id]['name'] : '--',
                'street' => isset($areas[$val->street_id]) ? $areas[$val->street_id]['name'] : '--',
            ];
        }
        $this->datas = [
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }



}
