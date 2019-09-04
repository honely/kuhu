<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class AttributeModel extends CommonModel
{
    protected $pk = 'attr_id';
    protected $name = 'app_shop_goods_attribute';


    protected $rules = [
        ['attr_name', 'require|max:60', '请输入属性名称|属性名称最多不能超过60个字符'],
        ['type_id', 'require|number', '请选择属模型|所属模型必须是数字'],
        ['attr_input_type', 'require|number', '请输入 | 必须是数字'],
        ['attr_values', 'max:65535', '请输入可选值列表|可选择过多'],
        ['orderby', 'number', '请输入属性排序|属性排序必须是数字'],
    ];


    public function dataFilter($appId){
        $request = request();
        $param = [
            "attr_name" => (string)$request->param("attr_name", ""),//属性名称
            "type_id" => (int)$request->param("type_id", "0"),//所属模型
            "attr_input_type" => (int)$request->param("attr_input_type", "0"),//
            "attr_values" => (string)$request->param("attr_values", "SecurityEditorHtml"),//可选值列表
            "orderby" => (int)$request->param("orderby", "50"),//属性排序
        ];
        if($param['attr_input_type'] == 1 && empty($param['attr_values'])){
                $this->error = "请输入可选值列表";
                return false;
        }
        $attr_values = json_decode($param['attr_values']);
        $new_attr_values = [];
        foreach ($attr_values as $val){
            if(!empty($val)){
                $new_attr_values[] = $val;
            }
        }
        $param['attr_values'] = json_encode($new_attr_values);
        $param['app_id'] = $appId;
        return $param;
    }

    protected static function init(){
        //插入前事件
        $SpecModel = new SpecModel();
        SpecModel::event('before_write', function ($data) use ($SpecModel) {
            $GoodstypeModel = new GoodstypeModel();
            if (!$type = $GoodstypeModel->find($data->type_id)) {
                return false;
            }
            if ($type->app_id != $data->app_id) {
                return false;
            }
        });
    }





}
