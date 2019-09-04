<?php
namespace app\website\controller\api;

use app\website\model\website\ProductCategoryModel;
use app\website\model\website\ProductModel;
use app\website\model\website\TongJiModel;

class Product extends WebsiteCommon {


    protected $category = [];

    public function getCats() {
        $ProductCategoryModel = new ProductCategoryModel();
        $listTmp = $ProductCategoryModel->where(['app_id'=>$this->appId])->order("orderby desc")->select();
        $list[0] = [
            'category_id' => 0,
            'title' => '全部',
        ];
        foreach ($listTmp as $v) {
            $list[] = [
                'category_id' => $v->category_id,
                'title' => $v->title,
            ];
        }
        $this->datas['list'] = $list;
        $this->category = $list;
    }

    /**
     * 获得产品列表
     * @param int $category_id  分类ID
     * @return array  查询结果
     */
    public function index() {
        $ProductModel = new ProductModel();
        $category_id = (int) $this->request->param('category_id');
        $where['app_id'] = $this->appId;
        $where['is_online'] = 1;
        if ($category_id) {
            $where['category_id'] = $category_id;
        }
        $cat = (int) $this->request->param("cat");
        $cat > 0 && $where['category_id'] = $category_id;
        $order = $this->request->param("order");
        switch ($order) {
            case 1:
                $orderby = 'views desc';
                break;
            case 2:
                $orderby = 'product_id  desc';
                break;
            case 3:
                $orderby = 'orderby desc';
                break;
            default:
                $orderby = 'orderby desc,product_id desc';
                break;
        }

        $listTmp = $ProductModel->where($where)->order($orderby)->select();
        $list = [];
        $this->getCats();
        foreach ($listTmp as $v) {
            $list[] = [
                'product_id' => (int)$v->product_id,
                'category_id' => (int)$v->category_id,
                'title' => (string)$v->title,
                'sub_title' => (string)$v->sub_title,
                'photo' => (string)$v->photo,
                'notice' => $v->notice ? mb_substr($v->notice,0,20,'utf-8') : '',
                'views' => (int)$v->views,
            ];
        }

        $this->datas = [
            'list' => $list,
            'category' => $this->category,
            'isMore' => (int)($this->limit == count($list)),
            'seo' => $this->default_seo,
        ];

    }


    /**
     * 获得产品详情
     * @param int $category_id  产品分类ID
     * @return array  查询结果
     */
    public function detail() {
        $product_id = (int) $this->request->param('product_id',0);
        $ProductModel = new ProductModel();
        if (!$detail = $ProductModel->find($product_id)) {
            $this->warning('参数不正确！');
        }
        if ($detail->app_id != $this->appId) {
            $this->warning('参数不正确！');
        }
        $ProductModel->where(['product_id'=>$product_id])->setInc('views',1);
        $TongJiModel = new TongJiModel();
        $TongJiModel->viewProduct($this->appId,$this->device,$product_id,$detail->title);
        $seo = json_decode($detail->seo) ? json_decode($detail->seo, true) : [];
        $seo = empty($seo) ? $this->default_seo : $seo;
        $datas = [
            'product_id' => (int)$detail->product_id,
            'category_id' => (int)$detail->category_id,
            'title' => (string)$detail->title,
            'sub_title' => (string)$detail->sub_title,
            'photo' => (string)$detail->photo,
            'notice' => (string)$detail->notice,
            'price' => $detail->price ? round($detail->price/100,2) : '面议',
            'original_price' => $detail->original_price ? round($detail->original_price/100,2) : '面议',
            'detail' => json_decode($detail->detail) ? json_decode($detail->detail,true) : [],
            'photos' => json_decode($detail->photos) ? json_decode($detail->photos,true) : [],
            'is_online' => (int)$detail->is_online,
            'mobile' => (string)$detail->mobile,
            'add_time' => (int)$detail->add_time ? date("Y-m-d",$detail->add_time) : '--',
            'views' => (int)$detail->views,
            'seo' => $seo,
        ];

        $this->datas = $datas;
    }

}
