<?php

namespace app\shop\controller\admin;


use app\shop\model\shop\AttributeModel;
use app\shop\model\shop\GoodstypeModel;
use app\shop\model\shop\SpecItemModel;
use app\shop\model\shop\SpecModel;

class Goodstype extends Common
{

    public function create()
    {
        $GoodstypeModel = new GoodstypeModel();
        $count = $GoodstypeModel->where("app_id", $this->appId)->count();
        $maxNum = config("limitnum.app_shop_goods_type_num");
        if ($count > $maxNum) {
            $this->warning("您最多添加{$maxNum}个商品类型");
        }
        $res = $GoodstypeModel->setData($GoodstypeModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($GoodstypeModel->getError());
        }
    }

    public function edit()
    {
        $type_id = (int)$this->request->param("type_id");
        $GoodstypeModel = new GoodstypeModel();
        if (!$detail = $GoodstypeModel->find($type_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $res = $GoodstypeModel->setData($GoodstypeModel->dataFilter($this->appId), $type_id);
        if ($res === false) {
            $this->warning($GoodstypeModel->getError());
        }
    }

    public function del()
    {
        $type_id = (int)$this->request->param("type_id");
        $GoodstypeModel = new GoodstypeModel();
        if (!$detail = $GoodstypeModel->find($type_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $GoodstypeModel->where("type_id", $type_id)->delete();
        //删除产品规格
        $SpecModel = new SpecModel();
        $spec = $SpecModel->where("type_id", $type_id)->delete();
        $specIds = [];
        foreach ($spec as $val) {
            $specIds[] = $val->spec_id;
        }
        $SpecItemModel = new SpecItemModel();
        $SpecItemModel->whereIn("spec_id", $specIds)->delete();
        $SpecModel->where("type_id", $type_id)->delete();
        //删除产品属相
        $AttributeModel = new AttributeModel();
        $AttributeModel->where("type_id", $type_id)->delete();
    }



    public function index()
    {
        $GoodstypeModel = new GoodstypeModel();
        $where['app_id'] = $this->appId;
        $name = (string)$this->request->param("name");
        if (!empty($name)) {
            $where["name"] = ["LIKE", "%{$name}%"];
        }
        $maxNum = config("limitnum.app_shop_goods_type_num");
        $list = $GoodstypeModel->where($where)->order("type_id desc")->page(1, $maxNum)->select();
        $count = $GoodstypeModel->where($where)->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'type_id' => $val->type_id,
                'name' => $val->name,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }





}
