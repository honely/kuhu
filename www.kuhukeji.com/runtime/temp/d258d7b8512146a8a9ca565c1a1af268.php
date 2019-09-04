<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:68:"/www/wwwroot/www.kuhukeji.com/application/web/view/member/index.html";i:1554979218;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?=$siteinfo['title'];?></title>
    <meta name="Keywords"  content="<?=$siteinfo['keyword'];?>" />
    <meta name="Description" content="<?=$siteinfo['desc'];?>" />

    <link type="text/css" rel="stylesheet" href="/static/web/css/common.css"/>
    <link type="text/css" rel="stylesheet" href="/static/web/css/ucenter.css"/>

    <script src="/static/web/js/jquery.min.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
        <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>
<body style="background: #f2f2f2;">
 <div id="ucenterbox">
    <div class="headerNav">
        <div class="nav-block">
            

            <div class="nav-tit">
                <p class="tit">商户管理中心</p>
            </div>

            <div class="rt">
                欢迎<?=$member['mobile'];?><a @click="logout" href="javascript:void(0);">退出</a>
            </div>
        </div>
    </div>

    <div class="ucenter-main">
   
       

     
        <div v-if=" is_create ==1" style="padding-bottom:30px;"  class="ucenter-box mt20">
            <div class="ucenter-catlist">
             
                <el-button  style="float: right;" @click="is_create = 0" size="mini">返回</el-button>
            </div>

            <el-row  :gutter="40">
                <?php foreach($apps as $val){ if($val['is_install'] == 1 && $val['app_type'] == 1){ ?>
                <el-col style="margin-top:20px;"  :span="6">
                        <div class="app_type_item">
                            <img src="<?=$val['app_create_icon'];?>" />

                            <el-input size="small" style="width:80%;margin-top:20px;" @change="setName" v-model="input[<?=$val['app_id'];?>]" placeholder="请输入小程序名称"></el-input>

                            <el-button type="primary" style="width:80%; margin-top:10px;" @click="createApp(<?=$val['app_id'];?>)"  size="small">立即创建</el-button>
                        </div>
                </el-col>
                <?php }}?>
                <el-col style="margin-top:20px;"  :span="6">
                    <div class="app_type_item">
                        <img src="/static/web/image/img_more@2x.png" />

                        <el-button type="primary" style="width:80%; margin-top:50px;"  size="small" :disabled="true">我要制作</el-button>
                    </div>
            </el-col>
            
            </el-row>

        </div>

        <div v-if=" is_create ==0" style="min-height: 500px;" v-loading="loading" class="ucenter-box mt20">
            <div class="ucenter-catlist">
                <a :class="app_type ==0 ?'on' :''" @click="select(0)" href="javascript:void(0);">所有应用</a>
                <?php foreach($apps as $val){ if($val['is_install'] == 1 && $val['app_type'] == 1){ ?>
                <a @click="select(<?=$val['app_id'];?>)" :class="app_type==<?=$val['app_id'];?> ? 'on' : ''" href="javascript:void(0);"><?=$val['app_name'];?></a>
                <?php } }?>    
                <el-button type="primary" style="float: right;" @click="is_create = 1" size="mini">创建小程序</el-button>
            </div>


            <el-row style="min-height: 400px;" :gutter="20">
                <el-col v-for="(item,index) in apps" style="margin-top:20px;" :span="6">
                    <div class="miniapp-item">
                        <h2>{{item.app_name}}</h2>
                        <div class="cnt-row mt20">
                           类型 : {{item.app_type_mean}}
                        </div>
                        <div class="cnt-row mt10">
                            创建时间：2019-01-28 16:4
                        </div>
                        <div class="btn-list mt20">
                            <a target="_blank" :href="item.url"><el-button size="mini">管理</el-button></a>
                            <el-button @click="delApp(item.app_id)" size="mini">删除</el-button>
                        </div>
                    </div>

                </el-col>
            </el-row>
            <div class="pagelist">
                <el-pagination
                small
                :page-size="pagesize"
                @current-change="setPage"
                layout="prev, pager, next"
                :total="num">
            </el-pagination>
            </div>
        </div>

    </div>

    <div class="copy">ICP备案：<?=!empty($siteinfo['icp']) ? $siteinfo['icp'] : '皖ICP备14015149号-4';?> <?=!empty($siteinfo['company']) ? $siteinfo['company'] : '合肥微小宝网络科技有限公司';?> </div>

</div>   



<script>
    $.ajaxSetup({
        cache:false,
    });
    var vm = new Vue({
        el:'#ucenterbox',
         data:function(){
             return {
                app_type:0,
                is_create:0,
                page:1,
                loading:false,
                apps:[],
                input:[],
               app_name:'',
                num:0,
                pagesize:8,
             };
         },
         created(){
             this.getApps();
         },
         methods: {
            logout(){
                $.post('/web/member/logout',{
                },function(data){
                    if(data.code == 1){
                        window.location.href=data.url;
                    }else{
                        that.$message.error(data.msg); 
                    }

                },'json');
            },
            createApp(appType){
                if(this.app_name==''){
                    this.$message.error('请输入小程序名称');
                    return;    
                }
                var that = this;
                $.post('/web/member/createApp',{
                    app_type:appType,
                    app_name:this.app_name
                },function(data){
                    if(data.code == 1){
                        window.location.href=data.url;
                    }else{
                        that.$message.error(data.msg); 
                    }

                },'json');
            },
            setName(e){
                this.app_name = e;
            },  
            select(id){
                this.app_type = id;
                this.page = 1;
                this.getApps();
            },
            setPage(page){
                console.log(page);
                this.page = page;
                this.getApps();
            },
            delApp(app_id){
                this.$confirm('此操作将永久删除该小程序?', '操作提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
                }).then(() => {
                    var that = this;
                    $.post('/web/member/delApp',{
                        app_id: app_id,
                    },function(res){
                        if(res.code == 1){
                            that.getApps();
                        }
                    },'json');
                }).catch(() => {
                      
                });
            },
            getApps(){
                var  that  = this;
                if(this.loading == false){
                    this.loading = true;
                    $.post('/web/member/getApp',{
                        app_type: this.app_type,
                        page:this.page,
                    },function(res){
                        console.log(res);
                        that.loading  = false;
                        that.apps = res.data.apps;
                        that.num  = res.data.count;
                        that.pagesize = res.data.limit;

                    },'json');
                }
               
            },
         },
    });
</script>
</body>
</html>