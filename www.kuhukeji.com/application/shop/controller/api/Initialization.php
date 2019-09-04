<?php
namespace app\shop\controller\api;

use app\shop\logic\shop\miniapp\Miniapp;
use app\common\model\app\AppThemeModel;
use app\shop\model\shop\SettingModel;
use think\Controller;
use app\common\model\app\AppModel;
use app\common\library\token\ApiToken;

/**
 *  旅游小程序初始化
 */
class Initialization extends Controller
{
    protected $app;

    /**
     *  初始化
     */
    protected $token;  //token
    protected $skin; //皮肤
    protected $sceneId;
    protected $device;
    protected $openId;
    protected $info;


    protected function _initialize(){
        parent::_initialize();
        header('Access-Control-Allow-Origin:*');
        header('Access-Control-Allow-Methods:GET, POST, PUT');
        header('Access-Control-Allow-Headers:Origin, X-Requested-With, Content-Type,X-File-Name, Accept');
        header("Access-Control-Max-Age: 1728000");
        $appId = (int)$this->request->param('app_id',0);
        $this->device = (string)$this->request->param('device','');
        $this->sceneId = (string)$this->request->param('scene_id','');
        $device = array_flip(config('device'));
        if (!isset($device[$this->device])) {
            $this->result("", 400, '参数错误', 'json');
        }
        $AppModel = new  AppModel();
        if (!$app = $AppModel->find($appId)) {
            $this->result("", 400, '参数错误', 'json');
        };
        if ($app->expire_time < time()) {
            $this->result("", 404, "该应用已过期", "json");
        }
        $SettingModel = new SettingModel();
        if (!$setting = $SettingModel->find($app->app_id)) {
            $this->result("", 404, '商家尚未设置商家信息!','json');
        }
        $info = [
            'company_name' => (string) $setting->company_name,
            'banner' => (string) $setting->banner,
            'introduce' => json_decode($setting->introduce) ? json_decode($setting->introduce, true) : [],
            'address' => (string) $setting->address,
            'tel' => (string) $setting->tel,
            'mobile' => (string) $setting->mobile,
            'email' => (string) $setting->email,
            'qrcode' => (string) $setting->qrcode,
        ];
//        if ($app->appkey != $appKey) {
//            $this->result("", 400, "参数错误", "json");
//        }
        $this->app = $app;
        $this->info = $info;
    }


    /**
     * 初始化小程序
     */
    public function Init(){
        $this->getToken()->getSkin()->getOpenId();
        $datas = [
            'token' => $this->token,
            'skin' => $this->skin,
            'open_id' => $this->openId,
            'is_copyright' => 1,
            'info' => $this->info,
        ];
        $this->result($datas, 200, "程序初始化成功", "json");
    }

    /**
     * getOpenIOd
     */
    public function getOpenId(){
        $code = (string) $this->request->param("code");
        $open_id = (string) $this->request->param("open_id");
        $res = Miniapp::makeModule($this->device,$this->app->app_id)->getSessionKey($code, $open_id);
        if($res == false){
            $this->result('', 400, "信息初始化失败", "json");
        }
        $this->openId = $res['open_id'];
    }

    /**
     * getToken
     */
    private function getToken()
    {
        $MiniAppToken = new ApiToken();
        $this->token = $MiniAppToken->getAuthCodeToken(
            $this->app->app_id,
            $this->app->member_id,
            $this->app->expire_time,
            $this->device  // h5  weixin  ali   baidu  toutiao
        );
        return $this;
    }


    /**
     * 获得程序皮肤
     */
    private function getSkin(){
        $AppThemeModel = new AppThemeModel();
        $theme = $AppThemeModel->getTheme($this->app->app_id);
        $this->skin = [
            'theme' => $theme['theme'],
            'footer' => $theme['footer'],
        ];
        return $this;
    }

}
