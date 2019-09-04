<?php

// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------
// 应用公共文件

function recurse_copy($src, $dst)
{ // 原目录，复制到的目录
    if (!is_dir($src)) return false;
    $dir = opendir($src);
    if (!is_dir($dst)) mkdir($dst, 0755, true);

    while (false !== ($file = readdir($dir))) {
        if (($file != '.') && ($file != '..')) {
            if (is_dir($src . '/' . $file)) {
                recurse_copy($src . '/' . $file, $dst . '/' . $file);
            } else {
                copy($src . '/' . $file, $dst . '/' . $file);
            }
        }
    }
    closedir($dir);
}


//有些客户可能存在BOM头
function echoTxt($str)
{
    if (ob_get_level() == 0) ob_start();
    ob_implicit_flush(true);
    ob_clean();
    header("Content-type: text/plain");
    echo "{$str}";
    ob_flush();
    flush();
    ob_end_flush();
}


function getImg($img, $type = '')
{
    $img = str_replace('\\', '/', $img);
    if (empty($type))
        return $img;
    $imgs = explode('.', $img);
    $imgs[count($imgs) - 1] = $type . '.' . $imgs[count($imgs) - 1];
    return join('.', $imgs);
}

function getWeek($date)
{
    $t = strtotime($date);
    $weekarray = array("周日", "周一", "周二", "周三", "周四", "周五", "周六");
    return $weekarray[date('w', $t)];
}

function getDateArr($num)
{
    $start = $_SERVER['REQUEST_TIME'];
    $end = $start + $num * 86400;
    $return = [];
    for ($i = $start; $i <= $end; $i = $i + 86400) {
        $return[] = date('Y-m-d', $i);
    }
    return $return;
}

function getDates($num = 30)
{
    $start = $_SERVER['REQUEST_TIME'];
    $end = $start + $num * 86400;
    $weekarray = array("周日", "周一", "周二", "周三", "周四", "周五", "周六");
    $today = date('Y-m-d', $start);
    $date = [];
    for ($i = $start; $i <= $end; $i = $i + 86400) {
        $day = date('Y-m-d', $i);
        $w = date('w', $i);

        if ($day == $today) {
            $day2 = '今天';
        } else {
            $day2 = date('m-d', $i);
        }
        $date[] = [
            'day' => $day,
            'w' => $weekarray[$w],
            'day2' => $day2
        ];
    }
    return $date;
}

function getDate60()
{
    return getDates(60);
}

function getTimeWeek($time)
{
    $weekArray = [0 => "日", 1 => "一", 2 => "二", 3 => "三", 4 => "四", 5 => "五", 6 => "六"];
    return $weekArray[date("w", $time)];
}

function formatDateTime($dataTime)
{
    $text = '';
    $time = $dataTime === NULL || $dataTime > time() ? time() : intval($dataTime);
    $t = time() - $time; //时间差 （秒）
    $y = date('Y', $time) - date('Y', time());//是否跨年
    switch ($t) {
        case $t == 0:
            $text = '刚刚';
            break;
        case $t < 60:
            $text = $t . '秒前'; // 一分钟内
            break;
        case $t < 60 * 60:
            $text = floor($t / 60) . '分钟前'; //一小时内
            break;
        case $t < 60 * 60 * 24:
            $text = floor($t / (60 * 60)) . '小时前'; // 一天内
            break;
        case $t < 60 * 60 * 24 * 3:
            $text = floor($time / (60 * 60 * 24)) == 1 ? '昨天 ' . date('H:i', $time) : '前天 ' . date('H:i', $time); //昨天和前天
            break;
        case $t < 60 * 60 * 24 * 30:
            $text = date('m月d日 H:i', $time); //一个月内
            break;
        case $t < 60 * 60 * 24 * 365 && $y == 0:
            $text = date('m月d日', $time); //一年内
            break;
        default:
            $text = date('Y年m月d日', $time); //一年以前
            break;
    }

    return $text;
}


/*
 * 经度纬度 转换成距离
 * $lat1 $lng1 是 数据的经度纬度
 * $lat2,$lng2 是获取定位的经度纬度
 */

function rad($d)
{
    return $d * 3.1415926535898 / 180.0;
}

function getDistanceNone($lat1, $lng1, $lat2, $lng2)
{
    $EARTH_RADIUS = 6378.137;
    $radLat1 = rad($lat1);
    //echo $radLat1;
    $radLat2 = rad($lat2);
    $a = $radLat1 - $radLat2;
    $b = rad($lng1) - rad($lng2);
    $s = 2 * asin(sqrt(pow(sin($a / 2), 2) + cos($radLat1) * cos($radLat2) * pow(sin($b / 2), 2)));
    $s = $s * $EARTH_RADIUS;
    $s = round($s * 10000);
    return $s;
}

