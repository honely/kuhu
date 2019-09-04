<?php
namespace app\website\controller\admin;


use app\website\model\website\RecruitModel;


class Recruit  extends Common{

    public function recruitCreate(){
        $RecruitModel = new RecruitModel();
        $res = $RecruitModel->setData($RecruitModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($RecruitModel->getError());
        }
    }


    public function recruitEdit(){
        $recruit_id = (int) $this->request->param("recruit_id");
        $RecruitModel = new RecruitModel();
        if (!$detail = $RecruitModel->find($recruit_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $res = $RecruitModel->setData($RecruitModel->dataFilter($this->appId),  $recruit_id);
        if ($res === false) {
            $this->warning($RecruitModel->getError());
        }
    }


    public function recruitDel(){
        $recruit_id = (int) $this->request->param("recruit_id");
        $RecruitModel = new RecruitModel();
        if (!$detail = $RecruitModel->find($recruit_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $RecruitModel->where(['app_id'=>$this->appId,"recruit_id"=>$recruit_id])->delete();
    }

    public function recruitDetail() {
        $recruit_id = (int) $this->request->param("recruit_id");
        $RecruitModel = new  RecruitModel();
        if (!$detail = $RecruitModel->find($recruit_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'recruit_id'  =>  $detail->recruit_id,
            'title'  =>  $detail->title,
            'working_place'  =>  $detail->working_place,
            'experience'  =>  $detail->experience,
            'education'  =>  $detail->education,
            'salary'  =>  $detail->salary,
            'detail'  =>  json_decode($detail->detail, true),
            'qualify'  =>  json_decode($detail->qualify, true),
            'welfare'  =>  json_decode($detail->welfare, true),
        ];
    }

    public function recruitIndex(){
        $RecruitModel = new RecruitModel();
        $where['app_id'] = $this->appId;
        $title = (string) $this->request->param("title");
        if($title){
            $where["title"] = ["LIKE","%{$title}%"];
        }

        $list = $RecruitModel->where($where)->order("recruit_id desc")->page($this->page, $this->limit)->select();
        $count = $RecruitModel->where($where)->count();

        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'recruit_id'  =>  $val->recruit_id,
                'title'  =>  $val->title,
                'working_place'  =>  $val->working_place,
                'experience'  =>  $val->experience,
                'education'  =>  $val->education,
                'salary'  =>  $val->salary,
                'add_time' => $val->add_time ? date("Y-m-d",$val->add_time) : '--',
                'add_ip' => $val->add_ip,
//                'detail'  =>  json_decode($val->detail, true),
//                'qualify'  =>  json_decode($val->qualify, true),
//                'welfare'  =>  json_decode($val->welfare, true),
            ];
        }

        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    public function deleteRecruitByIds()
    {
        $recruitIds = (string) $this->request->param('recruitIds');
        $recruitIds = json_encode($recruitIds, true);
        $recruitIds = empty($recruitIds) ? '' : $recruitIds;
        $RecruitModel = new RecruitModel();
        $RecruitModel->where(['app_id'=>$this->appId])->whereIn('recruit_id', $recruitIds)->delete();
    }

}
