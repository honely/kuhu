<?php

namespace app\shop\controller\admin;

use app\common\logic\upload\UploadCommon;
use app\common\model\resource\AppResourceModel;
use think\Exception;
use think\Image;
use think\Request;

/**
 * 上传入口
 */
class Upload extends Common
{

    public $imgUrl = "";


    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $this->imgUrl = "https://" . $_SERVER['HTTP_HOST'];
    }

    //服务器图片根目录
    protected $RootPath = "./cdn/image";

    public function videoUpload()
    {
        $file = request()->file('file');
        if ($file == null) {
            $this->result("", 400, "请选择视频", 'json');
        }
        // 移动到框架应用根目录/public/uploads/ 目录下
        $dir = "./cdn/video/";
        $info = $file->validate(['size' => 5000000, 'ext' => 'mp4'])->move($dir);
        if ($info) {
            $data = $info->getInfo();
            $img = $info->getSaveName();
            $datas = [
                'video_url' => $this->imgUrl . "/cdn/video/" . getImg($img),
            ];
            $this->result($datas, 200, "上传成功", 'json');
        } else {
            $this->result("", 400, "请选择视频", 'json');
        }
    }


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
        $groupId = (int)request()->param("groupId");
        $ResourceModel = new AppResourceModel();
        $ResourceModel->save([
            'category_id' => $groupId,
            'app_id' => (int)$this->appId,
            'photo' => $res['photo'],
            'size' => $res['size'],
            'title' => $res['title'],
            'w' => $res['w'],
            'h' => $res['h'],
        ]);
        $datas['img_url'] = $res['photo'];
        $this->datas = $datas;

    }


    public function imageUploadAll()
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
        $groupId = (int)request()->param("groupId");
        $ResourceModel = new AppResourceModel();
        $ResourceModel->save([
            'category_id' => $groupId,
            'app_id' => (int)$this->appId,
            'photo' => $res['photo'],
            'size' => $res['size'],
            'title' => $res['title'],
            'w' => $res['w'],
            'h' => $res['h'],
        ]);
        $datas['img_url'] = $res['photo'];
        $this->datas = $datas;
    }

}

