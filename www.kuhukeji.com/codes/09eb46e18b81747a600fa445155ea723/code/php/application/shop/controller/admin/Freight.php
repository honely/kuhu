<?php

namespace app\shop\controller\admin;



use app\shop\model\shop\FreightConfigModel;
use app\shop\model\shop\FreightRegionModel;
use app\shop\model\shop\FreightTemplateModel;
use think\Db;
use think\Loader;
use app\shop\model\shop\GoodsModel;


class Freight extends Common
{

    public function index()
    {
        $this->limit = 3;
        $FreightTemplate = new FreightTemplateModel();
        $template_list = $FreightTemplate->with('freightConfig')->where("app_id", $this->appId)->order("template_id desc")->page($this->page, $this->limit)->select();
        $count = $FreightTemplate->where("app_id", $this->appId)->count();
        $datas = [];
        $freight_type = getMean("freight_type");
        foreach ($template_list as $key => $val) {
            $config = [];
            foreach ($val->freight_config as $v) {
                $region = [];
                if (!empty($v->freight_region)) {
                    foreach ($v->freight_region as $r) {
                        $region[] = $r->region->name;
                    }
                } else {
                    $region = ["全国"];
                }
                $config[] = [
                    'config_id' => $v->config_id,
                    'first_unit' => $v->first_unit,
                    'first_money' => moneyFormat($v->first_money, true),
                    'continue_unit' => $v->continue_unit,
                    'continue_money' => moneyFormat($v->continue_money, true),
                    'is_default' => (int)$v->is_default,
                    'region' => implode(",", $region),
                ];
            }
            $datas[] = [
                'template_name' => $val->template_name,
                'template_id' => $val->template_id,
                'type' => $val->type,
                'is_delete' => false,
                'type_mean' => empty($freight_type[$val->type]) ? '' : $freight_type[$val->type],
                'is_enable_default' => $val->is_enable_default,
                'config' => $config,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'limit' => $this->limit,
            'count' => $count,
        ];
    }

    public function detail()
    {
        $template_id = (int)$this->request->param("template_id");
        $FreightTemplate = new FreightTemplateModel();
        $freightTemplate = $FreightTemplate->with('freightConfig')->where("app_id", $this->appId)->where(['template_id' => $template_id])->find();

        foreach ($freightTemplate->freight_config as $v) {
            $region = $region_ids =  [];
            if (!empty($v->freight_region)) {
                foreach ($v->freight_region as $r) {
                    $region[] = $r->region->name;
                    $region_ids[] = $r->region->region_id;
                }
            } else {
                $region = ["全国"];
            }
            $config[] = [
                'config_id' => $v->config_id,
                'first_unit' => $v->first_unit,
                'first_money' => moneyFormat($v->first_money),
                'continue_unit' => $v->continue_unit,
                'continue_money' => moneyFormat($v->continue_money),
                'is_default' => (int)$v->is_default,
                'region' => implode(",", $region),
                'region_ids' =>  $region_ids,
            ];
        }
        $datas = [
            'template_name' => $freightTemplate->template_name,
            'template_id' => $freightTemplate->template_id,
            'type' => $freightTemplate->type,
            'type_mean' => empty($freight_type[$freightTemplate->type]) ? '' : $freight_type[$freightTemplate->type],
            'is_enable_default' => $freightTemplate->is_enable_default,
            'config' => $config,
        ];
        $this->datas['detail'] = $datas;
    }

    /**
     *  保存运费模板
     * @throws \think\Exception
     */
    public function create()
    {
        $data['template_name'] = (string)$this->request->param("template_name");
        $data['type'] = (int)$this->request->param("type");
        $data['is_enable_default'] = (int)$this->request->param("is_enable_default");
        $configStr = (string)$this->request->param("config", "", "SecurityEditorHtml");
        $data['app_id'] = $this->appId;
        if (empty($data['template_name'])) {
            $this->warning("请输入模板名称");
        }
        $config = json_decode($configStr);
        if (empty($config)) {
            $this->warning("参数错误");
        }
        $have_default = 0;
        $configData = $region = $checkUnique = [];
        foreach ($config as $key => $val) {
            if (empty($val->first_unit) || empty($val->first_money)) {
                $this->warning("请仔细填写物流参数");
            }
            if (empty($val->continue_unit) || empty($val->continue_money)) {
                $this->warning("请仔细填写物流参数");
            }
            if ($val->is_default == 1) {
                $have_default = $have_default + 1;
            } elseif (empty($val->region_ids)) {
                $this->warning("参数错误");
            }

            $configData[$key] = [
                'is_default' => $val->is_default,
                'first_unit' => $val->first_unit,
                'first_money' => moneyToInt($val->first_money),
                'continue_unit' => $val->continue_unit,
                'continue_money' => moneyToInt($val->continue_money),
            ];
            if ($val->is_default == 0) {
                $checkUnique = array_merge($checkUnique, $val->region_ids);
            }
            $region[$key] = $val->region_ids;
        }
        if (count($checkUnique) != count(array_unique($checkUnique))) {
            $this->warning("请勿设置重复的区域");
        }
        if ($data['is_enable_default'] == 1 && $have_default <= 0) {
            $this->warning("参数错误");
        }
        if ($have_default > 1) {
            $this->warning("参数错误");
        }

        $FreightTemplateModel = new FreightTemplateModel();
        $FreightTemplateModel->save($data);
        $tmp_id = $FreightTemplateModel->template_id;

        foreach ($configData as &$val) {
            $val['template_id'] = $tmp_id;
        }
        unset($val);
        $FreightConfigModel = new FreightConfigModel();
        $res = $FreightConfigModel->saveAll($configData, false);
        $regionDataTmp = $checkUnique = [];
        foreach ($res as $key => $val) {
            $regionDataTmp[$val->config_id] = $region[$key];
        }
        $regionData = [];
        foreach ($regionDataTmp as $key => $val) {
            foreach ($val as $v) {
                $regionData[] = [
                    'template_id' => $tmp_id,
                    'config_id' => $key,
                    'region_id' => $v,
                ];
            }
        }
        $FreightRegionModel = new FreightRegionModel();
        $FreightRegionModel->saveAll($regionData, false);
    }


    /**
     * @throws \Exception
     */
    public function edit()
    {
        $template_id = (int)$this->request->param("template_id");
        $FreightTemplateModel = new FreightTemplateModel();

        if (!$detail = $FreightTemplateModel->find($template_id)) {
            $this->warning();
        }

        if ($detail->app_id != $this->appId) {
            $this->warning();
        }

        $data['template_name'] = (string)$this->request->param("template_name");
        $data['type'] = (int)$this->request->param("type");
        $data['is_enable_default'] = (int)$this->request->param("is_enable_default");
        $configStr = (string)$this->request->param("config", "", "SecurityEditorHtml");
        $data['app_id'] = $this->appId;
        if (empty($data['template_name'])) {
            $this->warning("请输入模板名称");
        }
        $config = json_decode($configStr);
        if (empty($config)) {
            $this->warning("参数错误");
        }
        $have_default = 0;
        $configData = $region = $checkUnique = [];
        foreach ($config as $key => $val) {
            if (empty($val->first_unit) || empty($val->first_money)) {
                $this->warning("请仔细填写物流参数");
            }
            if (empty($val->continue_unit) || empty($val->continue_money)) {
                $this->warning("请仔细填写物流参数");
            }
            if ($val->is_default == 1) {
                $have_default = $have_default + 1;
            } elseif (empty($val->region_ids)) {
                $this->warning("参数错误");
            }

            $configData[$key] = [
                'is_default' => $val->is_default,
                'first_unit' => $val->first_unit,
                'first_money' => moneyToInt($val->first_money),
                'continue_unit' => $val->continue_unit,
                'continue_money' => moneyToInt($val->continue_money),
            ];
            if ($val->is_default == 0) {
                $checkUnique = array_merge($checkUnique, $val->region_ids);
            }
            $region[$key] = $val->region_ids;
        }
        if (count($checkUnique) != count(array_unique($checkUnique))) {
            $this->warning("请勿设置重复的区域");
        }
        if ($data['is_enable_default'] == 1 && $have_default <= 0) {
            $this->warning("参数错误");
        }
        if ($have_default > 1) {
            $this->warning("参数错误");
        }


        $FreightTemplateModel->save($data, ['template_id' => $template_id]);
        $tmp_id = $template_id;

        foreach ($configData as &$val) {
            $val['template_id'] = $tmp_id;
        }
        unset($val);
        $FreightConfigModel = new FreightConfigModel();
        $FreightConfigModel->where("template_id", $tmp_id)->delete();
        $res = $FreightConfigModel->saveAll($configData, false);
        $regionDataTmp = $checkUnique = [];
        foreach ($res as $key => $val) {
            $regionDataTmp[$val->config_id] = $region[$key];
        }
        $regionData = [];
        foreach ($regionDataTmp as $key => $val) {
            foreach ($val as $v) {
                $regionData[] = [
                    'template_id' => $tmp_id,
                    'config_id' => $key,
                    'region_id' => $v,
                ];
            }
        }
        $FreightRegionModel = new FreightRegionModel();
        $FreightRegionModel->where("template_id", $tmp_id)->delete();
        $FreightRegionModel->saveAll($regionData, false);
    }




    /**
     * 删除运费模板
     * @throws \think\Exception
     */
    public function delete()
    {
        $template_id =  (int) $this->request->param("template_id");
        $FreightTemplateModel = new FreightTemplateModel();
        if (!$detail = $FreightTemplateModel->find($template_id)) {
            $this->warning(1);
        }
        if ($detail->app_id != $this->appId) {
            $this->warning(2);
        }
        $GoodsModel = new GoodsModel();
        $goods =  $GoodsModel->where("is_free_shipping", 0)
            ->where("freight_template_id", $template_id)->find();
        if (!empty($goods)) {
            $this->warning("有商品正在使用此模板 先解除所有商品");
        }
        $FreightRegionModel = new FreightRegionModel();
        $FreightConfigModel = new FreightConfigModel();
        $FreightTemplateModel->where( "template_id", $template_id)->delete();
        $FreightRegionModel->where( "template_id", $template_id)->delete();
        $FreightConfigModel->where( "template_id", $template_id)->delete();
    }


    public function area()
    {
        $province_list = Db::name('region')->where(array('parent_id' => 0, 'level' => 1))->select();
        $this->assign('province_list', $province_list);
        return $this->fetch();
    }


    /**
     * 获取模板列表
     */
    public function getIndex()
    {
        $FreightTemplateModel = new FreightTemplateModel();
        $list =  $FreightTemplateModel->where("app_id", $this->appId)->select();
        $datas = [];
        $type = getMean("freight_template_type");
        foreach ($list as $val) {
            $datas[] = [
                'template_id' => $val->template_id,
                'template_name' => $val->template_name,
                'type' => $val->type,
                'type_mean' => empty($type[$val->type])  ? '' : $type[$val->type],
            ];
        }
        $this->datas['list'] = $datas;
    }
}
