<?php
namespace app\website\controller\admin;


use app\website\model\website\SettingModel;


class Setting  extends Common{

    public function getSetting()
    {
        $SettingModel = new SettingModel();
        if (!$detail = $SettingModel->find($this->appId)) {
            $this->datas['detail'] = [
                'company_name'  =>  '',
                'banner'  =>  [],
                'introduce'  =>  [],
                'address'  =>  '',
                'lat'  =>  '',
                'lng'  =>  '',
                'tel'  =>  '',
                'mobile'  =>  '',
                'fax'  =>  '',
                'email'  =>  '',
                'qrcode'  =>  '',
            ];
        }else{
            $this->datas['detail'] = [
                'company_name'  =>  $detail->company_name,
                'banner'  =>  json_decode($detail->banner,true) ? json_decode($detail->banner,true) : $detail->banner,
                'introduce'  =>  json_decode($detail->introduce,true) ? json_decode($detail->introduce,true) : $detail->introduce,
                'address'  =>  $detail->address,
                'lat'  =>  $detail->lat,
                'lng'  =>  $detail->lng,
                'tel'  =>  $detail->tel,
                'mobile'  =>  $detail->mobile,
                'fax'  =>  $detail->fax,
                'email'  =>  $detail->email,
                'qrcode'  =>  $detail->qrcode,
            ];
        }
    }



    public function setSetting()
    {
        $SettingModel = new SettingModel();
        if (!$detail = $SettingModel->find($this->appId)) {

            $res = $SettingModel->setData($SettingModel->dataFilter($this->appId));
            if ($res === false) {
                $this->warning($SettingModel->getError());
            }
        } else {
            $res = $SettingModel->setData($SettingModel->dataFilter($this->appId), $this->appId);
            if ($res === false) {
                $this->warning($SettingModel->getError());
            }
        }
    }


    /**
     * 获得SEO
     */
    public function getSeo()
    {
        $SettingModel = new SettingModel();
        if (!$detail = $SettingModel->find($this->appId)) {
            $this->datas['detail'] = [
                'title'  =>  '',
                'keywords'  =>  [],
                'description'  =>  [],
            ];
        }else{
            $this->datas['detail'] = [
                'title'  =>  $detail->title,
                'keywords'  =>  $detail->keywords,
                'description'  =>  $detail->description,
            ];
        }
    }


    /**
     * 设置SEO
     */
    public function setSeo()
    {
        $data['title'] = (string) $this->request->param('title','','SecurityEditorHtml');
        $data['keywords'] = (string) $this->request->param('keywords','','SecurityEditorHtml');
        $data['description'] = (string) $this->request->param('description','','SecurityEditorHtml');
        $SettingModel = new SettingModel();
        if (!$detail = $SettingModel->find($this->appId)) {
            $data['app_id'] = $this->appId;
            $res = $SettingModel->save($data);
            if ($res === false) {
                $this->warning($SettingModel->getError());
            }
        } else {
            $res = $SettingModel->isUpdate(true)->save($data,['app_id'=>$this->appId]);
            if ($res === false) {
                $this->warning($SettingModel->getError());
            }
        }
    }




}
