<?php
namespace app\shop\controller\admin;
use app\common\library\token\AppToken;
use app\common\model\app\AppModel;
use app\common\statuscode\ApiCode;
use think\Controller;

class  Common  extends   Controller{
    protected $code  = 200;
    protected $datas = [];
    protected $msg = "OK";
    protected $isReturn = false;
    protected $page;
    protected $limit = 10;
    protected $appId;
    protected $manageId;
    protected $app;
    protected $default_seo = ['title' => '', 'keywords' => '', 'description' => '', 'releaseDate' => '', 'image' => []];



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
        $token = (string) $this->request->param("appToken");
        $CodeAuth = new AppToken();
        $res = $CodeAuth->getAppAuthDeCode($token);
        if($res == false){
            return false;
        }
        $appId =  (int) $res['app_id'];
        if(!$app  = AppModel::get($appId)){
            return false;
        };
        $this->app = $app;
        $this->manageId = $res['manage_id'];
        $this->appId = $appId;
    }


    /**
     * 警告信息返回400code
     * @param string $msg  错误信息
     * @return void
     */
    protected function warning($msg = '非法操作'){
        $this->code = ApiCode::WARNING;
        $this->msg = $msg;
        $this->btt();
    }

    /*
     *数据返回
     */
    protected function btt(){
        $this->isReturn = true;
//        $return = [
//            ''
//        ];
//        echoTxt("sadasdas";
        $this->result($this->datas,  $this->code,  $this->msg,'json');
//        );
    }

    public function __destruct() {
        if(!$this->isReturn){
            $this->btt();
        }
    }

}
