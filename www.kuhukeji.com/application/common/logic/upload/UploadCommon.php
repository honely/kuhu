<?php


namespace app\common\logic\upload;

use app\common\model\resource\AppResourceModel;
use app\common\model\setting\SettingModel;
use Qiniu\Auth;
use Qiniu\Storage\UploadManager;
use think\Exception;
use think\Image;

class UploadCommon
{

    public function upload(){

        $SettingModel= new SettingModel();
        $setting = $SettingModel->getCache("qiniu_oss");

        if(!empty($setting) && $setting->is_open == 1){
            $res  = $this->qiniuupload($setting);
        }else{
            $res  = $this->ptupload();
        }
        return $res;
    }


    /*
     *  自家平台上传
     *  @param file file 上传文件的 缓存地址
     *  @return string|false  成功 返回文件地址
     */

    protected function ptupload(){
        $file = request()->file('file');
        // 移动到框架应用根目录/public/uploads/ 目录下
        $dir = "./cdn/image/";
        $info = $file->validate(['size' => 2000000, 'ext' => 'jpg,png,gif,jpeg'])->move($dir);
        if ($info) {
            $data = $info->getInfo();
            $img = $info->getSaveName();
            $image = Image::open($dir . $img);
            return [
                'photo' => request()->domain() . "/cdn/image/" . getImg($img),
                'size' => $data['size'],
                'title' => $data['name'],
                'w' => $image->width(),
                'h' => $image->height(),
            ];
        }else{
            return false;
        }
    }
    /*
     * 七牛云上传
     * @param  config 七牛云 配置信息
     * @return string|false  成功 返回文件地址
     */
    protected function qiniuupload($config){
        $file = request()->file('file');
        // 要上传图片的本地路径
        $filePath = $file->getRealPath();
        $ext = pathinfo($file->getInfo('name'), PATHINFO_EXTENSION);  //后缀
        $info = $file->getInfo();
        $in_ext  = ['jpg','png','gif','jpeg'];
        if(!in_array($ext,$in_ext,true)){
            echo "后缀名错误";
        }
        //获取当前控制器名称
        // 上传到七牛后保存的文件名
        $key =substr(md5($file->getRealPath()) , 0, 5). date('YmdHis') . rand(0, 9999) . '.' . $ext;
        $auth = new Auth($config->accesskey, $config->secretkey);
        $token = $auth->uploadToken($config->bucket);
        $uploadMgr = new UploadManager();
        $image = Image::open($info['tmp_name']);
        list($ret, $err) = $uploadMgr->putFile($token, $key, $filePath);
        if ($err !== null) {
            return false;
        } else {
            $imgUrl =  substr($config->imgUrl, -1) == "/" ? $config->imgUrl : $config->imgUrl.'/' ;
            $imgUrl =  $imgUrl . $ret['key'];
            $data = [
                'title' => $info['name'],
                'size' => $info['size'],
                'photo'   => $imgUrl,
                'w' => $image->width(),
                'h' => $image->height(),
            ];
            return $data;
        }

    }

}