(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["pages/mine/coupon/index"],{"0360":function(t,a,e){"use strict";e("2346");var i=d(e("b70d")),n=d(e("3a53"));function d(t){return t&&t.__esModule?t:{default:t}}i.default.mpType="page";var o=new n.default(i.default);o.$mount()},"0627":function(t,a,e){},"5e89":function(t,a,e){"use strict";var i=e("0627"),n=e.n(i);n.a},b70d:function(t,a,e){"use strict";e.r(a);var i=e("fd03"),n=e("c5f4");for(var d in n)"default"!==d&&function(t){e.d(a,t,function(){return n[t]})}(d);e("5e89");var o=e("2877"),s=Object(o["a"])(n["default"],i["a"],i["b"],!1,null,null,null);a["default"]=s.exports},c5f4:function(t,a,e){"use strict";e.r(a);var i=e("fd63"),n=e.n(i);for(var d in i)"default"!==d&&function(t){e.d(a,t,function(){return i[t]})}(d);a["default"]=n.a},fd03:function(t,a,e){"use strict";var i=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("view",{staticClass:"coupon-box",attrs:{_hid:0}},[t._ri(!!t.list,1)?e("view",{attrs:{_hid:1}},[e("tab-view",{attrs:{type:2,tabBars:t.tabBars,tabIndex:t.tindex,_hid:2,_batrs:"type,tabBars,tabIndex",_cid:0},on:{tapTab:t.tapTabListener}}),e("uni-couponView",{attrs:{type:2,iData:t.list,tabIndex:t.type,_hid:1004,_batrs:"type,iData,tabIndex",_cid:1}}),t._ri(!!t.more,2006)?e("view",{staticClass:"more",attrs:{bindtap:"loadMore",_hid:2006}},[]):t._e(),t._ri(!t.more,2008)?e("view",{staticClass:"nodata",attrs:{_hid:2008}},[]):t._e()],1):t._e(),e("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",_hid:2010,_batrs:"img",_cid:2}}),e("ToastView",{attrs:{_hid:3012,_cid:3}})],1)},n=[];e.d(a,"a",function(){return i}),e.d(a,"b",function(){return n})},fd63:function(t,a,e){"use strict";(function(t){Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var e={data:function(){return{userid:0,tindex:0,tabBars:[{name:"未使用",id:"0"},{name:"已使用",id:"1"},{name:"已失效",id:"2"}],type:"",page:1,list:[],more:0,imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(a){var e=this,i=t.getStorageSync("user_id");void 0!=i&&""!=i&&(e.$data.userid=i),void 0!=a.pid&&""!=a.pid&&t.setStorageSync("pid",a.pid),e.wxb.addPage(this),e.wxb.Init(a,function(t){e.getCouponList()})},onUnload:function(){this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:""==t.$data.companyName?"O2O电商小程序":t.$data.companyName,path:"/pages/index/index?pid="+t.$data.userid}},methods:{getCouponList:function(t){var a=this,e=a.$data.page,i=a.$data.list;1==e&&(i=[]),a.wxb.Post("/shop/api.Coupon/myCoupon",{type:a.$data.type,page:a.$data.page},function(t){for(var e in t.list)i.push(t.list[e]);a.$data.list=i,a.$data.more=t.isMore,a.$data.page+=1,console.log(i)})},tapTabListener:function(t){this.wxb.printLog("index=>"+t),this.$data.type=t,this.$data.page=1,this.$data.list=[],this.getCouponList()}}};a.default=e}).call(this,e("c11b")["default"])}},[["0360","common/runtime","common/vendor"]]]);