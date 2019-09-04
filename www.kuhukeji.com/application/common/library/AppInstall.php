<?php

namespace app\common\library;

use app\common\library\Curl;

use app\common\model\setting\SettingModel;
use  app\common\library\zipFold;
use think\Config;
use think\Db;

class  AppInstall
{

    private $app_key = 'app_type';
    private $account_key = 'wyu_auth';
    private $account = [];
    private $appTypeDatas = [];
    private $accountSign = '';
    private $accountT = 0;

    private $appId = 0;
    private $app = [];
    private $host = 'https://www.woyaou.com/api/';

    private $error = [];

    public function __construct()
    {
        $SettingModel = new SettingModel();
        $this->account = $SettingModel->getCache($this->account_key);
        $this->appTypeDatas = $SettingModel->getCache($this->app_key, false, true); //因为下面要改变 所以 用数组来返回
    }
    
    public function checkV(){
        $api = $this->host . 'account/checkV'; //检测框架的升级
        $v  = $this->getV();
        $Curl = new Curl();
        $this->getSign();
        $res = $Curl->post($api, [
            'account_id' => $this->account->account_id,
            'account_t' => $this->accountT,
            'account_sign' => $this->accountSign,
            'v' => $v,
        ]);
        if($res == 1) return true;
        return false;
    }
    public function getV(){
        $v = '1.0';
        if(file_exists(ROOT_PATH.'woyaou.v.php')){
            $v = require ROOT_PATH.'woyaou.v.php';
        }
        return $v;
    }
    //下载主框架的升级文件
    public function downloadMain(){
        $v  = $this->getV();
        $Curl = new Curl();
        $api = $this->host . 'account/downloadMain';
        $this->getSign();
        $file = $this->getMainName($v) . '.zip';
        $Curl->downLoad($api, [
            'account_id' => $this->account->account_id,
            'account_t' => $this->accountT,
            'account_sign' => $this->accountSign,
            'v' => $v
        ], $file);
    }
    
      //拥有的版本，也就是我当前安装了的版本，以免服务器升级没有升级版本没办法更新等
    public function getMainName($update_v = '')
    {
        $dir = APP_PATH . '../codes/www/';
        if(!is_dir($dir)) mkdir ($dir,0777,true);
        return $dir.$update_v;
    }
    public function installYesMain(){
        $v = $this->getV();
        $api = $this->host . 'account/getMainV';
         $Curl = new Curl();
        $this->getSign();
        $res = $Curl->post($api, [
            'account_id' => $this->account->account_id,
            'account_t' => $this->accountT,
            'account_sign' => $this->accountSign,
            'v' => $v,
        ]);
        file_put_contents('woyaou.v.php', '<?php   return "'.$res.'";');
        return true;
    }
    
    
    public function installYes($appid)
    {
        if (empty($appId)) $this->setError('参数错误');
        $api = $this->host . 'account/installYes';
        $Curl = new Curl();
        $this->getSign();
        $res = $Curl->post($api, [
            'account_id' => $this->account->account_id,
            'account_t' => $this->accountT,
            'account_sign' => $this->accountSign,
            'app_id' => $appid,
        ]);
        $datas = json_decode($res, true);
        if (empty($datas)) return $this->setError('获取数据失败');
        $this->appTypeDatas['apps'] = $datas['data']['apps'];
        $this->appTypeDatas['vote_num'] = $datas['data']['vote_num'];
        $SettingModel = new SettingModel();
        $SettingModel->setCache($this->app_key, $this->appTypeDatas);   //更新数据库
        return $this->appTypeDatas;
    }

    public function updateYes($appid, $updateId)
    {
        if (empty($appId)) $this->setError('参数错误');
        $api = $this->host . 'account/updateYes';
        $Curl = new Curl();
        $this->getSign();
        $res = $Curl->post($api, [
            'account_id' => $this->account->account_id,
            'account_t' => $this->accountT,
            'account_sign' => $this->accountSign,
            'app_id' => $appid,
            'updateId' => $updateId,
        ]);
        $datas = json_decode($res, true);
        if (empty($datas)) return $this->setError('获取数据失败');
        $this->appTypeDatas['apps'] = $datas['data']['apps'];
        $this->appTypeDatas['vote_num'] = $datas['data']['vote_num'];
        $SettingModel = new SettingModel();
        $SettingModel->setCache($this->app_key, $this->appTypeDatas);   //更新数据库
        return $this->appTypeDatas;
    }


