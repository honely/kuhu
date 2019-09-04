<?php
header("Content-Type: text/html;charset=utf-8");
error_reporting(E_ERROR | E_PARSE);
@set_time_limit(0);

if (file_exists('../install.lock')) {
    //404通知
    header('HTTP/1.1 404 Not Found');
    die;
}

$action = empty($_GET['action']) ? 'index' : $_GET['action'];


//安装页面的首页
if ($action == 'index') {

    require './views/index.html';
}

if ($action == 'install') {
    $status = get();
    if ($status == 1) {
        $str = "<?php
return [
    'type'            => 'mysql',
    'hostname'        => '" . $_REQUEST['dbhost'] . "',
    'database'        => '" . $_REQUEST['dbname'] . "',
    'username'        => '" . $_REQUEST['dbuser'] . "',
    'password'        => '" . $_REQUEST['dbpwd'] . "',
    'hostport'        => '" . $_REQUEST['dbport'] . "',
    'dsn'             => '',
    'params'          => [],
    'charset'         => 'utf8',
    'prefix'          => 'wyu_',
    'debug'           => false,
    'deploy'          => 0,
    'rw_separate'     => false,
    'master_num'      => 1,
    'slave_no'        => '',
    'read_master'     => false,
    'fields_strict'   => true,
    'resultset_type'  => 'array',
    'auto_timestamp'  => false,
    'datetime_format' => 'Y-m-d H:i:s',
    'sql_explain'     => false,
];
";
        file_put_contents('../application/database.php', $str);
        $str2 = "<?php
return [
    'admin' => '" . md5(microtime(true) . rand(0, 10000)) . "',
    'app'   => '" . md5(microtime(true) . rand(0, 10000)) . "',
    'api'   => '" . md5(microtime(true) . rand(0, 10000)) . "'
];
";
        file_put_contents('../application/extra/tokenkey.php', $str2);
        $sql = file_get_contents('./install.sql');
        try {
            $dbh = new PDO('mysql:host=' . $_REQUEST['dbhost'] . ';dbname=' . $_REQUEST['dbname'], $_REQUEST['dbuser'], $_REQUEST['dbpwd']); //初始化一个PDO对象
            $sql = str_replace("\r\n", "\n", $sql);
            $sqls = explode(";\n", $sql);
            foreach ($sqls as $val) {
                $dbh->exec($val);
            }
            $dbh->exec("insert into wyu_admin (username,password,add_time) values('{$_REQUEST['admin']}','" . md5($_REQUEST['password']) . "','" . time() . "')");
            $setting = json_encode(['account_id' => $_REQUEST['appId'], 'account_token' => $_REQUEST['appToken']]);
            $smsTmp = '{"appid":"","appkey":"","regtemplateid":"","regtemplate":"\u5c0a\u656c\u7684\u7528\u6237\uff0c\u60a8\u597d\uff01\u60a8\u7684\u9a8c\u8bc1\u7801\u662f{1}\u3002"}';
            $dbh->exec("insert into wyu_setting values('tx_sms','{$smsTmp}')");
            $dbh->exec("insert into wyu_setting values('wyu_auth','{$setting}')");
            $dbh = null;
            file_put_contents('../install.lock', 'https://www.woyaou.com');
            die('1');
        } catch (PDOException $e) {
            die ("Error!: " . $e->getMessage() . "<br/>");
        }
    } else {
        die('0');
    }
}

