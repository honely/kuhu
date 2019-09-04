<?php
namespace app\website\controller\api;

use app\website\model\website\NewsCategoryModel;
use app\website\model\website\NewsModel;
use app\website\model\website\TongJiModel;

class News extends WebsiteCommon {

    protected $category = [];

    public function getCats() {
        $NewsCategoryModel = new NewsCategoryModel();
        $listTmp = $NewsCategoryModel->where(['app_id'=>$this->appId])->order("orderby desc")->select();
        $list[0] = [
            'category_id' => 0,
            'title' => '全部',
        ];

        foreach ($listTmp as $v) {
            $list[$v->category_id] = [
                'category_id' => $v->category_id,
                'title' => $v->title,
            ];
        }
        $this->datas['list'] = array_values($list);
        $this->category = $list;
    }

    /**
     * 获得新闻列表
     * @param int $category_id  分类ID
     * @return array  查询结果
     */
    public function index() {
        $NewsModel = new NewsModel();
        $category_id = (int) $this->request->param('category_id');
        $where['app_id'] = $this->appId;
        $cat = (int) $this->request->param("cat");
        if ($category_id ) {
            $where['category_id'] = $category_id;
        }
        $cat > 0 && $where['category_id'] = $category_id;
        $order = $this->request->param("order");
        switch ($order) {
            case 1:
                $orderby = 'views desc';
                break;
            case 2:
                $orderby = 'news_id  desc';
                break;
            case 3:
                $orderby = 'orderby desc';
                break;
            default:
                $orderby = 'orderby desc,news_id desc';
                break;
        }
        $listTmp = $NewsModel->where($where)->order($orderby)->select();
        $list = [];

        $this->getCats();
        foreach ($listTmp as $v) {
            $list[] = [
                'news_id' => (int)$v->news_id,
                'category_id' => (int)$v->category_id,
                'title' => (string)$v->title,
                'photo' => (string)$v->photo,
                'detail' => json_decode($v->detail) ? json_decode($v->detail,true) : [],
                'description' => $v->description ? mb_substr($v->description,0,20,'utf-8') : '',
                'add_time' => $v->add_time ? date("Y-m-d", $v->add_time) : '',
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
     * 获得新闻详情
     * @param int $news_id  产品分类ID
     * @return array  查询结果
     */
    public function detail() {
        $news_id = (int) $this->request->param('news_id',0);
        $NewsModel = new NewsModel();
        if (!$detail = $NewsModel->find($news_id)) {
            $this->warning('参数不正确！');
        }
        if ($detail->app_id != $this->appId) {
            $this->warning('参数不正确！');
        }
        $recommend = [];
        $recTmp = $NewsModel->where(['app_id'=>$this->appId])->where('news_id','neq',$news_id)->limit(5)->select();

        foreach ($recTmp as $v) {
            $recommend[] = [
                'news_id' => (int)$v->news_id,
                'title' => (string)$v->title,
                'description' => $v->description ? mb_substr($v->description,0,20,'utf-8') : '',
                'add_time' => $v->add_time ? date("Y-m-d", $v->add_time) : '',
                'views' => (int)$v->views,
            ];
        }
        $TongJiModel = new TongJiModel();
        $TongJiModel->viewNews($this->appId,$this->device,$news_id,$detail->title);
        $NewsModel->where(['news_id'=>$news_id])->setInc('views',1);

        $seo = json_decode($detail->seo) ? json_decode($detail->seo, true) : [];
        $seo = empty($seo) ? $this->default_seo : $seo;

        $datas = [
            'news_id' => (int)$detail->news_id,
            'title' => (string)$detail->title,
            'photo' => (string)$detail->photo,
            'detail' => json_decode($detail->detail) ? json_decode($detail->detail,true) : [],
            'description' => $detail->description ? mb_substr($detail->description,0,20,'utf-8') : '',
            'add_time' => $detail->add_time ? date("Y-m-d", $detail->add_time) : '',
            'views' => (int)$detail->views,
        ];

        $this->datas = [
            'datas' => $datas,
            'recommend' => $recommend,
            'seo' => $seo,
        ];
    }

}
