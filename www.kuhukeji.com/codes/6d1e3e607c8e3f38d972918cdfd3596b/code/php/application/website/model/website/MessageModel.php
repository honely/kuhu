<?php
namespace app\website\model\website;

use app\website\model\CommonModel;

class MessageModel extends CommonModel
{
    protected $pk = 'message_id';
    protected $name = 'app_website_message';

    protected $rules = [
        ['app_id', 'number', 'appId不能为空!'],
        ['name', 'require|max:30', '联系人必须填写'],
        ['mobile', 'require|max:12', '联系方式必须填写'],
        ['message', 'require|max:256', '留言内容必须填写'],
    ];


    public function dataFilter($app_id = 0)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "name" => (string)$request->param("name", ""),//标题
            "mobile" => (string)$request->param("mobile", ""),//标题
            "message" => (string)$request->param("message", ""),//标题
        ];
        $message_id = (int) $request->param('message_id',0);
        if($message_id){
            $param['message_id'] = $message_id;
        }
        return $param;
    }


}


