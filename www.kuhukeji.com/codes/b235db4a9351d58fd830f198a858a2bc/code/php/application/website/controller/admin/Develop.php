<?php
namespace app\website\controller\admin;


use app\website\model\website\DevelopModel;


class Develop  extends Common{

    public function developCreate(){
        $DevelopModel = new DevelopModel();
        $res = $DevelopModel->setData($DevelopModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($DevelopModel->getError());
        }
    }


    public function developEdit(){
        $develop_id = (int) $this->request->param("develop_id");
        $DevelopModel = new DevelopModel();
        if (!$detail = $DevelopModel->find($develop_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $res = $DevelopModel->setData($DevelopModel->dataFilter($this->appId),  $develop_id);
        if ($res == false) {
            $this->warning($DevelopModel->getError());
        }
    }


    public function developDel(){

        $develop_id = (int) $this->request->param("develop_id");
        $DevelopModel = new DevelopModel();
        if (!$detail = $DevelopModel->find($develop_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $DevelopModel->where(['app_id'=>$this->appId,"develop_id"=>$develop_id])->delete();
    }

    public function developDetail() {
        $develop_id = (int) $this->request->param("develop_id");
        $DevelopModel = new  DevelopModel();
        if (!$detail = $DevelopModel->find($develop_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'develop_id'  =>  $detail->develop_id,
            'title'  =>  $detail->title,
            'date'  =>  $detail->date,
            'detail'  =>  $detail->detail,
        ];
    }

    public function developIndex(){
        $DevelopModel = new DevelopModel();
        $where['app_id'] = $this->appId;
        $title = (string) $this->request->param("title");
        if($title){
            $where["title"] = ["LIKE","%{$title}%"];
        }

        $list = $DevelopModel->where($where)->order("develop_id desc")->page($this->page, $this->limit)->select();
        $count = $DevelopModel->where($where)->count();

        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'develop_id'  =>  $val->develop_id,
                'title'  =>  $val->title,
                'date'  =>  $val->date,
                'detail'  =>  $val->detail,
            ];
        }

        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


}
