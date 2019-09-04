<?php
namespace app\admin\controller\resource;

use app\admin\controller\Common;
use app\common\model\resource\FooterIconModel;


class Footericon extends Common
{
    //icon列表
    public function Index() {
        $title = (string) $this->request->param('title');
        $where = [];
        if ($title) {
            $where['title'] = ['like',"%$title%"];
        }
        $FooterIconModel = new FooterIconModel();
        $listTmp = $FooterIconModel->where($where)->order("icon_id desc")->page($this->page,$this->limit)->select();
        $count = $FooterIconModel->where($where)->count();

        $list = [];
        foreach ($listTmp as $v) {
            $list[] = [
                'icon_id' => (int) $v->icon_id,
                'title' => (string) $v->title,
                'unchecked' => (string) $v->unchecked,
                'checked' => (string) $v->checked,
                'orderby' => (int) $v->orderby,
            ];
        }

        $this->datas = [
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    public function create()
    {
        $FooterIconModel = new FooterIconModel();
        $res = $FooterIconModel->setData($FooterIconModel->dataFilter());
        if ($res == false) {
            $this->warning($FooterIconModel->getError());
        }
    }

    public function edit()
    {
        $icon_id = (int)$this->request->param("icon_id");
        $FooterIconModel = new FooterIconModel();
        if (!$detail = $FooterIconModel->find($icon_id)) {
            $this->warning("不存在数据");
        }
        $res = $FooterIconModel->setData($FooterIconModel->dataFilter(), $icon_id);
        if ($res == false) {
            $this->warning($FooterIconModel->getError());
        }
    }

    public function del()
    {
        $icon_id = (int)$this->request->param("icon_id");
        $FooterIconModel = new FooterIconModel();
        if (!$detail = $FooterIconModel->find($icon_id)) {
            $this->warning("不存在数据");
        }
        $FooterIconModel->where("icon_id", $icon_id)->delete();
    }

    public function detail()
    {
        $icon_id = (int)$this->request->param("icon_id");
        $FooterIconModel = new  FooterIconModel();
        if (!$detail = $FooterIconModel->find($icon_id)) {
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'icon_id' => (int)$detail->icon_id,
            'title' => (string)$detail->title,
            'checked' => (string)$detail->checked,
            'unchecked' => (string)$detail->unchecked,
            'orderby' => (int)$detail->orderby,
        ];
    }

    public function delete()
    {
        $icon_id = (int)$this->request->param("icon_id",0);
        $iconIds = (string)$this->request->param("iconIds");
        $iconIds = json_decode($iconIds,true) ? json_decode($iconIds,true) : [];

        if ($icon_id && empty($iconIds)) {
            $iconIds[$icon_id] = $icon_id;
        }
        $FooterIconModel = new  FooterIconModel();
        $FooterIconModel->where(['icon_id'=>['in',$iconIds]])->delete();

    }


}
