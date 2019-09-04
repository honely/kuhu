<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:68:"/www/wwwroot/www.kuhukeji.com/application/shop/view/index/index.html";i:1561087928;s:68:"/www/wwwroot/www.kuhukeji.com/application/shop/view/public/menu.html";i:1561087928;s:70:"/www/wwwroot/www.kuhukeji.com/application/shop/view/public/footer.html";i:1561087928;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?=$siteinfo['sitename'];?>分销商城---<?=$siteinfo['title'];?></title>
    <meta name="Keywords"  content="<?=$siteinfo['sitename'];?>分销商城小程序系统、<?=$siteinfo['sitename'];?>分销商城微信小程序、<?=$siteinfo['sitename'];?>分销商城支付宝小程序、<?=$siteinfo['sitename'];?>分销商城百度小程序" />
    <meta name="Description" content="<?=$siteinfo['desc'];?>" />

    <link type="text/css" rel="stylesheet" href="/static/web/css/common.css"/>
    <link type="text/css" rel="stylesheet" href="/static/web/css/mall.css"/>
    <link type="text/css" rel="stylesheet" href="/static/web/plugin/swiper/css/swiper.min.css">

    <script type="text/javascript" src="/static/web/js/jquery.min.js"></script>
    <script type="text/javascript" src="/static/web/js/jquery.qrcode.min.js"></script>

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

    <!--电商种类-->
    <div class="type-box">
        <div class="n-wrap">
            <h3 class="t-tit">适用多种电商业态</h3>
            <p class="t-desc">多业态多细分行业支持，全面解决电商行业移动营销需求！</p>
            <ul class="t-cont">
                <li class="item-type">
                    <div class="it-icon">
                        <img src="/static/web/image/icon_hangye01.png">
                    </div>
                    <p class="it-name">服装鞋靴</p>
                </li>

                <li class="item-type">
                    <div class="it-icon">
                        <img src="/static/web/image/icon_hangye02.png">
                    </div>
                    <p class="it-name">快消食品</p>
                </li>

                <li class="item-type">
                    <div class="it-icon">
                        <img src="/static/web/image/icon_hangye03.png">
                    </div>
                    <p class="it-name">美妆洗护</p>
                </li>

                <li class="item-type">
                    <div class="it-icon">
                        <img src="/static/web/image/icon_hangye04.png">
                    </div>
                    <p class="it-name">母婴亲子</p>
                </li>

                <li class="item-type">
                    <div class="it-icon">
                        <img src="/static/web/image/icon_hangye05.png">
                    </div>
                    <p class="it-name">手机数码</p>
                </li>

                <li class="item-type">
                    <div class="it-icon">
                        <img src="/static/web/image/icon_hangye06.png">
                    </div>
                    <p class="it-name">珠宝首饰</p>
                </li>

                <li class="item-type">
                    <div class="it-icon">
                        <img src="/static/web/image/icon_hangye07.png">
                    </div>
                    <p class="it-name">水果生鲜</p>
                </li>

                <li class="item-type">
                    <div class="it-icon">
                        <img src="/static/web/image/icon_hangye08.png">
                    </div>
                    <p class="it-name">茶叶酒水</p>
                </li>

                <li class="item-type">
                    <div class="it-icon">
                        <img src="/static/web/image/icon_hangye09.png">
                    </div>
                    <p class="it-name">百货商超</p>
                </li>

                <li class="item-type">
                    <div class="it-icon">
                        <img src="/static/web/image/icon_hangye10.png">
                    </div>
                    <p class="it-name">更多</p>
                </li>
            </ul>
        </div>
    </div>

    <!--小程序渠道-->
    <div class="channel-box">
        <div class="n-wrap" style="text-align: center;">
            <h3 class="cb-tit">线上社交全渠道开店，海量曝光</h3>
            <p class="cb-desc">支持微信、支付宝、百度、头条小程序+H5，五端合一，把握社交网络每一份流量</p>
            <img src="/static/web/image/img_qudao01.png" style="width:726px;height: 345px;">
        </div>
    </div>

    <!--装修小程序-->
    <div class="decorate-box">
        <div class="nor-img"></div>
        <div class="n-wrap">
            <h3 class="db-tit">店铺装修组件可视化，不是设计师也能有范儿</h3>
            <p class="db-desc">100+套精选模板，一键应用；零代码可视化自助建站，零基础简单拖拽操作，上百功能控件任意组合</p>
            <div class="show-img">
                <img class="img-lt" src="/static/web/image/img_mockplus_left.png"/>
                <img class="img-rt" src="/static/web/image/img_mockplus_right.png"/>
            </div>
        </div>
    </div>

    <!--营销方法-->
    <div class="market-box">
        <div class="mb-header">
            <div class="n-wrap">
                <p class="mh-tit">营销玩法多元化，助力商家提升成交</p>
                <div class="mh-tab">
                    <div class="item-tab active" menu_type="tabNav_01">
                        <p class="it-name">获客拉新</p>
                    </div>
                    <div class="item-tab" menu_type="tabNav_02">
                        <p class="it-name">下单转化</p>
                    </div>
                    <div class="item-tab" menu_type="tabNav_03">
                        <p class="it-name">裂变分销</p>
                    </div>
                    <div class="item-tab" menu_type="tabNav_04">
                        <p class="it-name">留存复购</p>
                    </div>
                </div>
            </div>
        </div>

        <div id="tabNav_01_cont" class="tabContBox active">
            <div class="n-wrap">
                <div class="item-func">
                    <h3 class="if-tit">多渠道流量获取，</h3>
                    <p class="if-desc">帮助商家快速获客</p>
                    <img class="if-img" src="/static/web/image/img_yingxiaoA01.png">
                </div>
                <div class="func-line">
                    <img src="/static/web/image/icon_step.png">
                </div>
                <div class="item-func">
                    <h3 class="if-tit">多人拼团，</h3>
                    <p class="if-desc">引导客户邀请好友一起购买</p>
                    <img class="if-img" src="/static/web/image/img_yingxiaoA02.png">
                </div>
                <div class="func-line">
                    <img src="/static/web/image/icon_step.png">
                </div>
                <div class="item-func">
                    <h3 class="if-tit">好友帮砍价，</h3>
                    <p class="if-desc">以一带百，裂变社交提升客单量</p>
                    <img class="if-img" src="/static/web/image/img_yingxiaoA03.png">
                </div>
            </div>
        </div>
        <div id="tabNav_02_cont" class="tabContBox">
            <div class="n-wrap">
                <div class="item-func">
                    <h3 class="if-tit">领取优惠券，</h3>
                    <p class="if-desc">店铺运营必备，百搭实用</p>
                    <img class="if-img" src="/static/web/image/img_yingxiaoB01.png">
                </div>
                <div class="func-line">
                    <img src="/static/web/image/icon_step.png">
                </div>
                <div class="item-func">
                    <h3 class="if-tit">限时秒杀，</h3>
                    <p class="if-desc">定时特价促销，拉动店铺人气</p>
                    <img class="if-img" src="/static/web/image/img_yingxiaoB02.png">
                </div>
                <div class="func-line">
                    <img src="/static/web/image/icon_step.png">
                </div>
                <div class="item-func">
                    <h3 class="if-tit">满减折扣，</h3>
                    <p class="if-desc">限时让满减打折促销更灵活更省心</p>
                    <img class="if-img" src="/static/web/image/img_yingxiaoB03.png">
                </div>
            </div>
        </div>
        <div id="tabNav_03_cont" class="tabContBox">
            <div class="n-wrap">
                <div class="item-func">
                    <h3 class="if-tit">分销推广顾问，</h3>
                    <p class="if-desc">分销奖励，让更多人帮你卖货</p>
                    <img class="if-img" src="/static/web/image/img_yingxiaoC01.png">
                </div>
                <div class="func-line">
                    <img src="/static/web/image/icon_step.png">
                </div>
                <div class="item-func">
                    <h3 class="if-tit">拼团速购，</h3>
                    <p class="if-desc">呼朋喊友享优惠，商品卖的更多更好</p>
                    <img class="if-img" src="/static/web/image/img_yingxiaoC02.png">
                </div>
                <div class="func-line">
                    <img src="/static/web/image/icon_step.png">
                </div>
                <div class="item-func">
                    <h3 class="if-tit">邀好友砍价，</h3>
                    <p class="if-desc">多人砍价，增加店铺商品曝光度</p>
                    <img class="if-img" src="/static/web/image/img_yingxiaoC03.png">
                </div>
            </div>
        </div>
        <div id="tabNav_04_cont" class="tabContBox">
            <div class="n-wrap">
                <div class="item-func">
                    <h3 class="if-tit">会员储蓄钱包，</h3>
                    <p class="if-desc">会员钱包充值，带来持续复购</p>
                    <img class="if-img" src="/static/web/image/img_yingxiaoD01.png">
                </div>
                <div class="func-line">
                    <img src="/static/web/image/icon_step.png">
                </div>
                <div class="item-func">
                    <h3 class="if-tit">积分商城，</h3>
                    <p class="if-desc">积分兑换，增加用户粘性，活跃客户</p>
                    <img class="if-img" src="/static/web/image/img_yingxiaoD02.png">
                </div>
                <div class="func-line">
                    <img src="/static/web/image/icon_step.png">
                </div>
                <div class="item-func">
                    <h3 class="if-tit">用户签到，</h3>
                    <p class="if-desc">签到送积分，让客户活跃度突飞猛进</p>
                    <img class="if-img" src="/static/web/image/img_yingxiaoD03.png">
                </div>
            </div>
        </div>
    </div>

    <!--销售渠道-->
    <div class="sale-box">
        <div class="n-wrap" style="position: relative;">
            <h3 class="com-tit">分销推广顾问拓展销售渠道，让更多人帮你宣传卖货</h3>
            <p class="com-desc">通过分销奖励引发裂变传播，粉丝变渠道，订单不用愁</p>
            <div class="sb-cont">
                <div class="sb-lt">
                    <img class="active" id="saleNav_01_cont" src="/static/web/image/img_fenxiao01.png">
                    <img id="saleNav_02_cont" src="/static/web/image/img_fenxiao02.png">
                    <img id="saleNav_03_cont" src="/static/web/image/img_fenxiao03.png">
                    <img id="saleNav_04_cont" src="/static/web/image/img_fenxiao04.png">
                </div>
                <div class="sb-rt">
                    <ul style="width: 400px;margin: 0 auto;">
                        <li class="item-sale active" menu_type="saleNav_01">
                            <p class="is-tit">1、商家制定分销规则，搭建招募页面</p>
                            <p class="is-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;顾问等级、佣金比例和权益</p>
                        </li>
                        <li class="item-sale" menu_type="saleNav_02">
                            <p class="is-tit">2、分享至微信群和朋友圈</p>
                            <p class="is-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;低成本招募粉丝推广</p>
                        </li>
                        <li class="item-sale" menu_type="saleNav_03">
                            <p class="is-tit">3、分销员分享生成推广海报</p>
                            <p class="is-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;顾问海报、商品海报、图文二维码</p>
                        </li>
                        <li class="item-sale" menu_type="saleNav_04">
                            <p class="is-tit">4、分销成功，获得佣金奖励</p>
                            <p class="is-desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;能者多得让分销员更有干劲定期佣金结算</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!--plus粉丝-->
    <div class="fans-box">
        <div class="n-wrap">
            <h3 class="com-tit">VIP会员-您的忠实粉丝，精准营销拉升客单</h3>
            <p class="com-desc">VIP会员享受权益灵活多样，智能触达精准客户</p>
            <div class="fb-cont">
                <div class="fb-lt">
                    <img src="/static/web/image/img_plus_left.png"/>
                </div>
                <div class="fb-rt">
                    <img src="/static/web/image/img_plus.png"/>
                </div>
            </div>
        </div>
    </div>

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
                                <div  id="qrimg<?=$i;?>" class="qr-img"></div>
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
            <a href="/shop/index/template.html"><button class="btn-more">查看更多</button></a>
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




<script type="text/javascript">
    $(function () {
        $(".item-tab").on("click", "", function (e) {
            var menu_type = $(this).attr("menu_type");
            console.log($(this).hasClass("active"))
            if (!$(this).hasClass("active")) {
                console.log($(this).addClass("active").removeClass("active"));
                $(this).addClass("active").siblings().removeClass("active");
                $("#" + menu_type + "_cont").addClass("active").siblings().removeClass("active");
            }
        })

        $(".item-sale").on("click", "", function (e) {
            var menu_type = $(this).attr("menu_type");
            console.log($(this).hasClass("active"))
            if (!$(this).hasClass("active")) {
                console.log($(this).addClass("active").removeClass("active"));
                $(this).addClass("active").siblings().removeClass("active");
                $("#" + menu_type + "_cont").addClass("active").siblings().removeClass("active");
            }
        })
    });

</script>

</body>
</html>