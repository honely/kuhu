(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/index/rush/detail"],{"13b5":function(t,e,a){"use strict";a.r(e);var i=a("d7eb"),s=a.n(i);for(var o in i)"default"!==o&&function(t){a.d(e,t,function(){return i[t]})}(o);e["default"]=s.a},"58dc":function(t,e,a){"use strict";a.r(e);var i=a("98c5"),s=a("13b5");for(var o in s)"default"!==o&&function(t){a.d(e,t,function(){return s[t]})}(o);a("a0c7");var n=a("2877"),c=Object(n["a"])(s["default"],i["a"],i["b"],!1,null,null,null);e["default"]=c.exports},"7b45":function(t,e,a){"use strict";a("2346");var i=o(a("b0ce")),s=o(a("58dc"));function o(t){return t&&t.__esModule?t:{default:t}}Page((0,i.default)(s.default))},"98c5":function(t,e,a){"use strict";var i=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("view",{staticClass:"goods-detail-box"},[t.detail?a("view",[a("tab-view",{attrs:{type:2,tabBars:t.tabBars,eventid:"6d9e3a47-0",mpcomid:"6d9e3a47-0"},on:{tapTab:t.tapTab}}),0==t.index?a("block",[a("view",{staticClass:"goods-video-box"},[a("swiper",{staticStyle:{height:"100%"},attrs:{circular:"true",interval:"3000",duration:"500",autoplay:"true",eventid:"6d9e3a47-1"},on:{change:t.bannerChangeListener}},t._l(t.detail.photos,function(t,e){return a("swiper-item",{key:e,attrs:{mpcomid:"6d9e3a47-1-"+e}},[a("image",{staticStyle:{width:"100%",height:"100%"},attrs:{src:t}})])})),a("view",{staticClass:"share-box"},[a("button",{staticClass:"btn-share",attrs:{"open-type":"share"}}),a("text",{staticClass:"iconfont icon-btn_share",staticStyle:{color:"#fff"}})],1),t.detail&&t.detail.photos&&t.detail.photos.length>0?a("view",{staticClass:"dot-bg"},[t._v(t._s(t.currIndex)+"/"+t._s(t.detail.photos?t.detail.photos.length:0))]):t._e()],1),a("view",{staticClass:"bargain-info"},[a("view",{staticClass:"lt-barInfo"},[a("view",{staticClass:"price"},[a("text",[t._v("¥")]),a("text",{staticStyle:{"font-size":"32px","margin-left":"4px"}},[t._v(t._s(t.detail.qg_rushbuy_price))])]),a("view",{staticClass:"cost-price"},[a("view",{staticClass:"cp-top"},[a("text",[t._v("原价：")]),a("text",{staticStyle:{"text-decoration":"line-through"}},[t._v("¥"+t._s(t.detail.market_price))])]),a("view",{staticClass:"cp-bottom"},[t._v("限时秒杀")])]),a("image",{staticClass:"arrow-img",attrs:{src:t.imgBaseUrl+"/box_m@2x.png"}})]),a("view",{staticClass:"rt-barInfo"},[a("view",{staticClass:"rt-top"},[t._v("距离结束还剩")]),a("view",{staticClass:"rt-bottom"},[a("uni-countdown",{attrs:{color:"#ffffff",splitorColor:"#ED3005","background-color":"#ED3005","border-color":"rgba(0,0,0,0)",hour:t.hour,minute:t.minute,second:t.second,"show-day":!1,mpcomid:"6d9e3a47-2"}})],1)])]),a("view",{staticClass:"goods-info"},[a("view",{staticClass:"goods-name"},[t._v(t._s(t.detail.goods_name))]),a("view",{staticClass:"goods-price"},[a("text",{staticStyle:{color:"#ED3005","font-size":"16px"}},[t._v("¥")]),a("text",{staticStyle:{color:"#ED3005","font-size":"32px"}},[t._v(t._s(t.detail.shop_price))]),a("text",{staticStyle:{color:"#999999","font-size":"14px","margin-left":"8px"}},[t._v("门市价")]),a("text",{staticStyle:{color:"#999999","font-size":"14px","margin-left":"4px","text-decoration":"line-through"}},[t._v(t._s(t.detail.market_price))])]),a("view",{staticClass:"goods-desc"},[a("view",{staticClass:"item-desc"},[a("text",{staticStyle:{color:"#666666"}},[t._v("快递：")]),a("text",[t._v(t._s(t.detail&&0==t.detail.is_free_shipping?t.detail.shipping_price+"元":"免费"))])]),a("view",{staticClass:"item-desc"},[a("text",{staticStyle:{color:"#666666"}},[t._v("还剩：")]),a("text",[t._v(t._s(t.detail&&t.detail.qg_goods_num?t.detail.qg_goods_num:"0"))])]),a("view",{staticClass:"item-desc"},[a("text",{staticStyle:{color:"#666666"}},[t._v("已购买：")]),a("text",[t._v(t._s(t.detail&&t.detail.qg_buy_num?t.detail.qg_buy_num:"0"))])])])]),t._e(),t.detail.goods_attr?a("goodsDescribe",{attrs:{attr:t.detail.goods_attr,content:t.detail.goods_content,mpcomid:"6d9e3a47-3"}}):t._e(),a("view",{staticStyle:{width:"100%",height:"60px"}}),a("view",{staticClass:"bottom-info"},[a("view",{staticClass:"item-bottom-menu",staticStyle:{display:"flex","align-items":"center"}},[a("view",{staticClass:"ib-menu",attrs:{eventid:"6d9e3a47-2"},on:{click:t.toHomeListener}},[a("text",{staticClass:"iconfont icon-tabbar",staticStyle:{"font-size":"22px"}}),a("view",{staticStyle:{"font-size":"12px","margin-top":"5px"}},[t._v("首页")])]),a("view",{staticClass:"ib-menu",attrs:{eventid:"6d9e3a47-3"},on:{click:t.toCallPhone}},[a("text",{staticClass:"iconfont icon-btn_call",staticStyle:{"font-size":"22px"}}),a("view",{staticStyle:{"font-size":"12px","margin-top":"5px"}},[t._v("客服")])])]),t.qg_end_time?a("view",{staticClass:"item-bottom-menu",staticStyle:{flex:"2",color:"#fff","font-size":"18px",background:"#ED3005"},attrs:{eventid:"6d9e3a47-4"},on:{click:t.showSkuDialogListener}},[t._v("立即抢购")]):t._e(),0==t.qg_end_time?a("view",{staticClass:"item-bottom-menu",staticStyle:{flex:"2",color:"#fff","font-size":"18px",background:"#999999"}},[t._v("抢购已结束")]):t._e()])],1):t._e(),1==t.index?a("block",[a("view",{staticClass:"common-info"},[t._e(),a("view",{staticClass:"comm-type"},[a("view",{staticClass:"item-type",class:1==t.comment_type?"active":"",attrs:{"data-type":"1",eventid:"6d9e3a47-5"},on:{click:t.commentTypeListener}},[t._v("全部")]),a("view",{staticClass:"item-type",class:2==t.comment_type?"active":"",attrs:{"data-type":"2",eventid:"6d9e3a47-6"},on:{click:t.commentTypeListener}},[t._v("好评")]),a("view",{staticClass:"item-type",class:3==t.comment_type?"active":"",attrs:{"data-type":"3",eventid:"6d9e3a47-7"},on:{click:t.commentTypeListener}},[t._v("中评")]),a("view",{staticClass:"item-type",class:4==t.comment_type?"active":"",attrs:{"data-type":"4",eventid:"6d9e3a47-8"},on:{click:t.commentTypeListener}},[t._v("差评")])])]),t.comment.length>0?a("view",{staticClass:"common-list"},t._l(t.comment,function(e,i){return a("view",{key:i,staticClass:"item-common"},[a("view",{staticClass:"icom-lt"},[a("image",{staticClass:"user-face",attrs:{src:e.face?e.face:t.imgBaseUrl+"/mine/img_my_head@3x.png"}})]),a("view",{staticClass:"icom-rt"},[a("view",{staticClass:"user-info"},[a("view",{staticClass:"uinfo-lt"},[a("view",{staticClass:"u-name"},[t._v(t._s(e.username))]),a("view",{staticClass:"u-date"},[t._v(t._s(e.add_time))])]),a("view",{staticClass:"uinfo-rt"},[t._l(e.goods_rank,function(t,e){return a("block",{key:t},[a("text",{staticClass:"iconfont icon-Star_c xingxing",staticStyle:{color:"#FFAE19"}})])}),5-e.goods_rank>0?a("block",t._l(5-e.goods_rank,function(t,e){return a("text",{key:t,staticClass:"iconfont icon-Star_c xingxing",staticStyle:{color:"#DFE6EB"}})})):t._e()],2)]),a("view",{staticClass:"common-cont"},[t._v(t._s(e.content))]),a("view",{staticClass:"common-img"},t._l(e.img,function(t,e){return a("image",{key:e,staticClass:"c-img",attrs:{src:t}})}))])])})):t._e(),t.more?a("view",{staticClass:"more",attrs:{bindtap:"getRushDetail"}},[t._v("点击查看更多")]):t._e(),t.more?t._e():a("view",{staticClass:"nodata"},[t._v("已经全部为你呈现了")])]):t._e(),2==t.index?a("view",{staticClass:"rcm-list"},t._l(t.likes,function(e,i){return a("navigator",{key:i,attrs:{url:"/pages/index/goods/detail?goods_id="+e.goods_id,"open-type":"redirect"}},[a("view",{staticClass:"rcm-goods"},[a("image",{staticClass:"g-img",attrs:{src:e.photosales_sum}}),a("view",{staticClass:"g-info"},[a("view",{staticClass:"ellipsis-02 gname"},[t._v(t._s(e.goods_name))]),a("view",{staticClass:"g-desc"},[a("view",{staticClass:"price-num"},[a("text",[t._v("¥")]),a("text",{staticStyle:{"font-size":"18px"}},[t._v(t._s(e.shop_price))])]),a("view",{staticClass:"sell-num"},[a("text",[t._v(t._s(e.sales_sum))]),a("text",{staticStyle:{color:"#666666"}},[t._v("人已买")])])])])])])})):t._e(),t.likeMore&&2==t.index?a("view",{staticClass:"more",attrs:{eventid:"6d9e3a47-9"},on:{click:t.getLikeGoodsList}},[t._v("点击查看更多")]):t._e(),t.likeMore||2!=t.index?t._e():a("view",{staticClass:"nodata"},[t._v("已经全部为你呈现了")])],1):t._e(),a("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",mpcomid:"6d9e3a47-4"}}),a("ToastView",{attrs:{mpcomid:"6d9e3a47-5"}}),t.skuFlag?a("skuDialog",{attrs:{specs:t.specs,showNum:1,noadd:t.getRushDetail(),detail:t.detail,eventid:"6d9e3a47-10",mpcomid:"6d9e3a47-6"},on:{addEvent:t.sureSelectGoodsListener,closeEvent:t.hideSkuDialogListener}}):t._e()],1)},s=[];a.d(e,"a",function(){return i}),a.d(e,"b",function(){return s})},a0c7:function(t,e,a){"use strict";var i=a("cc23"),s=a.n(i);s.a},cc23:function(t,e,a){},d7eb:function(t,e,a){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i=n(a("540a")),s=n(a("8972")),o=n(a("9219"));function n(t){return t&&t.__esModule?t:{default:t}}var c={data:function(){return{specs:[],skuFlag:!1,hour:0,minute:0,second:0,qg_end_time:0,index:0,tabBars:[{name:"商品",id:"0"},{name:"评价",id:"1"},{name:"推荐",id:"2"}],tData:{type:1,pbottom:0,ptop:22,mtop:0,data:{icon:"icon_quan",title:"领取优惠券"}},rushbuy_goods_id:0,detail:"",currIndex:1,comment_type:1,comment:[],more:0,page:1,likes:[],likePage:1,likeMore:0,imgBaseUrl:"",customerNum:"",userid:0}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},components:{goodsDescribe:s.default,uniCountdown:o.default,skuDialog:i.default},onLoad:function(e){var a=this,i=t.getStorageSync("user_id");void 0!=i&&""!=i&&(a.$data.userid=i),void 0!=e.pid&&""!=e.pid&&t.setStorageSync("pid",e.pid),a.wxb.printLog("=============onLoad================"),a.wxb.addPage(this),a.wxb.Init(e,function(t){a.$data.customerNum=t.info.tel,void 0!=e.id&&(a.$data.rushbuy_goods_id=e.id),a.getRushDetail()})},onUnload:function(){this.wxb.printLog("=============onUnload================"),this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:t.$data.detail&&""!=t.$data.detail.goods_name?t.$data.detail.goods_name:"商品详情",path:"/pages/index/rush/detail?id="+t.$data.rushbuy_goods_id+"&pid="+t.$data.userid}},methods:{toCallPhone:function(e){var a=this,i=a.$data.customerNum;""!=i?t.makePhoneCall({phoneNumber:i}):t.showToast({title:"请先配置"})},toHomeListener:function(e){t.reLaunch({url:"/pages/index/index"})},showSkuDialogListener:function(t){this.$data.skuFlag=!0},hideSkuDialogListener:function(t){this.$data.skuFlag=!1},sureSelectGoodsListener:function(e){console.log(e);var a=this,i=e.detail,s=i.goodsNum,o=i.sku;i.sku_msg;t.navigateTo({url:"buy?goods_id="+a.$data.rushbuy_goods_id+"&goodsNum="+s+"&spec_key="+o})},bannerChangeListener:function(t){this.$data.currIndex=t.detail.current+1},tapTab:function(t){this.$data.index=t,2==t&&(this.$data.likePage=1,this.getLikeGoodsList())},catchTouchMove:function(t){},getLikeGoodsList:function(){var t=this,e=t.$data.likePage,a=t.$data.likes;1==e&&(a=[]),t.$data.detail&&t.wxb.Post("/shop/api.goods/index",{page:t.$data.likePage,p_cat_id:0},function(e){for(var i in e.list)a.push(e.list[i]);t.$data.likes=a,t.$data.likePage+=1,t.$data.likeMore=e.isMore})},commentTypeListener:function(t){var e=t.currentTarget.dataset.type;this.$data.comment_type=e,this.$data.page=1,this.getRushDetail()},getRushDetail:function(t){var e=this,a=e.$data.comment,i=e.$data.page;1==i&&(a=[]),e.wxb.Post("/shop/api.Rushbuy/detail",{rushbuy_goods_id:e.$data.rushbuy_goods_id,comment_type:e.$data.comment_type,page:e.$data.page},function(t){for(var s in t.comment.comment)a.push(t.comment.comment[s]);if(1==i){e.$data.detail=t.detail,e.$data.qg_end_time=t.detail.qg_end_time,console.log("倒计时->"+t.detail.qg_end_time);var o=e.$data.qg_end_time,n=o/3600|0,c=(Math.round(o)-3600*n)/60|0;o=o%60|0;console.log("hour->"+n),console.log("minute->"+c),console.log("second->"+o),e.$data.hour=n,e.$data.minute=c,e.$data.second=o;var l=[];for(var d in t.detail.spec){var r=[];for(var s in t.detail.spec[d])t.detail.spec[d][s].select="item-spec-nor",r.push(t.detail.spec[d][s]);l.push({name:d,list:r})}e.$data.specs=l,e.wxb.printLog(l)}e.$data.isMore=t.comment.isMore,e.$data.comment=a,e.$data.page+=1})}}};e.default=c}).call(this,a("543d")["default"])}},[["7b45","common/runtime","common/vendor"]]]);