    //获取APP的列表
    public function getApps()
    {
        $api = $this->host . 'account/getApps';
        $Curl = new Curl();
        $this->getSign();
        $res = $Curl->post($api, [
            'account_id' => $this->account->account_id,
            'account_t' => $this->accountT,
            'account_sign' => $this->accountSign,
        ]);
        $datas = json_decode($res, true);
        if (empty($datas)) return $this->setError('获取数据失败');
        $this->appTypeDatas['apps'] = $datas['data']['apps'];
        $this->appTypeDatas['vote_num'] = $datas['data']['vote_num'];
        $SettingModel = new SettingModel();
        $SettingModel->setCache($this->app_key, $this->appTypeDatas);   //更新数据库

        return $this->appTypeDatas;
    }


    public function download($appId, $updateId = 0, $update_v = '')
    {
        set_time_limit(0); //设置下载不超时
        if (empty($appId)) {
            return $this->setError('要安装的APP不能为空');
        }
        if (!$app = $this->getAppByAppid($appId)) {
            return $this->setError('要安装的APP不能为空');
        }
        if (!$app['is_have'] || !$app['have_v']) {
            return $this->setError('要安装的APP不能为空');
        }
        if ($update_v && $update_v <= $app['have_v']) {
            return $this->setError('要安装的APP不能为空');
        }
        $Curl = new Curl();
        $api = $this->host . 'account/download';
        $this->getSign();

        $file = $this->getFileName($appId, $update_v) . '.zip';
        $Curl->downLoad($api, [
            'account_id' => $this->account->account_id,
            'account_t' => $this->accountT,
            'account_sign' => $this->accountSign,
            'app_id' => $appId,
            'updateId' => $updateId
        ], $file);
    }

    public function installFileMain(){
        $v = $this->getV();
        $fold  = $this->getMainName($v);
        $phpFile = $fold . '/codes/';
        recurse_copy($phpFile, $_SERVER['DOCUMENT_ROOT']);
        return true;
    }    
    
    

    //复制文件
    public function installFile($appId, $update_v = '')
    {
        $fold = $this->getFileName($appId, $update_v);
        $phpFile = $fold . '/code/php/';
        recurse_copy($phpFile, $_SERVER['DOCUMENT_ROOT']);
        $webDir = $this->getWebDir($appId);
        $webFile = $fold . '/code/app/h5/';
        recurse_copy($webFile, $webDir);
        $vue = $fold . '/code/vue/';
        recurse_copy($vue, $_SERVER['DOCUMENT_ROOT']);
        return true;
    }
    
    public function installSqlMain(){
        $v = $this->getV();
        $fold  = $this->getMainName($v);
        $sqlFile = $fold.'/update.sql'; 
        $con = Db::connect(Config::get('database'));
        if (!file_exists($sqlFile)) return false;
        $content = file_get_contents($sqlFile);
        $content = str_replace("\r\n", "\n", $content);
        $sqls = explode(";\n", $content);
        foreach ($sqls as $val) {
            $val = trim($val);
            if (!empty($val)) {
                $con->execute($val);
            }
        }
        return true;
    }
    
   

    public function installSql($appId, $update_v = '')
    {
        $con = Db::connect(Config::get('database'));
        $sqlFile = $update_v ? $this->getFileName($appId, $update_v) . '/code/update.sql' : $this->getFileName($appId) . '/code/install.sql';
        if (!file_exists($sqlFile)) return false;
        $content = file_get_contents($sqlFile);
        $content = str_replace("\r\n", "\n", $content);
        $sqls = explode(";\n", $content);
        foreach ($sqls as $val) {
			$val = trim($val);
            if (!empty($val)) {
                $con->execute($val);
            }
        }
        return true;
    }
    
    
    public function unzipMain(){
        $v  = $this->getV();
        $fold  = $this->getMainName($v);
        if (!is_dir($fold)) {
            mkdir($fold, 0755, true);
        }
        $file = $fold.'.zip';
        $zipFold = new zipFold();
        return $zipFold->unzip($file, $fold);
    }
    
    //解压ZIP 
    public function unzipFile($appId, $update_v = '')
    {

        $fold = $this->getFileName($appId, $update_v);

        if (!is_dir($fold)) {
            mkdir($fold, 0755, true);
        }
        $file = $this->getFileName($appId, $update_v) . '.zip';

        $zipFold = new zipFold();
        return $zipFold->unzip($file, $fold);
    }

    public function install($appId, $code = '')
    {
        if (empty($appId)) {
            return $this->setError('要安装的APP不能为空');
        }
        $this->appTypeDatas['app_install'] = time();
        $this->appTypeDatas['app_id'] = $appId;
        $SettingModel = new SettingModel();
        $SettingModel->setCache($this->app_key, $this->appTypeDatas);   //更新数据库

        $Curl = new Curl();
        $api = $this->host . 'account/install';
        $this->getSign();
        $res = $Curl->post($api, [
            'account_id' => $this->account->account_id,
            'account_t' => $this->accountT,
            'account_sign' => $this->accountSign,
            'app_id' => $appId,
            'code' => $code,
        ]);
        $result = json_decode($res, true);
        if ($result['code'] == 200) {
            $this->getApps();
            return true;
        }
        return $this->setError($result['msg']);
    }

