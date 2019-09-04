<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;


class OpenSettingModel extends CommonModel
{
    protected $pk = 'app_id';
    protected $name = 'app_open_setting';

    protected $type;

    public function checkType($type) {
        $types = [
            'weixin' => 1,
            'ali' => 2,
            'baidu' => 3,
            'toutiao' => 4,
            'h5' => 5
        ];
        if (!isset($types[$type])) {
            $this->error = '不存在的类型！';
            return false;
        }
        return true;
    }

    public function getOpenSetting($appId,$type) {
        $setting = json_decode($this->where(['app_id'=>$appId])->value($type), true);
        if (empty($setting)) {
            $setting = $this->defaultSetting($type);
        } else {
            if ($type == 'weixin') {
                if ($setting['cert'] != '') {
                    $setting['cert'] = SecurityEditorHtml(file_get_contents($setting['cert']));
                }
                if ($setting['pem'] != '') {
                    $setting['pem'] = SecurityEditorHtml(file_get_contents($setting['pem']));
                }
            }
        }
        return $setting;
    }

    public function setOpenSetting($appId,$type,$data) {
        if ($type == 'weixin') {
            $data_arr = json_decode($data, true);
            $cert = SecurityEditorHtml($data_arr['cert']);
            $pem = SecurityEditorHtml($data_arr['pem']);
            if ($cert || $pem) {
                //获得存储的path
                $date = date('Ym', time());
                $path = "{$date}/";
                $RootPath = "./cdn/payment/";
                $file_path = $RootPath . $path;

                //获得存储的文件名
                $cert_name = md5(uniqid(true)) . '.cert';
                $pem_name = md5(uniqid(true)) . '.pem';

                //存入文件中
                try {
                    if (!is_dir($file_path)) {
                        mkdir($file_path, 755, true);
                    }
                    if ($cert) {
                        file_put_contents($file_path.$cert_name, $cert);
                    }
                    if ($pem) {
                        file_put_contents($file_path.$pem_name, $pem);
                    }
                } catch (\Exception $exception) {

                }
                $data_arr['cert'] = IMAGE_URL . '/cdn/payment/' . $path . $cert_name;
                $data_arr['pem'] = IMAGE_URL . '/cdn/payment/'. $path . $pem_name;
                $data = json_encode($data_arr);
            }
        }
        $is_exist =  $this->find($appId);
        if ($is_exist) {
            $this->save([$type=>$data],['app_id'=>$appId]);
        } else {
            $this->save([$type=>$data,'app_id'=>$appId]);
        }
        return true;
    }

    public function defaultSetting($type) {
        switch ($type) {
            case 'weixin':
                $return = [
                    'appid' => '',
                    'appsecret' => '',
                    'merchantid' => '',
                    'merchantsecret' => '',
                    'cert' => '',
                    'pem' => '',
                ];
                break;
            case 'ali':
                $return = [
                    'appid' => '',
                    'publickey' => '',
                    'privatekey' => '',
                    'aeskey' => '',
                ];
                break;
            default:
                $return = [
                    'appid' => '',
                    'appsecret' => '',
                    'merchantid' => '',
                    'merchantsecret' => '',
                    'cert' => '',
                    'pem' => '',
                ];
                break;
        }
        return $return;
    }

}
