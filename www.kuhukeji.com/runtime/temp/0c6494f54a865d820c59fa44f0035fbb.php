<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:71:"/www/wwwroot/www.kuhukeji.com/application/website/view/index/index.html";i:1561087907;s:71:"/www/wwwroot/www.kuhukeji.com/application/website/view/public/menu.html";i:1561087907;s:73:"/www/wwwroot/www.kuhukeji.com/application/website/view/public/footer.html";i:1561087907;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?=$siteinfo['sitename'];?>万能建站---<?=$siteinfo['title'];?></title>
    <meta name="Keywords"  content="<?=$siteinfo['sitename'];?>万能建站小程序系统、<?=$siteinfo['sitename'];?>万能建站微信小程序、<?=$siteinfo['sitename'];?>万能建站支付宝小程序、<?=$siteinfo['sitename'];?>万能建站百度小程序" />
    <meta name="Description" content="<?=$siteinfo['desc'];?>" />


    <link type="text/css" rel="stylesheet" href="/static/web/css/common.css"/>
    <link type="text/css" rel="stylesheet" href="/static/web/css/website.css"/>
    <link type="text/css" rel="stylesheet" href="/static/web/plugin/swiper/css/swiper.min.css">
    <script type="text/javascript" src="/static/web/js/jquery.min.js"></script>