function getDistance($lat1, $lng1, $lat2, $lng2)
{
    $s = getDistanceNone($lat1, $lng1, $lat2, $lng2);
    $s = $s / 10000;
    if ($s < 1) {
        $s = round($s * 1000);
        $s .= 'm';
    } else {
        $s = round($s, 2);
        $s .= 'km';
    }
    return $s;
}

/**
 * 判断输入的字符串是否是一个合法的电话号码（仅限中国大陆）
 *
 * @param string $string
 * @return boolean
 */
function isPhone($string)
{
    if (preg_match('/^[0,4]\d{2,3}-\d{7,8}$/', $string))
        return true;
    return false;
}

/*
 * 下面的验证是否是合法手机号不正确
 * */
function isMobile($string)
{
    return preg_match('/^1[34578]\d{9}$/', $string);
}


function toJson($data)
{
    return json_decode($data);
}

function SecurityEditorHtml($str)
{
    $farr = array(
        "/\s+/", //过滤多余的空白
        "/<(\/?)(script|i?frame|style|html|body|title|link|meta|\?|\%)([^>]*?)>/isU",
        "/(<[^>]*)on[a-zA-Z]+\s*=([^>]*>)/isU"
    );
    $tarr = array(
        " ",
        "＜\\1\\2\\3＞",
        "\\1\\2",
    );
    $str = preg_replace($farr, $tarr, $str);
    $str = str_replace(array("\\r\\n", "\\r", "\\n"), "", $str);
    return $str;
}

//加解密函数

function authcode($string, $operation = 'ENCODE', $key = '', $expiry = 0)
{
    // 动态密匙长度，相同的明文会生成不同密文就是依靠动态密匙
    $ckey_length = 4;
    // 密匙
    $key = md5($key ? $key : config('auth.code'));
    // 密匙a会参与加解密
    $keya = md5(substr($key, 0, 16));
    // 密匙b会用来做数据完整性验证
    $keyb = md5(substr($key, 16, 16));
    // 密匙c用于变化生成的密文
    $keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length) :
        substr(md5(microtime()), -$ckey_length)) : '';
    // 参与运算的密匙
    $cryptkey = $keya . md5($keya . $keyc);
    $key_length = strlen($cryptkey);
    // 明文，前10位用来保存时间戳，解密时验证数据有效性，10到26位用来保存$keyb(密匙b)，
//解密时会通过这个密匙验证数据完整性
    // 如果是解码的话，会从第$ckey_length位开始，因为密文前$ckey_length位保存 动态密匙，以保证解密正确
    $string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) :
        sprintf('%010d', $expiry ? $expiry + time() : 0) . substr(md5($string . $keyb), 0, 16) . $string;
    $string_length = strlen($string);
    $result = '';
    $box = range(0, 255);
    $rndkey = array();
    // 产生密匙簿
    for ($i = 0; $i <= 255; $i++) {
        $rndkey[$i] = ord($cryptkey[$i % $key_length]);
    }
    // 用固定的算法，打乱密匙簿，增加随机性，好像很复杂，实际上对并不会增加密文的强度
    for ($j = $i = 0; $i < 256; $i++) {
        $j = ($j + $box[$i] + $rndkey[$i]) % 256;
        $tmp = $box[$i];
        $box[$i] = $box[$j];
        $box[$j] = $tmp;
    }
    // 核心加解密部分
    for ($a = $j = $i = 0; $i < $string_length; $i++) {
        $a = ($a + 1) % 256;
        $j = ($j + $box[$a]) % 256;
        $tmp = $box[$a];
        $box[$a] = $box[$j];
        $box[$j] = $tmp;
        // 从密匙簿得出密匙进行异或，再转成字符
        $result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
    }
    if ($operation == 'DECODE') {
        // 验证数据有效性，请看未加密明文的格式
        if ((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) &&
            substr($result, 10, 16) == substr(md5(substr($result, 26) . $keyb), 0, 16)
        ) {
            return substr($result, 26);
        } else {
            return '';
        }
    } else {
        // 把动态密匙保存在密文里，这也是为什么同样的明文，生产不同密文后能解密的原因
        // 因为加密后的密文可能是一些特殊字符，复制过程可能会丢失，所以用base64编码
        return $keyc . str_replace('=', '', base64_encode($result));
    }
    //替换url包成url参数唯一性；
}

/*
 * 把金额 转换成   万
 *
 */
function toMoney($money, $msg = true)
{
    return $_money = round($money / 10000) . $return = $msg == true ? '万' : "";
}

//二维数组转换函数
//参数  1 数组 2 要排序的值 3 排序方式

