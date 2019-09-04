<?php
/**
*作者：baototo.com 尤哥
*/
namespace app\website\model\sms;
use app\website\model\CommonModel;
class SmsSendLogModel  extends CommonModel{
    protected $pk       = 'log_id';
    protected $name    = 'sms_send_log';
    protected $insert = ['add_time','add_ip'];




}
