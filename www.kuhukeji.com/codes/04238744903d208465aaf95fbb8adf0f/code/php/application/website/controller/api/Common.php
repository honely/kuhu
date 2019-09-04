<?php
namespace app\website\controller\api;

use app\common\library\token\ApiToken;
use app\website\library\MiniAppToken;
use app\common\statuscode\ApiCode;
use app\website\logic\CallData;
use think\Controller;

class Common extends Controller {
    protected $code  = 200;
    protected $datas = [];
    protected $msg = "OK";
    protected $isReturn = false;
    protected $appId = 0;
    protected $userId = 0;
    protected $openId;
    protected $device; //设备号
    protected $page;
    protected $limit = 10;

    public function _initialize() {
        header('Access-Control-Allow-Origin:*');
        header('Access-Control-Allow-Methods:GET, POST, PUT');
        header('Access-Control-Allow-Headers:Origin, X-Requested-With, Content-Type,X-File-Name, Accept');
        header("Access-Control-Max-Age: 1728000");
        $this->page = (int) $this->request->param('page',1);
        $this->limit =(int) $this->request->param('limit',10);
        $this->checkApp();
    }


    protected function checkApp(){
        $token =  $this->request->param('token');
        $MiniAppToken = new ApiToken();
        $app =  $MiniAppToken->getAuthDeCodeToken($token);
        if($app == false){
            $this->warning("系统错误请联系管理员");
        }
        if($app['expire_time'] < $this->request->time()){
            $this->warning("程序已过期");
        }
        $this->device = $app['device'];
        $this->appId = $app['app_id'];
    }

    /*
     *自定义code msg  datas
     */
    protected function custom($datas= [],$code = 200,$msg=''){
        $this->datas = $datas;
        $this->code  = $code;
        $this->msg = $msg;
        $this->btt();
    }

    /**
     *警告
     */
    protected function warning($msg = '操作错误'){
        $this->code = ApiCode::WARNING;
        $this->msg = $msg;
        $this->datas = [];
        $this->btt();
    }

    /**
     *警告
     */
    protected function noPage($msg = '该页面天恋爱去了'){
        $this->code = ApiCode::NOPAGE;
        $this->msg = $msg;
        $this->btt();
    }

    /**
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
