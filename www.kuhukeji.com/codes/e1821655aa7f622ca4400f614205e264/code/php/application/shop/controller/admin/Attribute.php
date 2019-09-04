<?php

namespace app\shop\controller\admin;

use app\shop\model\app\AppThemeModel;
use app\shop\model\shop\AttributeModel;
use app\shop\model\shop\GoodstypeModel;

class Attribute extends Common
{
    public function create()
    {
        $AttributeModel = new AttributeModel();
        $res = $AttributeModel->setData($AttributeModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($AttributeModel->getError());
        }
    }

    public function edit()
    {
        $attr_id = (int)$this->request->param("attr_id");
        $AttributeModel = new AttributeModel();
        if (!$detail = $AttributeModel->find($attr_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $res = $AttributeModel->setData($AttributeModel->dataFilter($this->appId), $attr_id);
        if ($res === false) {
            $this->warning($AttributeModel->getError());
        }
    }

    public function del()
    {
        $attr_id = (int)$this->request->param("attr_id");
        $AttributeModel = new AttributeModel();
        if (!$detail = $AttributeModel->find($attr_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $AttributeModel->where("attr_id", $attr_id)->delete();
    }

    public function index(){
        $AttributeModel = new AttributeModel();
        $where['app_id'] = $this->appId;
        $type_id = (int)$this->request->param("type_id");
        if (!empty($type_id)) {
            $where["type_id"] = $type_id;
        }
        $list = $AttributeModel->where($where)->order("attr_id desc")->page($this->page, $this->limit)->select();
        $count = $AttributeModel->where($where)->count();
        $datas = [];
        $mean = getMean("shop_attr_input_type");
        foreach ($list as $val) {
            $datas[] = [
                'attr_id' => $val->attr_id,
                'attr_name' => $val->attr_name,
                'type_id' => $val->type_id,
                'attr_input_type' => $val->attr_input_type,
                'attr_input_type_mean' => empty($mean[$val->attr_input_type]) ? '' :  $mean[$val->attr_input_type],
                'attr_values' => (array) json_decode($val->attr_values, true),
                'orderby' => $val->orderby,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }

    public function getTypeAttr(){
        $type_id = (int)$this->request->param("type_id");
        $GoodstypeModel = new  GoodstypeModel();
        if (!$detail = $GoodstypeModel->find($type_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $AttributeModel = new AttributeModel();
        $attr =  $AttributeModel->where("type_id",$type_id)->order("orderby desc")->select();
        $datas = [];
        foreach ($attr as $val){
            $datas[] = [
                'attr_id' => $val->attr_id,
                'attr_name' => $val->attr_name,
                'attr_input_type' => $val->attr_input_type,
                'attr_values' =>  json_decode($val->attr_values),
            ];
        }
        $this->datas["list"] = $datas;
    }

}