function arraySort($arr, $keys, $type = 'asc')
{
    if (empty($arr)) {
        return $arr;
    }
    $keysvalue = $new_array = array();
    foreach ($arr as $k => $v) {
        if (empty($v[$keys])) {
            return $arr;
        }
        $keysvalue[$k] = $v[$keys];
    }
    if ($type == 'asc') {
        asort($keysvalue);
    } else {
        arsort($keysvalue);
    }
    reset($keysvalue);
    foreach ($keysvalue as $k => $v) {
        $new_array[$k] = $arr[$k];
    }
    return $new_array;
}


/*
 * @param $cardNum string 卡号
 * @param $length  int      每几个为一组
 * @param $division
 *
 */
function formatCardNum($cardNum, $glue = ' ', $length = 3)
{
    return implode($glue, str_split($cardNum, $length));
}

/*
 *  生成核销码
 */
function generateCode($length = 10)
{
    return rand(pow(10, ($length - 1)), pow(10, $length) - 1);
}


/**
 * 判断区间
 * @param $stage_data array 范围数组 如 [99,199,299,399]
 * @param $stage_num integer 需要判断的数字
 * @return int 区间前一位 索引值
 */
function sorts($stage_data, $stage_num)
{
    array_push($stage_data, $stage_num);
    $data = array_unique($stage_data);
    sort($data);
    return array_search($stage_num, $data);
}


function isImage($imgurl)
{
    $ext1 = strtolower(substr($imgurl, strrpos($imgurl, '.')));
    $arr = ['.jpg', '.gif', '.png', '.jpeg'];
    return in_array($ext1, $arr);
}


/**
 * 根据当前系统 转换字符编码
 * linux  to utf8  win to gbk
 * @param $text string  文字内容
 */
function osCliText($text)
{
    if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') {
        return iconv('UTF-8', 'gbk', $text);
    }
    return $text;
}


/**
 * 将元 转换成 分
 * @param $money  float  价格浮点数 元
 * @return int 价格的 分
 */
function moneyToInt($money)
{
    return (int)bcmul($money, 100, 0);
}

/**
 * 价格格式化
 * @param int $money 价格 分
 * @param bool $format 是否格式化 默认 否
 * @return float|string  格式后的价格
 */
function moneyFormat($money, $format = false)
{
    return $format ? number_format($money / 100, 2) : round($money / 100, 2);
}

function getMean($name, $get = "v")
{
    $file = $get == "v" ? "statusvalue" : "statuskey";
    return (array)config("{$file}.{$name}");
}

/**
 * 将配置文件中的参数转换
 * @param $status
 */
function statusToMap($status)
{
    $return = [];
    foreach ($status as $key => $val) {
        $return[] = [
            'value' => $val,
            'key' => $key,
        ];
    }
    return $return;
}

function specKeyToArray($specKey)
{
    if (empty($specKey)) return "无规格";
    $specKeyArray = explode(",", $specKey);
    $key = [];
    foreach ($specKeyArray as $val) {
        $itemArray = explode(":", $val);
        $key[] = [
            'key' => empty($itemArray[0]) ? '' : $itemArray[0],
            'value' => empty($itemArray[1]) ? '' : $itemArray[1],
        ];
    }
    return $key;
}


/*
 * 线段切割法,分割砍价金额
*/
function lineCut($money, $people)
{
    //获取切割处
    $temp = [];
    while (count($temp) < $people - 1) {
        $number = mt_rand(1, $money - 1);
        $temp[$number] = 1;
    }
    //补头补尾
    $temp[0] = 1;
    $temp[$money] = 1;
    $temp = array_keys($temp);
    sort($temp);
    //循环分配
    $red_packet = [];
    for ($i = 0; $i < $people; $i++) {
        $red_packet[] = $temp[$i + 1] - $temp[$i];
    }
    $max_key = array_search(max($red_packet), $red_packet);
    if ($max_key > 0) {
        list ($red_packet[0], $red_packet[$max_key]) = [$red_packet[$max_key], $red_packet[0]];
    }
    return $red_packet;
}


function checkSevenDays($date_begin,$date_end) {
    //默认返回近七天数据、包括今天
    if ($date_begin && $date_end) {
        if ($date_begin > $date_end) {
            return false;
        }
        if (($date_end - $date_begin) / 86400 > 7) {
            return false;
        }
        $date = ['date_begin'=>$date_begin,'date_end'=>$date_end];
    } else {
        $date_begin = strtotime(date("Y-m-d",time()));
        $date_end = $date_begin + 86400;
        $date = ['date_begin'=>$date_begin,'date_end'=>$date_end];

    }
    return $date;
}

