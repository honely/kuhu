<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:71:"/www/wwwroot/www.kuhukeji.com/application/shop/view/index/template.html";i:1561087928;s:68:"/www/wwwroot/www.kuhukeji.com/application/shop/view/public/menu.html";i:1561087928;s:70:"/www/wwwroot/www.kuhukeji.com/application/shop/view/public/footer.html";i:1561087928;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?=$siteinfo['sitename'];?>分销商城模版---<?=$siteinfo['title'];?></title>
    <meta name="Keywords"  content="<?=$siteinfo['sitename'];?>分销商城小程序系统模版、<?=$siteinfo['sitename'];?>分销商城微信小程序模版、<?=$siteinfo['sitename'];?>分销商城支付宝小程序模版、<?=$siteinfo['sitename'];?>分销商城百度小程序" />
    <meta name="Description" content="<?=$siteinfo['desc'];?>" />


    <link type="text/css" rel="stylesheet" href="/static/web/css/common.css"/>
    <link type="text/css" rel="stylesheet" href="/static/web/css/website.css"/>
    <link type="text/css" rel="stylesheet" href="/static/web/plugin/swiper/css/swiper.min.css">
    <script type="text/javascript" src="/static/web/js/jquery.min.js"></script>
    <link type="text/css" rel="stylesheet" href="/static/web/css/template.css"/>

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
            <div class="swiper-slide slide-01"></div>
       
        </div>
    </div>

    <div class="template-list">
            <div class="n-wrap">
                <ul class="tmp-list">
                    
                    <li class="rt-tmp">
                        <div class="type-box">
                            <span class="type-tit"><?=empty($appname)?'全部模版':$appname;?></span>
                            <?php if(!empty($cats)){ ?>
                            <span class="item-type <?php if($cat == 0){ ?>active <?php }?>"><a href="/shop/index/template.html">全部</a></span>
                            <?php foreach($cats as $val){ ?>
                            <span class="item-type <?php if($cat == $val['cat_id']){ ?>active <?php }?>"><a href="/shop/index/template/cat/<?=$val['cat_id'];?>.html"><?=$val['cat_name'];?></a></span>
                              <?php } }?>     
                        </div>
                        <script type="text/javascript" src="/static/web/js/jquery.qrcode.min.js"></script>
    
                        <ul class="tmp-cont">
                            <?php $i=0; foreach($temps as $val){ $i++;?>
                                <li class="item-template" >
                                    <div class="tmp-top">
                                        <img src="<?=$val['photo'];?>" class="thumb-img">
                                        <div class="qrcode">
                                            <div id="qrimg<?=$i;?>" class="qr-img"></div>
                                            <p class="qr-name">微信扫描二维码预览</p>
                                            <button class="qr-btn">免费拥有</button>
                                        </div>
                                    </div>
                                    <script>
                                        jQuery(function(){
                                            jQuery('#qrimg<?=$i;?>').qrcode({ width: 160,
                        height: 160,text:"<?=$val['url'];?>"});
                                        });
                                    </script>
                                    <h3 class="tmp-tit"><?=$val['title'];?></h3>
                                    <p class="tmp-price">免费</p>
                                </li>
                               
                               
                                <?php }?>
                        
                        </ul>
    
                        <div style="display: block;margin-top: 10px; width: 100%; text-align: center;">
                            <?=$page;?>
                        </div>
                    </li>
                </ul>
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