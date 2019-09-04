<?php
/**
*作者：baototo.com 尤哥
*/
namespace app\common\model\sms;
use app\common\model\CommonModel;
class SmsSendLogModel  extends CommonModel{
    protected $pk       = 'log_id';
    protected $name    = 'sms_send_log';
    protected $insert = ['add_time','add_ip'];
    
    


}