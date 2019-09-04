<?php

namespace app\shop\model;

use think\Model;
use think\Cache;

class   CommonCacheModel extends Model{

    protected $settingMap = [];

    protected $fetchAllCache = '';

    protected $fetchAllOrder = [];

    //查询单个模型的所有缓存
    public function fetchAll($getOb = false)
    {
        $return = Cache::get($this->fetchAllCache);
        if (empty($return) || $getOb === true) {
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
    public function setCache($k,$datas = []){
        $v = [];
        if(empty($datas)){
            foreach ($this->settingMap[$k] as $key=>$val){
                $type = gettype($val);
                switch ($type){
                    case "string" :
                        $v[$key] = (string)   request()->param($key,$val);
                        break;
                    case "integer":
                    case "double":
                        $v[$key] = (int)      request()->param($key,$val);
                        break;
                    case "array" :
                        $v[$key] = (array)    request()->param($key . "/a",$val);
                        break;
                    default :
                        $v[$key] = (string)   request()->param($key,$val);
                        break;
                }
            }
        }else{
            if(is_object($datas)){
                $datas = json_decode(json_encode($datas,256),true);
            }
            foreach ($this->settingMap[$k] as $key=>$val){
                $v[$key] = isset($datas[$key]) ? $datas[$key] : '';
            }
        }
        $this->save(['v'=>json_encode($v)],['k'=>$k]);
        Cache::set($this->fetchAllCache . $k, json_encode($v));
    }

    /**
     * 获取缓存信息
     * @param $k
     * @param bool $getOb  是否直接回去数据库信息
     * @param bool $returnArray 是否返回 数组
     * @return array|mixed|object
     */

    public function getCache($k,$getOb = false,$returnArray = false){

      if(empty($this->settingMap[$k])) return (object) [];

      //从数据库拉新 将 ob 设置为TRUE  如果认可缓存这无需这个操作
      $data  = $getOb == true ? [] :  json_decode(Cache::get($this->fetchAllCache . $k),$returnArray);
      if(empty($data)){
          $dataStr = $this->find($k);
          $data = json_decode($dataStr['v'],$returnArray);
      }
      if(empty($data)){
          $saveData = json_encode($this->settingMap[$k]);
          $this->save(['v'=>$saveData],['k'=>$k]);
          $data =  json_decode($saveData,$returnArray);
      }
      return $data;
    }

}
