<?php

namespace app\shop\logic\shop;

use app\common\library\Curl;
use app\shop\model\shop\SettingModel;
use app\shop\model\shop\ShippingModel;

/**
 * Class KuaidiniaoApi
 * @package app\shop\logic\shop
 */
class KuaidiniaoApi
{

    private $EBusinessID ;
    private $AppKey;
    private $isOpen;
    private $ShipperCode;
    private $appId;
    private $ShippingId;
    private $LogisticCode;
    private $isEnd = false;

    /**
     * 设置应用ID
     * @param $appId
     * @return $this
     */
    public function setAppId($appId)
    {
        $this->appId = $appId;
        return $this;
    }

    /**
     * 设置物流ID
     * @param $ShippingId int 设置物流ID
     * @return $this
     */
    public function setShippingCode($ShipperCode)
    {
        $this->ShipperCode = $ShipperCode;
        return $this;
    }

    /**
     * 设置物流单号
     * @param $LogisticCode string 物流单号
     * @return $this
     */
    public function setLogisticCode($LogisticCode)
    {
        $this->LogisticCode = $LogisticCode;
        return $this;
    }

    /**
     * 是否开启
     */
    public function getIsOpen(){
        return $this->isOpen == 1;
    }

    /**
     * 获取信息
     * @return  array [] 或者无
     */
    public function getTraces()
    {

        if($this->checkNoPass()){
            return [];
        }

        $requestData = [
            'OrderCode' => $this->LogisticCode,
            'ShipperCode' => $this->ShipperCode,
            'LogisticCode' => $this->LogisticCode,
        ];
        $requestDataStr = json_encode($requestData);
        $datas = array(
            'EBusinessID' => $this->EBusinessID,
            'RequestType' => '1002',
            'RequestData' => urlencode($requestDataStr),
            'DataType' => '2',
        );
        $datas['DataSign'] = $this->encrypt($requestDataStr, $this->AppKey);
        $Curl = new Curl();
        $resultStr = $Curl->post("http://api.kdniao.com/Ebusiness/EbusinessOrderHandle.aspx", $datas);
        $result = json_decode($resultStr, true);
        if ($result['Success'] == false) {
            return [];
        }
        $this->isEnd = $result['State'] == 3 || $result['State'] == 4;
        return $result["Traces"];
    }

    /**
     * 物流是否已完成 ！注意 如果已完成 请插入数据库
     * @return bool
     */
    public function isEnd()
    {
        return $this->isEnd;
    }

    /**
     * 电商Sign签名生成
     * @param  $data  string 内容
     * @param  $appkey string Appkey
     * @return string DataSign签名
     */
    private function encrypt($data, $appkey)
    {
        return urlencode(base64_encode(md5($data . $appkey)));
    }

    /**
     * 验证是否可以查询
     */
    private function checkNoPass()
    {
        $this->getSetting();
        return empty($this->EBusinessID) ||
            empty($this->ShipperCode) ||
            empty($this->LogisticCode) ||
            $this->isOpen == 0 ||
            empty($this->AppKey);
    }

    /**
     * 获取配置信息
     */
    private function getSetting()
    {
        $res = SettingModel::getKdnInfo($this->appId);
        $this->isOpen = $res['is_open'];
        $this->EBusinessID = $res['usinessid'];
        $this->AppKey = $res['appkey'];
    }
}
