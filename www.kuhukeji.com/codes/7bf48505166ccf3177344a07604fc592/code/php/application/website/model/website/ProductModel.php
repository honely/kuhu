<?php

namespace app\website\model\website;

use app\website\model\CommonModel;

class ProductModel extends CommonModel
{
    protected $pk = 'product_id';
    protected $name = 'app_website_product';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['title', 'require|max:64', '请输入标题|标题最多不能超过64个字符'],
        ['sub_title', 'require|max:25', '副标题必须填写|副标题长度不得大于255'],
        ['category_id', 'require|number', '请输入|必须是数字'],
        ['photos', 'require', '相册必须上传图片'],
        ['photo', 'require', '封面图片必须上传'],
        ['price', 'require', '请输入价格'],
        ['original_price', 'require', '请输入原价'],
        ['notice', 'max:65535', '购买须知最多不能超过65535个字符'],
        ['detail', 'require', '请输入商品详情'],
        ['is_online', 'number', '上下架必须是数字'],
        ['mobile', 'max:11', '产品联系电话最多不能超过11个字符'],
        ['orderby', 'number', '排序必须是数字'],
        ['seo', 'require|min:1', 'SEO信息必须填写|SEO信息必须填写'],
    ];


    public function dataFilter($appId,$seo)
    {
        $request = request();
        $param = [
            "app_id" => $appId,
            "title" => (string)$request->param("title", ""),//标题
            "sub_title" => (string)$request->param("sub_title", ""),//标题
            "category_id" => (int)$request->param("category_id", "0"),//
            "photos" => (string)$request->param("photos", "", "SecurityEditorHtml"),//相册
            "photo" => (string)$request->param("photo", "", "SecurityEditorHtml"),//相册
            "price" => (int)($request->param("price", "0") * 100),//价格
            "original_price" => (int)($request->param("original_price", "0") * 100),//原价
            "notice" => (string)$request->param("notice", ""),//购买须知
            "detail" => (string)$request->param("detail", "", "SecurityEditorHtml"),//商品详情
            "is_online" => (int) ($request->param("is_online", "0") == 1),//上下架
            "orderby" => (int) $request->param("orderby", "0") ,//排序
            "seo" => $seo,
        ];
        $mobile = (string)$request->param("mobile", "");//产品联系电话
        if($mobile){
            if(!isMobile($mobile) && !isPhone($mobile)){
                $this->error = "请输入正确的联系方式";
                return false;
            }
            $param['mobile'] = $mobile;
        } else {
            $SettingModel = new SettingModel();
            if ($setting = $SettingModel->find($appId)) {
                if (!$mobile = $setting->getAttr('mobile')) {
                    $this->error = "请输入正确的联系方式";
                    return false;
                }
                $param['mobile'] = $mobile;
            }
        }
        return $param;
    }


}
