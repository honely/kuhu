<?php
namespace app\make\controller;

use think\Controller;
use app\common\statuscode\ApiCode;

class Common extends Controller {

    protected $code  = 200;
    protected $datas = [];
    protected $msg = "OK";
    protected $isReturn = false;

    public function _initialize()
    {
        parent::_initialize();
        header('Access-Control-Allow-Origin:*');
        header('Access-Control-Allow-Methods:GET, POST, PUT');
        header('Access-Control-Allow-Headers:Origin, X-Requested-With, Content-Type,X-File-Name, Accept');
        header("Access-Control-Max-Age: 1728000");
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