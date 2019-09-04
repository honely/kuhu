<?php

namespace app\website\controller\admin;
use app\common\library\token\AppToken;
use app\common\model\app\AppModel;
use think\Controller;
use app\common\model\manage\ManageModel;

class Passport extends Controller{

    public function login(){
        header('Access-Control-Allow-Origin:*');
        header('Access-Control-Allow-Methods:GET, POST, PUT');
        header('Access-Control-Allow-Headers:Origin, X-Requested-With, Content-Type,X-File-Name, Accept');
        header("Access-Control-Max-Age: 1728000");
        $manage_name = (string)$this->request->param("managename");
        $password = (string)$this->request->param("password");
        $ManageModel = new ManageModel();
        if (! $manage = $ManageModel->checkLogin($manage_name, $password)) {
            $this->result("", 400, $ManageModel->getError(), 'json');
        }
        $CodeAuth = new AppToken();
        $AppModel = new AppModel();
        if (!$app = $AppModel->find($manage->app_id)) {
            $this->result("", 400, "非法操作", "json");
        }
        if ($app->expire_time < time()) {
            $this->result("", 400, "该应用已过期", "json");
        }
        if ($app->app_type != 1) {
            $this->result("", 400, "此账号不属于该平台", "json");
        }
        $data = [
            'token' => $CodeAuth->getAppAuthCode($manage->app_id, $manage->manage_id),
            'app_name' => $app->app_name,
            'app_type' => $app->app_type,
            'auth' => ['setting', 'tongji'],
        ];
        $this->result($data, 200, "操作成功", "json");
    }
}
