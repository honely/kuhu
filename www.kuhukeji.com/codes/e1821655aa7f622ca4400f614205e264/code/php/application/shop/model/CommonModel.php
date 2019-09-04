<?php

namespace app\shop\model;

use think\Db;
use think\Model;
use think\Request;
use think\Cache;

class   CommonModel extends Model{
    protected $auto = [];
    protected $insert = [];
    protected $update = [];
    protected $fetchAllOrder = [];
    protected $fetchAllCache = '';
    protected $settingMap = [];
    protected $rules = [];
    public function setAddTimeAttr()
    {
        return Request::instance()->time();
    }

    public function setAddIpAttr()
    {
        return Request::instance()->ip();
    }

    public function setLastTimeAttr()
    {
        return Request::instance()->time();
    }

    public function setLastIpAttr()
    {
        return Request::instance()->ip();
    }

    //字段自增或减少数量
    public function IncDecCol($pk, $col, $num = 1)
    {
        $num = (int)$num;
        return $this->db()->execute("update " . config('database.prefix') . $this->name . " set `{$col}` = `{$col}` + {$num}  where `{$this->pk}` = '{$pk}' ");
    }

    public function getChildIds($parent_id)
    {

        $datas = $this->field($this->pk)->where(['parent_id' => $parent_id])->select();
        $return = [];
        foreach ($datas as $val) {
            $return[$val[$this->pk]] = $val[$this->pk];
        }
        return $return;
    }


    //根据一组ID查询
    public function itemsByIds($ids)
    {
        //var_dump($ids);
        $return = [];
        if (empty($ids)) return $return;
        $data = $this->where([$this->pk => ['IN', $ids]])->select();
        foreach ($data as $val) {
            $return[$val[$this->pk]] = $val;
        }
        return $return;
    }

    //查询某个条件下的所有数据 然后将ID 作为KEY 返回
    public function fetchItems($app_id, $order = [])
    {
        $order = empty($order) ? ["{$this->pk}" => 'desc'] : $order;
        $app_id = (int)$app_id;
        $data = $this->where(['app_id' => $app_id])->select();
        $return = [];
        foreach ($data as $val) {
            $return[$val[$this->pk]] = $val;
        }
        return $return;
    }

    //查询所有
    public function fetchAll($type = false)
    {
        $return = Cache::get($this->fetchAllCache);
        if (empty($return) || $type === true) {
            $return = [];
            $data = $this->order($this->fetchAllOrder)->select();
            foreach ($data as $val) {
                $return[$val[$this->pk]] = $val;
            }
            Cache::set($this->fetchAllCache, json_encode($return));
        }
        return $return ? json_decode($return) : [];
    }


    /**
     * 设置kv 缓存
     * @param $k
     * @param $v
     */
    public function setCache($k,$v){

        Cache::set($k, json_encode($v));
    }

    /**
     * 获取缓存
     * @param $k string 缓存key
     */
    public function getCache($k){
      if(empty($this->settingMap[$k])) return (object) [];
       $data  = Cache::get($k);
      if(empty($data)){
          $dataStr = $this->find($k);
          $data = json_decode($dataStr);
      }
      if(empty($data)){
          $this->save(['v'=>json_encode($this->settingMap[$k])],['k'=>$k]);
          $data = json_decode($this->settingMap[$k]);
      }
      return $data;
    }



    /**
     * 数据库设置数据
     * @param $data array 数据
     * @param int $pkId   id  是否更新
     * @param array $allolwField 过滤的字段
     * @return false|int
     */
    public function setData($data, $pkId = 0,$allowField = true){
        if($data == false)return false;
        $where = [];
        if ($pkId > 0) {
            $where[$this->pk] = $pkId;
        }

        return $this->allowField($allowField)->validate($this->rules)->save($data, $where);
    }


    /**
     * 获取下一个ID
     */
    public function getAutoMaxId(){
        $sql = "SELECT auto_increment FROM information_schema.`TABLES` WHERE Table_Schema='".config("database.database")."' AND table_name = '{$this->getTable()}' limit 1";
        $data = Db::query($sql);
        return empty($data[0]['auto_increment']) ? 0 : $data[0]['auto_increment'];
    }

    /**
     * 获取当前模型的 规则
     */
    public function getRules(){
        return $this->rules;
    }


}
