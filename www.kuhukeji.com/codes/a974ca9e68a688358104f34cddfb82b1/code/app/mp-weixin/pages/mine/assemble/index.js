(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/mine/assemble/index"],{3773:function(t,e,s){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var s={data:function(){return{tabIndex:0,list:"",page:1,more:0,imgBaseUrl:"",userid:0}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(e){var s=this,a=t.getStorageSync("user_id");void 0!=a&&""!=a&&(s.$data.userid=a),void 0!=e.pid&&""!=e.pid&&t.setStorageSync("pid",e.pid),s.wxb.addPage(this),s.wxb.Init(e,function(t){s.getAssembleList()})},onUnload:function(){this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:""==t.$data.companyName?"O2O电商小程序":t.$data.companyName,path:"/pages/index/index?pid="+t.$data.userid}},methods:{tabListener:function(t){this.$data.tabIndex=t,this.$data.page=1,this.$data.list=[],this.getAssembleList()},getAssembleList:function(t){var e=this,s=e.$data.list,a=e.$data.page;1==a&&(s=[]),e.wxb.Post("/shop/api.groupbuy/getMyGroupBuy",{type:e.$data.tabIndex,page:a},function(t){for(var a in t.list)s.push(t.list[a]);e.$data.list=s,e.$data.more=t.isMore,e.$data.page+=1})}}};e.default=s}).call(this,s("543d")["default"])},"3c30":function(t,e,s){},6612:function(t,e,s){"use strict";var a=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("view",{staticClass:"assemble-box"},[s("view",{staticClass:"assemble-tab"},[s("text",{staticClass:"item-tab",class:0==t.tabIndex?"active":"",attrs:{eventid:"5698de2d-0"},on:{click:function(e){t.tabListener(0)}}},[t._v("我发起的")]),s("text",{staticClass:"item-tab",class:1==t.tabIndex?"active":"",attrs:{eventid:"5698de2d-1"},on:{click:function(e){t.tabListener(1)}}},[t._v("我参与的")])]),0==t.tabIndex&&t.list?s("view",{staticClass:"assemble-list"},[t._l(t.list,function(e,a){return s("view",{key:a,staticClass:"item-assemble"},[s("view",{staticClass:"assemble-top"},[s("text",{staticStyle:{flex:"1"}}),s("text",{staticStyle:{"font-size":"16px",color:"#ED3005"}},[t._v(t._s(e.status_mean))])]),s("view",{staticClass:"goods-info"},[s("view",{staticClass:"g-img"},[s("image",{attrs:{src:e.photo}}),s("text",{staticClass:"t-num"},[t._v(t._s(e.need_num)+"人团")])]),s("view",{staticClass:"g-cont"},[s("view",{staticClass:"name ellipsis-02"},[t._v(t._s(e.goods_name))]),s("view",{staticClass:"sku"},[s("text",{staticStyle:{flex:"1"}},[t._v(t._s(e.key_name))])]),s("text",{staticClass:"state"},[t._v("开团")])])]),s("view",{staticClass:"g-desc"},[s("text",{staticStyle:{"margin-left":"10px"}},[t._v("合计：")]),s("text",{staticStyle:{color:"#000000","font-size":"20px"}},[t._v("¥"+t._s(e.payment_price))]),s("text",{staticStyle:{"margin-left":"4px"}},[t._v("(含运费 ¥"+t._s(e.shipping_price)+")")])]),s("view",{staticClass:"bottom-info"},[s("navigator",{staticClass:"btn-01",attrs:{url:"../../index/pintuan/assemble?item_id="+e.groupbuy_item_id}},[t._v("查看团详情")])],1)])}),1==t.more?s("view",{staticClass:"more",attrs:{eventid:"5698de2d-2"},on:{click:t.getAssembleList}},[t._v("点击查看更多")]):t._e(),0==t.more?s("view",{staticClass:"nodata"},[t._v("已经全部为你呈现了")]):t._e()],2):t._e(),1==t.tabIndex&&t.list?s("view",{staticClass:"assemble-list"},[t._l(t.list,function(e,a){return s("view",{key:a,staticClass:"item-assemble"},[s("view",{staticClass:"assemble-top"},[s("text",{staticStyle:{flex:"1"}}),s("text",{staticStyle:{"font-size":"16px",color:"#ED3005"}},[t._v(t._s(e.status_mean))])]),s("view",{staticClass:"goods-info"},[s("view",{staticClass:"g-img"},[s("image",{attrs:{src:e.photo}}),s("text",{staticClass:"t-num"},[t._v(t._s(e.need_num)+"人团")])]),s("view",{staticClass:"g-cont"},[s("view",{staticClass:"name ellipsis-02"},[t._v(t._s(e.goods_name))]),s("view",{staticClass:"sku"},[s("text",{staticStyle:{flex:"1"}},[t._v(t._s(e.key_name))]),s("text",[t._v("x2")])]),s("text",{staticClass:"state"},[t._v("参团")])])]),s("view",{staticClass:"g-desc"},[s("text",{staticStyle:{"margin-left":"10px"}},[t._v("合计：")]),s("text",{staticStyle:{color:"#000000","font-size":"20px"}},[t._v("¥"+t._s(e.payment_price))]),s("text",{staticStyle:{"margin-left":"4px"}},[t._v("(含运费 ¥"+t._s(e.shipping_price)+")")])]),s("view",{staticClass:"bottom-info"},[s("navigator",{staticClass:"btn-01",attrs:{url:"../../index/pintuan/assemble?item_id="+e.groupbuy_item_id}},[t._v("查看团详情")])],1)])}),1==t.more?s("view",{staticClass:"more",attrs:{eventid:"5698de2d-3"},on:{click:t.getAssembleList}},[t._v("点击查看更多")]):t._e(),0==t.more?s("view",{staticClass:"nodata"},[t._v("已经全部为你呈现了")]):t._e()],2):t._e(),s("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",mpcomid:"5698de2d-0"}}),s("ToastView",{attrs:{mpcomid:"5698de2d-1"}})],1)},i=[];s.d(e,"a",function(){return a}),s.d(e,"b",function(){return i})},"6f55":function(t,e,s){"use strict";s("2346");var a=n(s("b0ce")),i=n(s("c9ab"));function n(t){return t&&t.__esModule?t:{default:t}}Page((0,a.default)(i.default))},b2ca:function(t,e,s){"use strict";s.r(e);var a=s("3773"),i=s.n(a);for(var n in a)"default"!==n&&function(t){s.d(e,t,function(){return a[t]})}(n);e["default"]=i.a},c9ab:function(t,e,s){"use strict";s.r(e);var a=s("6612"),i=s("b2ca");for(var n in i)"default"!==n&&function(t){s.d(e,t,function(){return i[t]})}(n);s("eea4");var l=s("2877"),c=Object(l["a"])(i["default"],a["a"],a["b"],!1,null,null,null);e["default"]=c.exports},eea4:function(t,e,s){"use strict";var a=s("3c30"),i=s.n(a);i.a}},[["6f55","common/runtime","common/vendor"]]]);