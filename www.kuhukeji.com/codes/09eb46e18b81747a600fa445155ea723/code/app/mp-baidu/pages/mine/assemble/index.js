(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/mine/assemble/index"],{3773:function(t,i,s){"use strict";(function(t){Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;var s={data:function(){return{tabIndex:0,list:"",page:1,more:0,imgBaseUrl:"",userid:0}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(i){var s=this,a=t.getStorageSync("user_id");void 0!=a&&""!=a&&(s.$data.userid=a),void 0!=i.pid&&""!=i.pid&&t.setStorageSync("pid",i.pid),s.wxb.addPage(this),s.wxb.Init(i,function(t){s.getAssembleList()})},onUnload:function(){this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:""==t.$data.companyName?"O2O电商小程序":t.$data.companyName,path:"/pages/index/index?pid="+t.$data.userid}},methods:{tabListener:function(t){this.$data.tabIndex=t,this.$data.page=1,this.$data.list=[],this.getAssembleList()},getAssembleList:function(t){var i=this,s=i.$data.list,a=i.$data.page;1==a&&(s=[]),i.wxb.Post("/shop/api.groupbuy/getMyGroupBuy",{type:i.$data.tabIndex,page:a},function(t){for(var a in t.list)s.push(t.list[a]);i.$data.list=s,i.$data.more=t.isMore,i.$data.page+=1})}}};i.default=s}).call(this,s("5486")["default"])},"3c30":function(t,i,s){},6612:function(t,i,s){"use strict";var a=function(){var t=this,i=t.$createElement,s=t._self._c||i;return s("view",{staticClass:"assemble-box",attrs:{_hid:0}},[s("view",{staticClass:"assemble-tab",attrs:{_hid:1}},[s("text",{staticClass:"item-tab",class:0==t.tabIndex?"active":"",attrs:{_hid:2},on:{click:function(i){t.tabListener(0)}}},[]),s("text",{staticClass:"item-tab",class:1==t.tabIndex?"active":"",attrs:{_hid:4},on:{click:function(i){t.tabListener(1)}}},[])]),t._ri(!(0!=t.tabIndex||!t.list),6)?s("view",{staticClass:"assemble-list",attrs:{_hid:6}},[t._l(t.list,function(i,a,e){var d=void 0!==e?e:a;return s("view",{key:a,staticClass:"item-assemble",attrs:{_hid:7,_fid:d,_fk:"index"}},[s("view",{staticClass:"assemble-top",attrs:{_hid:8,_fid:d}},[s("text",{staticStyle:{flex:"1"},attrs:{_hid:9,_fid:d}}),s("text",{staticStyle:{"font-size":"16px",color:"#ED3005"},attrs:{_hid:10,_fid:d}},[t._v(t._s(i.status_mean),11,d)])]),s("view",{staticClass:"goods-info",attrs:{_hid:12,_fid:d}},[s("view",{staticClass:"g-img",attrs:{_hid:13,_fid:d}},[s("image",{attrs:{src:i.photo,_hid:14,_fid:d,_batrs:"src"}}),s("text",{staticClass:"t-num",attrs:{_hid:15,_fid:d}},[t._v(t._s(i.need_num)+"人团",16,d)])]),s("view",{staticClass:"g-cont",attrs:{_hid:17,_fid:d}},[s("view",{staticClass:"name ellipsis-02",attrs:{_hid:18,_fid:d}},[t._v(t._s(i.goods_name),19,d)]),s("view",{staticClass:"sku",attrs:{_hid:20,_fid:d}},[s("text",{staticStyle:{flex:"1"},attrs:{_hid:21,_fid:d}},[t._v(t._s(i.key_name),22,d)])]),s("text",{staticClass:"state",attrs:{_hid:23,_fid:d}},[])])]),s("view",{staticClass:"g-desc",attrs:{_hid:25,_fid:d}},[s("text",{staticStyle:{"margin-left":"10px"},attrs:{_hid:26,_fid:d}},[]),s("text",{staticStyle:{color:"#000000","font-size":"20px"},attrs:{_hid:28,_fid:d}},[t._v("¥"+t._s(i.payment_price),29,d)]),s("text",{staticStyle:{"margin-left":"4px"},attrs:{_hid:30,_fid:d}},[t._v("(含运费 ¥"+t._s(i.shipping_price)+")",31,d)])]),s("view",{staticClass:"bottom-info",attrs:{_hid:32,_fid:d}},[s("navigator",{staticClass:"btn-01",attrs:{url:"../../index/pintuan/assemble?item_id="+i.groupbuy_item_id,_hid:33,_fid:d,_batrs:"url"}},[])],1)])},7,t._self),t._ri(!(1!=t.more),35)?s("view",{staticClass:"more",attrs:{_hid:35},on:{click:t.getAssembleList}},[]):t._e(),t._ri(!(0!=t.more),37)?s("view",{staticClass:"nodata",attrs:{_hid:37}},[]):t._e()],1):t._e(),t._ri(!(1!=t.tabIndex||!t.list),39)?s("view",{staticClass:"assemble-list",attrs:{_hid:39}},[t._l(t.list,function(i,a,e){var d=void 0!==e?e:a;return s("view",{key:a,staticClass:"item-assemble",attrs:{_hid:40,_fid:d,_fk:"index"}},[s("view",{staticClass:"assemble-top",attrs:{_hid:41,_fid:d}},[s("text",{staticStyle:{flex:"1"},attrs:{_hid:42,_fid:d}}),s("text",{staticStyle:{"font-size":"16px",color:"#ED3005"},attrs:{_hid:43,_fid:d}},[t._v(t._s(i.status_mean),44,d)])]),s("view",{staticClass:"goods-info",attrs:{_hid:45,_fid:d}},[s("view",{staticClass:"g-img",attrs:{_hid:46,_fid:d}},[s("image",{attrs:{src:i.photo,_hid:47,_fid:d,_batrs:"src"}}),s("text",{staticClass:"t-num",attrs:{_hid:48,_fid:d}},[t._v(t._s(i.need_num)+"人团",49,d)])]),s("view",{staticClass:"g-cont",attrs:{_hid:50,_fid:d}},[s("view",{staticClass:"name ellipsis-02",attrs:{_hid:51,_fid:d}},[t._v(t._s(i.goods_name),52,d)]),s("view",{staticClass:"sku",attrs:{_hid:53,_fid:d}},[s("text",{staticStyle:{flex:"1"},attrs:{_hid:54,_fid:d}},[t._v(t._s(i.key_name),55,d)]),s("text",{attrs:{_hid:56,_fid:d}},[])]),s("text",{staticClass:"state",attrs:{_hid:58,_fid:d}},[])])]),s("view",{staticClass:"g-desc",attrs:{_hid:60,_fid:d}},[s("text",{staticStyle:{"margin-left":"10px"},attrs:{_hid:61,_fid:d}},[]),s("text",{staticStyle:{color:"#000000","font-size":"20px"},attrs:{_hid:63,_fid:d}},[t._v("¥"+t._s(i.payment_price),64,d)]),s("text",{staticStyle:{"margin-left":"4px"},attrs:{_hid:65,_fid:d}},[t._v("(含运费 ¥"+t._s(i.shipping_price)+")",66,d)])]),s("view",{staticClass:"bottom-info",attrs:{_hid:67,_fid:d}},[s("navigator",{staticClass:"btn-01",attrs:{url:"../../index/pintuan/assemble?item_id="+i.groupbuy_item_id,_hid:68,_fid:d,_batrs:"url"}},[])],1)])},40,t._self),t._ri(!(1!=t.more),70)?s("view",{staticClass:"more",attrs:{_hid:70},on:{click:t.getAssembleList}},[]):t._e(),t._ri(!(0!=t.more),72)?s("view",{staticClass:"nodata",attrs:{_hid:72}},[]):t._e()],1):t._e(),s("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",_hid:74,_batrs:"img",_cid:0}}),s("ToastView",{attrs:{_hid:1076,_cid:1}})],1)},e=[];s.d(i,"a",function(){return a}),s.d(i,"b",function(){return e})},"6f55":function(t,i,s){"use strict";s("2346");var a=d(s("c9ab")),e=d(s("3a53"));function d(t){return t&&t.__esModule?t:{default:t}}a.default.mpType="page";var r=new e.default(a.default);r.$mount()},b2ca:function(t,i,s){"use strict";s.r(i);var a=s("3773"),e=s.n(a);for(var d in a)"default"!==d&&function(t){s.d(i,t,function(){return a[t]})}(d);i["default"]=e.a},c9ab:function(t,i,s){"use strict";s.r(i);var a=s("6612"),e=s("b2ca");for(var d in e)"default"!==d&&function(t){s.d(i,t,function(){return e[t]})}(d);s("eea4");var r=s("2877"),_=Object(r["a"])(e["default"],a["a"],a["b"],!1,null,null,null);i["default"]=_.exports},eea4:function(t,i,s){"use strict";var a=s("3c30"),e=s.n(a);e.a}},[["6f55","common/runtime","common/vendor"]]]);