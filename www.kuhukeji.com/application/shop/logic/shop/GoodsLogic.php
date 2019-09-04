<?php

namespace app\home\logic;
use think\Model;
use app\home\logic\CartLogic;
use think\Db;
/**
 * 分类逻辑定义
 * Class CatsLogic
 * @package Home\Logic
 */
class GoodsLogic {


    /**
     * @param $goods_id_arr
     * @param $filter_param
     * @param $action
     * @param int $mode  0  返回数组形式  1 直接返回result
     * @return array 这里状态一般都为1 result 不是返回数据 就是空
     * 获取 商品列表页帅选规格
     */
    public function getFilterSpec($goods_id_arr, $filter_param, $action, $mode = 0){

        $goods_id_str = implode(',', $goods_id_arr);
        $goods_id_str = $goods_id_str ? $goods_id_str : '0';
        $spec_key = DB::query("select group_concat(`key` separator  '_') as `key` from __PREFIX__spec_goods_price where goods_id in($goods_id_str)");  //where("goods_id in($goods_id_str)")->select();
        $spec_key = explode('_', $spec_key[0]['key']);
        $spec_key = array_unique($spec_key);
        $spec_key = array_filter($spec_key);

        if (empty($spec_key)) {
            if ($mode == 1) return array();
            return array('status' => 1, 'msg' => '', 'result' => array());
        }
        $spec = M('spec')->where(array('search_index'=>1))->getField('id,name');
        $spec_item = M('spec_item')->where(array('spec_id'=>array('in',array_keys($spec))))->getField('id,spec_id,item');
        $list_spec = array();
        $old_spec = $filter_param['spec'];
        foreach ($spec_key as $k => $v) {
            if (strpos($old_spec, $spec_item[$v]['spec_id'] . '_') === 0 || strpos($old_spec, '@' . $spec_item[$v]['spec_id'] . '_') || $spec_item[$v]['spec_id'] == '')
                continue;
            $list_spec[$spec_item[$v]['spec_id']]['spec_id'] = $spec_item[$v]['spec_id'];
            $list_spec[$spec_item[$v]['spec_id']]['name'] = $spec[$spec_item[$v]['spec_id']];
            //$list_spec[$spec_item[$v]['spec_id']]['item'][$v] = $spec_item[$v]['item'];
            // 帅选参数
            if (!empty($old_spec))
                $filter_param['spec'] = $old_spec . '@' . $spec_item[$v]['spec_id'] . '_' . $v;
            else
                $filter_param['spec'] = $spec_item[$v]['spec_id'] . '_' . $v;
            $list_spec[$spec_item[$v]['spec_id']]['item'][] = array('key' => $spec_item[$v]['spec_id'], 'val' => $v, 'item' => $spec_item[$v]['item'], 'href' => urldecode(U("Goods/$action", $filter_param, '')));
        }
        if ($mode == 1) return $list_spec;
        return ['status' => 1, 'msg' => '', 'result' => $list_spec];
    }


    /**
     * 获取某个商品的评论统计
     * c0:全部评论数  c1:好评数 c2:中评数  c3差评数
     * rate1:好评率 rate2:中评率  c3差评率
     * @param $goods_id
     * @return array
     */
    public function commentStatistics($goods_id)
    {
        $commentWhere = ['is_show'=>1,'goods_id'=>$goods_id,'parent_id'=>0];
        $c1 = M('comment')->where($commentWhere)->where('ceil((deliver_rank + goods_rank + service_rank) / 3) in (4,5)')->count();
        $c2 = M('comment')->where($commentWhere)->where('ceil((deliver_rank + goods_rank + service_rank) / 3) in (3)')->count();
        $c3 = M('comment')->where($commentWhere)->where('ceil((deliver_rank + goods_rank + service_rank) / 3) in (0,1,2)')->count();
        $c4 = M('comment')->where($commentWhere)->where("img !='' and img NOT LIKE 'N;%'")->count(); // 晒图
        $c0 = $c1 + $c2 + $c3; // 所有评论
        if($c0 <= 0){
            $rate1 = 100;
            $rate2 = 0;
            $rate3 = 0;
        }else{
            $rate1 = ceil($c1 / $c0 * 100); // 好评率
            $rate2 = ceil($c2 / $c0 * 100); // 中评率
            $rate3 = ceil($c3 / $c0 * 100); // 差评率
        }
        return array('c0' => $c0, 'c1' => $c1, 'c2' => $c2, 'c3' => $c3, 'c4'=>$c4,'rate1' => $rate1, 'rate2' => $rate2, 'rate3' => $rate3);
    }


