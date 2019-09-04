<?php
namespace app\website\controller\admin;


use app\website\model\website\MessageModel;


class Message  extends Common{

    public function create(){
        $MessageModel = new MessageModel();
        $res = $MessageModel->setData($MessageModel->dataFilter($this->appId));
        if ($res == false) {
            $this->warning($MessageModel->getError());
        }
    }

    public function edit(){
        $message_id = (int) $this->request->param("message_id");
        $MessageModel = new MessageModel();
        if (!$detail = $MessageModel->find($message_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $res = $MessageModel->setData($MessageModel->dataFilter($this->appId),  $message_id);
        if ($res == false) {
            $this->warning($MessageModel->getError());
        }
    }

    public function delete(){
        $message_id = (int) $this->request->param("message_id");
        $MessageModel = new MessageModel();
        if (!$detail = $MessageModel->find($message_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $MessageModel->where("message_id",   $message_id)->delete();
    }

    public function detail() {
        $message_id = (int) $this->request->param("message_id");
        $MessageModel = new  MessageModel();
        if (!$detail = $MessageModel->find($message_id)) {
            $this->warning("不存在数据");
        }
        if($detail->app_id != $this->appId){
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'message_id'  =>  $detail->message_id,
            'name'  =>  $detail->name,
            'mobile'  =>  $detail->mobile,
            'message'  =>  $detail->message,
            'add_time'  =>  $detail->add_time ? date('Y-m-d', $detail->add_time) : '--',
            'add_ip' =>$detail->add_ip
        ];
    }

    public function index(){
        $MessageModel = new MessageModel();
        $where['app_id'] = $this->appId;
        $keyword = (string) $this->request->param("keyword");
        if($keyword){
            $where["name|message|mobile"] = ["LIKE","%{$keyword}%"];
        }
        $end_add_time = (int) $this->request->param("end_add_time",0,"strtotime");
        $bg_add_time = (int) $this->request->param("bg_add_time",0,"strtotime");
        if($end_add_time > 0 && $bg_add_time > 0){
            $where["add_time"] = ["between",[$bg_add_time,$end_add_time]];
        }
        $list = $MessageModel->where($where)->order("message_id desc")->page($this->page, $this->limit)->select();
        $count = $MessageModel->where($where)->count();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'message_id'  =>  $val->message_id,
                'name'  =>  $val->name,
                'mobile'  =>  $val->mobile,
                'message'  =>  $val->message,
                'add_time'  =>  $val->add_time ? date('Y-m-d', $val->add_time) : '--',
                'add_ip' =>$val->add_ip
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    public function deleteByIds()
    {
        $messageIds = (string) $this->request->param('messageIds');
        $messageIds = json_encode($messageIds, true);
        $messageIds = empty($messageIds) ? '' : $messageIds;
        $MessageModel = new MessageModel();
        $MessageModel->where(['app_id'=>$this->appId])->whereIn('message_id',$messageIds)->delete();
    }

}
