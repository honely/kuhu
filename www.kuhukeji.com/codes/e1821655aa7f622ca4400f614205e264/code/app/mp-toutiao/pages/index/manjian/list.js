(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/index/manjian/list"],{"15e7":function(t,i,a){"use strict";a("2346");var e=n(a("c8c4")),s=n(a("3a53"));function n(t){return t&&t.__esModule?t:{default:t}}e.default.mpType="page";var r=new s.default(e.default);r.$mount()},"610a":function(t,i,a){},"63a5":function(t,i,a){"use strict";(function(t){Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;var e=s(a("9219"));function s(t){return t&&t.__esModule?t:{default:t}}var n={data:function(){return{userid:0,list:[],page:1,more:0,manjian_id:"",data:"",hour:0,minute:0,second:0,expire_time:0,imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},components:{uniCountdown:e.default},onLoad:function(i){var a=this,e=t.getStorageSync("user_id");void 0!=e&&""!=e&&(a.$data.userid=e),void 0!=i.pid&&""!=i.pid&&t.setStorageSync("pid",i.pid),a.wxb.printLog("=============onLoad================"),a.wxb.addPage(this),a.wxb.Init(i,function(t){i.id&&(a.$data.manjian_id=i.id),a.getManJianList()})},onUnload:function(){this.wxb.printLog("=============onUnload================"),this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:"折扣",path:"/pages/index/discount/list?pid="+t.$data.userid+"&manjian_id="+t.$data.manjian_id}},methods:{getManJianList:function(t){var i=this,a=i.$data.list,e=i.$data.page;1==e&&(a=[]),i.wxb.Post("/shop/api.manjian/getlist",{page:i.$data.page,manjian_id:i.$data.manjian_id},function(t){for(var e in"baidu"==i.wxb.device&&swan.setPageInfo&&swan.setPageInfo({title:t.seo.title?"":t.seo.title,keywords:t.seo.keywords?"":t.seo.keywords,description:t.seo.description?"":t.seo.description,releaseDate:t.seo.releaseDate?"":t.seo.releaseDate,image:t.seo.image?"":t.seo.image,success:function(){console.log("百度SEO信息设置完成")}}),i.$data.data=t.data,t.list)a.push(t.list[e]);i.$data.more=t.isMore,i.$data.list=a,i.$data.expire_time=t.data.expire_time,console.log("倒计时->"+t.data.expire_time);var s=i.$data.expire_time,n=s/3600|0,r=(Math.round(s)-3600*n)/60|0;s=s%60|0;console.log("hour->"+n),console.log("minute->"+r),console.log("second->"+s),i.$data.hour=n,i.$data.minute=r,i.$data.second=s})}}};i.default=n}).call(this,a("f266")["default"])},"95f1":function(t,i,a){"use strict";var e=a("610a"),s=a.n(e);s.a},"9ceb":function(t,i,a){"use strict";var e=function(){var t=this,i=t.$createElement,a=t._self._c||i;return a("view",{staticClass:"mainjian-box",attrs:{_hid:0}},[t._ri(!!t.data,1)?a("view",{staticClass:"manjian-cont",attrs:{_hid:1}},[a("view",{staticClass:"mj-img",attrs:{_hid:2}},[a("image",{staticStyle:{width:"100%",height:"100%"},attrs:{src:t.data.prom_img,_hid:3,_batrs:"src"}})]),a("view",{staticClass:"mj-header",attrs:{_hid:4}},[a("view",{staticClass:"mh-lf",attrs:{_hid:5}},[]),a("view",{staticClass:"mh-rf",attrs:{_hid:7}},[a("text",{staticStyle:{color:"#fff","font-size":"16px","margin-right":"8px"},attrs:{_hid:8}},[]),a("uni-countdown",{attrs:{color:"#ffffff",splitorColor:"#ED3005","background-color":"#ED3005","border-color":"rgba(0,0,0,0)",hour:t.hour,minute:t.minute,second:t.second,"show-day":!1,_hid:10,_batrs:"hour,minute,second,show-day",_cid:0}})],1)]),a("view",{staticClass:"mj-list",attrs:{_hid:1012}},[t._l(t.list,function(i,e,s){var n=void 0!==s?s:e;return a("view",{key:e,staticClass:"item-manjian",attrs:{_hid:1013,_fid:n,_fk:"i"},on:{click:function(a){t.$linkListener("../goods/detail?goods_id="+i.goods_id)}}},[a("view",{staticClass:"mj-img",attrs:{_hid:1014,_fid:n}},[a("text",{staticClass:"tag",attrs:{_hid:1015,_fid:n}},[]),a("image",{staticStyle:{width:"100%",height:"100%"},attrs:{src:i.photo,_hid:1017,_fid:n,_batrs:"src"}}),t._ri(!!i.is_vip,1018,void 0!==s?s:e)?a("view",{staticClass:"zhuanxiang",attrs:{_hid:1018,_fid:n}},[]):t._e()]),a("view",{staticClass:"mj-cont",attrs:{_hid:1020,_fid:n}},[a("view",{staticClass:"mname ellipsis-02",attrs:{_hid:1021,_fid:n}},[]),t._m(0,!0),a("view",{staticClass:"mprice",attrs:{_hid:1028,_fid:n}},[a("view",{staticClass:"mp-lt",attrs:{_hid:1029,_fid:n}},[a("view",{staticClass:"xprice",attrs:{_hid:1030,_fid:n}},[a("text",{attrs:{_hid:1031,_fid:n}},[]),a("text",{staticStyle:{"font-size":"18px","margin-left":"3px"},attrs:{_hid:1033,_fid:n}},[t._v(t._s(i.shop_price),1034,n)])]),a("view",{staticClass:"yprice",attrs:{_hid:1035,_fid:n}},[a("text",{attrs:{_hid:1036,_fid:n}},[]),a("text",{staticStyle:{"text-decoration":"line-through","margin-left":"3px"},attrs:{_hid:1038,_fid:n}},[t._v("￥"+t._s(i.market_price),1039,n)])])]),a("text",{staticClass:"iconfont icon-btn_cart mp-rt",attrs:{_hid:1040,_fid:n}})])])])},1013,t._self),t._ri(!(1!=t.more),1041)?a("view",{staticClass:"more",attrs:{_hid:1041},on:{click:t.getManJianList}},[]):t._e(),t._ri(!(0!=t.more),1043)?a("view",{staticClass:"nodata",attrs:{_hid:1043}},[]):t._e()],1)]):t._e(),a("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",_hid:1045,_batrs:"img",_cid:1}}),a("ToastView",{attrs:{_hid:2047,_cid:2}})],1)},s=[function(){var t=this,i=t.$createElement,a=t._self._c||i;return a("view",{staticClass:"mnum",attrs:{_hid:1023,_fid:t._fid}},[a("text",{attrs:{_hid:1024,_fid:t._fid}},[]),a("text",{attrs:{_hid:1026,_fid:t._fid}},[])])}];a.d(i,"a",function(){return e}),a.d(i,"b",function(){return s})},c7c9:function(t,i,a){"use strict";a.r(i);var e=a("63a5"),s=a.n(e);for(var n in e)"default"!==n&&function(t){a.d(i,t,function(){return e[t]})}(n);i["default"]=s.a},c8c4:function(t,i,a){"use strict";a.r(i);var e=a("9ceb"),s=a("c7c9");for(var n in s)"default"!==n&&function(t){a.d(i,t,function(){return s[t]})}(n);a("95f1");var r=a("2877"),d=Object(r["a"])(s["default"],e["a"],e["b"],!1,null,null,null);i["default"]=d.exports}},[["15e7","common/runtime","common/vendor"]]]);