    /**
     * 获取商品规格
     * @param $goods_id|商品id
     * @return array
     */
    public function getSpec($goods_id)
    {
        //商品规格 价钱 库存表 找出 所有 规格项id
        $keys = M('SpecGoodsPrice')->where("goods_id", $goods_id)->getField("GROUP_CONCAT(`key` SEPARATOR '_') ");
        $filter_spec = array();
        if ($keys) {
            $specImage = M('SpecImage')->where(['goods_id'=>$goods_id,'src'=>['<>','']])->getField("spec_image_id,src");// 规格对应的 图片表， 例如颜色
            $keys = str_replace('_', ',', $keys);
            $sql = "SELECT a.name,a.order,b.* FROM __PREFIX__spec AS a INNER JOIN __PREFIX__spec_item AS b ON a.id = b.spec_id WHERE b.id IN($keys) ORDER BY b.id";
            $filter_spec2 = \think\Db::query($sql);
            foreach ($filter_spec2 as $key => $val) {
                $filter_spec[$val['name']][] = array(
                    'item_id' => $val['id'],
                    'item' => $val['item'],
                    'src' => $specImage[$val['id']],
                );
            }
        }
        return $filter_spec;
    }


    /**
     * 筛选的价格期间
     * @param $goods_id_arr|帅选的分类id
     * @param $filter_param
     * @param $action
     * @param int $c 分几段 默认分5 段
     * @return array
     */
    function getFilterPrice($goods_id_arr, $filter_param, $action, $c = 5)
    {

        if (!empty($filter_param['price']))
            return array();

        $goods_id_str = implode(',', $goods_id_arr);
        $goods_id_str = $goods_id_str ? $goods_id_str : '0';
        $priceList = M('goods')->where("goods_id", "in", $goods_id_str)->getField('shop_price', true);  //where("goods_id in($goods_id_str)")->select();
        rsort($priceList);
        $max_price = (int)$priceList[0];

        $psize = ceil($max_price / $c); // 每一段累积的价钱
        $parr = array();
        for ($i = 0; $i < $c; $i++) {
            $start = $i * $psize;
            $end = $start + $psize;

            // 如果没有这个价格范围的商品则不列出来
            $in = false;
            foreach ($priceList as $k => $v) {
                if ($v > $start && $v < $end)
                    $in = true;
            }
            if ($in == false)
                continue;

            $filter_param['price'] = "{$start}-{$end}";
            if ($i == 0)
                $parr[] = array('value' => "{$end}元以下", 'href' => urldecode(U("Goods/$action", $filter_param, '')));
            elseif($i == ($c-1) && ($max_price > $end))
                $parr[] = array('value' => "{$end}元以上", 'href' => urldecode(U("Goods/$action", $filter_param, '')));
            else
                $parr[] = array('value' => "{$start}-{$end}元", 'href' => urldecode(U("Goods/$action", $filter_param, '')));
        }
        return $parr;
    }


    /**
     * 根据规格 查找 商品id
     * @param $spec|规格
     * @return array|\type
     */
    public  function getGoodsIdBySpec($spec)
    {
        if (empty($spec))
            return array();

        $spec_group = explode('@', $spec);
        $where = " where 1=1 ";
        foreach ($spec_group as $k => $v) {
            $spec_group2 = explode('_', $v);
            array_shift($spec_group2);
            $like = array();
            foreach ($spec_group2 as $k2 => $v2) {
                $like[] = " key2  like '%\_$v2\_%' ";
            }
            $where .= " and (" . implode('or', $like) . ") ";
        }
        $sql = "select * from (select *,concat('_',`key`,'_') as key2 from __PREFIX__spec_goods_price as a) b  $where";
        $result = Db::query($sql);
        $arr = get_arr_column($result, 'goods_id');  // 只获取商品id 那一列
        return ($arr ? $arr : array_unique($arr));
    }

    /**
     * @param $attr|属性
     * @return array|mixed
     * 根据属性 查找 商品id
     * 59_直板_翻盖
     * 80_BT4.0_BT4.1
     */
    public  function getGoodsIdByAttr($attr)
    {
        if (empty($attr))
            return array();

        $attr_group = explode('@', $attr);
        $attr_id = $attr_value = array();
        foreach ($attr_group as $k => $v) {
            $attr_group2 = explode('_', $v);
            $attr_id[] = array_shift($attr_group2);
            $attr_value = array_merge($attr_value, $attr_group2);
        }
        $c = count($attr_id) - 1;
        if ($c > 0) {
            $arr = Db::name('goods_attr')
                ->where(['attr_id'=>['in',$attr_id],'attr_value'=>['in',$attr_value]])
                ->group('goods_id')
                ->having("count(goods_id) > $c")
                ->getField("goods_id", true);
        }else{
            $arr = M('goods_attr')
                ->where(['attr_id'=>['in',$attr_id],'attr_value'=>['in',$attr_value]])
                ->getField("goods_id", true); // 如果只有一个条件不再进行分组查询
        }
        return ($arr ? $arr : array_unique($arr));
    }

