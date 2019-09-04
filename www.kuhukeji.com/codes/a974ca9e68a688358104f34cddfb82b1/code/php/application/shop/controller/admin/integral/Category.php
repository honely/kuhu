<?php
namespace app\shop\controller\admin\integral;

use app\shop\controller\admin\Common;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\IntegralCategoryModel;

class Category extends Common{


    /**
     *  积分商品分类列表
     */
    public function categoryList(){
        $IntegralCategoryModel = new IntegralCategoryModel();
        $listTmp = $IntegralCategoryModel->where("app_id",$this->appId)->order("orderby desc")->page($this->page,$this->limit)->select();
        $count = $IntegralCategoryModel->where("app_id",$this->appId)->count();
        $list = [];
        foreach ( $listTmp as $val){
            $list[] = [
                'cat_id' => $val->cat_id,
                'name' => $val->name,
                'is_show' => $val->is_show,
                //'is_hot' => $val->is_hot,
                'orderby' => $val->orderby,
            ];

        }

        $this->datas = [
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit
        ];
    }

    /**
     * 修改商品分类
     */
    public function categoryEdit(){
        $cat_id = (int)$this->request->param("cat_id");
        $IntegralCategoryModel = new IntegralCategoryModel();

        if (!$detail = $IntegralCategoryModel->find($cat_id)) {
            $this->warning("不存在数据");
        }

        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }

        $res = $IntegralCategoryModel->setData($IntegralCategoryModel->dataFilter($this->appId), $cat_id);
        if ($res === false) {
            $this->warning($IntegralCategoryModel->getError());
        }
    }

    /**
     * 添加商品分类
     */
    public function categoryCreate()
    {
        $cat_limit = config('limitnum.app_shop_integral_category');
        $IntegralCategoryModel = new IntegralCategoryModel();
        if ($IntegralCategoryModel->where(['app_id' => $this->appId])->count() >= $cat_limit) {
            $this->warning("当前应用已超过最大创建分类数限制");
        }
        $res = $IntegralCategoryModel->setData($IntegralCategoryModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($IntegralCategoryModel->getError());
        }
    }


    /**
     * 删除商品分类
     */
    public function categoryDel()
    {
        $cat_id = (int)$this->request->param('cat_id');
        $IntegralCategoryModel = new IntegralCategoryModel();
        if (!$detail = $IntegralCategoryModel->find($cat_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }

        $GoodsModel = new GoodsModel();
        if ($GoodsModel->where(['cat_id' => $cat_id, 'app_id' => $this->appId])->count() > 0) {
            $this->warning("当前分类下存在商品,必须删除当前分类下的商品才能删除当前分类");
        }
        $IntegralCategoryModel->where(['cat_id' => $cat_id])->delete();
    }








}
