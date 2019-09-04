<?php
namespace app\website\controller\api;

use app\website\model\website\BusinessModel;
use app\website\model\website\ProductModel;
use app\website\model\website\TongJiModel;

class Business extends WebsiteCommon {

    protected $checkLogin = false;


    /**
     * 获得业务范围列表
     * @return array  查询结果
     */
    public function index() {
        $BusinessModel = new BusinessModel();
        $listTmp = $BusinessModel->where(['app_id'=>$this->appId])->order('orderby desc')->select();
        $list = [];
        foreach ($listTmp as $v) {
            $list[] = [
                'business_id' => $v->business_id,
                'title' => (string)$v->title,
                'sub_title' => (string)$v->sub_title,
                'photo' => (string)$v->photo,
                'photos' => json_decode($v->photos) ? json_decode($v->photos,true) : "",
                'add_time' => (int)$v->add_time ? date("Y-m-d",$v->add_time) : '--',
                'views' => (int) $v->views,
            ];
        }
        $this->datas = [
            'list' => $list,
            'isMore' => (int)($this->limit == count($list)),
            'seo' => $this->default_seo,
        ];
    }


    /**
     * 获得业务范围详情
     * @param int $business_id  业务范围ID
     */
    public function detail() {
        $business_id = (int) $this->request->param('business_id',0);
        $BusinessModel = new BusinessModel();
        if (!$detail = $BusinessModel->find($business_id)) {
            $this->warning('参数不正确！');
        }
        if ($detail->app_id != $this->appId) {
            $this->warning('参数不正确！');
        }
        $product_ids = json_decode($detail->product_ids, true) ? json_decode($detail->product_ids, true) : '';
        $ProductModel = new ProductModel();
        $listTmp = $ProductModel->itemsByIds($product_ids);
        $list = [];
        foreach ($listTmp as $v) {
            $list[] = [
                'product_id' => $v->product_id,
                'title' => $v->title,
                'sub_title' => $v->sub_title,
                'photo' => $v->photo,
                'notice' => $v->notice ? mb_substr($v->notice,0,20,'utf-8') : '',
            ];
        }
        $BusinessModel->where(['business_id'=>$business_id])->setInc('views',1);
        $TongJiModel = new TongJiModel();
        $TongJiModel->viewBusiness($this->appId,$this->device,$business_id,$detail->title);
        $seo = json_decode($detail->seo) ? json_decode($detail->seo, true) : [];
        $seo = empty($seo) ? $this->default_seo : $seo;

        $datas = [
            'business_id' => $detail->business_id,
            'title' => (string) $detail->title,
            'sub_title' => (string) $detail->sub_title,
            'photo' => (string)$detail->photo,
            'photos' => json_decode($detail->photos) ? json_decode($detail->photos,true) : [],
            'detail' => json_decode($detail->detail) ? json_decode($detail->detail,true) : [],
            'views' => (int) $detail->views,
            'products' => $list,
            'seo' => $seo,
        ];

        $this->datas = $datas;
    }

}