</head>
<body>
<section>
    <div class="topNav">
        <div class="topNav-block">
            <div class="logo">
                <a href="/"><img src="<?=$siteinfo['logo']?$siteinfo['logo']:'/static/web/image/logo.png';?>"/></a>
            </div>

            <div class="topNav-cont">
                
                <div class="m-login">
                    <a class="u-btn login" href="/web/passport/login.html">制作小程序</a>
                </div>
            </div>
        </div>
    </div>

    <!--轮播图片-->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide slide-02"></div>
       
        </div>
    </div>

    <div class="website-box">
        <div class="n-wrap" style="text-align: center;">
            <h3 class="com-tit">可视化万能建站小程序</h3>
            <p class="com-desc">颠覆传统建站，分分钟极速搭建速度，真正易用</p>
            <ul class="ws-cont">
                <li class="item-website">
                    <img class="wb-icon" src="/static/web/image/icon_advantage01.png">
                    <p class="wb-name">真正免费</p>
                </li>
                <li class="item-website">
                    <img class="wb-icon" src="/static/web/image/icon_advantage02.png">
                    <p class="wb-name">一键建站</p>
                </li>
                <li class="item-website">
                    <img class="wb-icon" src="/static/web/image/icon_advantage03.png">
                    <p class="wb-name">功能丰富</p>
                </li>
                <li class="item-website">
                    <img class="wb-icon" src="/static/web/image/icon_advantage04.png">
                    <p class="wb-name">海量模板</p>
                </li>
                <li class="item-website">
                    <img class="wb-icon" src="/static/web/image/icon_advantage05.png">
                    <p class="wb-name">维护便利</p>
                </li>
                <li class="item-website">
                    <img class="wb-icon" src="/static/web/image/icon_advantage06.png">
                    <p class="wb-name">自由设计</p>
                </li>
            </ul>

            <a href="/web/passport/login.html"><button class="free-have">免费拥有</button></a>
        </div>
    </div>

    <!--小程序渠道-->
    <div class="channel-box">
        <div class="n-wrap" style="text-align: center;">
            <h3 class="cb-tit">兼容四大小程序+H5</h3>
            <p class="cb-desc">支持微信、支付宝、百度、头条小程序+H5，五端合一</p>
            <img src="/static/web/image/img_qudao02.png" style="width:726px;height: 345px;">
        </div>
    </div>

    <!--数据显示-->
    <div class="data-box">
        <ul class="n-wrap">
            <li class="item-data">
                <p class="d-num"><span class="num">2000</span><span class="symbol">+</span></p>
                <p class="d-name">客户信任</p>
            </li>
            <li class="item-data">
                <p class="d-num"><span class="num">100</span><span class="symbol">+</span></p>
                <p class="d-name">覆盖行业</p>
            </li>
            <li class="item-data">
                <p class="d-num"><span class="num">200w</span><span class="symbol">+</span></p>
                <p class="d-name">用户覆盖</p>
            </li>
            <li class="item-data">
                <p class="d-num"><span class="num">100w</span><span class="symbol">+</span></p>
                <p class="d-name">研发代码</p>
            </li>
        </ul>
    </div>

    <!--制作小程序步骤-->
    <div class="step-box">
        <div class="n-wrap">
            <h1 class="sn-tit">三步打造专属小程序</h1>
            <p class="sn-hint">只需三步、真正傻瓜式操作</p>
            <div class="sn-cont">
                <div class="item-step">
                    <img src="/static/web/image/icon_step01.png">
                    <h3 class="step-tit">注册登录账号</h3>
                    <p class="step-hint">注册账号，登录账号，选择模板，提供海量模板，满足不同行业需求</p>
                </div>

                <img class="step-line" src="/static/web/image/icon_next.png">

                <div class="item-step">
                    <img src="/static/web/image/icon_step02.png">
                    <h3 class="step-tit">搭建小程序</h3>
                    <p class="step-hint">选择模板，随意修改模板数据和样式，省心省力</p>
                </div>

                <img class="step-line" src="/static/web/image/icon_next.png">

                <div class="item-step">
                    <img src="/static/web/image/icon_step03.png">
                    <h3 class="step-tit">发布小程序</h3>
                    <p class="step-hint">一键生成小程序代码，快速简单，发布小程及H5，手机打开预览</p>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="/static/web/js/jquery.qrcode.min.js"></script>

    <!--海量模板-->
    <div class="template-box">
        <div class="n-wrap" style="text-align: center;">
            <h3 class="com-tit">海量精美模板模板</h3>
            <p class="com-desc">海量模板、任你挑选，可自由添加拖拽、不耗时</p>
            <ul class="tmp-cont">
                <?php $i=0; foreach($temps as $val){ $i++;?>
                    <li class="item-template" <?php if($i==2 || $i==5){?> style="margin: 0 172px;"<?php }?>  >
                        <div class="tmp-top">
                            <img src="<?=$val['photo'];?>" class="thumb-img">
                            <div class="qrcode">
                                <div id="qrimg<?=$i;?>" class="qr-img"></div>
                                <p class="qr-name">微信扫描二维码预览</p>
                                <button class="qr-btn">免费拥有</button>
                            </div>
                        </div>
                        <h3 class="tmp-tit"><?=$val['title'];?></h3>
                        <p class="tmp-price">免费</p>
                    </li>
                    <script>
                        jQuery(function(){
                            jQuery('#qrimg<?=$i;?>').qrcode({ width: 160,
        height: 160,text:"<?=$val['url'];?>"});
                        });
                    </script>
                   
                    <?php }?>
    
            </ul>


            <a href="/website/index/template.html"><button class="btn-more">查看更多</button></a>
        </div>
    </div>

    <!--选择我要有，让创业更简单-->
    <div class="business-box">
        <div class="n-wrap" style="text-align: center">
            <h3 class="biz-tit">选择我要有，让创业更简单</h3>
            <div class="btn-tryout">
                <img src="/static/web/image/icon_zixun_white.png">
                <a href="/web/passport/login.html"><span style="color:#fff;">免费试用</span></a>
            </div>
        </div>
    </div>


    
    <div class="footerNav">
            <div class="fNav-cont">
                <dl class="item-footer">
                    <dt>产品中心</dt>
                    <?php foreach($apps as $val){ if($val['is_install'] == 1){?>
                    <dd><?=$val['app_name'];?></dd>
                    <?php }}?>    
                    <dd>更多研发中</dd>
                </dl>
    
                <dl class="item-footer">
                    <dt>关于我们</dt>
                    <dd>公司介绍</dd>
                    <dd>联系我们</dd>
                </dl>
    
                <dl class="item-footer">
                    <dt>帮助中心</dt>
                    <dd>售后工单</dd>
                </dl>
    
                <dl class="item-footer">
                    <dt>联系我们</dt>
                    <dd><span>客服QQ：</span><span style="color: #0089FF;"><?=!empty($siteinfo['qq']) ? $siteinfo['qq'] : '2016030471';?></span></dd>
                    <dd><span>客服微信：</span><span style="color: #0089FF;"><?=!empty($siteinfo['weixin']) ? $siteinfo['weixin'] : '18096404936';?></span></dd>
                    <dd>技术邮箱：<?=!empty($siteinfo['email']) ? $siteinfo['email']: 'youge@baototo.com';?></dd>
                    <dd style="font-size: 24px;color: #fff;"><?=!empty($siteinfo['tel']) ? $siteinfo['tel'] : '0551-65560407';?></dd>
                    <dd style="color: #fff;">周一至周六 09:00-18:00</dd>
                </dl>
    
                <div class="item-footer" style="text-align: right;">
                    <div class="qrcode">
                        <img class="img-qr" src="<?=!empty($siteinfo['qrcode']) ? $siteinfo['qrcode'] : '/static/web/image/ma_footer.png';?>">
                        <p class="tit-qr"><?=!empty($siteinfo['sitename']) ? $siteinfo['sitename'] : '--'?>微信公众号</p>
                    </div>
                </div>
            </div>
            <div class="copy">ICP备案：<?=!empty($siteinfo['icp']) ? $siteinfo['icp'] : '皖ICP备14015149号-4';?> <?=!empty($siteinfo['company']) ? $siteinfo['company'] : '合肥微小宝网络科技有限公司';?></div>
        </div>
    
        <!--悬浮客服弹窗-->
        <div class="customBox">
            <div class="item-custom c-phone">
                <img class="c-icon" src="/static/web/image/icon_fr01.png">
                <p class="c-name">电话咨询</p>
                <div class="show-cont"><?=!empty($siteinfo['tel']) ? $siteinfo['tel'] : '0551-65560407';?></div>
            </div>
            <div class="item-custom c-qq">
                <img class="c-icon" src="/static/web/image/icon_fr02.png">
                <p class="c-name">在线咨询</p>
                <div class="show-cont" style="top: 370px;"><?=!empty($siteinfo['qq']) ? $siteinfo['qq'] : '2016030471';?></div>
            </div>
            <div class="item-custom">
                <a href="/web/passport/login.html"><img class="c-icon" src="/static/web/image/icon_fr03.png">
                  <p class="c-name">免费试用</p>
                  </a>
            </div>
    
            <div class="custom-backTop" id="custom-backTop">
                <img class="backTop" src="/static/web/image/btn_returntop.png">
            </div>
        </div>
        <script type="text/javascript">
    
    
            //回到顶部
            $('#custom-backTop').click(function () {
                $('body,html').animate({scrollTop: 0}, 500);
                return false;
            });
            $(".customBox").addClass("customBox-show");
        
        
        </script>

</section>


</body>
</html>