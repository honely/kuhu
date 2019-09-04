<?php
namespace app\admin\controller\admin;
use app\admin\controller\Common;
use app\common\model\admin\RoleModel;

class Role  extends Common{

     public function _initialize(){
         parent::_initialize();
         $role_id = (int) $this->request->param("role_id");
         if($role_id == 1){
             $this->warning("当前角色不可操作");
         }
     }

    public function create(){
        $RoleModel = new RoleModel();
        $res = $RoleModel->setData($RoleModel->dataFilter());
        if ($res == false) {
            $this->warning($RoleModel->getError());
        }
    }

    public function edit(){
        $role_id = (int) $this->request->param("role_id");
        $RoleModel = new RoleModel();
        if (!$detail = $RoleModel->find($role_id)) {
            $this->warning("不存在数据");
        }
        $res = $RoleModel->setData($RoleModel->dataFilter(),  $role_id);
        if ($res == false) {
            $this->warning($RoleModel->getError());
        }
    }

    public function delete(){
        $role_id = (int) $this->request->param("role_id");
        $RoleModel = new RoleModel();
        if (!$detail = $RoleModel->find($role_id)) {
            $this->warning("不存在数据");
        }
        $RoleModel->where("role_id",   $role_id)->delete();
    }

    public function detail() {
        $role_id = (int) $this->request->param("role_id");
        $RoleModel = new  RoleModel();
        if (!$detail = $RoleModel->find($role_id)) {
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [

            'role_id'  =>  $detail->role_id,
            'role_name'  =>  $detail->role_name,

        ];
    }

    public function index(){
        $RoleModel = new RoleModel();
        $where = [];


        $role_name = (string) $this->request->param("role_name");
        if(!empty($role_name)){
            $where["role_name"] = ["LIKE","%{$role_name}%"];
        }
        $list = $RoleModel->where($where)->order("role_id desc")->page($this->page, $this->limit)->select();
        $count = $RoleModel->where($where)->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [

            'role_id'  =>  $val->role_id,
            'role_name'  =>  $val->role_name,

            ];
        }
        $this->datas = [
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }

}
