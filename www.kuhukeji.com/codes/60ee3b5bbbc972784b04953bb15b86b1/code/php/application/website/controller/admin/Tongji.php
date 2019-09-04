<?php

namespace app\website\controller\admin;


use app\website\model\website\TongJiModel;


class Tongji extends Common
{
    protected $timeTrance = [
        1 => '-3 days',
        2 => '-7 days',
        3 => '-15 days',
        4 => '-30 days',
    ];



    public function getHotExample() {
        $timearea = (int) $this->request->param('timearea',1);
        $timeTrance = [
            1 => '-3 days',
            2 => '-7 days',
            3 => '-15 days',
            4 => '-30 days',
        ];
        $whereTime = [];
        if (isset($timeTrance[$timearea])) {
            $whereTime = $timeTrance[$timearea];
        }
        $TongJiModel = new TongJiModel();
        $ExampleTop10 = $TongJiModel->field("title,count(resource_id) as num,resource_id")
            ->group("resource_id")
            ->where("app_id", $this->appId)
            ->where("type", 4)
            ->whereTime("add_time", $whereTime)
            ->order("num desc,tongji_id desc")
            ->limit(0, 10)->select();
        $ExampleTop10Ids =  $title = [];
        foreach ($ExampleTop10 as $val) {
            $title[] = $val->title;
            $ExampleTop10Ids[$val->resource_id] = $val->resource_id;
        }
        $ExampleTop10Idsin = empty($ExampleTop10Ids) ? "" : $ExampleTop10Ids ;

        $TongJiModelaa = $TongJiModel->where("type",4)->whereIn("resource_id", $ExampleTop10Idsin)->select();

        $tongjiNum = [
            'weixin' => [
                'data' => [],
            ],
            'baidu' =>  [
                'data' => [],
            ],
            'toutiao' => [
                'data' => [],
            ],
            'h5'   => [
                'data' => [],
            ],
            'ali'  => [
                'data' => [],
            ],
        ];
        $_tongjiNum = 0;
        if (!empty($TongJiModelaa)) {
            foreach ($TongJiModelaa as $val) {
                if (empty($tongjiNum[$val->device])) {
                    $tongjiNum[$val->device] = [];
                }
                if (empty($tongjiNum[$val->device][$val->resource_id])) {
                    $tongjiNum[$val->device][$val->resource_id] = 1;
                } else {
                    $tongjiNum[$val->device][$val->resource_id] = $tongjiNum[$val->device][$val->resource_id] + 1;
                }
            }

            foreach ($ExampleTop10Ids as $val){
                foreach ($tongjiNum as $k=>$v){
                    $tongjiNum[$k]['data'][] = empty($tongjiNum[$k][$val]) ? 0 : $tongjiNum[$k][$val];
                }

            }
            $_tongjiNum = [];
            foreach ($tongjiNum as $key=>$val){
                $_tongjiNum[$key] = $val['data'];
            }
        }

        $this->datas = [
            'title' => $title,
            'count' => $_tongjiNum,
            'ExampleTop10Ids' => $ExampleTop10Ids,
        ];


    }



