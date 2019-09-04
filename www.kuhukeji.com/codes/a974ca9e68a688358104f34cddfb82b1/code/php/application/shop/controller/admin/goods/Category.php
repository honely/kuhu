<?php
namespace app\shop\controller\admin\goods;

use app\shop\controller\admin\Common;
use app\shop\model\shop\GoodscategoryModel;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\IntegralCategoryModel;

class Category extends Common{


    /**
     *  商品分类列表
     */
    public function categoryList(){
        $GoodscategoryModel = new GoodscategoryModel();
        $cats = $GoodscategoryModel->getCatTree($this->appId,false);
         $this->datas = [
            'list' => $cats,
        ];
    }

    /**
     * 修改商品分类
     */
    public function categoryEdit(){
        $cat_id = (int)$this->request->param("cat_id");
        $GoodscategoryModel = new GoodscategoryModel();

        if (!$detail = $GoodscategoryModel->find($cat_id)) {
            $this->warning("不存在数据");
        }

        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }

        $res = $GoodscategoryModel->setData($GoodscategoryModel->dataFilter($this->appId), $cat_id);
        if ($res === false) {
            $this->warning($GoodscategoryModel->getError());
        }
    }

    /**
     * 添加商品分类
     */
    public function categoryCreate(){
        $cat_limit = config('limitnum.app_shop_category_num');
        $GoodscategoryModel = new GoodscategoryModel();
        if ($GoodscategoryModel->where(['app_id' => $this->appId])->count() >= $cat_limit) {
            $this->warning("当前应用已超过最大创建分类数限制");
        }
        $res = $GoodscategoryModel->setData($GoodscategoryModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($GoodscategoryModel->getError());
        }
    }


    /**
     * 删除商品分类
     */
    public function categoryDel()
    {
        $cat_id = (int)$this->request->param('cat_id');
        $GoodscategoryModel = new GoodscategoryModel();
        if (!$detail = $GoodscategoryModel->find($cat_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $GoodsModel = new GoodsModel();
        if ($detail->parent_id == 0) {
            if($goods = $GoodsModel->where("p_cat_id",$cat_id)->find()){
                $this->warning("该分类已被选用 请删除引用");
            }
            //删除全部子分类
            $GoodscategoryModel->where(['parent_id' => $cat_id])->delete();
        }else{
            if($goods = $GoodsModel->where("cat_id",$cat_id)->find()){
                $this->warning("该分类已被选用 请删除引用");
            }
        }
        $GoodscategoryModel->where(['cat_id' => $cat_id])->delete();
    }


    /**
     * 设为推荐分类
     */
    public function tuijian() {
        $cat_id = (int) $this->request->param('cat_id');
        $IntegralCategoryModel = new IntegralCategoryModel();
        if (!$cat = $IntegralCategoryModel->find($cat_id)) {
            $this->warning('参数不正确');
        }
        if ($cat->app_id != $this->appId) {
            $this->warning('参数不正确');
        }
        $IntegralCategoryModel->save(['is_hot' => 0], ['app_id' => $this->appId]);
        $IntegralCategoryModel->save(['is_hot' => 1], ['cat_id' => $cat_id]);
    }


}
