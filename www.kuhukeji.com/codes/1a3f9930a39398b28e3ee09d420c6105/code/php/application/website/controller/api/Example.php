<?php
namespace app\website\controller\api;

use app\website\model\website\ExampleCategoryModel;
use app\website\model\website\ExampleModel;
use app\website\model\website\TongJiModel;

class Example extends WebsiteCommon {

    protected $category = [];

    public function getCats() {
        $ExampleCategoryModel = new ExampleCategoryModel();
        $listTmp = $ExampleCategoryModel->where(['app_id'=>$this->appId])->order("orderby desc")->select();
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
        $ExampleModel = new ExampleModel();
        $category_id = (int) $this->request->param('category_id');
        $where['app_id'] = $this->appId;
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
                $orderby = 'example_id  desc';
                break;
            case 3:
                $orderby = 'orderby desc';
                break;
            default:
                $orderby = 'orderby desc,example_id desc';
                break;
        }
        $listTmp = $ExampleModel->where($where)->order($orderby)->select();
        $list = [];
        $this->getCats();
        foreach ($listTmp as $v) {
            $list[] = [
                'example' => (int)$v->example_id,
                'category_id' => (int)$v->category_id,
                'title' => (string)$v->title,
                'photo' => (string)$v->photo,
                'add_time' => $v->add_time ? date("Y-m-d", $v->add_time) : '--',
                'views' => (int)$v->views,
            ];
        }


        $this->datas = [
            'list' => array_values($list),
            'category' => $this->category,
            'isMore' => (int)($this->limit == count($list)),
            'seo' => $this->default_seo,
        ];

    }


    /**
     * 获得产品详情
     * @param int $example_id 产品分类ID
     * @return array  查询结果
     */
    public function detail() {
        $example_id = (int) $this->request->param('example_id',0);
        $ExampleModel = new ExampleModel();
        if (!$detail = $ExampleModel->find($example_id)) {
            $this->warning('参数不正确！');
        }
        if ($detail->app_id != $this->appId) {
            $this->warning('参数不正确！');
        }
        $ExampleModel->where(['example_id'=>$example_id])->setInc('views',1);
        $TongJiModel = new TongJiModel();
        $TongJiModel->viewExample($this->appId,$this->device,$example_id,$detail->title);
        $seo = json_decode($detail->seo) ? json_decode($detail->seo, true) : [];
        $seo = empty($seo) ? $this->default_seo : $seo;

        $datas = [
            'example_id' => (int)$detail->example_id,
            'category_id' => (int)$detail->category_id,
            'title' => (string)$detail->title,
            'photo' => (string)$detail->photo,
            'photos' => json_decode($detail->photos) ? json_decode($detail->photos,true) : [],
            'info' => json_decode($detail->info) ? json_decode($detail->info, true) : [],
            'detail' => json_decode($detail->detail) ? json_decode($detail->detail, true) : [],
            'add_time' => (int)$detail->add_time ? date("Y-m-d",$detail->add_time) : '--',
            'views' => (int)$detail->views,
            'seo' => $seo,
        ];

        $this->datas = $datas;
    }



}
