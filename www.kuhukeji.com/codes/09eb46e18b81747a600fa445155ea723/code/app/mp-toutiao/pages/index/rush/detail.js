(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/index/rush/detail"],{"13b5":function(t,i,s){"use strict";s.r(i);var a=s("d7eb"),e=s.n(a);for(var o in a)"default"!==o&&function(t){s.d(i,t,function(){return a[t]})}(o);i["default"]=e.a},"58dc":function(t,i,s){"use strict";s.r(i);var a=s("98c5"),e=s("13b5");for(var o in e)"default"!==o&&function(t){s.d(i,t,function(){return e[t]})}(o);s("a0c7");var d=s("2877"),r=Object(d["a"])(e["default"],a["a"],a["b"],!1,null,null,null);i["default"]=r.exports},"7b45":function(t,i,s){"use strict";s("2346");var a=o(s("58dc")),e=o(s("3a53"));function o(t){return t&&t.__esModule?t:{default:t}}a.default.mpType="page";var d=new e.default(a.default);d.$mount()},"98c5":function(t,i,s){"use strict";var a=function(){var t=this,i=t.$createElement,s=t._self._c||i;return s("view",{staticClass:"goods-detail-box",attrs:{_hid:0}},[t._ri(!!t.detail,1)?s("view",{attrs:{_hid:1}},[s("tab-view",{attrs:{type:2,tabBars:t.tabBars,_hid:2,_batrs:"type,tabBars",_cid:0},on:{tapTab:t.tapTab}}),t._ri(!(0!=t.index),1004)?s("block",{attrs:{_hid:1004}},[s("view",{staticClass:"goods-video-box",attrs:{_hid:1005}},[s("swiper",{staticStyle:{height:"100%"},attrs:{circular:"true",interval:"3000",duration:"500",autoplay:"true",_hid:1006},on:{change:t.bannerChangeListener}},t._l(t.detail.photos,function(t,i,a){var e=void 0!==a?a:i;return s("swiper-item",{key:i,attrs:{_hid:1007,_fid:e,_fk:"index"}},[s("image",{staticStyle:{width:"100%",height:"100%"},attrs:{src:t,_hid:1008,_fid:e,_batrs:"src"}})])},1007,t._self)),s("view",{staticClass:"share-box",attrs:{_hid:1009}},[s("button",{staticClass:"btn-share",attrs:{"open-type":"share",_hid:1010}}),s("text",{staticClass:"iconfont icon-btn_share",staticStyle:{color:"#fff"},attrs:{_hid:1011}})],1),t._ri(!!(t.detail&&t.detail.photos&&t.detail.photos.length>0),1012)?s("view",{staticClass:"dot-bg",attrs:{_hid:1012}},[t._v(t._s(t.currIndex)+"/"+t._s(t.detail.photos?t.detail.photos.length:0),1013)]):t._e()],1),s("view",{staticClass:"bargain-info",attrs:{_hid:1014}},[s("view",{staticClass:"lt-barInfo",attrs:{_hid:1015}},[s("view",{staticClass:"price",attrs:{_hid:1016}},[s("text",{attrs:{_hid:1017}},[]),s("text",{staticStyle:{"font-size":"32px","margin-left":"4px"},attrs:{_hid:1019}},[t._v(t._s(t.detail.qg_rushbuy_price),1020)])]),s("view",{staticClass:"cost-price",attrs:{_hid:1021}},[s("view",{staticClass:"cp-top",attrs:{_hid:1022}},[s("text",{attrs:{_hid:1023}},[]),s("text",{staticStyle:{"text-decoration":"line-through"},attrs:{_hid:1025}},[t._v("¥"+t._s(t.detail.market_price),1026)])]),s("view",{staticClass:"cp-bottom",attrs:{_hid:1027}},[])]),s("image",{staticClass:"arrow-img",attrs:{src:t.imgBaseUrl+"/box_m@2x.png",_hid:1029,_batrs:"src"}})]),s("view",{staticClass:"rt-barInfo",attrs:{_hid:1030}},[s("view",{staticClass:"rt-top",attrs:{_hid:1031}},[]),s("view",{staticClass:"rt-bottom",attrs:{_hid:1033}},[s("uni-countdown",{attrs:{color:"#ffffff",splitorColor:"#ED3005","background-color":"#ED3005","border-color":"rgba(0,0,0,0)",hour:t.hour,minute:t.minute,second:t.second,"show-day":!1,_hid:1034,_batrs:"hour,minute,second,show-day",_cid:1}})],1)])]),s("view",{staticClass:"goods-info",attrs:{_hid:2036}},[s("view",{staticClass:"goods-name",attrs:{_hid:2037}},[t._v(t._s(t.detail.goods_name),2038)]),s("view",{staticClass:"goods-price",attrs:{_hid:2039}},[s("text",{staticStyle:{color:"#ED3005","font-size":"16px"},attrs:{_hid:2040}},[]),s("text",{staticStyle:{color:"#ED3005","font-size":"32px"},attrs:{_hid:2042}},[t._v(t._s(t.detail.shop_price),2043)]),s("text",{staticStyle:{color:"#999999","font-size":"14px","margin-left":"8px"},attrs:{_hid:2044}},[]),s("text",{staticStyle:{color:"#999999","font-size":"14px","margin-left":"4px","text-decoration":"line-through"},attrs:{_hid:2046}},[t._v(t._s(t.detail.market_price),2047)])]),s("view",{staticClass:"goods-desc",attrs:{_hid:2048}},[s("view",{staticClass:"item-desc",attrs:{_hid:2049}},[s("text",{staticStyle:{color:"#666666"},attrs:{_hid:2050}},[]),s("text",{attrs:{_hid:2052}},[t._v(t._s(t.detail&&0==t.detail.is_free_shipping?t.detail.shipping_price+"元":"免费"),2053)])]),s("view",{staticClass:"item-desc",attrs:{_hid:2054}},[s("text",{staticStyle:{color:"#666666"},attrs:{_hid:2055}},[]),s("text",{attrs:{_hid:2057}},[t._v(t._s(t.detail&&t.detail.qg_goods_num?t.detail.qg_goods_num:"0"),2058)])]),s("view",{staticClass:"item-desc",attrs:{_hid:2059}},[s("text",{staticStyle:{color:"#666666"},attrs:{_hid:2060}},[]),s("text",{attrs:{_hid:2062}},[t._v(t._s(t.detail&&t.detail.qg_buy_num?t.detail.qg_buy_num:"0"),2063)])])])]),t._ri(!1,2064)?s("view",{staticClass:"goods-server-info",attrs:{_hid:2064}},[s("view",{staticClass:"item-server",attrs:{_hid:2065}},[s("text",{staticStyle:{width:"50px"},attrs:{_hid:2066}},[]),s("text",{attrs:{_hid:2068}},[])]),s("view",{staticClass:"item-server",attrs:{_hid:2070}},[s("text",{staticStyle:{width:"50px"},attrs:{_hid:2071}},[]),s("text",{attrs:{_hid:2073}},[])]),s("view",{staticClass:"item-server-desc",attrs:{_hid:2075}},[s("text",{staticStyle:{width:"50px","line-height":"50px"},attrs:{_hid:2076}},[]),s("view",{staticClass:"server-info",attrs:{_hid:2078}},[s("view",{staticClass:"sinfo-item",attrs:{_hid:2079}},[s("text",{staticClass:"iconfont icon-icon_success",attrs:{_hid:2080}}),s("text",{staticStyle:{"margin-left":"4px"},attrs:{_hid:2081}},[])]),s("view",{staticClass:"sinfo-item",attrs:{_hid:2083}},[s("text",{staticClass:"iconfont icon-icon_success",attrs:{_hid:2084}}),s("text",{staticStyle:{"margin-left":"4px"},attrs:{_hid:2085}},[])]),s("view",{staticClass:"sinfo-item",attrs:{_hid:2087}},[s("text",{staticClass:"iconfont icon-icon_success",attrs:{_hid:2088}}),s("text",{staticStyle:{"margin-left":"4px"},attrs:{_hid:2089}},[])])])])]):t._e(),t._ri(!!t.detail.goods_attr,2091)?s("goodsDescribe",{attrs:{attr:t.detail.goods_attr,content:t.detail.goods_content,_hid:2091,_batrs:"attr,content",_cid:2}}):t._e(),s("view",{staticStyle:{width:"100%",height:"60px"},attrs:{_hid:3093}}),s("view",{staticClass:"bottom-info",attrs:{_hid:3094}},[s("view",{staticClass:"item-bottom-menu",staticStyle:{display:"flex","align-items":"center"},attrs:{_hid:3095}},[s("view",{staticClass:"ib-menu",attrs:{_hid:3096},on:{click:t.toHomeListener}},[s("text",{staticClass:"iconfont icon-tabbar",staticStyle:{"font-size":"22px"},attrs:{_hid:3097}}),s("view",{staticStyle:{"font-size":"12px","margin-top":"5px"},attrs:{_hid:3098}},[])]),s("view",{staticClass:"ib-menu",attrs:{_hid:3100},on:{click:t.toCallPhone}},[s("text",{staticClass:"iconfont icon-btn_call",staticStyle:{"font-size":"22px"},attrs:{_hid:3101}}),s("view",{staticStyle:{"font-size":"12px","margin-top":"5px"},attrs:{_hid:3102}},[])])]),t._ri(!!t.qg_end_time,3104)?s("view",{staticClass:"item-bottom-menu",staticStyle:{flex:"2",color:"#fff","font-size":"18px",background:"#ED3005"},attrs:{_hid:3104},on:{click:t.showSkuDialogListener}},[]):t._e(),t._ri(!(0!=t.qg_end_time),3106)?s("view",{staticClass:"item-bottom-menu",staticStyle:{flex:"2",color:"#fff","font-size":"18px",background:"#999999"},attrs:{_hid:3106}},[]):t._e()])],1):t._e(),t._ri(!(1!=t.index),3108)?s("block",{attrs:{_hid:3108}},[s("view",{staticClass:"common-info",attrs:{_hid:3109}},[t._ri(!1,3110)?s("view",{staticClass:"comm-desc",attrs:{_hid:3110}},[s("view",{staticClass:"lt-comm",attrs:{_hid:3111}},[s("text",{attrs:{_hid:3112}},[]),s("text",{staticStyle:{"margin-left":"8px"},attrs:{_hid:3114}},[])]),s("view",{staticClass:"rt-comm",attrs:{_hid:3116}},[])]):t._e(),s("view",{staticClass:"comm-type",attrs:{_hid:3118}},[s("view",{staticClass:"item-type",class:1==t.comment_type?"active":"",attrs:{"data-type":"1",_hid:3119},on:{click:t.commentTypeListener}},[]),s("view",{staticClass:"item-type",class:2==t.comment_type?"active":"",attrs:{"data-type":"2",_hid:3121},on:{click:t.commentTypeListener}},[]),s("view",{staticClass:"item-type",class:3==t.comment_type?"active":"",attrs:{"data-type":"3",_hid:3123},on:{click:t.commentTypeListener}},[]),s("view",{staticClass:"item-type",class:4==t.comment_type?"active":"",attrs:{"data-type":"4",_hid:3125},on:{click:t.commentTypeListener}},[])])]),t._ri(!!(t.comment.length>0),3127)?s("view",{staticClass:"common-list",attrs:{_hid:3127}},t._l(t.comment,function(i,a,e){var o=void 0!==e?e:a;return s("view",{key:a,staticClass:"item-common",attrs:{_hid:3128,_fid:o,_fk:"index"}},[s("view",{staticClass:"icom-lt",attrs:{_hid:3129,_fid:o}},[s("image",{staticClass:"user-face",attrs:{src:i.face?i.face:t.imgBaseUrl+"/mine/img_my_head@3x.png",_hid:3130,_fid:o,_batrs:"src"}})]),s("view",{staticClass:"icom-rt",attrs:{_hid:3131,_fid:o}},[s("view",{staticClass:"user-info",attrs:{_hid:3132,_fid:o}},[s("view",{staticClass:"uinfo-lt",attrs:{_hid:3133,_fid:o}},[s("view",{staticClass:"u-name",attrs:{_hid:3134,_fid:o}},[t._v(t._s(i.username),3135,o)]),s("view",{staticClass:"u-date",attrs:{_hid:3136,_fid:o}},[t._v(t._s(i.add_time),3137,o)])]),s("view",{staticClass:"uinfo-rt",attrs:{_hid:3138,_fid:o}},[t._l(i.goods_rank,function(t,i,o){var d=(void 0!==e?e:a)+"-"+(void 0!==o?o:i);return s("block",{key:t,attrs:{_hid:3139,_fid:d,_fk:"n"}},[s("text",{staticClass:"iconfont icon-Star_c xingxing",staticStyle:{color:"#FFAE19"},attrs:{_hid:3140,_fid:d}})])},"3139-"+(void 0!==e?e:a),t._self),t._ri(!!(5-i.goods_rank>0),3141,void 0!==e?e:a)?s("block",{attrs:{_hid:3141,_fid:o}},t._l(5-i.goods_rank,function(t,i,o){var d=(void 0!==e?e:a)+"-"+(void 0!==o?o:i);return s("text",{key:t,staticClass:"iconfont icon-Star_c xingxing",staticStyle:{color:"#DFE6EB"},attrs:{_hid:3142,_fid:d,_fk:"m"}})},"3142-"+(void 0!==e?e:a),t._self)):t._e()],1)]),s("view",{staticClass:"common-cont",attrs:{_hid:3143,_fid:o}},[t._v(t._s(i.content),3144,o)]),s("view",{staticClass:"common-img",attrs:{_hid:3145,_fid:o}},t._l(i.img,function(t,i,e){var o=(void 0!==e?e:a)+"-"+(void 0!==e?e:i);return s("image",{key:i,staticClass:"c-img",attrs:{src:t,_hid:3146,_fid:o,_batrs:"src",_fk:"z"}})},"3146-"+(void 0!==e?e:a),t._self))])])},3128,t._self)):t._e(),t._ri(!!t.more,3147)?s("view",{staticClass:"more",attrs:{bindtap:"getRushDetail",_hid:3147}},[]):t._e(),t._ri(!t.more,3149)?s("view",{staticClass:"nodata",attrs:{_hid:3149}},[]):t._e()]):t._e(),t._ri(!(2!=t.index),3151)?s("view",{staticClass:"rcm-list",attrs:{_hid:3151}},t._l(t.likes,function(i,a,e){var o=void 0!==e?e:a;return s("navigator",{key:a,attrs:{url:"/pages/index/goods/detail?goods_id="+i.goods_id,"open-type":"redirect",_hid:3152,_fid:o,_batrs:"url",_fk:"i"}},[s("view",{staticClass:"rcm-goods",attrs:{_hid:3153,_fid:o}},[s("image",{staticClass:"g-img",attrs:{src:i.photosales_sum,_hid:3154,_fid:o,_batrs:"src"}}),s("view",{staticClass:"g-info",attrs:{_hid:3155,_fid:o}},[s("view",{staticClass:"ellipsis-02 gname",attrs:{_hid:3156,_fid:o}},[t._v(t._s(i.goods_name),3157,o)]),s("view",{staticClass:"g-desc",attrs:{_hid:3158,_fid:o}},[s("view",{staticClass:"price-num",attrs:{_hid:3159,_fid:o}},[s("text",{attrs:{_hid:3160,_fid:o}},[]),s("text",{staticStyle:{"font-size":"18px"},attrs:{_hid:3162,_fid:o}},[t._v(t._s(i.shop_price),3163,o)])]),s("view",{staticClass:"sell-num",attrs:{_hid:3164,_fid:o}},[s("text",{attrs:{_hid:3165,_fid:o}},[t._v(t._s(i.sales_sum),3166,o)]),s("text",{staticStyle:{color:"#666666"},attrs:{_hid:3167,_fid:o}},[])])])])])])},3152,t._self)):t._e(),t._ri(!(!t.likeMore||2!=t.index),3169)?s("view",{staticClass:"more",attrs:{_hid:3169},on:{click:t.getLikeGoodsList}},[]):t._e(),t._ri(!(t.likeMore||2!=t.index),3171)?s("view",{staticClass:"nodata",attrs:{_hid:3171}},[]):t._e()],1):t._e(),s("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",_hid:3173,_batrs:"img",_cid:3}}),s("ToastView",{attrs:{_hid:4175,_cid:4}}),t._ri(!!t.skuFlag,5177)?s("skuDialog",{attrs:{specs:t.specs,showNum:1,noadd:t.getRushDetail(),detail:t.detail,_hid:5177,_batrs:"specs,showNum,noadd,detail",_cid:5},on:{addEvent:t.sureSelectGoodsListener,closeEvent:t.hideSkuDialogListener}}):t._e()],1)},e=[];s.d(i,"a",function(){return a}),s.d(i,"b",function(){return e})},a0c7:function(t,i,s){"use strict";var a=s("cc23"),e=s.n(a);e.a},cc23:function(t,i,s){},d7eb:function(t,i,s){"use strict";(function(t){Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;var a=d(s("540a")),e=d(s("8972")),o=d(s("9219"));function d(t){return t&&t.__esModule?t:{default:t}}var r={data:function(){return{specs:[],skuFlag:!1,hour:0,minute:0,second:0,qg_end_time:0,index:0,tabBars:[{name:"商品",id:"0"},{name:"评价",id:"1"},{name:"推荐",id:"2"}],tData:{type:1,pbottom:0,ptop:22,mtop:0,data:{icon:"icon_quan",title:"领取优惠券"}},rushbuy_goods_id:0,detail:"",currIndex:1,comment_type:1,comment:[],more:0,page:1,likes:[],likePage:1,likeMore:0,imgBaseUrl:"",customerNum:"",userid:0}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},components:{goodsDescribe:e.default,uniCountdown:o.default,skuDialog:a.default},onLoad:function(i){var s=this,a=t.getStorageSync("user_id");void 0!=a&&""!=a&&(s.$data.userid=a),void 0!=i.pid&&""!=i.pid&&t.setStorageSync("pid",i.pid),s.wxb.printLog("=============onLoad================"),s.wxb.addPage(this),s.wxb.Init(i,function(t){s.$data.customerNum=t.info.tel,void 0!=i.id&&(s.$data.rushbuy_goods_id=i.id),s.getRushDetail()})},onUnload:function(){this.wxb.printLog("=============onUnload================"),this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:t.$data.detail&&""!=t.$data.detail.goods_name?t.$data.detail.goods_name:"商品详情",path:"/pages/index/rush/detail?id="+t.$data.rushbuy_goods_id+"&pid="+t.$data.userid}},methods:{toCallPhone:function(i){var s=this,a=s.$data.customerNum;""!=a?t.makePhoneCall({phoneNumber:a}):t.showToast({title:"请先配置"})},toHomeListener:function(i){t.reLaunch({url:"/pages/index/index"})},showSkuDialogListener:function(t){this.$data.skuFlag=!0},hideSkuDialogListener:function(t){this.$data.skuFlag=!1},sureSelectGoodsListener:function(i){console.log(i);var s=this,a=i.detail,e=a.goodsNum,o=a.sku;a.sku_msg;t.navigateTo({url:"buy?goods_id="+s.$data.rushbuy_goods_id+"&goodsNum="+e+"&spec_key="+o})},bannerChangeListener:function(t){this.$data.currIndex=t.detail.current+1},tapTab:function(t){this.$data.index=t,2==t&&(this.$data.likePage=1,this.getLikeGoodsList())},catchTouchMove:function(t){},getLikeGoodsList:function(){var t=this,i=t.$data.likePage,s=t.$data.likes;1==i&&(s=[]),t.$data.detail&&t.wxb.Post("/shop/api.goods/index",{page:t.$data.likePage,p_cat_id:0},function(i){for(var a in i.list)s.push(i.list[a]);t.$data.likes=s,t.$data.likePage+=1,t.$data.likeMore=i.isMore})},commentTypeListener:function(t){var i=t.currentTarget.dataset.type;this.$data.comment_type=i,this.$data.page=1,this.getRushDetail()},getRushDetail:function(t){var i=this,s=i.$data.comment,a=i.$data.page;1==a&&(s=[]),i.wxb.Post("/shop/api.Rushbuy/detail",{rushbuy_goods_id:i.$data.rushbuy_goods_id,comment_type:i.$data.comment_type,page:i.$data.page},function(t){for(var e in t.comment.comment)s.push(t.comment.comment[e]);if(1==a){i.$data.detail=t.detail,i.$data.qg_end_time=t.detail.qg_end_time,console.log("倒计时->"+t.detail.qg_end_time);var o=i.$data.qg_end_time,d=o/3600|0,r=(Math.round(o)-3600*d)/60|0;o=o%60|0;console.log("hour->"+d),console.log("minute->"+r),console.log("second->"+o),i.$data.hour=d,i.$data.minute=r,i.$data.second=o;var n=[];for(var c in t.detail.spec){var _=[];for(var e in t.detail.spec[c])t.detail.spec[c][e].select="item-spec-nor",_.push(t.detail.spec[c][e]);n.push({name:c,list:_})}i.$data.specs=n,i.wxb.printLog(n)}i.$data.isMore=t.comment.isMore,i.$data.comment=s,i.$data.page+=1})}}};i.default=r}).call(this,s("f266")["default"])}},[["7b45","common/runtime","common/vendor"]]]);