<?php

namespace app\admin\controller;
use app\common\library\token\AdminToken;
use app\common\statuscode\ApiCode;
use think\Controller;
use app\common\model\admin\AdminModel;

class  Common  extends   Controller{
    protected $code  = 200;
    protected $datas = [];
    protected $msg = "OK";
    protected $isReturn = false;
    protected $page;
    protected $limit = 10;

    protected $admin = [];
    protected $adminId = 0;
    public function _initialize() {
        header('Access-Control-Allow-Origin:*');
        header('Access-Control-Allow-Methods:GET, POST, PUT');
        header('Access-Control-Allow-Headers:Origin, X-Requested-With, Content-Type,X-File-Name, Accept');
        header("Access-Control-Max-Age: 1728000");
        $this->page = (int) $this->request->param('page',1);
        $this->limit =(int) $this->request->param('limit',10);
        $res =  $this->checkLogin();
        if($res === false){
            $this->code = 100;
            $this->msg = "未登录";
            $this->btt();
        }
    }


    protected function checkLogin(){
        $token = (string) $this->request->param("token");
        $CodeAuth = new AdminToken();
        $res = $CodeAuth->getAdminAuthDeCodeToken($token);
        if($res == false){
             return false;
        }
        $adminId =  (int) $res['admin_id'];
        $AdminModel = new AdminModel();
        if(!$admin = $AdminModel->find($adminId)){
           return false;
        }
        if($admin->admin_id != 1 && $admin->is_delete == 1){
              return false;
        }
        $this->admin = $admin;
        $this->adminId = $adminId;
    }


   /**
    * 警告信息返回400code
    * @param string $msg  错误信息
    * @return void
    */
    protected function warning($msg = '操作错误'){
        $this->code = ApiCode::WARNING;
        $this->msg = $msg;
        $this->btt();
    }

    /*
     *数据返回
     */
    protected function btt(){
        $this->isReturn = true;
        $this->result($this->datas,  $this->code,  $this->msg,'json');
    }

    public function __destruct() {
        if(!$this->isReturn){
            $this->btt();
        }
    }

}
