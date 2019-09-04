<?php
namespace app\admin\controller;

use app\common\model\admin\AdminModel;
use think\Controller;

use app\common\library\AppInstall;
class Passport extends Controller {

    /**
     * 总后台管理员登录
     * @param $password string 管理员用户名
     * @param $username string 管理员密码
     */
    public function login(){
        var_dump(123123);
        exit;
     header('Access-Control-Allow-Origin:*');
     header('Access-Control-Allow-Methods:GET, POST, PUT');
     header('Access-Control-Allow-Headers:Origin, X-Requested-With, Content-Type,X-File-Name, Accept');
     header("Access-Control-Max-Age: 1728000");
      $username = (string) $this->request->param("username");
      $password = (string) $this->request->param("password");
       $AdminModel = new AdminModel();
       $res = $AdminModel->checkLogin($username,$password);
       if($res === false){
           $this->result('',400,$AdminModel->getError(),'json');
       }
        $this->result($res,200,'ok','json');
    }

    public function checkInstall(){
        $wyu_token = $this->request->param('wyu_token');
        $app_id = $this->request->param('app_id');
        $AppInstall = new AppInstall();
        if($AppInstall->checkInstall($app_id)){
            die($wyu_token); //正确的返回
        }
        die('NO ACCESS');
    }
}