    public function getHotProduct()
    {
        $timearea = (int) $this->request->param('timearea',1);
        $timeTrance = [
            1 => '-3 days',
            2 => '-7 days',
            3 => '-15 days',
            4 => '-30 days',
        ];
        $whereTime = [];
        if (isset($timeTrance[$timearea])) {
            $whereTime = $timeTrance[$timearea];
        }

        $TongJiModel = new TongJiModel();
        $ProductTop10 = $TongJiModel->field("title,count(resource_id) as num,resource_id")
            ->group("resource_id")
            ->where("app_id", $this->appId)
            ->where("type", 1)
            ->whereTime("add_time", $whereTime)
            ->order("num desc,tongji_id desc")
            ->limit(0, 10)->select();
        $ProductTop10Ids =  $title = [];
        foreach ($ProductTop10 as $val) {
            $title[] = $val->title;
            $ProductTop10Ids[$val->resource_id] = $val->resource_id;
        }

        $ProductTop10Tdsin = empty($ProductTop10Ids) ? '' : $ProductTop10Ids;

        $TongJiModelaa = $TongJiModel->where("type",1)->whereIn("resource_id", $ProductTop10Tdsin)->select();
        $tongjiNum = [
            'weixin' => [
                'data' => [],
            ],
            'baidu' =>  [
                'data' => [],
            ],
            'toutiao' => [
                'data' => [],
            ],
            'h5'   => [
                'data' => [],
            ],
            'ali'  => [
                'data' => [],
            ],
        ];
        $_tongjiNum = 0;
        if (!empty($TongJiModelaa)) {
            foreach ($TongJiModelaa as $val) {
                if (empty($tongjiNum[$val->device])) {
                    $tongjiNum[$val->device] = [];
                }
                if (empty($tongjiNum[$val->device][$val->resource_id])) {
                    $tongjiNum[$val->device][$val->resource_id] = 1;
                } else {
                    $tongjiNum[$val->device][$val->resource_id] = $tongjiNum[$val->device][$val->resource_id] + 1;
                }
            }


            foreach ($ProductTop10Ids as $val){
                foreach ($tongjiNum as $k=>$v){
                    $tongjiNum[$k]['data'][] = empty($tongjiNum[$k][$val]) ? 0 : $tongjiNum[$k][$val];
                }
            }
            $_tongjiNum = [];
            foreach ($tongjiNum as $key=>$val){
                $_tongjiNum[$key] = $val['data'];
            }
        }

        $this->datas = [
            'title' => $title,
            'count' => $_tongjiNum,
            'ProductTop10Ids' => $ProductTop10Ids,
        ];

    }


    public function getHotNews() {
        $timearea = (int) $this->request->param('timearea',1);
        $timeTrance = [
            1 => '-3 days',
            2 => '-7 days',
            3 => '-15 days',
            4 => '-30 days',
        ];
        $whereTime = [];
        if (isset($timeTrance[$timearea])) {
            $whereTime = $timeTrance[$timearea];
        }

        $TongJiModel = new TongJiModel();
        $NewsTop10 = $TongJiModel->field("title,count(resource_id) as num,resource_id")
            ->group("resource_id")
            ->where("app_id", $this->appId)
            ->where("type", 2)
            ->whereTime("add_time", $whereTime)
            ->order("num desc,tongji_id desc")
            ->limit(0, 10)->select();
        $NewsTop10Ids =  $title = [];
        foreach ($NewsTop10 as $val) {
            $title[] = $val->title;
            $NewsTop10Ids[$val->resource_id] = $val->resource_id;
        }
        $whereNewsTop10Ids = empty($NewsTop10Ids) ? '' : $NewsTop10Ids;
        $TongJiModelaa = $TongJiModel->where("type",2)->whereIn("resource_id", $whereNewsTop10Ids)->select();
        $tongjiNum = [
            'weixin' => [
                'data' => [],
            ],
            'baidu' =>  [
                'data' => [],
            ],
            'toutiao' => [
                'data' => [],
            ],
            'h5'   => [
                'data' => [],
            ],
            'ali'  => [
                'data' => [],
            ],
        ];
        $_tongjiNum = 0;
        if (!empty($TongJiModelaa)) {
            foreach ($TongJiModelaa as $val) {
                if (empty($tongjiNum[$val->device])) {
                    $tongjiNum[$val->device] = [];
                }
                if (empty($tongjiNum[$val->device][$val->resource_id])) {
                    $tongjiNum[$val->device][$val->resource_id] = 1;
                } else {
                    $tongjiNum[$val->device][$val->resource_id] = $tongjiNum[$val->device][$val->resource_id] + 1;
                }
            }

            foreach ($NewsTop10Ids as $val){
                foreach ($tongjiNum as $k=>$v){
                    $tongjiNum[$k]['data'][] = empty($tongjiNum[$k][$val]) ? 0 : $tongjiNum[$k][$val];
                }

            }
            $_tongjiNum = [];
            foreach ($tongjiNum as $key=>$val){
                $_tongjiNum[$key] = $val['data'];
            }
        }

        $this->datas = [
            'title' => $title,
            'count' => $_tongjiNum,
            'NewsTop10Ids' => $NewsTop10Ids,
        ];
    }



