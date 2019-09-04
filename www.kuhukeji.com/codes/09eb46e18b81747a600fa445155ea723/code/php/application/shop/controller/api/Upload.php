<?php

namespace app\shop\controller\api;

use app\common\logic\upload\UploadCommon;
use app\common\model\resource\AppResourceModel;
use think\Image;

/**
 * 上传入口
 */
class Upload extends Common
{
    public $imgUrl = "";

    //服务器图片根目录
    protected $RootPath = "./cdn/image";

    public function _initialize()
    {
        header('Access-Control-Allow-Origin:*');
        header('Access-Control-Allow-Methods:GET, POST, PUT');
        header('Access-Control-Allow-Headers:Origin, X-Requested-With, Content-Type,X-File-Name, Accept');
        header("Access-Control-Max-Age: 1728000");
        $this->imgUrl = "https://" + $_SERVER['HTTP_HOST'];
    }

    /**
     *
     */
    public function imageUpload()
    {

        $file = request()->file('file');
        if ($file == null) {
            $this->warning("请上传图片");
        }
        $UploadCommon = new UploadCommon();
        $res = $UploadCommon->upload();
        if ($res == false) {
            $this->warning("系统错误");
        }
        $datas['img_url'] = $res['photo'];
        $this->datas = $datas;
    }

}
