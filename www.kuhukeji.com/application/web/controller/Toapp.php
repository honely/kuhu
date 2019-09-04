<?php

namespace app\web\controller;

use app\common\library\token\AppToken;
use app\common\model\app\AppModel;
use think\Controller;

class Toapp extends Controller
{


    /**
     * 登录小程序
     */
    public function loginApp(){
        header('Access-Control-Allow-Origin:*');
        header('Access-Control-Allow-Methods:GET, POST, PUT');
        header('Access-Control-Allow-Headers:Origin, X-Requested-With, Content-Type,X-File-Name, Accept');
        header("Access-Control-Max-Age: 1728000");

        $id = (int)$this->request->param("appid");
        $token = (string)$this->request->param("token");

        if (empty($id) || empty($token)) {
            $this->result("", 400, "非法操作", "json");
        }
        $CodeAuth = new AppToken();

        $memberCode = $CodeAuth->getMemberAuthDeCode($token);
        if ($memberCode == false) {
            $this->result("", 400, "非法操作#1", "json");
        }

        $AppModel = new AppModel();
        if (!$app = $AppModel->find($id)) {
            $this->result("", 400, "非法操作#2", "json");
        }
        if ($app->expire_time < time()) {
            $this->result("", 400, "该应用已过期", "json");
        }
        $data = [
            'token' => $CodeAuth->getAppAuthCode($id,0),
            'app_name' => $app->app_name,
            'app_type' => $app->app_type,
            'auth'  => ['setting','tongji'],
        ];
        $this->result($data, 200, "操作成功", "json");


    }


}
