(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/mine/mall/order/index"],{"01bb":function(t,i,e){"use strict";(function(t){Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;var a=s(e("9219"));function s(t){return t&&t.__esModule?t:{default:t}}var d={data:function(){return{userid:0,tindex:0,tabBars:[{name:"全部",id:"0"},{name:"待付款",id:"1"},{name:"待发货",id:"2"},{name:"待收货",id:"3"},{name:"已完成",id:"4"}],type:"",page:1,more:0,list:[],imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},components:{uniCountdown:a.default},onLoad:function(i){var e=this,a=t.getStorageSync("user_id");void 0!=a&&""!=a&&(e.$data.userid=a),void 0!=i.pid&&""!=i.pid&&t.setStorageSync("pid",i.pid),e.wxb.printLog(i),i.tabIndex&&(e.$data.tindex=i.tabIndex-0,e.$data.type=i.tabIndex-0),e.wxb.addPage(this),e.wxb.Init(i,function(t){e.getUserOrderList()})},onUnload:function(){this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:""==t.$data.companyName?"积分商城":t.$data.companyName,path:"/pages/mine/mall/index?pid="+t.$data.userid}},methods:{toComment:function(i){t.navigateTo({url:"../../order/comment?model="+JSON.stringify(i)})},toLogistics:function(i){console.log("order_id=>"+i),t.navigateTo({url:"./logistics?order_id="+i})},toHome:function(){t.redirectTo({url:"/pages/mine/mall/index"})},toRefund:function(i){t.navigateTo({url:"./refund/index?order_id="+i})},toConfirmOrder:function(t){var i=this;i.wxb.Post("/shop/api.integral/confirmOrder",{order_id:t},function(t){i.$data.page=1,i.getUserOrderList()})},deleteOrder:function(t){var i=this;i.wxb.Post("/shop/api.integral/delOrder",{order_id:t},function(t){i.$data.page=1,i.getUserOrderList()})},getUserOrderList:function(t){var i=this,e=i.$data.page,a=i.$data.list;1==e&&(a=[]),i.wxb.Post("/shop/api.integral/orderIndex",{type:i.$data.type,page:i.$data.page},function(t){for(var e in t.list)a.push(t.list[e]);i.$data.list=a,i.$data.more=t.isMore,i.$data.page+=1,console.log(a)})},tapTabListener:function(t){this.$data.type=t,this.$data.page=1,this.getUserOrderList()}}};i.default=d}).call(this,e("f266")["default"])},"195d":function(t,i,e){"use strict";e("2346");var a=d(e("c4cf")),s=d(e("3a53"));function d(t){return t&&t.__esModule?t:{default:t}}a.default.mpType="page";var r=new s.default(a.default);r.$mount()},"34c6":function(t,i,e){"use strict";var a=function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("view",{staticClass:"order-box",attrs:{_hid:0}},[e("view",{staticStyle:{width:"100%",background:"#fff!important",display:"inline-flex",position:"fixed",top:"44px","z-index":"999"},attrs:{_hid:1}},[e("tab-view",{attrs:{type:1,tabBars:t.tabBars,color:"#ED3005;",tabIndex:t.tindex,_hid:2,_batrs:"type,tabBars,tabIndex",_cid:0},on:{tapTab:t.tapTabListener}})],1),e("view",{staticClass:"order-list",attrs:{_hid:1004}},[t._l(t.list,function(i,a,s){var d=void 0!==s?s:a;return e("view",{key:a,staticClass:"item-order",attrs:{_hid:1005,_fid:d,_fk:"index"}},[e("navigator",{attrs:{url:"detail?order_id="+i.order_id,_hid:1006,_fid:d,_batrs:"url"}},[e("view",{staticClass:"order-top",attrs:{_hid:1007,_fid:d}},[e("text",{attrs:{_hid:1008,_fid:d}}),e("text",{staticStyle:{flex:"1"},attrs:{_hid:1009,_fid:d}},[t._v("订单号："+t._s(i.order_sn?i.order_sn:i.order_id),1010,d)]),e("text",{attrs:{_hid:1011,_fid:d}},[t._v(t._s(i.order_status_mean),1012,d)])]),e("view",{staticClass:"goods-info",attrs:{_hid:1013,_fid:d}},[e("image",{staticClass:"g-img",attrs:{src:i.photo,_hid:1014,_fid:d,_batrs:"src"}}),e("view",{staticClass:"g-cont",attrs:{_hid:1015,_fid:d}},[e("view",{staticClass:"name ellipsis-02",attrs:{_hid:1016,_fid:d}},[t._v(t._s(i.goods_name),1017,d)]),e("view",{staticClass:"price",attrs:{_hid:1018,_fid:d}},[e("image",{staticStyle:{width:"16px",height:"16px"},attrs:{src:t.imgBaseUrl+"/mine/icon_integral@3x.png",_hid:1019,_fid:d,_batrs:"src"}}),e("text",{staticStyle:{color:"#ED3005","font-size":"16px","margin-left":"4px"},attrs:{_hid:1020,_fid:d}},[t._v(t._s(i.integral),1021,d)]),e("text",{staticClass:"num",attrs:{_hid:1022,_fid:d}},[t._v("+"+t._s(i.shop_price)+"元",1023,d)])])])]),e("view",{staticClass:"g-desc",attrs:{_hid:1024,_fid:d}},[e("text",{staticStyle:{"margin-left":"10px"},attrs:{_hid:1025,_fid:d}},[]),e("text",{staticStyle:{color:"#000000","font-size":"20px"},attrs:{_hid:1027,_fid:d}},[t._v("¥"+t._s(i.shop_price),1028,d)]),e("text",{staticStyle:{"margin-left":"4px"},attrs:{_hid:1029,_fid:d}},[t._v("(含运费 ¥"+t._s(i.shipping_price)+")",1030,d)])])]),e("view",{staticClass:"bottom-info",attrs:{_hid:1031,_fid:d}},[t._ri(!(0!=i.order_status),1032,void 0!==s?s:a)?e("block",{attrs:{_hid:1032,_fid:d}},[e("view",{staticStyle:{flex:"1",display:"flex","align-items":"center"},attrs:{_hid:1033,_fid:d}},[e("uni-countdown",{attrs:{color:"#ffffff",splitorColor:"#ffffff","background-color":"#ED3005","border-color":"rgba(0,0,0,0)",second:i.expire_time,"show-day":!1,styleNum:2,_hid:1034,_fid:d,_batrs:"second,show-day,styleNum",_cid:1}})],1),e("view",{staticClass:"btn-delete",attrs:{_hid:2036,_fid:d},on:{click:function(e){t.deleteOrder(i.order_id)}}},[e("text",{staticClass:"iconfont icon-btn_delete",attrs:{_hid:2037,_fid:d}})]),e("text",{staticClass:"btn-03",attrs:{_hid:2038,_fid:d}},[])]):t._e(),t._ri(!(1!=i.order_status),2040,void 0!==s?s:a)?e("block",{attrs:{_hid:2040,_fid:d}},[e("view",{staticClass:"btn-delete",attrs:{_hid:2041,_fid:d},on:{click:function(e){t.deleteOrder(i.order_id)}}},[e("text",{staticClass:"iconfont icon-btn_delete",attrs:{_hid:2042,_fid:d}})])]):t._e(),t._ri(!(2!=i.order_status),2043,void 0!==s?s:a)?e("block",{attrs:{_hid:2043,_fid:d}},[e("text",{staticClass:"btn-02",attrs:{_hid:2044,_fid:d},on:{click:function(e){t.toRefund(i.order_id)}}},[]),e("text",{staticClass:"btn-01",attrs:{_hid:2046,_fid:d},on:{click:function(e){t.toLogistics(i.order_id)}}},[]),e("text",{staticClass:"btn-01",attrs:{_hid:2048,_fid:d},on:{click:function(e){t.toConfirmOrder(i.order_id)}}},[])]):t._e(),t._ri(!(9!=i.order_status),2050,void 0!==s?s:a)?e("block",{attrs:{_hid:2050,_fid:d}},[e("view",{staticClass:"btn-delete",attrs:{_hid:2051,_fid:d},on:{click:function(e){t.deleteOrder(i.order_id)}}},[e("text",{staticClass:"iconfont icon-btn_delete",attrs:{_hid:2052,_fid:d}})]),e("text",{staticClass:"btn-01",attrs:{_hid:2053,_fid:d},on:{click:function(e){t.toLogistics(i.order_id)}}},[]),e("text",{staticClass:"btn-01",attrs:{_hid:2055,_fid:d},on:{click:function(e){t.toComment(i)}}},[]),e("text",{staticClass:"btn-02",attrs:{_hid:2057,_fid:d},on:{click:t.toHome}},[])]):t._e(),t._ri(!(4!=i.order_status),2059,void 0!==s?s:a)?e("block",{attrs:{_hid:2059,_fid:d}},[e("view",{staticClass:"btn-delete",attrs:{_hid:2060,_fid:d},on:{click:function(e){t.deleteOrder(i.order_id)}}},[e("text",{staticClass:"iconfont icon-btn_delete",attrs:{_hid:2061,_fid:d}})]),e("text",{staticClass:"btn-01",attrs:{_hid:2062,_fid:d},on:{click:function(e){t.toLogistics(i.order_id)}}},[]),e("text",{staticClass:"btn-02",attrs:{_hid:2064,_fid:d},on:{click:t.toHome}},[])]):t._e(),t._ri(!(5!=i.order_status),2066,void 0!==s?s:a)?e("block",{attrs:{_hid:2066,_fid:d}},[e("view",{staticClass:"btn-delete",attrs:{_hid:2067,_fid:d},on:{click:function(e){t.deleteOrder(i.order_id)}}},[e("text",{staticClass:"iconfont icon-btn_delete",attrs:{_hid:2068,_fid:d}})]),e("text",{staticClass:"btn-02",attrs:{_hid:2069,_fid:d},on:{click:t.toHome}},[])]):t._e(),t._ri(!(6!=i.order_status&&7!=i.order_status&&8!=i.order_status),2071,void 0!==s?s:a)?e("view",{staticClass:"btn-delete",attrs:{_hid:2071,_fid:d},on:{click:function(e){t.deleteOrder(i.order_id)}}},[e("text",{staticClass:"iconfont icon-btn_delete",attrs:{_hid:2072,_fid:d}})]):t._e()],1)],1)},1005,t._self),t._ri(!!t.more,2073)?e("view",{staticClass:"more",attrs:{_hid:2073},on:{click:t.getUserOrderList}},[]):t._e(),t._ri(!t.more,2075)?e("view",{staticClass:"nodata",attrs:{_hid:2075}},[]):t._e()],1),e("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",_hid:2077,_batrs:"img",_cid:2}}),e("ToastView",{attrs:{_hid:3079,_cid:3}})],1)},s=[];e.d(i,"a",function(){return a}),e.d(i,"b",function(){return s})},ad70:function(t,i,e){"use strict";e.r(i);var a=e("01bb"),s=e.n(a);for(var d in a)"default"!==d&&function(t){e.d(i,t,function(){return a[t]})}(d);i["default"]=s.a},c4cf:function(t,i,e){"use strict";e.r(i);var a=e("34c6"),s=e("ad70");for(var d in s)"default"!==d&&function(t){e.d(i,t,function(){return s[t]})}(d);e("dd37");var r=e("2877"),n=Object(r["a"])(s["default"],a["a"],a["b"],!1,null,null,null);i["default"]=n.exports},dd37:function(t,i,e){"use strict";var a=e("f6da"),s=e.n(a);s.a},f6da:function(t,i,e){}},[["195d","common/runtime","common/vendor"]]]);