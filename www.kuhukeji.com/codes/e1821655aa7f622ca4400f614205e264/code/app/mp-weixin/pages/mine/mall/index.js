(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/mine/mall/index"],{"0918":function(t,a,e){"use strict";var i=e("0b42"),s=e.n(i);s.a},"0b42":function(t,a,e){},"28fa":function(t,a,e){"use strict";var i=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("view",{staticClass:"mall-box"},[t.userInfo?e("view",[e("view",{staticClass:"base-info"},[e("image",{staticClass:"b-face",attrs:{src:t.userInfo.face}}),e("view",{staticClass:"b-mid"},[e("view",{staticClass:"bm-tit"},[t._v(t._s(t.userInfo.nickname))]),e("view",{staticClass:"bm-num"},[e("text",{staticClass:"iconfont icon-"}),e("text",{staticClass:"num"},[t._v(t._s(t.userInfo.integral))])])]),e("navigator",{staticClass:"b-record",staticStyle:{height:"40px"},attrs:{url:"./order/index"}},[t._v("兑换记录")])],1),e("view",{staticStyle:{background:"#fff","margin-top":"12px"}},[e("tab-view",{attrs:{tabBars:t.cat,color:t.selectColor,type:1,eventid:"18c898ef-0",mpcomid:"18c898ef-0"},on:{tapTab:t.tabClickListener}})],1),e("view",{staticClass:"goods-list"},t._l(t.list,function(a,i){return e("view",{key:i,staticClass:"item-goods",style:"padding-right:"+(i%2==0?"2px":"0px")+";padding-left:"+(i%2==1?"2px":"0px")+";"},[e("navigator",{attrs:{url:"detail?id="+a.goods_id}},[e("view",{staticClass:"g-cont"},[e("view",{staticClass:"thumb-img"},[e("image",{staticClass:"img",attrs:{src:a.photo}}),e("text",{staticClass:"g-num"},[t._v("剩余"+t._s(a.goods_num))])]),e("view",{staticClass:"desc-info"},[e("view",{staticClass:"g-name ellipsis-02"},[t._v(t._s(a.goods_name))]),e("view",{staticClass:"g-price"},[e("view",{staticClass:"gp-detail"},[e("view",{staticClass:"coin-num"},[e("image",{staticStyle:{width:"16px",height:"16px"},attrs:{src:t.imgBaseUrl+"/mine/icon_integral@3x.png"}}),e("text",[t._v(t._s(a.integral))])]),e("text",{staticClass:"money-num"},[t._v("+"+t._s(a.shop_price))])]),e("view",{staticClass:"gp-exchange"},[t._v("兑换")])])])])])],1)})),1==t.more?e("view",{staticClass:"more",staticStyle:{"border-bottom-width":"0"},attrs:{eventid:"18c898ef-1"},on:{click:t.getPinTuanList}},[t._v("点击查看更多")]):t._e(),0==t.more?e("view",{staticClass:"nodata",staticStyle:{"border-bottom-width":"0"}},[t._v("已经全部为你呈现了")]):t._e()]):t._e(),e("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",mpcomid:"18c898ef-1"}}),e("ToastView",{attrs:{mpcomid:"18c898ef-2"}})],1)},s=[];e.d(a,"a",function(){return i}),e.d(a,"b",function(){return s})},"704b":function(t,a,e){"use strict";e("2346");var i=n(e("b0ce")),s=n(e("a681"));function n(t){return t&&t.__esModule?t:{default:t}}Page((0,i.default)(s.default))},"8fdc":function(t,a,e){"use strict";e.r(a);var i=e("9128"),s=e.n(i);for(var n in i)"default"!==n&&function(t){e.d(a,t,function(){return i[t]})}(n);a["default"]=s.a},9128:function(t,a,e){"use strict";(function(t){Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var e={data:function(){return{userid:0,selectColor:"#ED3005",cat:[],list:[],userInfo:"",cat_id:"-1",page:1,more:0,imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(a){var e=this,i=t.getStorageSync("user_id");void 0!=i&&""!=i&&(e.$data.userid=i),void 0!=a.pid&&""!=a.pid&&t.setStorageSync("pid",a.pid),e.wxb.printLog("=============onLoad================"),e.wxb.addPage(this),e.wxb.Init(a,function(t){e.getMallInfo()})},onUnload:function(){this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:""==t.$data.companyName?"积分商城":t.$data.companyName,path:"/pages/mine/mall/index?pid="+t.$data.userid}},methods:{getMallInfo:function(t){var a=this,e=a.$data.page,i=a.$data.list;1==e&&(i=[]),a.wxb.Post("/shop/api.integral/index",{cat_id:a.$data.cat_id,page:a.$data.page},function(t){for(var e in"baidu"==a.wxb.device&&swan.setPageInfo&&swan.setPageInfo({title:t.seo.title?"":t.seo.title,keywords:t.seo.keywords?"":t.seo.keywords,description:t.seo.description?"":t.seo.description,releaseDate:t.seo.releaseDate?"":t.seo.releaseDate,image:t.seo.image?"":t.seo.image,success:function(){console.log("百度SEO信息设置完成")}}),t.list)i.push(t.list[e]);a.$data.list=i,a.$data.userInfo=t.user,a.$data.more=t.isMore;var s=[];for(var n in s.push({cat_id:"-1",name:"全部",is_hot:0}),s.push({cat_id:"0",name:"推荐",is_hot:0}),t.cat)s.push(t.cat[n]);console.log(s),a.$data.cat=s,console.log(a.$data.cat)})},tabClickListener:function(t){var a=this.$data.cat;this.$data.cat_id=a[t].cat_id,this.$data.page=1,this.getMallInfo()}}};a.default=e}).call(this,e("543d")["default"])},a681:function(t,a,e){"use strict";e.r(a);var i=e("28fa"),s=e("8fdc");for(var n in s)"default"!==n&&function(t){e.d(a,t,function(){return s[t]})}(n);e("0918");var o=e("2877"),c=Object(o["a"])(s["default"],i["a"],i["b"],!1,null,null,null);a["default"]=c.exports}},[["704b","common/runtime","common/vendor"]]]);