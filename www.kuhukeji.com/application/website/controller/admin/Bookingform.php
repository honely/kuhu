<?php

namespace app\website\controller\admin;


use app\website\model\website\BookingDataModel;
use app\website\model\website\BookingformModel;

class Bookingform extends Common
{
    public function create(){
        $BookingformModel = new BookingformModel();
        $res = $BookingformModel->setData($BookingformModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($BookingformModel->getError());
        }
    }

    public function edit(){
        $form_id = (int)$this->request->param("form_id");
        $BookingformModel = new BookingformModel();
        if (!$detail = $BookingformModel->find($form_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $res = $BookingformModel->setData($BookingformModel->dataFilter($this->appId), $form_id);
        if ($res === false) {
            $this->warning($BookingformModel->getError());
        }
    }

    public function del()
    {
        $form_id = (int)$this->request->param("form_id");
        $BookingformModel = new BookingformModel();
        if (!$detail = $BookingformModel->find($form_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $BookingformModel->where("form_id", $form_id)->delete();
    }

    public function detail()
    {
        $form_id = (int)$this->request->param("form_id");
        $BookingformModel = new  BookingformModel();
        if (!$detail = $BookingformModel->find($form_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'form_id' => $detail->form_id,
            'title' => $detail->title,
            'details' => $detail->details,
            'booking_num' => $detail->booking_num,
        ];
    }

    public function index()
    {
        $BookingformModel = new BookingformModel();
        $where['app_id'] = $this->appId;
        $title = (string)$this->request->param("title");
        if (!empty($title)) {
            $where["title"] = ["LIKE", "%{$title}%"];
        }
        $list = $BookingformModel->where($where)->order("form_id desc")->page($this->page, $this->limit)->select();
        $count = $BookingformModel->where($where)->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'form_id' => $val->form_id,
                'title' => $val->title,
                'details' => $val->details,
                'booking_num' => $val->booking_num,
                'add_time' => date("Y-m-d H:i:s",$val->add_time),
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    /**
     *  万能表单提交的数据
     */
    public function getBookingData() {
        $form_id = (int) $this->request->param('form_id',0);
        $BookingformModel = new BookingformModel();
        if (!$form = $BookingformModel->find($form_id)) {
            $this->warning('参数不正确！');
        }

        $form = json_decode($form['details']);
        $datas = [];
        foreach ($form->formContent as $v) {
            if ($v->type == 'select') {
                $datas['select'][$v->name] = $v->opt;
            }
            if ($v->type == 'radio') {
                $datas['radio'][$v->name] = $v->opt;
            }
            if ($v->type == 'checkbox') {
                $datas['checkbox'][$v->name] = $v->opt;
            }
        }

        $BookingDataModel = new BookingDataModel();
        $where = [
            'app_id' => $this->appId,
            'form_id' => $form_id,
        ];
        $listTmp = $BookingDataModel->where($where)->page($this->page,$this->limit)->select();
        $count = $BookingDataModel->where($where)->count();
        $list = [];
        foreach ($listTmp as $v) {
            $detail_tmp = json_decode($v->details,true);
            foreach ($detail_tmp as $vvv) {
                foreach ($vvv as $kkkk=>$vvvv) {
                    $detail[$kkkk] = $vvvv;
                }
            }

            foreach ($datas as $kk=>$vv) {
                foreach ($detail as $kkk => $vvv) {
                    foreach ($vv as $kkkk => $vvvv) {
                        $_tmp = [];
                        $__tmp = '';
                        if ($kkkk == $kkk) {
                            if ($kk == 'checkbox') {
                                $value = json_decode($vvv, true);
                                foreach ($value as $vvvvv) {
                                    $_tmp[] = $vvvv[$vvvvv];
                                }
                                $detail[$kkk] = $_tmp;
                            } elseif ($kk == 'radio' || $kk == 'select') {
                                $__tmp = $vvvv[$vvv];
                                $detail[$kkk] = $__tmp;
                            }
                        }
                    }
                }
            }

            $list[] = [
                'form_id' => $v->form_id,
                'booking_id' => $v->booking_id,
                'details' => $detail,
                'add_time' => date("Y-m-d H:i:s",$v->add_time),
            ];

        }

        $this->datas = [
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }

}
