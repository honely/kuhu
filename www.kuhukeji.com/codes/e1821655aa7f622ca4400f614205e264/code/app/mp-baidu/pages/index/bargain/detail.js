(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/index/bargain/detail"],{"38bd":function(t,i,a){"use strict";(function(t){Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;var s=o(a("540a")),e=o(a("8972")),d=o(a("9219")),r=o(a("0eb2"));function o(t){return t&&t.__esModule?t:{default:t}}var n={data:function(){return{userid:0,hour:0,minute:0,second:0,bargain_id:"",detail:"",index:0,tabBars:[{name:"商品",id:"0"},{name:"评价",id:"1"},{name:"推荐",id:"2"}],tData:{type:1,pbottom:0,ptop:22,mtop:0,data:{icon:"icon_quan",title:"领取优惠券"}},currIndex:1,kan_surplus_time:0,specs:[],skuFlag:!1,buyType:0,goodsNum:0,sku:"",address_id:"",addressFlag:!1,list:[],comment_type:1,comment:[],more:0,page:1,likes:[],likePage:1,likeMore:0,imgBaseUrl:"",customerNum:""}},components:{skuDialog:s.default,goodsDescribe:e.default,uniCountdown:d.default,addressView:r.default},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(i){var a=this,s=t.getStorageSync("user_id");void 0!=s&&""!=s&&(a.$data.userid=s),void 0!=i.pid&&""!=i.pid&&t.setStorageSync("pid",i.pid),a.wxb.printLog("=============onLoad================"),a.wxb.addPage(this),a.wxb.Init(i,function(t){a.$data.customerNum=t.info.tel,void 0!=i.id&&(a.$data.bargain_id=i.id),a.getBargainDetail(),a.getAddressList()})},onUnload:function(){this.wxb.printLog("=============onUnload================"),this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:t.$data.detail&&""!=t.$data.detail.goods_name?t.$data.detail.goods_name:"商品详情",path:"/pages/index/bargain/detail?id="+t.$data.bargain_id+"&pid="+t.$data.userid}},methods:{toCallPhone:function(i){var a=this,s=a.$data.customerNum;""!=s?t.makePhoneCall({phoneNumber:s}):t.showToast({title:"请先配置"})},toHomeListener:function(i){t.reLaunch({url:"/pages/index/index"})},getLikeGoodsList:function(){var t=this,i=t.$data.likePage,a=t.$data.likes;1==i&&(a=[]),t.$data.detail&&t.wxb.Post("/shop/api.goods/index",{page:t.$data.likePage,p_cat_id:0},function(i){for(var s in i.list)a.push(i.list[s]);t.$data.likes=a,t.$data.likePage+=1,t.$data.likeMore=i.isMore})},showSkuDialogListener:function(t){this.$data.skuFlag=!0},hideSkuDialogListener:function(t){this.$data.skuFlag=!1},buyGoodsListener:function(i){t.redirectTo({url:"../goods/detail?goods_id="+this.$data.detail.goods_id})},bargainGoodsListener:function(i){if(1==this.$data.detail.is_kan&&0==this.$data.detail.is_kan)t.navigateTo({url:"join?bargain_item_id="+this.$data.detail.bargain_item_id+"&kan_price=0"});else{var a=this;a.showSkuDialogListener(),this.$data.buyType=1}},sureSelectGoodsListener:function(t){var i=this;if(0==i.$data.buyType);else if(1==i.$data.buyType){console.log(t);var a=t.detail,s=a.goodsNum,e=a.sku;this.$data.goodsNum=s,this.$data.sku=e,this.hideSkuDialogListener(),this.showAddressDialogListener()}},getAddressList:function(t){var i=this;i.wxb.Post("/shop/api.address/getIndex",{},function(t){i.$data.list=t.list})},showAddressDialogListener:function(t){this.$data.addressFlag=!0},hideAddressDialogListener:function(t){this.$data.addressFlag=!1},selectAddrListener:function(t){console.log("确定选择的地址");var i=this,a=(t=JSON.parse(t),t.address_id);i.$data.address_id=a,i.hideAddressDialogListener(),i.openBargain()},openBargain:function(i){var a=this;a.wxb.Post("/shop/api.bargain/openBargain",{bargain_id:a.$data.bargain_id,spec_key:a.$data.sku,address_id:a.$data.address_id},function(i){a.getBargainDetail(),t.navigateTo({url:"join?bargain_item_id="+i.bargain_item_id+"&kan_price="+i.kan_price})})},bannerChangeListener:function(t){this.$data.currIndex=t.detail.current+1},commentTypeListener:function(t){var i=t.currentTarget.dataset.type;this.$data.comment_type=i,this.$data.page=1,this.getBargainDetail()},getBargainDetail:function(t){var i=this,a=i.$data.comment,s=i.$data.page;1==s&&(a=[]),i.wxb.Post("/shop/api.bargain/detail",{bargain_id:i.$data.bargain_id,comment_type:i.$data.comment_type,page:i.$data.page},function(t){for(var e in t.comment.comment)a.push(t.comment.comment[e]);if(1==s){i.$data.detail=t.detail,i.$data.kan_surplus_time=t.detail.kan_surplus_time;var d=i.$data.kan_surplus_time,r=d/3600|0,o=(Math.round(d)-3600*r)/60|0;d=d%60|0;i.$data.hour=r,i.$data.minute=o,i.$data.second=d;var n=[];for(var c in t.detail.spec){var _=[];for(var e in t.detail.spec[c])t.detail.spec[c][e].select="item-spec-nor",_.push(t.detail.spec[c][e]);n.push({name:c,list:_})}i.$data.specs=n,i.wxb.printLog(n)}i.$data.isMore=t.comment.isMore,i.$data.comment=a,i.$data.page+=1})},tapTab:function(t){this.$data.index=t,2==t&&(this.$data.likePage=1,this.getLikeGoodsList())},catchTouchMove:function(t){}}};i.default=n}).call(this,a("5486")["default"])},"4e3a":function(t,i,a){"use strict";var s=a("d36a"),e=a.n(s);e.a},"71af":function(t,i,a){"use strict";a.r(i);var s=a("f69f"),e=a("afed");for(var d in e)"default"!==d&&function(t){a.d(i,t,function(){return e[t]})}(d);a("4e3a");var r=a("2877"),o=Object(r["a"])(e["default"],s["a"],s["b"],!1,null,null,null);i["default"]=o.exports},"842c":function(t,i,a){"use strict";a("2346");var s=d(a("71af")),e=d(a("3a53"));function d(t){return t&&t.__esModule?t:{default:t}}s.default.mpType="page";var r=new e.default(s.default);r.$mount()},afed:function(t,i,a){"use strict";a.r(i);var s=a("38bd"),e=a.n(s);for(var d in s)"default"!==d&&function(t){a.d(i,t,function(){return s[t]})}(d);i["default"]=e.a},d36a:function(t,i,a){},f69f:function(t,i,a){"use strict";var s=function(){var t=this,i=t.$createElement,a=t._self._c||i;return a("view",{staticClass:"goods-detail-box",attrs:{_hid:0}},[t._ri(!!t.detail,1)?a("view",{attrs:{_hid:1}},[a("tab-view",{attrs:{type:2,tabBars:t.tabBars,_hid:2,_batrs:"type,tabBars",_cid:0},on:{tapTab:t.tapTab}}),t._ri(!(0!=t.index),1004)?a("block",{attrs:{_hid:1004}},[a("view",{staticClass:"goods-video-box",attrs:{_hid:1005}},[t._ri(!1,1006)?a("view",{staticClass:"notice-info",attrs:{_hid:1006}},[a("view",{staticClass:"notice-list",attrs:{_hid:1007}},[a("swiper",{staticStyle:{height:"36px"},attrs:{circular:"true",vertical:"true",interval:"3000",duration:"500",autoplay:"true",_hid:1008}},t._l(t.detail.bargain_log,function(i,s,e){var d=void 0!==e?e:s;return a("swiper-item",{key:s,attrs:{catchtouchmove:"catchTouchMove",_hid:1009,_fid:d,_fk:"i"}},[a("view",{staticClass:"item-notice",attrs:{_hid:1010,_fid:d}},[a("image",{staticClass:"icon-notice",attrs:{src:i.face,_hid:1011,_fid:d,_batrs:"src"}}),a("text",{attrs:{_hid:1012,_fid:d}},[t._v(t._s(i.nickname)+"刚刚抢到了该商品",1013,d)])])])},1009,t._self))],1)]):t._e(),a("swiper",{staticStyle:{height:"100%"},attrs:{circular:"true",interval:"3000",duration:"500",autoplay:"true",_hid:1014},on:{change:t.bannerChangeListener}},t._l(t.detail.photos,function(t,i,s){var e=void 0!==s?s:i;return a("swiper-item",{key:i,attrs:{_hid:1015,_fid:e,_fk:"index"}},[a("image",{staticStyle:{width:"100%",height:"100%"},attrs:{src:t,_hid:1016,_fid:e,_batrs:"src"}})])},1015,t._self)),a("view",{staticClass:"share-box",attrs:{_hid:1017}},[a("button",{staticClass:"btn-share",attrs:{"open-type":"share",_hid:1018}}),a("text",{staticClass:"iconfont icon-btn_share",staticStyle:{color:"#fff"},attrs:{_hid:1019}})],1),t._ri(!!(t.detail&&t.detail.photos&&t.detail.photos.length>0),1020)?a("view",{staticClass:"dot-bg",attrs:{_hid:1020}},[t._v(t._s(t.currIndex)+"/"+t._s(t.detail.photos?t.detail.photos.length:0),1021)]):t._e()],1),a("view",{staticClass:"bargain-info",attrs:{_hid:1022}},[a("view",{staticClass:"lt-barInfo",attrs:{_hid:1023}},[a("view",{staticClass:"price",attrs:{_hid:1024}},[a("text",{attrs:{_hid:1025}},[]),a("text",{staticStyle:{"font-size":"32px","margin-left":"4px"},attrs:{_hid:1027}},[t._v(t._s(t.detail.kj_bargain_price),1028)])]),a("view",{staticClass:"cost-price",attrs:{_hid:1029}},[a("view",{staticClass:"cp-top",attrs:{_hid:1030}},[a("text",{attrs:{_hid:1031}},[]),a("text",{staticStyle:{"text-decoration":"line-through"},attrs:{_hid:1033}},[t._v("¥"+t._s(t.detail.kj_init_price),1034)])]),a("view",{staticClass:"cp-bottom",attrs:{_hid:1035}},[])]),a("image",{staticClass:"arrow-img",attrs:{src:t.imgBaseUrl+"/box_m@2x.png",_hid:1037,_batrs:"src"}})]),a("view",{staticClass:"rt-barInfo",attrs:{_hid:1038}},[t._ri(!(0!=t.detail.is_kan),1039)?a("view",{staticClass:"rt-top",attrs:{_hid:1039}},[a("text",{staticClass:"iconfont icon-icon_pintuan",staticStyle:{"font-size":"22px"},attrs:{_hid:1040}}),a("text",{staticStyle:{"margin-left":"6px"},attrs:{_hid:1041}},[t._v(t._s(t.detail.kj_sold_num)+"人",1042)])]):t._e(),t._ri(!(0!=t.detail.is_kan),1043)?a("view",{staticClass:"rt-bottom",attrs:{_hid:1043}},[t._v("已"+t._s(t.detail.kj_bargain_price)+"元拿到手",1044)]):t._e(),t._ri(!(1!=t.detail.is_kan),1045)?a("view",{staticClass:"rt-top",staticStyle:{"font-size":"14px"},attrs:{_hid:1045}},[]):t._e(),t._ri(!(1!=t.detail.is_kan),1047)?a("view",{staticClass:"rt-bottom",attrs:{_hid:1047}},[a("uni-countdown",{attrs:{color:"#ffffff",splitorColor:"#ED3005","background-color":"#ED3005","border-color":"rgba(0,0,0,0)",hour:t.hour,minute:t.minute,second:t.second,"show-day":!1,_hid:1048,_batrs:"hour,minute,second,show-day",_cid:1}})],1):t._e()])]),a("view",{staticClass:"goods-info",attrs:{_hid:2050}},[a("view",{staticClass:"goods-name",attrs:{_hid:2051}},[t._v(t._s(t.detail.goods_name),2052)]),a("view",{staticClass:"goods-price",attrs:{_hid:2053}},[a("text",{staticStyle:{color:"#ED3005","font-size":"16px"},attrs:{_hid:2054}},[]),a("text",{staticStyle:{color:"#ED3005","font-size":"32px"},attrs:{_hid:2056}},[t._v(t._s(t.detail.shop_price),2057)]),a("text",{staticStyle:{color:"#999999","font-size":"14px","margin-left":"8px"},attrs:{_hid:2058}},[]),a("text",{staticStyle:{color:"#999999","font-size":"14px","margin-left":"4px","text-decoration":"line-through"},attrs:{_hid:2060}},[t._v(t._s(t.detail.market_price),2061)])]),a("view",{staticClass:"goods-desc",attrs:{_hid:2062}},[a("view",{staticClass:"item-desc",attrs:{_hid:2063}},[a("text",{staticStyle:{color:"#666666"},attrs:{_hid:2064}},[]),a("text",{attrs:{_hid:2066}},[t._v(t._s(t.detail&&0==t.detail.is_free_shipping?t.detail.shipping_price+"元":"免费"),2067)])]),a("view",{staticClass:"item-desc",attrs:{_hid:2068}},[a("text",{staticStyle:{color:"#666666"},attrs:{_hid:2069}},[]),a("text",{attrs:{_hid:2071}},[t._v(t._s(t.detail&&t.detail.goods_num?t.detail.goods_num:"0"),2072)])]),a("view",{staticClass:"item-desc",attrs:{_hid:2073}},[a("text",{staticStyle:{color:"#666666"},attrs:{_hid:2074}},[]),a("text",{attrs:{_hid:2076}},[t._v(t._s(t.detail&&t.detail.kj_sold_num?t.detail.kj_sold_num:"0"),2077)])])])]),a("view",{staticStyle:{width:"100%",height:"12px",background:"#f8f8f8"},attrs:{_hid:2078}}),a("view",{staticClass:"goods-server-info",attrs:{_hid:2079}},[a("view",{staticClass:"item-server",attrs:{_hid:2080}},[a("text",{staticStyle:{width:"50px"},attrs:{_hid:2081}},[]),a("text",{attrs:{_hid:2083}},[])]),a("view",{staticClass:"item-server",attrs:{_hid:2085}},[a("text",{staticStyle:{width:"50px"},attrs:{_hid:2086}},[]),a("text",{attrs:{_hid:2088}},[])]),t._ri(!1,2090)?a("view",{staticClass:"item-server-desc",attrs:{_hid:2090}},[a("text",{staticStyle:{width:"50px","line-height":"50px"},attrs:{_hid:2091}},[]),a("view",{staticClass:"server-info",attrs:{_hid:2093}},[a("view",{staticClass:"sinfo-item",attrs:{_hid:2094}},[a("text",{staticClass:"iconfont icon-icon_success",attrs:{_hid:2095}}),a("text",{staticStyle:{"margin-left":"4px"},attrs:{_hid:2096}},[])]),a("view",{staticClass:"sinfo-item",attrs:{_hid:2098}},[a("text",{staticClass:"iconfont icon-icon_success",attrs:{_hid:2099}}),a("text",{staticStyle:{"margin-left":"4px"},attrs:{_hid:2100}},[])]),a("view",{staticClass:"sinfo-item",attrs:{_hid:2102}},[a("text",{staticClass:"iconfont icon-icon_success",attrs:{_hid:2103}}),a("text",{staticStyle:{"margin-left":"4px"},attrs:{_hid:2104}},[])])])]):t._e()]),t._ri(!!t.detail.goods_attr,2106)?a("goodsDescribe",{attrs:{attr:t.detail.goods_attr,content:t.detail.goods_content,_hid:2106,_batrs:"attr,content",_cid:2}}):t._e(),a("view",{staticStyle:{width:"100%",height:"60px"},attrs:{_hid:3108}}),a("view",{staticClass:"bottom-info",attrs:{_hid:3109}},[a("view",{staticClass:"item-bottom-menu",staticStyle:{display:"flex","align-items":"center"},attrs:{_hid:3110}},[a("view",{staticClass:"ib-menu",attrs:{_hid:3111},on:{click:t.toHomeListener}},[a("text",{staticClass:"iconfont icon-tabbar",staticStyle:{"font-size":"22px"},attrs:{_hid:3112}}),a("view",{staticStyle:{"font-size":"12px","margin-top":"5px"},attrs:{_hid:3113}},[])]),a("view",{staticClass:"ib-menu",attrs:{_hid:3115},on:{click:t.toCallPhone}},[a("text",{staticClass:"iconfont icon-btn_call",staticStyle:{"font-size":"22px"},attrs:{_hid:3116}}),a("view",{staticStyle:{"font-size":"12px","margin-top":"5px"},attrs:{_hid:3117}},[])])]),a("view",{staticClass:"item-bottom-menu",staticStyle:{color:"#fff","font-size":"18px",background:"#FFAE19"},attrs:{_hid:3119},on:{click:t.buyGoodsListener}},[a("view",{staticClass:"ibmenu-num",attrs:{_hid:3120}},[t._v("¥"+t._s(t.detail&&t.detail.kj_init_price?t.detail.kj_init_price:"0.00"),3121)]),a("view",{staticClass:"ibmenu-text",attrs:{_hid:3122}},[])]),a("view",{staticClass:"item-bottom-menu",staticStyle:{color:"#fff","font-size":"18px",background:"#ED3005"},attrs:{_hid:3124},on:{click:t.bargainGoodsListener}},[a("view",{staticClass:"ibmenu-num",attrs:{_hid:3125}},[t._v("¥"+t._s(t.detail&&t.detail.kj_bargain_price?t.detail.kj_bargain_price:"0.00"),3126)]),a("view",{staticClass:"ibmenu-text",attrs:{_hid:3127}},[t._v(t._s(1==t.detail.is_kan?"继续砍":"砍价拿"),3128)])])])],1):t._e(),t._ri(!(1!=t.index),3129)?a("block",{attrs:{_hid:3129}},[a("view",{staticClass:"common-info",attrs:{_hid:3130}},[t._ri(!1,3131)?a("view",{staticClass:"comm-desc",attrs:{_hid:3131}},[a("view",{staticClass:"lt-comm",attrs:{_hid:3132}},[a("text",{attrs:{_hid:3133}},[]),a("text",{staticStyle:{"margin-left":"8px"},attrs:{_hid:3135}},[])]),a("view",{staticClass:"rt-comm",attrs:{_hid:3137}},[])]):t._e(),a("view",{staticClass:"comm-type",attrs:{_hid:3139}},[a("view",{staticClass:"item-type",class:1==t.comment_type?"active":"",attrs:{"data-type":"1",_hid:3140},on:{click:t.commentTypeListener}},[]),a("view",{staticClass:"item-type",class:2==t.comment_type?"active":"",attrs:{"data-type":"2",_hid:3142},on:{click:t.commentTypeListener}},[]),a("view",{staticClass:"item-type",class:3==t.comment_type?"active":"",attrs:{"data-type":"3",_hid:3144},on:{click:t.commentTypeListener}},[]),a("view",{staticClass:"item-type",class:4==t.comment_type?"active":"",attrs:{"data-type":"4",_hid:3146},on:{click:t.commentTypeListener}},[])])]),t._ri(!!(t.comment.length>0),3148)?a("view",{staticClass:"common-list",attrs:{_hid:3148}},t._l(t.comment,function(i,s,e){var d=void 0!==e?e:s;return a("view",{key:s,staticClass:"item-common",attrs:{_hid:3149,_fid:d,_fk:"index"}},[a("view",{staticClass:"icom-lt",attrs:{_hid:3150,_fid:d}},[a("image",{staticClass:"user-face",attrs:{src:i.face?i.face:t.imgBaseUrl+"/mine/img_my_head@3x.png",_hid:3151,_fid:d,_batrs:"src"}})]),a("view",{staticClass:"icom-rt",attrs:{_hid:3152,_fid:d}},[a("view",{staticClass:"user-info",attrs:{_hid:3153,_fid:d}},[a("view",{staticClass:"uinfo-lt",attrs:{_hid:3154,_fid:d}},[a("view",{staticClass:"u-name",attrs:{_hid:3155,_fid:d}},[t._v(t._s(i.username),3156,d)]),a("view",{staticClass:"u-date",attrs:{_hid:3157,_fid:d}},[t._v(t._s(i.add_time),3158,d)])]),a("view",{staticClass:"uinfo-rt",attrs:{_hid:3159,_fid:d}},[t._l(i.goods_rank,function(t,i,d){var r=(void 0!==e?e:s)+"_"+(void 0!==d?d:i);return a("block",{key:t,attrs:{_hid:3160,_fid:r,_fk:"n"}},[a("text",{staticClass:"iconfont icon-Star_c xingxing",staticStyle:{color:"#FFAE19"},attrs:{_hid:3161,_fid:r}})])},"3160_"+(void 0!==e?e:s),t._self),t._ri(!!(5-i.goods_rank>0),3162,void 0!==e?e:s)?a("block",{attrs:{_hid:3162,_fid:d}},t._l(5-i.goods_rank,function(t,i,d){var r=(void 0!==e?e:s)+"_"+(void 0!==d?d:i);return a("text",{key:t,staticClass:"iconfont icon-Star_c xingxing",staticStyle:{color:"#DFE6EB"},attrs:{_hid:3163,_fid:r,_fk:"m"}})},"3163_"+(void 0!==e?e:s),t._self)):t._e()],1)]),a("view",{staticClass:"common-cont",attrs:{_hid:3164,_fid:d}},[t._v(t._s(i.content),3165,d)]),a("view",{staticClass:"common-img",attrs:{_hid:3166,_fid:d}},t._l(i.img,function(t,i,e){var d=(void 0!==e?e:s)+"_"+(void 0!==e?e:i);return a("image",{key:i,staticClass:"c-img",attrs:{src:t,_hid:3167,_fid:d,_batrs:"src",_fk:"z"}})},"3167_"+(void 0!==e?e:s),t._self))])])},3149,t._self)):t._e(),t._ri(!!t.more,3168)?a("view",{staticClass:"more",attrs:{bindtap:"getBargainDetail",_hid:3168}},[]):t._e(),t._ri(!t.more,3170)?a("view",{staticClass:"nodata",attrs:{_hid:3170}},[]):t._e()]):t._e(),t._ri(!(2!=t.index),3172)?a("view",{staticClass:"rcm-list",attrs:{_hid:3172}},t._l(t.likes,function(i,s,e){var d=void 0!==e?e:s;return a("navigator",{key:s,attrs:{url:"/pages/index/goods/detail?goods_id="+i.goods_id,"open-type":"redirect",_hid:3173,_fid:d,_batrs:"url",_fk:"i"}},[a("view",{staticClass:"rcm-goods",attrs:{_hid:3174,_fid:d}},[a("image",{staticClass:"g-img",attrs:{src:i.photosales_sum,_hid:3175,_fid:d,_batrs:"src"}}),a("view",{staticClass:"g-info",attrs:{_hid:3176,_fid:d}},[a("view",{staticClass:"ellipsis-02 gname",attrs:{_hid:3177,_fid:d}},[t._v(t._s(i.goods_name),3178,d)]),a("view",{staticClass:"g-desc",attrs:{_hid:3179,_fid:d}},[a("view",{staticClass:"price-num",attrs:{_hid:3180,_fid:d}},[a("text",{attrs:{_hid:3181,_fid:d}},[]),a("text",{staticStyle:{"font-size":"18px"},attrs:{_hid:3183,_fid:d}},[t._v(t._s(i.shop_price),3184,d)])]),a("view",{staticClass:"sell-num",attrs:{_hid:3185,_fid:d}},[a("text",{attrs:{_hid:3186,_fid:d}},[t._v(t._s(i.sales_sum),3187,d)]),a("text",{staticStyle:{color:"#666666"},attrs:{_hid:3188,_fid:d}},[])])])])])])},3173,t._self)):t._e(),t._ri(!(!t.likeMore||2!=t.index),3190)?a("view",{staticClass:"more",attrs:{_hid:3190},on:{click:t.getLikeGoodsList}},[]):t._e(),t._ri(!(t.likeMore||2!=t.index),3192)?a("view",{staticClass:"nodata",attrs:{_hid:3192}},[]):t._e()],1):t._e(),a("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",_hid:3194,_batrs:"img",_cid:3}}),a("ToastView",{attrs:{_hid:4196,_cid:4}}),t._ri(!!t.skuFlag,5198)?a("skuDialog",{attrs:{specs:t.specs,detail:t.detail,showNum:0==t.buyType?0:1,_hid:5198,_batrs:"specs,detail,showNum",_cid:5},on:{addEvent:t.sureSelectGoodsListener,closeEvent:t.hideSkuDialogListener}}):t._e(),t._ri(!!t.addressFlag,6200)?a("view",{staticClass:"mask",attrs:{_hid:6200}},[a("view",{staticClass:"dialog-address",attrs:{_hid:6201}},[a("view",{staticClass:"d-header",attrs:{_hid:6202}},[a("text",{staticStyle:{flex:"1"},attrs:{_hid:6203}},[]),a("text",{staticClass:"iconfont icon-btn_close_black",staticStyle:{"padding-left":"15px"},attrs:{_hid:6205},on:{click:t.hideAddressDialogListener}})]),a("addressView",{attrs:{list:t.list,_hid:6206,_batrs:"list",_cid:6},on:{selectEvent:t.selectAddrListener}})],1)]):t._e()],1)},e=[];a.d(i,"a",function(){return s}),a.d(i,"b",function(){return e})}},[["842c","common/runtime","common/vendor"]]]);