    /**
     * 获取地址
     * @return array
     */
    public function getRegionList()
    {
        $res = S('getRegionList');
        if(!empty($res))
            return $res;
        $parent_region = M('region')->field('id,name')->where(array('level'=>1))->cache(true)->select();
        $ip_location = array();
        $city_location = array();
        foreach($parent_region as $key=>$val){
            $c = M('region')->field('id,name')->where(array('parent_id'=>$parent_region[$key]['id']))->order('id asc')->cache(true)->select();
            $ip_location[$parent_region[$key]['name']] = array('id'=>$parent_region[$key]['id'],'root'=>0,'djd'=>1,'c'=>$c[0]['id']);
            $city_location[$parent_region[$key]['id']] = $c;
        }
        $res = array(
            'ip_location'=>$ip_location,
            'city_location'=>$city_location
        );
        S('getRegionList',$res);
        return $res;
    }

    /**
     * 寻找Region_id的父级id
     * @param $cid
     * @return array
     */
    public function getParentRegionList($cid){
        //$pids = '';
        $pids = array();
        $parent_id =  M('region')->where(array('id'=>$cid))->getField('parent_id');
        if($parent_id != 0){
            //$pids .= $parent_id;
            array_push($pids,$parent_id);
            $npids = $this->getParentRegionList($parent_id);
            if(!empty($npids)){
                //$pids .= ','.$npids;
                $pids = array_merge($pids,$npids);
            }

        }
        return $pids;
    }

    /**
     * 商品物流配送和运费
     * @param $goods_id
     * @param $region_id
     * @return array
     */
    public function getGoodsDispatching($goods_id,$region_id)
    {
        $return_data = array('status'=>1,'msg'=>'');
        $goods = M('goods')->where(array('goods_id'=>$goods_id))->find();
        //检查商品是否包邮
        if($goods['is_free_shipping']){
            $return_data['msg'] = '有货';
            $return_data['result'] = array(array('shipping_name'=>'包邮','freight'=>0));
            return $return_data;
        }
        $parent_region_id = $this->getParentRegionList($region_id);
        $goodsLogic = new GoodsLogic();
        //商品没有配置物流，使用物流配置里的默认物流
        if(empty($goods['shipping_area_ids'])){
            $plugin_goods_shipping = M('plugin')->where(array('type'=>'shipping'))->select();
            $goods_shipping = array();
            foreach($plugin_goods_shipping as $k=>$v){
                $goods_shipping[$k]['freight'] = $goodsLogic->getFreight($plugin_goods_shipping[$k]['code'],$parent_region_id[0],$parent_region_id[1],$region_id,$goods['weight']);//默认全国
                $goods_shipping[$k]['shipping_name'] = $plugin_goods_shipping[$k]['name'];
            }
            $return_data['msg'] = '有货';
            $return_data['result'] = $goods_shipping;
            return $return_data;
        }
        //查找地区$region_id的所有父类，与地区地址表进行匹配
        $goods_shipping_area_id_array = explode(',',$goods['shipping_area_ids']);
        array_push($parent_region_id,(string)$region_id);//把region_id和它全部父级存起来
        $find_shipping_area_id = M('area_region')->where(array('region_id'=>array('in',$parent_region_id)))->group('shipping_area_id')->getField('shipping_area_id',true);
        $shipping_area_id_array =array();
        foreach($find_shipping_area_id as $key=>$val){
            if(in_array($find_shipping_area_id[$key],$goods_shipping_area_id_array)){
                array_push($shipping_area_id_array,$find_shipping_area_id[$key]);
            }
        }
        //没有匹配到，就使用商品配置的物流id去物流地址表去查找
        if(count($shipping_area_id_array) == 0){
            $goods_shipping = M('shipping_area')->where(array('shipping_area_id'=>array('in',$goods_shipping_area_id_array),'is_default'=>1))->select();
            //查询到就返回物流信息和运费，没有返回无货
            if(!empty($goods_shipping)){
                foreach($goods_shipping as $k=>$v){
                    $goods_shipping[$k]['freight'] = $goodsLogic->getFreight($goods_shipping[$k]['shipping_code'],$parent_region_id[0],$parent_region_id[1],$region_id,$goods['weight']);
                    $goods_shipping[$k]['shipping_name'] = M('plugin')->where(array('type'=>'shipping','code'=>$goods_shipping[$k]['shipping_code']))->getField('name');
                }
                $return_data['msg'] = '有货';
                $return_data['result'] = $goods_shipping;
                return $return_data;
            }else{
                $return_data['status'] = -1;
                $return_data['msg'] = '无货';
                return $return_data;
            }
        }
        //匹配到就返回物流信息和运费
        $goods_shipping = M('')
            ->table(C('DB_PREFIX').'area_region ar')
            ->join('__SHIPPING_AREA__ sa','sa.shipping_area_id = ar.shipping_area_id','INNER')
            ->where(array('ar.shipping_area_id'=>array('in',$shipping_area_id_array)))
            ->group('sa.shipping_code')
            ->select();
        //没匹配到就返回无货
        if(empty($goods_shipping)){
            $return_data['status'] = -1;
            $return_data['msg'] = '无货';
            return $return_data;
        }
        foreach($goods_shipping as $k=>$v){
            $goods_shipping[$k]['freight'] = $goodsLogic->getFreight($goods_shipping[$k]['shipping_code'],0,0,$goods_shipping[$k]['region_id'],$goods['weight']);
            $goods_shipping[$k]['shipping_name'] = M('plugin')->where(array('type'=>'shipping','code'=>$goods_shipping[$k]['shipping_code']))->getField('name');
        }
        $return_data = array(
            'status'=>1,
            'msg'=>'可发货',
            'result'=>$goods_shipping
        );
        return $return_data;
    }



