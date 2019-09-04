<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:67:"/www/wwwroot/www.kuhukeji.com/application/web/view/about/index.html";i:1554979218;s:67:"/www/wwwroot/www.kuhukeji.com/application/web/view/public/menu.html";i:1554979218;s:69:"/www/wwwroot/www.kuhukeji.com/application/web/view/public/footer.html";i:1558839056;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?=$siteinfo['title'];?></title>
    <meta name="Keywords"  content="<?=$siteinfo['keyword'];?>" />
    <meta name="Description" content="<?=$siteinfo['desc'];?>" />

    <link type="text/css" rel="stylesheet" href="/static/web/css/common.css"/>
    <link type="text/css" rel="stylesheet" href="/static/web/css/about.css"/>
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
                <div class="m-topNav">
                    <ul class="menu">
                        <li><a <?=$selectIndex==1 ? 'class="active"' : '';?> href="/">首页</a></li>
                        <?php $i=0;foreach($apps as $val){ if($val['is_install'] == 1){ $i++; if($i<=2){?>
                        <li><a href="/<?=$val['app_dir'];?>/"><?=$val['app_name'];?></a></li>
                        <?php  }}}?>   
                        <li>
                            <a href="/web/app/index.html" <?=$selectIndex==2 ? 'class="active"' : '';?>>
                                   应用中心
                            </a>
                            
                        </li>
                        <li><a <?=$selectIndex==4 ? 'class="active"' : '';?> href="/web/about/index.html">关于我们</a></li>
                    </ul>
                </div>
                <div class="m-login">
                    <a class="u-btn register" style="margin-left: 60px" href="/web/passport/register.html">注册</a>
                    <a class="u-btn login" href="/web/passport/login.html">登录</a>
                </div>
            </div>
        </div>
    </div>

    <!--广告位置信息-->
    <div class="banner-box">
        <div class="n-wrap">
            <h1 class="bb-tit">重新定义，引领未来</h1>
        </div>
    </div>

    <!--关于我们内容-->
    <div class="about-box">
        <div class="n-wrap">
            <!--公司介绍-->
            <div class="aboutContBox active" id="tabNav_01_cont">
                <div class="aboutTit"><?=empty($siteinfo['company'])?'合肥微小宝网络科技有限公司':$siteinfo['company'];?></div>
                <div class="aboutDesc"><?=empty($siteinfo['about']) ? '' : $siteinfo['about'];?></div>
                <div class="aboutCompany">
                    <img src="/static/web/image/img_about01.png">
                </div>
                <!--办公环境 730 360 img_company.png-->
                <div class="envBox"></div>

                <div class="contactBox">
                    <div class="contactTit">联系方式</div>
                    <div class="contactCont">
                        <div class="item-contact">
                            <img class="ctact-icon" src="/static/web/image/icon_contact01.png">
                            <p class="tit">客服热线</p>
                            <p class="desc"><?=empty($siteinfo['tel']) ? '0551-65560407' : $siteinfo['tel'];?></p>
                        </div>
                        <div class="item-contact">
                            <img class="ctact-icon" src="/static/web/image/icon_contact02.png">
                            <p class="tit">技术支持邮箱</p>
                            <p class="desc"><?=empty($siteinfo['email']) ? 'youge@baototo.com' : $siteinfo['email'];?></p>

                        </div>
                        <div class="item-contact">
                            <img class="ctact-icon" src="/static/web/image/icon_contact03.png">
                            <p class="tit">客服QQ</p>
                            <p class="desc"> <?=empty($siteinfo['qq']) ? '2016030471' : $siteinfo['qq'];?></p>

                        </div>
                        <div class="item-contact">
                            <img class="ctact-icon" src="/static/web/image/icon_contact04.png">
                            <p class="tit">客服微信</p>
                            <p class="desc"> <?=empty($siteinfo['weixin']) ? '18096404936' : $siteinfo['weixin'];?></p>
                        </div>
                    </div>
                </div>

                <div class="addressBox">
                    <div class="addr-img">
                        <img src="<?=empty($siteinfo['map']) ? $siteinfo['map'] : '/static/web/image/map.png';?>">
                    </div>

                    <div class="addr-desc">
                        <div class="item">地址：<?=$siteinfo['addr'];?></div>
                        <div class="item">邮编：<?=$siteinfo['postcode'];?></div>
                        <div class="qr-cont">
                            <img class="qr-img" src="<?=empty($siteinfo['qrcode']) ? $siteinfo['qrcode'] : '/static/web/image/ma_footer.png';?>">
                            <p>关注微信公众号</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="footerNav">
            <div class="fNav-cont">
                <dl class="item-footer">
                    <dt>产品中心</dt>
                    <?php foreach($apps as $val){ if($val['is_install'] == 1){?>
                    <dd><a href="/<?=$val['app_dir'];?>/"><?=$val['app_name'];?></a></dd>
                    <?php }}?>    
                    <dd>更多研发中</dd>
                </dl>

                <dl class="item-footer">
                    <dt>关于我们</dt>
                    <dd><a href="/web/about/index.html">公司介绍</a></dd>
                    <dd><a href="/web/about/index.html">联系我们</a></dd>
                </dl>
    
                <dl class="item-footer">
                    <dt>帮助中心</dt>
                    <dd>售后工单</dd>
                </dl>
    
                <dl class="item-footer">
                    <dt>联系我们</dt>
                    <dd><span>客服QQ：</span><span style="color: #0089FF;"><?=!empty($siteinfo['qq']) ? $siteinfo['qq'] : '2016030471';?></span></dd>
                    <dd><span>客服微信：</span><span style="color: #0089FF;"><?=!empty($siteinfo['weixin']) ? $siteinfo['weixin'] : '18096404936';?></span></dd>
                  	<dd><a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=8a8628200fdbf724fe995cec48c9d471950a601b7055d4e0c714a796e60666dd"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="酷狐小程序制作平台" title="酷狐小程序制作平台"></a></dd>
                    <dd>技术邮箱：<?=!empty($siteinfo['email']) ? $siteinfo['email']: 'youge@baototo.com';?></dd>
                    <dd style="font-size: 24px;color: #fff;"><?=!empty($siteinfo['tel']) ? $siteinfo['tel'] : '0551-65560407';?></dd>
                    <dd style="color: #fff;">周一至周六 09:00-18:00</dd>
                </dl>
    
                <div class="item-footer" style="text-align: right;">
                    <div class="qrcode">
                        <img class="img-qr" src="<?=!empty($siteinfo['qrcode']) ? $siteinfo['qrcode'] : '/static/web/image/ma_footer.png';?>">
                        <p class="tit-qr">微信公众号</p>
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
                 <a target="_blank"  href="http://wpa.qq.com/msgrd?v=3&uin=<?=!empty($siteinfo['qq']) ? $siteinfo['qq'] : '2016030471';?>&site=qq&menu=yes">  <img class="c-icon" src="/static/web/image/icon_fr02.png">
                <p class="c-name">在线咨询</p>
                <div class="show-cont" style="top: 370px;"><?=!empty($siteinfo['qq']) ? $siteinfo['qq'] : '2016030471';?></div>
                </a>
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