<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:70:"/www/wwwroot/www.kuhukeji.com/application/web/view/passport/login.html";i:1558748961;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?=$siteinfo['title'];?></title>
    <meta name="Keywords"  content="<?=$siteinfo['keyword'];?>" />
    <meta name="Description" content="<?=$siteinfo['desc'];?>" />

    <link type="text/css" rel="stylesheet" href="/static/web/css/common.css"/>
    <link type="text/css" rel="stylesheet" href="/static/web/css/header.css"/>
    <link type="text/css" rel="stylesheet" href="/static/web/css/login.css"/>
    <script src="/static/web/js/jquery.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
        <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>

</head>
<body class="is-component">
<div id="loginbox" class="login-box is-component">
    <div class="n-wrap">
        <div class="loginCont">
            <div class="tLine"></div>
            <div class="login-form">
                <div class="form-tit">登录</div>
                <div class="form-group">
                    <label class="label">手机号</label>
                    <div class="field">
                        <div class="wrap-input">
                            <input name="mobile" type="text" v-model="mobile" class="control" placeholder="请输入手机号">
                            <i class="u-icon-clear"></i>
                            <label class="bottom-line"></label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="label">密&nbsp;&nbsp;码</label>
                    <div class="field">
                        <div class="wrap-input">
                            <input name="password" type="password" v-model="password"  autocomplete="off" class="control" placeholder="8-20位字符，包含数字和字母">
                            <i class="u-icon-clear"></i>
                            <label class="bottom-line"></label>
                        </div>
                    </div>
                </div>

                <div class="form-group" style="margin-top: 8px">
                    <div class="field">
                            <el-button @click="login" style="width:100%;" :loading="loading" type="primary">立即登陆</el-button>
                    </div>
                </div>

                <div class="form-group" style="margin-top: 1px">
                    <div class="field">
                        <div class="remember">
                            <label class="u-check" id="JZ">
                                <el-checkbox v-model="agree">已阅读并同意</el-checkbox>
                                <a href="/web/passport/protocol.html" style="color: #0078E0;">《用户使用协议》</a>
                            </label>
                        </div>
                        <div class="forget">
                            <a href="/web/passport/forget.html" class="f-tit">忘记密码</a>
                            <a href="/web/passport/register.html" class="r-tit">免费注册</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copy">ICP备案：<?=!empty($siteinfo['icp']) ? $siteinfo['icp'] : '皖ICP备14015149号-4';?> <?=!empty($siteinfo['company']) ? $siteinfo['company'] : '合肥微小宝网络科技有限公司';?> </div>
    </div>
</div>
<style>
    .login-form .form-group .remember .u-check {
        padding-left: 0px;
    }
    .el-checkbox{
        margin-right: 0px;
    }
</style>
<script>
    $.ajaxSetup({
        cache:false,
    });
    var vm = new Vue({
        el:'#loginbox',
         data:function(){
             return {
                mobile:'',
                password:'',
                agree:true,
                loading:false,
             };
         },methods: {
            login(){
                if(!this.agree){
                    this.$message({
                        message:'请同意使用协议！',
                        type:'error'
                    });
                    return;
                }

                if(this.mobile==''){
                    this.$message({
                        message:'请填写手机号码！',
                        type:'error'
                    });
                    return;
                }
                if(this.password == ''){
                   this.$message({
                        message:'请填写密码！',
                        type:'error'
                    });
                    return;
                }
                if(this.loading == true) return;
                var that = this;
                that.loading =true;

                $.post('/web/passport/login.html',{
                    mobile:that.mobile,
                    password:that.password
                },function(data,status){
                    that.loading =false;

                    if(data.code == 1){
                        that.$message({
                            message:data.msg,
                            type:'success'
                        });
                        setTimeout(function(){
                            window.location.href = data.url;
                        },2000);
                    }else{
                        that.$message({
                            message:data.msg,
                            type:'error'
                        });
                    }                   
                },'json');
                
            },
         },
    });
</script>
</body>
</html>