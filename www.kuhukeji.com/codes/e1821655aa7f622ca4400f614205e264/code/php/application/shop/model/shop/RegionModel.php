<?php
namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class RegionModel extends CommonModel {

    protected $pk = 'region_id';
    protected $name = 'app_shop_region';


    /**
     * 获取所有的区域
     * 兼容 element
     */
    public function getRegion(){
        $level1 = $this->where("level",1)->select();
        $level2 = $this->where("level",2)->select();
        $level3 = $this->where("level",3)->select();
        $tree3 = $tree2 = $tree =  [];
        //获取三级
        foreach ($level3 as $val){
            $tree3[$val->parent_id][] = [
                'region_id' => $val->region_id,
                'label' => $val->getAttr('name'),
                'level' => $val->level,
                'parent_id' => $val->parent_id,
            ];
        }
        //获取二级
        foreach ($level2 as $val){
            $tree2[$val->parent_id][] = [
                'region_id' => $val->region_id,
                'label' => $val->getAttr('name'),
                'level' => $val->level,
                'parent_id' => $val->parent_id,
                'children' => empty($tree3[$val->region_id]) ? [] : $tree3[$val->region_id],
            ];
        }
        //获取一级
        foreach ($level1 as $val){
            $tree[] = [
                'region_id' => $val->region_id,
                'label' => $val->getAttr('name'),
                'level' => $val->level,
                'parent_id' => $val->parent_id,
                'children' => empty($tree2[$val->region_id]) ? [] : $tree2[$val->region_id],
            ];
        }
        return $tree;
    }

}
