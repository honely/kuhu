<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:71:"/www/wwwroot/www.kuhukeji.com/application/web/view/passport/forget.html";i:1558748961;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?=$siteinfo['title'];?></title>
    <meta name="Keywords"  content="<?=$siteinfo['keyword'];?>" />
    <meta name="Description" content="<?=$siteinfo['desc'];?>" />

    <link type="text/css" rel="stylesheet" href="/static/web/css/common.css"/>
    <link type="text/css" rel="stylesheet" href="/static/web/css/header.css"/>
    <script src="/static/web/js/jquery.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
        <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="/static/web/gt.js"></script>

    <link type="text/css" rel="stylesheet" href="/static/web/css/register.css"/>
</head>
<body>



<div id="regbox" class="register-box">
    <div class="n-wrap">
        <div class="registerCont">
            <div class="tLine"></div>

            <div class="register-form">
                <div class="form-tit">找回密码</div>
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

                <div class="error-cont"></div>

                <div class="reform-item">
                    <div class="m-regForm">
                        <label class="u-label">验证码</label>
                        <input type="text" autocomplete="off" name="code"  v-model="code" class="u-input" id="sms" tabindex="2" maxlength="6" placeholder="输入验证码">
                    </div>
                    <div class="m-smsBtn">
                        <button type="button" :class="djsType==0? 'u-btn u-btn-sms  u-btn-disabled' : 'u-btn u-btn-sms'" style="cursor: pointer" @click="getyzm" v-html="djsTxt">{{djsTxt}}</button>
                    </div>
                </div>

                <div class="form-group" v-show="showyzm" style="margin-top: 12px;">
                        <div id="embed-captcha"></div>
                </div>
              

                <div class="error-cont"></div>

                <div class="form-group">
                    <label class="label">新密码</label>
                    <div class="field">
                        <div class="wrap-input">
                            <input name="password" type="password"  v-model="password" autocomplete="off" class="control" placeholder="8-20位字符，包含数字和字母">
                            <i class="u-icon-clear"></i>
                            <label class="bottom-line"></label>
                        </div>
                    </div>
                </div>

                <div class="error-cont"></div>

               


                <div class="form-group" style="margin-top: 12px;">
                    <div class="field">
                        <button wyu="submit"  id="embed-submit" @click="onsubmit" type="button" loading="loading" class="u-btn u-btn-submit">立刻找回</button>
                    </div>
                </div>
                <div class="form-group" style="margin-top: 24px">
                    <div class="field">
                        <div class="login">
                            <a href="/web/passport/login.html" style="color: #0078E0;">我还记得，立即登陆</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="copy">ICP备案：<?=!empty($siteinfo['icp']) ? $siteinfo['icp'] : '皖ICP备14015149号-4';?> <?=!empty($siteinfo['company']) ? $siteinfo['company'] : '合肥微小宝网络科技有限公司';?> </div>
    </div>
</div>
<style>
    .register-form .form-group .remember .u-check {
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
        el:'#regbox',
         data:function(){
             return {
                 mobile:'',
                 code:'',
                 password:'',
                 captchaObj:null,
                 djs:180,
                 showyzm:false,
                 djsType:0,
                 djsTxt:'发送验证码',
                 djsObj:null,
                 agree:false,
                 loading:false,
                 is_gee_open: <?=$is_gee_open;?>,
             };
         },
         created(){
             if (this.is_gee_open == 1) {
                 this.initJY();
             }
         },
         methods: {
             /**
              * 初始化极验
              */
             initJY() {
                 var that = this;
                 $.ajax({
                     url: "<?=url('web/passport/getStart')?>", // 加随机数防止缓存
                     type: "get",
                     dataType: "json",
                     success: function (data) {
                         initGeetest({
                             gt: data.gt,
                             challenge: data.challenge,
                             new_captcha: data.new_captcha,
                             product: "embed",
                             offline: !data.success
                         }, that.handlerEmbed);
                     }
                 });
             },

            onsubmit(){
              
                var myreg = /^[1][0-9]{10}$/;
                if(!myreg.test(this.mobile)){
                    this.$message({
                        message:'请填写手机号码！',
                        type:'error'
                    });
                    return;
                }
                if(!this.code){
                    this.$message({
                        message:'请输入验证码',
                        type:'error'
                    });
                    return;
                }
                if(!this.password){
                    this.$message({
                        message:'请输入密码',
                        type:'error'
                    });
                    return;
                }
                var that  = this;
                if(this.loading == true) return;
                that.loading =true;

                $.post('/web/passport/forget.html',{
                    mobile:this.mobile,
                    password:this.password,
                    code:this.code,
                    agree:1,
                },function(data){
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
            getyzm(){
                var myreg = /^[1][0-9]{10}$/;
                if (!myreg.test(this.mobile)) {
                    this.$message({
                        message: '请填写手机号码！',
                        type: 'error'
                    });
                    return;
                }

                if (this.djsType == 0) {
                    this.djsType = 1;

                    this.djsTxt = '待验证';
                    if (this.is_gee_open == 1) {
                        this.showyzm = true;
                    } else {
                        this.getcode();
                    }
                }
            },
             handlerEmbed(captchaObj) {
                 this.captchaObj = captchaObj;
                 // 将验证码加到id为captcha的元素里，同时会有三个input的值：geetest_challenge, geetest_validate, geetest_seccode
                 this.captchaObj.appendTo("#embed-captcha");

                 var that = this;
                 that.captchaObj.onSuccess(function () {
                     that.getcode();
                 });
             },
            djsAction(){
                if (this.djsObj != null) {
                    clearInterval(this.djsObj);
                }
                this.djs = 180; //初始化数值
                var that = this;
                this.djsObj = setInterval(function () {
                    that.djs--;
                    if (that.djs == 0) {
                        that.djsType = 0;
                        that.djsTxt = '重新发送';
                        clearInterval(that.djsObj);
                    } else {
                        that.djsType = 1;
                        that.djsTxt = that.djs + '秒';
                    }
                }, 1000);
            },
            getcode(){
                var that = this;
                var param = {};
                if (this.is_gee_open == 1) {
                    var result = that.captchaObj.getValidate();
                    param = {
                        mobile: that.mobile,
                        geetest_challenge: result.geetest_challenge,
                        geetest_validate: result.geetest_validate,
                        geetest_seccode: result.geetest_seccode
                    }
                } else {
                    param = {
                        mobile: that.mobile,
                    };
                }
                $.ajax({
                    url: "<?=url('web/passport/sendSms2')?>", // 加随机数防止缓存
                    type: "post",
                    dataType: "json",
                    data: param,
                    success: function (data) {
                        that.djsAction();
                        if(that.is_gee_open == 1){
                            that.captchaObj.reset();
                            that.showyzm = false;
                        }
                    }
                });
            }
        },
    });
       
    
    
     
    
        
    </script>
</body>
</html>