    public function getHotBusiness() {
        $timearea = (int) $this->request->param('timearea',1);
        $timeTrance = [
            1 => '-3 days',
            2 => '-7 days',
            3 => '-15 days',
            4 => '-30 days',
        ];
        $whereTime = [];
        if (isset($timeTrance[$timearea])) {
            $whereTime = $timeTrance[$timearea];
        }

        $TongJiModel = new TongJiModel();
        $BusinessTop10 = $TongJiModel->field("title,count(resource_id) as num,resource_id")
            ->group("resource_id")
            ->where("app_id", $this->appId)
            ->where("type", 3)
            ->whereTime("add_time", $whereTime)
            ->order("num desc,tongji_id desc")
            ->limit(0, 10)->select();
        $BusinessTop10Ids =  $title = [];
        foreach ($BusinessTop10 as $val) {
            $title[] = $val->title;
            $BusinessTop10Ids[$val->resource_id] = $val->resource_id;
        }
        $BusinessTop10Ids = empty($BusinessTop10Ids) ? '' : $BusinessTop10Ids;
        $TongJiModelaa = $TongJiModel->where("type",3)->whereIn("resource_id", $BusinessTop10Ids)->select();
        $tongjiNum = [
            'weixin' => [
                'data' => [],
            ],
            'baidu' =>  [
                'data' => [],
            ],
            'toutiao' => [
                'data' => [],
            ],
            'h5'   => [
                'data' => [],
            ],
            'ali'  => [
                'data' => [],
            ],
        ];
        $_tongjiNum = 0;
        if (!empty($TongJiModelaa)) {
            foreach ($TongJiModelaa as $val) {
                if (empty($tongjiNum[$val->device])) {
                    $tongjiNum[$val->device] = [];
                }
                if (empty($tongjiNum[$val->device][$val->resource_id])) {
                    $tongjiNum[$val->device][$val->resource_id] = 1;
                } else {
                    $tongjiNum[$val->device][$val->resource_id] = $tongjiNum[$val->device][$val->resource_id] + 1;
                }
            }

            foreach ($BusinessTop10Ids as $val){
                foreach ($tongjiNum as $k=>$v){
                    $tongjiNum[$k]['data'][] = empty($tongjiNum[$k][$val]) ? 0 : $tongjiNum[$k][$val];
                }

            }
            $_tongjiNum = [];
            foreach ($tongjiNum as $key=>$val){
                $_tongjiNum[$key] = $val['data'];
            }
        }

        $this->datas = [
            'title' => $title,
            'count' => $_tongjiNum,
            'BusinessTop10Ids' => $BusinessTop10Ids,
        ];
    }



    public function getDevices() {
        $timearea = (int) $this->request->param('timearea',1);
        $timeTrance = [
            1 => '-3 days',
            2 => '-7 days',
            3 => '-15 days',
            4 => '-30 days',
        ];
        $whereTime = [];
        if (isset($timeTrance[$timearea])) {
            $whereTime = $timeTrance[$timearea];
        }

        $TongJiModel = new TongJiModel();

        $TongJiModelaa = $TongJiModel->whereTime('add_time',$whereTime)
                                     ->where('app_id',$this->appId)
                                     ->field('device,count(tongji_id) as num')
                                     ->group('device')
                                     ->select();
        $list = [];
        $deviceTrance = [
            'h5' => 'h5',
            'weixin' => '微信小程序',
            'ali' => '支付宝小程序',
            'baidu' => '百度小程序',
            'toutiao' => '头条小程序'];
        foreach ($TongJiModelaa as $v) {
            if(!empty($v->device)){
                $list[] = [
                    'title' => $deviceTrance[$v->device],
                    'views' => $v->num,
                ];
            }
        }

        $this->datas = $list;
    }




}

