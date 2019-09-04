<?php

namespace app\admin\controller;

use app\common\model\resource\ResourceModel;
use think\Controller;
use think\Image;

/**
 * 上传入口
 */
class Upload extends Controller
{

    //服务器图片根目录
    protected $RootPath = "./cdn/image";
    protected $imgUrl;
    public function _initialize(){
        header('Access-Control-Allow-Origin:*');
        header('Access-Control-Allow-Methods:GET, POST, PUT');
        header('Access-Control-Allow-Headers:Origin, X-Requested-With, Content-Type,X-File-Name, Accept');
        header("Access-Control-Max-Age: 1728000");
         $this->imgUrl = "https://" . $_SERVER['HTTP_HOST'];
    }


    public function videoUpload(){
        $file = request()->file('file');
        if($file == null){
            $this->result("",400,"请选择视频",'json');
        }
        // 移动到框架应用根目录/public/uploads/ 目录下
        $dir = "./cdn/video/";
        $info = $file->validate([ 'size' => 5000000, 'ext' => 'mp4'])->move($dir);
        if ($info) {
            $data = $info->getInfo();
            $img = $info->getSaveName();
            $datas = [
                'video_url' => $this->imgUrl . "/cdn/video/" . getImg($img),
            ];
            $this->result($datas,200,"上传成功",'json');
        } else {
            $this->result("",400,"请选择视频",'json');
        }
    }

    /**
     * TODO:未验证TOKEN
     */

    public function imageUpload()
    {
        $file = request()->file('file');
        if($file == null){
           $this->result("",400,"请上传图片",'json');
        }
        // 移动到框架应用根目录/public/uploads/ 目录下
        $dir = "./cdn/image/";
        $info = $file->validate(['size' => 2000000, 'ext' => 'jpg,png,gif,jpeg'])->move($dir);
        if ($info) {
            $data = $info->getInfo();
            $img = $info->getSaveName();
            $image = Image::open($dir. $img);
            $datas = [
                'img_url' => $this->imgUrl . "/cdn/image/" . getImg($img),
            ];
            $groupId = (int) request()->param("groupId");
            $ResourceModel = new ResourceModel();
            $ResourceModel->save([
                'category_id' => $groupId,
                'photo' => $this->imgUrl . "/cdn/image/" . getImg($img),
                'size' => $data['size'],
                'title' => $data['name'],
                'w'  => $image->width(),
                'h'  => $image->height(),
            ]);
            $this->result($datas,200,"图片上传成功",'json');
        } else {
            $this->result("",400,"请上传图片",'json');
        }
    }


    /**
     * app素材上传 上传方式 base64 必须post 提交
     * @param   string $app_auth app验证
     * @param   string $file 图片的base64 编码
     * @return
     * TODO:未验证TOKEN
     */
    public function base64Upload() {
        $file = (string)$this->request->param('file', '');
        if (empty($file)) {
            $this->result([], 400, '非法上传', 'json');
        }
        $preg_match = preg_match('/^(data:\s*image\/(\w+);base64,)/', $file, $result);
        @list($a, $b, $suffix) = $result;
        if (!$preg_match || !$suffix || !in_array($suffix, ['jpg', 'png', 'gif', 'jpeg'])) {
            $this->result([], 400, '非法上传', 'json');
        }
        //获得存储的path
        $date = date('Ymd', time());
        $RootPath = "./cdn/image/";
        $path = "{$date}/";
        //获得存储的文件名
        $file_name = md5(uniqid(true)) . '.' . $suffix;
        $image = base64_decode(str_replace($a, '', $file));
        //存入文件中
        $file_path = $RootPath . $path;
        try {
            if (!is_dir($file_path)) {
                mkdir($file_path, 755, true);
            }
            file_put_contents($file_path . $file_name, $image);
        } catch (\Exception $exception) {
        }
        $imgUrl = $this->imgUrl . '/cdn/image/' . $path . $file_name;
        echo $imgUrl;
    }


}
