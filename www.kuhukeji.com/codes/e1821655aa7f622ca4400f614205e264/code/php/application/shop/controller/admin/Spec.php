<?php

namespace app\shop\controller\admin;


use app\shop\model\shop\GoodstypeModel;
use app\shop\model\shop\SpecItemModel;
use app\shop\model\shop\SpecModel;

class Spec extends Common
{
    public function create()
    {
        $SpecModel = new SpecModel();
        $res = $SpecModel->setData($SpecModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($SpecModel->getError());
        }
    }

    public function edit()
    {
        $spec_id = (int)$this->request->param("spec_id");
        $SpecModel = new SpecModel();
        if (!$detail = $SpecModel->find($spec_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $res = $SpecModel->setData($SpecModel->dataFilter($this->appId), $spec_id);
        if ($res === false) {
            $this->warning($SpecModel->getError());
        }
    }

    public function del()
    {
        $spec_id = (int)$this->request->param("spec_id");
        $SpecModel = new SpecModel();
        if (!$detail = $SpecModel->find($spec_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $SpecItemModel = new SpecItemModel();
        $SpecItemModel->where("spec_id", $spec_id)->delete();
        $SpecModel->where("spec_id", $spec_id)->delete();
    }


    public function index()
    {
        $SpecModel = new SpecModel();
        $where['app_id'] = $this->appId;
        $type_id = (int)$this->request->param("type_id");
        if (!empty($type_id)) {
            $where["type_id"] = $type_id;
        }
        $list = $SpecModel->where($where)->order("spec_id desc")->page($this->page, $this->limit)->select();
        $count = $SpecModel->where($where)->count();
        $datas = $specIds = [];
        foreach ($list as $val) {
            $datas[] = [
                'spec_id' => $val->spec_id,
                'type_id' => $val->type_id,
                'name' => $val->name,
                'orderby' => $val->orderby,
            ];
            $specIds[] = $val->spec_id;
        }
        $items = $SpecModel->getSpecItemByIds($specIds);
        foreach ($datas as &$val) {
            $val['item'] = empty($items[$val['spec_id']]) ? "" : $items[$val['spec_id']];
        }
        unset($val);
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }

    /**
     * 获取详情
     */
    public function getSpecDetail(){
        $type_id = (int)$this->request->param("type_id");
        $GoodstypeModel = new GoodstypeModel();
        if(!$type = $GoodstypeModel->find($type_id)){
            $this->warning();
        }
        if($type->app_id != $this->appId){
            $this->warning();
        }
        $SpecModel = new SpecModel();
        $list = $SpecModel->where("type_id",$type_id)->order("spec_id desc")->select();
        $datas = $specIds = [];
        foreach ($list as $val) {
            $datas[] = [
                'spec_id' => $val->spec_id,
                'name' => $val->name,
                'orderby' => $val->orderby,
            ];
            $specIds[] = $val->spec_id;
        }
        $items = $SpecModel->getSpecItemByIds($specIds);
        foreach ($datas as &$val) {
            $val['item'] = empty($items[$val['spec_id']]) ? "" : $items[$val['spec_id']];
        }
      $this->datas['detail'] = $datas;
    }
}
