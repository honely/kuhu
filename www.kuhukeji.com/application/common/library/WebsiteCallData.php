<?php

namespace app\common\library;


use app\common\model\website\BookingformModel;
use app\common\model\website\ExampleModel;
use app\common\model\website\NewsModel;
use app\common\model\website\ProductModel;

class  WebsiteCallData
{
    private $appId;
    private $autoPluginsMap = [
        'plugin-product' => 'getProductCalldata',
        'plugin-formwn' => 'getBookingformCallData',
        'plugin-anli' => 'getExampleCalldata',
        'plugin-news' => 'getNewsCalldata',
    ];

    public function __construct($appId){
        $this->appId = $appId;
    }


    public function getData(&$plugins)
    {
        foreach ($plugins as &$val) {
            if(!empty($this->autoPluginsMap[$val['plug']])){
                $act  = $this->autoPluginsMap[$val['plug']];
                $val['show_data'] = $this->$act($val['datas']);
            }
        }
    }


    /**
     * 获取案例数据
     * @param $num
     * @param $catId
     * @param $order
     * @return array
     */
    public function getExampleCalldata($param)
    {
        $where['app_id'] = $this->appId;
        $catId = $param['catId'];
        if ($catId) {
            $where['category_id'] = $catId;
        }
        $orderby = '';
        $order = $param['order'];
        $num =  empty($param['num']) ? 2 : $param['num'] ;
        switch ($order) {
            case 1:
                $orderby = ' views desc';
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
        $ExampleModel = new ExampleModel();
        $list = $ExampleModel->where($where)->order($orderby)->limit(0, $num)->select();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'example_id' => $val->example_id,
                'category_id' => $val->category_id,
                'category_name' => "分类名称",// isset($this->exampleType[$val->category_id]) ? $this->exampleType[$val->category_id]['title'] : '',
                'title' => $val->title,
                'photo' => $val->photo,
                'photos' => json_decode($val->photos, true) ? json_decode($val->photos, true) : $val->photos,
                'info' => json_decode($val->info, true),
                'detail' => json_decode($val->detail, true),
                'add_time' => $val->add_time ? date('Y-m-d H:i', $val->add_time) : '--',
                'add_ip' => $val->add_ip,
            ];
        }
        return $datas;
    }


    public function getProductCalldata($param)
    {

        $where['app_id'] = $this->appId;
        $num = (int)  empty($param['num']) ? 2 :  $param['num'];
        $cateId = (int) $param['catId'];
        if ($cateId) {
            $where['category_id'] = $cateId;
        }
        $order = (int)$param['order'];
        $orderby = '';
        switch ($order) {
            case 1:
                $orderby = ' views desc ';
                break;
            case 2:
                $orderby = ' product_id  desc ';
                break;
            case 3:
                $orderby = ' orderby desc ';
                break;
            default:
                $orderby = 'orderby desc , product_id desc ';
                break;
        }
        $ProductModel = new ProductModel();

        $list = $ProductModel->where($where)->order($orderby)->limit(0, $num)->select();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'product_id' => $val->product_id,
                'title' => $val->title,
                'sub_title' => $val->sub_title,
                'category_id' => $val->category_id,
                'photo' => $val->photo,
                'photos' => json_decode($val->photos, true),
                'price' => $val->price ? round($val->price / 100, 2) : '面议',
                'original_price' => $val->original_price ? round($val->original_price / 100, 2) : '面议',
                'notice' => $val->notice,
                'detail' => json_decode($val->detail, true),
                'is_online' => $val->is_online,
                'mobile' => $val->mobile,
                'category_name' =>  "分类名称",// isset($this->cat[$val->category_id]) ? $this->cat[$val->category_id]['title'] : '--',
                'add_time' => isset($val->add_time) ? date("Y-m-d H:i", $val->add_time) : '--',
                'add_ip' => $val->add_ip,
                'orderby' => $val->orderby,
            ];
        }

        return  $datas;
    }


    public function getBookingformCallData($param){
        $form_id = (int) empty($param['formId']) ? 0 : $param['formId'] ;
        $BookingformModel = new  BookingformModel();
        if (!$detail = $BookingformModel->find($form_id)) {
            return [];
        }
        if ($detail->app_id != $this->appId) {
            return [];
        }
        return  [
            'form_id' => $detail->form_id,
            'title' => $detail->title,
            'details' => (array) json_decode($detail->details,true),
            'booking_num' => $detail->booking_num,
        ];
    }


    public function getNewsCalldata($param)
    {
        $where['app_id'] = $this->appId;

        $num = (int)  empty($param['num']) ? 2 :  $param['num'];
        $cateId = (int) $param['catId'] ;
        if ($cateId) {
            $where['category_id'] = $cateId;
        }
        $order = (int)$param['order'] ;
        $orderby = '';
        switch ($order) {
            case 1:
                $orderby = ' views desc ';
                break;
            case 2:
                $orderby = ' news_id  desc ';
                break;
            case 3:
                $orderby = ' orderby desc ';
                break;
            default:
                $orderby = 'orderby desc , news_id desc ';
                break;
        }
        $NewsModel = new NewsModel();
        $list = $NewsModel->where($where)->order($orderby)->limit(0, $num)->select();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'news_id' => $val->news_id,
                'title' => $val->title,
                'photo' => $val->photo,
                'description' => $val->description,
                'category_id' => (int) $val->category_id,
                'news_type_mean' => '分类名称',// isset($this->newsType[$val->category_id]) ? $this->newsType[$val->category_id]['title'] : '--',
                'add_time' => $val->add_time ? date('Y-m-d', $val->add_time) : '--',
                'add_ip' => $val->add_ip,
                'orderby' => $val->orderby
            ];
        }
        return $datas;
    }


}
