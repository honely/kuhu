<?php
namespace app\common\model\admin;
use app\common\model\CommonModel;

class RoleModel extends CommonModel
{
    protected $pk = 'role_id';
    protected $name = 'admin_role';


    protected $rules = [
     ['role_name','require|max:64','请输入角色名称|角色名称最多不能超过64个字符'],
    ];


    public function dataFilter(){
        $request = request();
        $param = [
            "role_name" => (string) $request->param("role_name",""),//角色名称
        ];
        return $param;
    }


}