    //检查安装
    public function checkInstall($appid)
    {
        if (time() - $this->appTypeDatas['app_install'] > 60) { //1分钟超时
            return false;
        }
        if ($appid != $this->appTypeDatas['app_id']) return false;
        return true;
    }

    public function getErrors()
    {
        return join(',', $this->error);
    }

    private function setError($error)
    {
        $this->error[] = $error;
        return false;
    }

    public function getAppByDir($dir)
    {
        foreach ($this->appTypeDatas['apps'] as $k => $v) {
            if ($v['app_dir'] == $dir) return $v;
        }
        return false;
    }

    public function getAppByAppid($appId)
    {
        if ($this->appId == $appId) return $this->app;
        foreach ($this->appTypeDatas['apps'] as $k => $v) {
            if ($v['app_id'] == $appId) {
                $this->appId = $appId;
                $this->app = $v;
                return $this->app;
            }
        }
        return false;
    }

    //拥有的版本，也就是我当前安装了的版本，以免服务器升级没有升级版本没办法更新等
    public function getFileName($appId, $update_v = '')
    {
        $app = $this->getAppByAppid($appId);
        return APP_PATH . '../codes/' . md5($app['app_dir'] . '-' . ($update_v ? $update_v : $app['have_v']) . $this->account->account_token);
    }

    //获取小程序包 APPID 
    public function getMiniappZip($miniappId, $appType, $type)
    {
        $dir = $this->getDirByType($appType, $type);
        $myDir = $this->getFileName($appType) . '/code/app/download/' . md5($miniappId . $type . $this->account->account_token);
        $tmpFile = $myDir . '.zip';
        if (!is_dir($myDir)) mkdir($myDir, 0755, true);
        recurse_copy($dir, $myDir . '/');
      	
      	$dir =  $this->getFileName($appType) . '/code/app/download/' . md5($miniappId . $type . $this->account->account_token) . '/common/';
      	$files = scandir($dir);
      	foreach($files as $f){
        		if($f!='.' && $f!='..'){
                	 $file = $dir.$f;
                      $contents = file_get_contents($file);
                      $contents = preg_replace('/([0-9]+)\_woyaou/i', $miniappId, $contents);
                      file_put_contents($file, $contents);
                }
        }
       
      
        if (file_exists($tmpFile)) unlink($tmpFile);
        $ZipFolder = new ZipFold();
        if ($ZipFolder->zip($tmpFile, $myDir . '/')) { //压缩文件生成后
            $fp = fopen($tmpFile, "r");
            $file_size = filesize($tmpFile);
            Header("Content-type: application/octet-stream");
            Header("Accept-Ranges: bytes");
            Header("Accept-Length:" . $file_size);
            Header("Content-Disposition: attachment; filename=" . $type . '_' . $appType . '_' . $miniappId . ".zip");
            $buffer = 1024;
            $file_count = 0;
            while (!feof($fp) && $file_count < $file_size) {
                $file_con = fread($fp, $buffer);
                $file_count += $buffer;
                echo $file_con;
            }
            fclose($fp);
            unlink($tmpFile);
        }

    }


    //获取小程序的目录
    public function getDirByType($appId, $type = '')
    {
        $dir = '';
        switch ($type) {
            case 'mp-weixin':
            case 'mp-alipay':
            case 'mp-baidu':
            case 'mp-toutiao':
                $dir = $this->getFileName($appId) . '/code/app/' . $type . '/';
                break;
            default:
                $dir = $this->getFileName($appId) . '/code/app/mp-weixin/';
                break;
        }
        return $dir;
    }

    //返回本身的URL
    public function getWebUrl($appId)
    {
        $app = $this->getAppByAppid($appId);
        return 'https://' . $_SERVER['HTTP_HOST'] . '/h5/' . $app['app_dir'] . '/#/?app_id=' . $appId;
    }

    //返回WEB的目录
    public function getWebDir($appId)
    {
        $app = $this->getAppByAppid($appId);
        $dir = $_SERVER['DOCUMENT_ROOT'] . '/h5/' . $app['app_dir'];
        if (!is_dir($dir)) {
            mkdir($dir, 0755, true);
        }
        return $dir;
    }


    private function getSign()
    {
        $this->accountT = time();
        $this->accountSign = md5($this->accountT . $this->account->account_id . $this->account->account_token);
    }


}