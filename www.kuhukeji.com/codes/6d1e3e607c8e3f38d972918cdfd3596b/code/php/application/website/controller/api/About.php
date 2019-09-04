<?php
namespace app\website\controller\api;

use app\website\model\website\BookingDataModel;
use app\website\model\website\BookingformModel;
use app\website\model\website\DevelopModel;
use app\website\model\website\MessageModel;
use app\website\model\website\RecruitModel;
use app\website\model\website\SettingModel;

class About extends WebsiteCommon {

    /**
     * 获得发展历程
     * @param int $category_id  分类ID
     * @return array  查询结果
     */
    public function develop() {
        $DevelopModel = new DevelopModel();
        $where['app_id'] = $this->appId;
        $listTmp = $DevelopModel->where($where)->order('develop_id desc')->select();
        $list = [];
        foreach ($listTmp as $v) {
            $list[] = [
                'develop_id' => (int)$v->develop_id,
                'title' => (string)$v->title,
                'detail' => (string)$v->detail,
                'date' => (string)$v->date,
            ];
        }

        $this->datas = [
            'list' => $list,
            'isMore' => (int)($this->limit == count($list)),
            'seo' => $this->default_seo,
        ];

    }


    public function about() {
        $SettingModel = new SettingModel();
        if (!$detail = $SettingModel->find($this->appId)) {
            $this->warning('小程序基础信息尚未设置！');
        }
        $datas = [
            'company_name' => (string)$detail->company_name,
            'banner' => json_decode($detail->banner) ? json_decode($detail->banner, true) : [],
            'introduce' => json_decode($detail->introduce) ? json_decode($detail->introduce, true) : [],
            'address' => (string)$detail->address,
            'lat' => (string)$detail->lat,
            'lng' => (string)$detail->lng,
            'tel' => (string)$detail->tel,
            'mobile' => (string)$detail->mobile,
            'fax' => (string)$detail->fax,
            'email' => (string)$detail->email,
            'qrcode' => (string)$detail->qrcode,
            'seo' => $this->default_seo,
        ];
        $this->datas = $datas;

    }


    /**
     * 获得人才招聘
     */
    public function recruit() {
        $RecruitModel = new RecruitModel();
        $where['app_id'] = $this->appId;
        $listTmp = $RecruitModel->where($where)->order('recruit_id desc')->select();
        $list = [];
        foreach ($listTmp as $v) {
            $list[] = [
                'recruit_id' => (int)$v->recruit_id,
                'title' => (string)$v->title,
                'working_place' => (string)$v->working_place,
                'experience' => (string)$v->experience,
                'education' => (string)$v->education,
                'salary' => (string)$v->salary,
                'detail' => (array) json_decode($v->detail,true),
                'qualify' => (array) json_decode($v->qualify,true) ,
                'welfare' => (array) json_decode($v->welfare,true) ,
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
     * 获得人才招聘
     */
    public function recruitDetail() {
        $recruit_id = (int) $this->request->param('recruit_id',0);
        $RecruitModel = new RecruitModel();
        $where['app_id'] = $this->appId;
        if ($detail = $RecruitModel->where($where)->find($recruit_id)) {
            $this->warning('参数不正确');
        }
        $RecruitModel->where(['recruit_id'=>$recruit_id])->setInc('recruit_id',1);

        $datas[] = [
            'recruit_id' => (int)$detail->recruit_id,
            'title' => (string)$detail->title,
            'working_place' => (string)$detail->working_place,
            'experience' => (string)$detail->experience,
            'education' => (string)$detail->education,
            'salary' => (string)$detail->salary,
            'detail' => json_decode($detail->detail) ? json_decode($detail->detail,true) : [],
            'qualify' => json_decode($detail->qualify) ? json_decode($detail->qualify,true) : [],
            'welfare' => json_decode($detail->welfare) ? json_decode($detail->welfare,true) : [],
            'views' => (int) $detail->views,
            'seo' => $this->default_seo,
        ];


        $this->datas = $datas;
    }



    /**
     * 提交留言
     */
    public function subMessage() {
        $MessageModel = new MessageModel();
        $res = $MessageModel->setData($MessageModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($MessageModel->getError());
        }
    }


    /**
     * 获取万能表单
     */
    public function getWnForm() {
        $BookingformModel = new BookingformModel();
        $formsTmp = $BookingformModel->where(['app_id'=>$this->appId])->select();
        $list = [];
        foreach ($formsTmp as $v) {
            $list[] = [
                'form_id' => $v->form_id,
                'title' => $v->title,
                'details' => json_decode($v->details) ? json_decode($v->details, true) : '',
                'views' => (int) $v->views,
            ];
        }
        $this->datas = [
            'list' => $list,
            'isMore' => (int)($this->limit == count($list)),
        ];
    }


    /**
     * 获取指定万能表单
     */
    public function getWnFormById() {
        $form_id = (int) $this->request->param('form_id');
        $BookingformModel = new BookingformModel();
        if (!$detail = $BookingformModel->find($form_id)) {
            $this->warning('参数错误！');
        }
        if ($detail->app_id != $this->appId) {
            $this->warning('参数错误！');
        }
        $BookingformModel->where(['form_id'=>$form_id])->setInc('views',1);
        $datas = [
            'form_id' => $detail->form_id,
            'title' => $detail->title,
            'details' => json_decode($detail->details) ? json_decode($detail->details, true) : '',
            'views' => (int) $detail->views,
        ];

        $this->datas = $datas;
    }


    /**
     * 万能表单提交留言
     */
    public function subWnForm() {
        $BookingDataModel = new BookingDataModel();
        $BookingformModel = new BookingformModel();
        $form_id = (int) $this->request->param('form_id',0);
        $dataStr    = (string) $this->request->param('details','','SecurityEditorHtml');
        $data = (array)  json_decode($dataStr);
        if(empty($data)){
            $this->warning();
        }
        if (!$detail = $BookingformModel->find($form_id)) {
            $this->warning('参数不正确');
        }

        if ($detail->app_id != $this->appId) {
            $this->warning('参数不正确');
        }
        $init_form = json_decode($detail->details);
        if(count($data) != count($init_form->formContent)){
            $this->warning("参数错误");
        }
        $data_form = [];
        foreach ($data as $val){
            $data_form[] = $val->subvalue;
        }
        $form = [];
        foreach ($init_form->formContent as $key=>$val){
            if($val->must == 1 && empty($data_form[$key])){
                $this->warning("{$val->name}不能为空");
            }
            $form[] = [$val->name=>$data_form[$key]];
        }
        $datas = [
            'form_id' => $form_id,
            'app_id' => $this->appId,
            'details' => json_encode($form,256),
        ];
        $res = $BookingDataModel->save($datas);
        if ($res == false) {
            $this->warning($BookingDataModel->getError());
        }
    }

}
