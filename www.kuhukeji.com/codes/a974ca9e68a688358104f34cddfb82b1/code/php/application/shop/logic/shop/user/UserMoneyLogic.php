<?php

namespace app\shop\logic\shop\user;

use app\shop\model\shop\UserModel;
use app\shop\model\shop\UserMoneyLogModel;
use think\Exception;


class UserMoneyLogic
{

    private $user;
    private $appId;
    private $UserMoneyLogModel;
    private $userMoney;


    public function __construct($userId)
    {
        $this->userId = $userId;
        $UserModel = new UserModel();
        if (!$user = $UserModel->find($userId)) {
            throw new Exception("用户不存在！");
        }
        $UserMoneyLogModel = new UserMoneyLogModel();
        $this->user = $user;
        $this->appId = $user->app_id;
        $this->UserMoneyLogModel = $UserMoneyLogModel;
    }


    public function getUserMoney () {
        if ($this->userMoney) {
            return $this->userMoney;
        } else {
            $where = [
                'user_id' => $this->userId,
                'get_type' => 1,
            ];
            $reduce_where = [
                'user_id' => $this->userId,
                'get_type' => ['>',10],
            ];
            $this->userMoney = $this->UserMoneyLogModel->where($where)->sum('money') - $this->UserMoneyLogModel->where($reduce_where)->sum('money');
            return $this->userMoney;
        }
    }

//不要用这个    用UserModel里面的
//    public function changeUserMoney($money,$type,$order_id=0) {
//        $data = [
//            'user_id' => $this->userId,
//            'app_id' => $this->user->app_id,
//            'money' => $money,
//            'type' => $type,
//            'order_id' => $order_id,
//        ];
//        $UserModel = new UserModel();
//        $this->getUserMoney();
//        if ($type <= 10) {   //充值
//            //入账不需要考虑   直接充
//            $data['get_type'] = 1;
//            $data['total_user_money'] = $this->userMoney + $money;
//            $UserModel->where(['user_id'=>$this->userId])->setInc('money',$money);
//        } elseif ($type > 10 && $type <= 20) {  //消费
//            //先获得用户账户余额
//            if ($money > $this->userMoney) {
//                throw new Exception("'消费/提现金额大于余额！");
//            }
//            $data['get_type'] = 2;
//            $data['total_user_money'] = $this->userMoney - $money;
//            $UserModel->where(['user_id'=>$this->userId])->setDec('money',$money);
//        }
//
//        $this->UserMoneyLogModel->save($data);
//    }

}


