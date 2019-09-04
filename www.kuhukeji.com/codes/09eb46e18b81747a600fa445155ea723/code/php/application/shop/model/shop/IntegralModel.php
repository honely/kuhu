<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;


class IntegralModel extends CommonModel{
    protected $pk = 'integral_id';
    protected $name = 'app_shop_user_integral';
    protected $insert = ['add_time', 'add_ip'];

    /**
     * 使用积分
     */
    public function useGold($userId, $num,$type,$appId){
        $userId = (int) $userId;
        $logNum = $num;
        if ($num <= 0) return false;
        $myNum = $this->getUsableGold($userId);
        if ($myNum < $num) return false;
        while (true) {
            $data = $this->where(['app_id'=>$appId,'user_id' => $userId,'surplus_num' => ['>', 0], 'expire_time' => ['>=', $_SERVER['REQUEST_TIME']]])->order(['expire_time' => 'asc'])->find();
            if (empty($data)) {
                break;
            }
            if ($data['surplus_num'] >= $num) {
                $data['surplus_num'] -= $num;
                $this->save(['surplus_num' => $data['surplus_num']], ['gold_id' => $data['gold_id']]);
                break;
            } else {
                $num -= $data['surplus_num'];
                $this->save(['surplus_num' => 0], ['gold_id' => $data['gold_id']]);
            }
            //多扣就多扣
            if ($num <= 0) break;
        }

        return true;

    }

    //增加积分
    public function addGold($appId,$userId,$totalNum,$type,$time = 0){
        if($time == 0){
            $time = request()->time() + 31536000 ;
        }
        $UserModel = new UserModel();
        $beishu = $UserModel->getGoldBei($userId);
        $totalNum = floor($totalNum * $beishu);
        $this->save([
            'app_id'  => $appId,
            'user_id'  => $userId,
            'total_num'  => $totalNum,
            'surplus_num'  => $totalNum,
            'expire_time'  => $time//一年
        ]);
        return true;
    }

    /**
     * 获得用户积分
     * @param  int $userId userID
     * @param  int $type   1获得总积分   2获得可以使用积分   3获得已过期积分
     * @return int|array  的时候返回 array
     */
    public function getUserGold($userId, $type){
        if ($type == 1) {
            return $this->getSumGold($userId);
        }
        if ($type == 2) {
            return $this->getUsableGold($userId);
        }
        if ($type == 3) {
            return $this->getNoUsableGold($userId);
        }
    }

    /**
     * 获得总积分
     */
    private function getSumGold($userId){
        $where = ['user_id' => $userId, 'total_num' => ['>', 0]];
        return $this->where($where)->sum("total_num");
    }

    /**
     * 获得可用积分
     */
    private function getUsableGold($userId)
    {
        $where = ['user_id' => $userId, 'surplus_num' => ['>', 0], 'expire_time' => ['>', time()]];
        return $this->where($where)->sum("surplus_num");
    }

    /**
     * 获得不可用积分
     */
    private function getNoUsableGold($userId)
    {
        $where = ['user_id' => $userId, 'surplus_num' => ['>', 0], 'expire_time' => ['<', time()]];
        return $this->where($where)->sum("surplus_num");
    }

}
