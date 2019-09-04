<?php
/**
*作者：baototo.com 尤哥
*/
namespace app\shop\model\sms;
use app\shop\model\CommonModel;
class ShopSmsLogModel  extends CommonModel{
    protected $pk       = 'log_id';
    protected $name    = 'app_shop_sms_log';
    protected $insert = ['add_time','add_ip'];




}
