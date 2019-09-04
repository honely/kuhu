<?php
namespace app\shop\model\shop;
use app\shop\logic\shop\user\AgentLogic;
use app\shop\model\CommonModel;

class  AgentApplyModel extends CommonModel{
    protected $pk = 'apply_id';
    protected $name = 'app_shop_agent_apply';
    protected $insert = ["add_time", "add_ip"];

    public function userExists($keyword){
        $keyword = addslashes($keyword);
        if(empty($keyword)) return $this;
        $this->whereExists(" select 1 from  `".config('database.prefix')."app_shop_user` where  (nickname like '%".$keyword."%' )   AND  `".config('database.prefix')."app_shop_user`.user_id = `".config('database.prefix')."app_shop_user_agent_apply`.user_id ");
        return $this;
    }



}
