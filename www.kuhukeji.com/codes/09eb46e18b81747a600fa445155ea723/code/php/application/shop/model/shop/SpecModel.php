<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class SpecModel extends CommonModel
{
    protected $pk = 'spec_id';
    protected $name = 'app_shop_spec';

    protected $rules = [
        ['type_id', '>=:1|number', '请选择所属模型|规格类型必须是数字'],
        ['name', 'require|max:55', '请输入规格名称|规格名称最多不能超过55个字符'],
        ['orderby', 'number', '排序必须是数字'],
    ];


    protected static function init(){
        //插入前事件
        $SpecModel = new SpecModel();
        SpecModel::event('before_write',function ($data) use ($SpecModel){
            $GoodstypeModel = new GoodstypeModel();
            if(!$type = $GoodstypeModel->find($data->type_id)){
                return false;
            }
            if($type->app_id != $data->app_id){
                return false;
            }

        });
        //插入后事件
        SpecModel::event('after_write', function ($data) {
            $spec_id = empty($data->spec_id) ? (empty($data->updateWhere['spec_id']) ? 0 : $data->updateWhere['spec_id'] ) :$data->spec_id;
            $item    = request()->param("item",'','SecurityEditorHtml');
            $itemArray = json_decode($item);
            $data = [];
            foreach ($itemArray as $val){
                $data[] = [
                    'spec_id' => $spec_id,
                    'item' => $val->item,
                ];
            }
            $SpecItemModel = new SpecItemModel();
            $SpecItemModel->where("spec_id",$spec_id)->delete();
            $SpecItemModel->saveAll($data,false);
        });
    }

    public function dataFilter($appId){
        $request = request();
        $param = [
            "type_id" => (int)    $request->param("type_id", "0"),//规格类型
            "name" =>    (string) $request->param("name", ""),//规格名称
            "orderby" =>   (int)    $request->param("orderby", "0"),//排序
        ];
        $item = (string) $request->param("item");

        if(empty($item)){
            $this->error="请输入规格项";
            return false;
        }
        $param['app_id'] = $appId;
        return $param;
    }




    /**
     * 根据一组IDs 来获取所有的item
     */
     public function getSpecItemByIds($specIds){
        $SpecItemModel = new SpecItemModel();
        $itemDatas  =  $SpecItemModel->whereIn("spec_id",$specIds)->select();
        $item = [];
        foreach ($itemDatas as $val){
            $item[$val->spec_id][] = [
                'item' => $val->item,
                'item_id' => $val->item_id,
            ];
        }
        return $item;

     }





}
