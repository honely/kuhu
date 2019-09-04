<?php
namespace app\shop\controller\admin\agent;

use app\shop\controller\admin\Common;
use app\shop\model\shop\AgentSettingModel;

class Setting extends Common
{
    public function detail(){
        $AgentSettingModel = new  AgentSettingModel();
        $detail = $AgentSettingModel->detail($this->appId);
        $this->datas['detail'] =[
            'ordinary_num'      => $detail['ordinary_num'], //一般就是0
            'ordinary_register' => $detail['ordinary_register'],
            'ordinary_order'    => $detail['ordinary_order'],
            'ordinary_vip'      => $detail['ordinary_vip'],
            'ordinary_rate'     => moneyFormat($detail['ordinary_rate']), //百分之几
            'ordinary_plus'   => moneyFormat($detail['ordinary_plus']),
            'ordinary_child_rate'     => moneyFormat($detail['ordinary_child_rate']), //百分之几
            'ordinary_child_plus'   => moneyFormat($detail['ordinary_child_plus']),

            'senior_num'        => $detail['senior_num'],
            'senior_register'   => $detail['senior_register'],
            'senior_order'      => $detail['senior_order'],
            'senior_vip'        => $detail['senior_vip'],
            'senior_rate'       => moneyFormat($detail['senior_rate']),//百分之几
            'senior_plus'        =>  moneyFormat($detail['senior_plus']),
            'senior_child_rate'  => moneyFormat($detail['senior_child_rate']), //百分之几
            'senior_child_plus' =>  moneyFormat($detail['senior_child_plus']),


            'expert_num'        => $detail['expert_num'],
            'expert_register'   => $detail['expert_register'],
            'expert_order'      => $detail['expert_order'],
            'expert_vip'      => $detail['expert_vip'],
            'expert_rate'       => moneyFormat( $detail['expert_rate']),//百分之几
            'expert_plus'        => moneyFormat($detail['expert_plus']),
            'expert_child_rate'  => moneyFormat($detail['expert_child_rate']), //百分之几
            'expert_child_plus' => moneyFormat($detail['expert_child_plus']),

        ];
    }

    public function save(){
        $datas = $this->request->param('datas/a');
        $save = [
            'ordinary_num' => isset($datas['ordinary_num']) ? (int)$datas['ordinary_num'] : 0,
            'ordinary_register' => isset($datas['ordinary_register']) ? (int)$datas['ordinary_register'] : 0,
            'ordinary_order' => isset($datas['ordinary_order']) ? (int)$datas['ordinary_order'] : 0,
            'ordinary_vip' => isset($datas['ordinary_vip']) ? (int)$datas['ordinary_vip'] : 0,
            'ordinary_rate' => isset($datas['ordinary_rate']) ? moneyToInt($datas['ordinary_rate']) : 0,
            'ordinary_plus' => isset($datas['ordinary_plus']) ? moneyToInt($datas['ordinary_plus']) : 0,
            'ordinary_child_rate'   => isset($datas['ordinary_child_rate']) ? moneyToInt($datas['ordinary_child_rate']) : 0,
            'ordinary_child_plus' => isset($datas['ordinary_child_plus']) ? moneyToInt($datas['ordinary_child_plus']) : 0,

            'senior_num' => isset($datas['senior_num']) ? (int)$datas['senior_num'] : 0,
            'senior_register' => isset($datas['senior_register']) ? (int)$datas['senior_register'] : 0,
            'senior_order' => isset($datas['senior_order']) ? (int)$datas['senior_order'] : 0,
            'senior_vip' => isset($datas['senior_vip']) ? (int)$datas['senior_vip'] : 0,
            'senior_rate' => isset($datas['senior_rate']) ? moneyToInt($datas['senior_rate']) : 0,
            'senior_plus' => isset($datas['senior_plus']) ? moneyToInt($datas['senior_plus']) : 0,
            'senior_child_rate' => isset($datas['senior_child_rate']) ? moneyToInt($datas['senior_child_rate']) : 0,
            'senior_child_plus' => isset($datas['senior_child_plus']) ? moneyToInt($datas['senior_child_plus']) : 0,


            'expert_num' => isset($datas['expert_num']) ? (int)$datas['expert_num'] : 0,
            'expert_register' => isset($datas['expert_register']) ? (int)$datas['expert_register'] : 0,
            'expert_order' => isset($datas['expert_order']) ? (int)$datas['expert_order'] : 0,
            'expert_vip' => isset($datas['expert_vip']) ? (int)$datas['expert_vip'] : 0,
            'expert_rate' => isset($datas['expert_rate']) ? moneyToInt($datas['expert_rate']) : 0,
            'expert_plus' => isset($datas['expert_plus']) ? moneyToInt($datas['expert_plus']) : 0,
            'expert_child_rate' => isset($datas['expert_child_rate']) ? moneyToInt($datas['expert_child_rate']) : 0,
            'expert_child_plus' => isset($datas['expert_child_plus']) ? moneyToInt($datas['expert_child_plus']) : 0,
        ];

        $AgentSettingModel = new  AgentSettingModel();
        $AgentSettingModel->save($save,['app_id'=> $this->appId]);
    }



    public function getApplyJunior() {
        $AgentSettingModel = new  AgentSettingModel();
        $detail = $AgentSettingModel->detail($this->appId);
        $agent_junior_setting_old = getMean('agent_junior_setting');
        $agent_apply_audit_setting_old =  getMean('agent_apply_audit_setting');

        $agent_junior_setting = $agent_apply_audit = [];
        foreach ($agent_junior_setting_old as $key=>$val) {
            $agent_junior_setting[] = [
                'name' => $val,
                'id' => $key,
            ];
        }
        foreach ($agent_apply_audit_setting_old as $key=>$val) {
            $agent_apply_audit[] = [
                'name' => $val,
                'id' => $key,
            ];
        }

        $this->datas =[
            'agent_apply_audit' => $agent_apply_audit,
            'agent_junior' => $agent_junior_setting,
            'condition'      => $detail['condition'],
            'shopping_num' => $detail['shopping_num'],
            'shopping_money'    => moneyFormat($detail['shopping_money']),
            'junior'      => $detail['junior'],
        ];
    }



    public function setApplyJunior() {
        $save['condition'] = (int) $this->request->param('condition',1);
        $save['shopping_num'] = (int) $this->request->param('shopping_num',1);
        $save['shopping_money'] = moneyToInt($this->request->param('shopping_money',0));
        $save['junior'] = (int) $this->request->param('junior',1);
        $AgentSettingModel = new  AgentSettingModel();
        $AgentSettingModel->save($save,['app_id'=> $this->appId]);
    }
}
