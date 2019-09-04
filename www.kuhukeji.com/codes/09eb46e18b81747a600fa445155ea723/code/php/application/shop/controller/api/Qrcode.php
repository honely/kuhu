<?php


namespace app\shop\controller\api;


class Qrcode
{
    public function getQrcode() {
        $this->isReturn = true;
        $param = (string) request()->param('param');
        if (ob_get_level() == 0)
        ob_start();
        ob_implicit_flush(true);
        ob_clean();
        $value = urldecode($param);
        $errorCorrectionLevel = "L";
        $matrixPointSize = 10;
        \QRcode::png($value, false, $errorCorrectionLevel, $matrixPointSize,0);
        ob_flush();
        flush();
        ob_end_flush();
    }
}