//安装页面环境检测
if ($action == 'check') {
    $message = [
        'dir' => [],
        'func' => [],
        'isYes' => 1,
    ];
    $checkList = [
        '../',
        '../cdn/',
        '../h5/',
        '../miniapp/',
        '../application/',
        '../application/extra/',
        '../application/extra/tokenkey.php',
        '../application/database.php',
    ];

    foreach ($checkList as $val) {
        if (!file_exists($val)) {
            $message['dir'][] = [
                'msg' => $val . '文件不存在',
                'type' => 0,
            ];
            $message['isYes'] = 0;
        } else if (is_writable_met($val)) {
            $message['dir'][] = [
                'msg' => $val . '文件检测通过',
                'type' => 1,
            ];
        } else {
            $message['dir'][] = [
                'msg' => $val . '文件检测不通过',
                'type' => 0,
            ];
            $message['isYes'] = 0;
        }
    }


    //要检查的方法 
    $function = [
        'curl_init',
        'file_put_contents',
        'fsockopen',
        'copy',
        'gzinflate',
        'fopen',
        'opendir',
        'crc32',
        'gzopen',
        'unpack',
        'bin2hex',
        'pack',
        'php_uname',
        'ini_set',
        'mb_strlen',
    ];

    foreach ($function as $val) {
        if (!function_exists($val)) {
            $message['func'][] = [
                'msg' => $val . '函数检测不通过',
                'type' => 0,
            ];
            $message['isYes'] = 0;
        } else {
            $message['func'][] = [
                'msg' => $val . '函数检测通过',
                'type' => 1,
            ];
        }
    }

    //要检查的扩展
    $class = [
        'ZipArchive',
        'PDO'
    ];

    foreach ($class as $val) {
        if (!class_exists($val)) {
            $message['func'][] = [
                'msg' => $val . '扩展检测不通过',
                'type' => 0,
            ];
            $message['isYes'] = 0;
        } else {
            $message['func'][] = [
                'msg' => $val . '扩展检测通过',
                'type' => 1,
            ];
        }
    }


    echo json_encode($message);
    die;
}

function is_writable_met($dir)
{
    $str = '';
    $is_dir = 0;
    if (is_dir($dir)) {
        $dir = $dir . 'metinfo.txt';
        $is_dir = 1;
        $info = 'metinfo';
    } else {
        $fp = @fopen($dir, 'r+');
        $i = 0;
        while ($i < 10) {
            $info .= @fgets($fp);
            $i++;
        }
        @fclose($fp);
        if ($info == '') return false;
    }
    $fp = @fopen($dir, 'w+');
    @fputs($fp, $info);
    @fclose($fp);
    if (!file_exists($dir)) return false;
    $fp = @fopen($dir, 'r+');
    $i = 0;
    while ($i < 10) {
        $str .= @fgets($fp);
        $i++;
    }
    @fclose($fp);
    if ($str != $info) return false;
    if ($is_dir == 1) {
        @unlink($dir);
    }
    return true;
}

function get()
{
    $t = time();
    $sign = md5($t . $_REQUEST['appId'] . $_REQUEST['appToken']);
    $url = 'https://www.woyaou.com/api/account/check.html?account_id=' . $_REQUEST['appId'] . '&account_t=' . $t . '&account_sign=' . $sign;
    $curl = curl_init(); // 启动一个CURL会话
    curl_setopt($curl, CURLOPT_URL, $url); // 要访问的地址
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0); // 对认证证书来源的检查
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0); // 从证书中检查SSL加密算法是否存在
    curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']); // 模拟用户使用的浏览器
    if (ini_get('open_basedir') == '' && ini_get('safe_mode' == 'Off')) {
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1); // 使用自动跳转
    }
    curl_setopt($curl, CURLOPT_AUTOREFERER, 1); // 自动设置Referer
    curl_setopt($curl, CURLOPT_HTTPGET, 1); // 发送一个常规的Post请求
    curl_setopt($curl, CURLOPT_TIMEOUT, 30); // 设置超时限制防止死循环
    curl_setopt($curl, CURLOPT_HEADER, 0); // 显示返回的Header区域内容
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); // 获取的信息以文件流的形式返回
    $tmpInfo = curl_exec($curl); // 执行操作
    if (curl_errno($curl)) {
        echo 'Errno' . curl_error($curl);
    }
    curl_close($curl); // 关闭CURL会话
    return $tmpInfo; // 返回数据
}