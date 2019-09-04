<?php

namespace app\website\controller\admin\resource;

use app\website\controller\admin\Common;
use app\common\model\resource\AppResourceModel as ResourceModel;
use app\common\model\resource\AppCategoryModel as CategoryModel;


class Resource extends Common
{

    public function create()
    {
        $ResourceModel = new ResourceModel();
        $res = $ResourceModel->setData($ResourceModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($ResourceModel->getError());
        }

    }


    public function del()
    {
        $resource_id = (int)$this->request->param("resource_id");
        $ResourceModel = new ResourceModel();
        if (!$detail = $ResourceModel->find($resource_id)) {
            $this->warning("不存在数据");
        }

        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }

        if ($detail->is_delete == 1) {
            $this->warning("不存在数据");
        }

        $ResourceModel->where("resource_id", $resource_id)->delete();
    }


    public function index()
    {
        $ResourceModel = new ResourceModel();
        $where['app_id'] = $this->appId;
        $category_id = (int)$this->request->param("category_id", -1);
        if ($category_id >= 0) {
            $where["category_id"] = $category_id;
        }
        $title = (string)$this->request->param("title");
        if (!empty($title)) {
            $where["title"] = ["LIKE", "%{$title}%"];
        }
        $where['is_delete'] = 0;
        $list = $ResourceModel->where($where)->order("resource_id desc")->page($this->page, $this->limit)->select();
        $count = $ResourceModel->where($where)->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'resource_id' => $val->resource_id,
                'category_id' => $val->category_id,
                'photo' => $val->photo,
                'size' => $val->size,
                'title' => $val->title,
                'w' => $val->w,
                'h' => $val->h,
                'is_delete' => false,
                'is_delete1' => false,
                'is_delete2' => false,
                'is_delete_lod' => false,
                'is_delete_lod1' => false,
                'is_delete_lod2' => false,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }

    /**
     * 批量上传图片
     */
    public function createAll()
    {
        $ResourceModel = new ResourceModel();
        $where['app_id'] = $this->appId;
        $category_id = (int)$this->request->param("category_id");
        if (!empty($category_id)) {
            $CategoryModel = new CategoryModel();
            if ($cat = $CategoryModel->find($category_id)) {
                $this->warning("参数错误");
            }
            if ($cat->app_id != $this->appId) {
                $this->warning("参数错误");
            }
        }
        $datasStr = (string)$this->request->param("datas", 'SecurityEditorHtml');
        $data = json_decode($datasStr);
        if (empty($data)) {
            $this->warning("请上传图片");
        }
        if (count($data) > 10) $this->warning("单次最大10个文件");
        $saveDatas = [];
        foreach ($data as $val) {
            if (empty($val['photo'])) {
                $this->warning("上传失败");
            }
            $saveDatas[] = [
                'category_id' => $category_id,
                'photo' => $val->photo,
                'size' => $val->size,
                'title' => empty($val->title) ? '未定义页面' : $val->title,
                'w' => $val->w,
                'h' => $val->h,
            ];
        }
        $ResourceModel->saveAll($saveDatas);
    }


    /**
     * 修改分组
     */
    public function editCat()
    {
        $id = (int)$this->request->param("id");
        $ids = (array)$this->request->param("ids/a");
        if (empty($id) && empty($ids)) {
            return;
        }
        $where['app_id'] = $this->appId;
        if (!empty($ids)) {
            $where['resource_id'] = ["IN", $ids];
        }
        if (!empty($id)) {
            $where['resource_id'] = $id;
        }
        $ResourceModel = new ResourceModel();
        $cat_id = (int)$this->request->param("cat_id");
        $CategoryModel = new CategoryModel();
        if (!$cat = $CategoryModel->find($cat_id)) {
            $this->warning("请选择分组");
        }
        if ($cat->app_id != $this->appId) {
            $this->warning("请选择分组");
        }
        $ResourceModel->save([
            'category_id' => $cat_id,
        ],$where);

    }

    /**
     * 修改名称
     */
    public function editName()
    {
        $id = (int) $this->request->param("id");
        $name = (string) $this->request->param("name");
        if(empty($name)){
            $this->warning();
        }
        $ResourceModel = new ResourceModel();
        if(!$detail = $ResourceModel->find($id)){
            $this->warning();
        }
        if($detail->app_id != $this->appId){
            $this->warning();
        }
        $ResourceModel->save(['title'=>$name],['resource_id'=>$id]);
    }

    /**
     * 删除图片
     */
    public function delete()
    {
        $id = (int)$this->request->param("id");
        $ids = (array)$this->request->param("ids/a");
        if (empty($id) && empty($ids)) {
            return;
        }
        $where['app_id'] = $this->appId;
        if (!empty($ids)) {
            $where['resource_id'] = ["IN", $ids];
        }
        if (!empty($id)) {
            $where['resource_id'] = $id;
        }

        $ResourceModel = new ResourceModel();
        $ResourceModel->save(['is_delete' => 1,],$where);
    }

}

