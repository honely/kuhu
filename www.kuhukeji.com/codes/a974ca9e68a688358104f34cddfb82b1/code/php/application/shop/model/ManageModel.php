<?php
namespace app\shop\model;

use app\shop\model\CommonModel;

class ManageModel extends CommonModel
{
    protected $pk = 'manage_id';
    protected $name = 'app_manage';
    protected $insert = ["add_time","app_ip"];

    protected $rules = [
        ['manage_name','require|max:20','请输入账号|账号最多不能超过20个字符'],
        ['password','require|max:32','请输入密码|密码最多不能超过32个字符'],
        ['remark','require|max:255','请输入备注|备注最多不能超过255个字符'],
        ['is_lock','require|number','请输入是否锁定|是否锁定必须是数字'],
    ];


    public function dataFilter($appId){
        $request = request();
        $param = [
            "app_id" => (int)$appId,
            "manage_name" => (string) $request->param("manage_name",""),//账号
            "password" => (string) $request->param("password","",'md5'),//密码
            "remark" => (string) $request->param("remark",""),//备注
            "is_lock" => (int) ($request->param("is_lock","0") == 1),//是否锁定
        ];
        return $param;
    }


    /**
     * 检查管理员是否存在
     * @param string $anageName 管理员账号名称
     * @return array|false|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
     public function checkManage( $manageName){
        return $this->where("manage_name",$manageName)->find();
     }




    /**
     * 验证登录
     * @param string $manageName
     * @param string $password
     * @return bool
     */
    public  function checkLogin( $manageName, $password){
       if(!$manage = $this->checkManage($manageName)){
           $this->error = "用户名或密码错误";
           return false;
       }
       if($manage->password != md5($password) ){
           $this->error = "用户名或密码错误";
           return false;
       }
       if($manage->is_lock == 1){
           $this->error = "账号已锁定";
           return false;
       }
       $this->save([
        'last_time' => request()->time(),
        'last_ip'  => request()->ip(),
       ],['manage_id'=>$manage->manage_id]);
       return $manage;
    }


}