    /**
     * 计算根据商品重量计算物流运费
     * @param  $shipping_code|物流 编号
     * @param  $province|省份
     * @param  $city|市
     * @param  $district|区
     * @param  $weight|重量
     * @return int
     */
    public function getFreight($shipping_code, $province, $city, $district, $weight)
    {

        if ($weight == 0) return 0; // 商品没有重量
        if ($shipping_code == '') return 0;

        // 先根据 镇 县 区找 shipping_area_id
        if ($district != 0) {
            $shipping_area_id = M('AreaRegion')->where("shipping_area_id in (select shipping_area_id from  " . C('database.prefix') . "shipping_area where shipping_code = :shipping_code) and region_id = :region_id")->bind(['shipping_code'=>$shipping_code,'region_id'=>$district])->getField('shipping_area_id');
        }

        // 先根据市区找 shipping_area_id
        if ($shipping_area_id == false && $city != 0) {
            $shipping_area_id = M('AreaRegion')->where("shipping_area_id in (select shipping_area_id from  " . C('database.prefix') . "shipping_area where shipping_code = :shipping_code) and region_id = :region_id")->bind(['shipping_code'=>$shipping_code,'region_id'=>$city])->getField('shipping_area_id');
        }

        // 市区找不到 根据省份找shipping_area_id
        if ($shipping_area_id == false && $province != 0) {
            $shipping_area_id = M('AreaRegion')->where("shipping_area_id in (select shipping_area_id from  " . C('database.prefix') . "shipping_area where shipping_code = :shipping_code) and region_id = :region_id")->bind(['shipping_code'=>$shipping_code,'region_id'=>$province])->getField('shipping_area_id');
        }

        // 省份找不到 找默认配置全国的物流费
        if ($shipping_area_id == false) {
            // 如果市和省份都没查到, 就查询 tp_shipping_area 表 is_default = 1 的  表示全国的  select * from `tp_plugin`  select * from  `tp_shipping_area` select * from  `tp_area_region`
            $shipping_area_id = M("ShippingArea")->where(['shipping_code'=>$shipping_code,'is_default'=>1])->getField('shipping_area_id');
        }

        if ($shipping_area_id == false) {
            return 0;
        }

        /// 找到了 shipping_area_id  找config
        $shipping_config = M('ShippingArea')->where("shipping_area_id", $shipping_area_id)->getField('config');
        $shipping_config = unserialize($shipping_config);
        $shipping_config['money'] = $shipping_config['money'] ? $shipping_config['money'] : 0;

        // 1000 克以内的 只算个首重费
        if ($weight < $shipping_config['first_weight']) {
            return $shipping_config['money'];
        }
        // 超过 1000 克的计算方法
        $weight = $weight - $shipping_config['first_weight']; // 续重
        $weight = ceil($weight / $shipping_config['second_weight']); // 续重不够取整
        $freight = $shipping_config['money'] + $weight * $shipping_config['add_money']; // 首重 + 续重 * 续重费

        return $freight;
    }

}

