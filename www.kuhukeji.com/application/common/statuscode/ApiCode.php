<?php
namespace app\common\statuscode;
class  ApiCode {
        //通过
        const SUCCESS  = 200;
        // 弹出提示类警告
        const WARNING = 400;
        //404找不到资源
        const NOPAGE = 404;
        //未登录
        const NOLOGIN = 100;
        //服务器内部错误
        const ERROR = 500;
        //整站维护中
        const STOP = 600;
}
