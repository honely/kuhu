<?php
namespace app\website\controller\api;

use app\common\library\token\ApiToken;
use app\website\library\MiniAppToken;
use app\common\model\app\AppModel;
use app\common\model\app\AppThemeModel;
use app\common\model\app\PagesModel;

use app\website\model\website\TongJiModel;
use think\Controller;

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


    protected function _initialize(){
        parent::_initialize();
        header('Access-Control-Allow-Origin:*');
        header('Access-Control-Allow-Methods:GET, POST, PUT');
        header('Access-Control-Allow-Headers:Origin, X-Requested-With, Content-Type,X-File-Name, Accept');
        header("Access-Control-Max-Age: 1728000");
        $appId = (int)$this->request->param('app_id',0);
        $appKey = (string)$this->request->param('app_key','');
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
            $this->result("", 400, "该应用已过期", "json");
        }
//        if ($app->appkey != $appKey) {
//            $this->result("", 400, "参数错误", "json");
//        }
        $this->app = $app;
    }


    /**
     * 初始化小程序
     */
    public function Init(){
        $this->getToken()->getSkin();
        $datas = [
            'token' => $this->token,
            'skin' => $this->skin,
            'is_copyright' => 1,
        ];
        $TongJiModel = new TongJiModel();
        $TongJiModel->visit($this->app->app_id,$this->device);
        $this->result($datas, 200, "程序初始化成功", "json");
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
