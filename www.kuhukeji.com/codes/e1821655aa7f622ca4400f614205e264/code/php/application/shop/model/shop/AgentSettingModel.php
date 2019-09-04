<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class  AgentSettingModel extends CommonModel
{
    protected $pk = 'app_id';
    protected $name = 'app_shop_agent_setting';


    public function detail($app_id)
    {
        $app_id = (int)$app_id;
        $datas = $this->get($app_id);
        if (empty($datas)) {
            $return = [
                'app_id' => $app_id,

                'ordinary_num' => 0, //推广的顾问
                'ordinary_register' => 0,//推广注册用户
                'ordinary_order' => 0, //推广的订单数
                'ordinary_vip' => 0, //推广的VIP数量
                'ordinary_rate' => 2, //百分之几 提成
                'ordinary_plus' => 200, //开卡提成
                'ordinary_child_rate' => 100,//所有子顾问推广的提成
                'ordinary_child_plus' => 100, //开铜卡提成

                'senior_num' => 20,
                'senior_register' => 50,
                'senior_order' => 20,
                'senior_vip' => 20,
                'senior_rate' => 3,//百分之几
                'senior_plus' => 300,//开通铜卡提成
                'senior_child_rate' => 150,//所有子顾问推广的提成
                'senior_child_plus' => 150, //所有子顾问推广的

                'expert_num' => 50,
                'expert_register' => 100,
                'expert_order' => 50,
                'expert_vip' => 50,
                'expert_rate' => 4,//百分之几
                'expert_plus' => 400,//开通铜卡提成
                'expert_child_rate' => 400,//所有子顾问推广的提成
                'expert_child_plus' => 400, //所有子顾问推广的

            ];
            $this->isUpdate(false)->save($return);
            return $return;
        } else {
            return $datas;
        }
    }

    public function FormatData($appId)
    {
        $data = $this->detail($appId);
        return [
            1 => [
                'num' => $data['ordinary_num'],
                'register' => $data['ordinary_register'],
                'order' => $data['ordinary_order'],
                'vip' => $data['ordinary_vip'],
                'rate' => $data['ordinary_rate'],
                'plus' => $data['ordinary_plus'],
                'child_rate' => $data['ordinary_child_rate'],
                'child_plus' => $data['ordinary_child_plus'],
            ],
            2 => [
                'num' => $data['senior_num'],
                'register' => $data['senior_register'],
                'order' => $data['senior_order'],
                'vip' => $data['senior_vip'],
                'rate' => $data['senior_rate'],
                'plus' => $data['senior_plus'],
                'child_rate' => $data['senior_child_rate'],
                'child_plus' => $data['senior_child_plus'],
            ],
            3 => [
                'num' => $data['expert_num'],
                'register' => $data['expert_register'],
                'order' => $data['expert_order'],
                'vip' => $data['expert_vip'],
                'rate' => $data['expert_rate'],
                'plus' => $data['expert_plus'],
                'child_rate' => $data['expert_child_rate'],
                'child_plus' => $data['expert_child_plus'],
            ],

        ];
    }


    /*
     *根据分组获得 提提成率
     */
    public function getRate($appId, $agentGroup)
    {
        $detail = $this->detail($appId);
        switch ($agentGroup) {
            case 1:
                return $detail["ordinary_rate"];
                break;
            case 2:
                return $detail["senior_rate"];
                break;
            case 3:
                return $detail["expert_rate"];
                break;
        }
    }


}
