(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-mine-order-index"],{"3cf8":function(t,e,i){e=t.exports=i("2350")(!1),e.push([t.i,".order-list[data-v-f840458a]{width:100%;display:inline-block;padding:6px 15px;margin-top:51px}.order-list .item-order[data-v-f840458a]{width:100%;display:inline-block;background:#fff;border-radius:8px;margin:6px 0}.order-list .item-order .order-top[data-v-f840458a]{width:100%;height:48px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;padding:0 15px}.item-order .goods-info[data-v-f840458a]{width:100%;padding:10px 15px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;background:#f5f6f7}.item-order .goods-info .g-img[data-v-f840458a]{width:100px;height:100px\n\t/* background: #f00; */}.item-order .goods-info .g-cont[data-v-f840458a]{width:100%;-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1;display:block;margin-left:10px;position:relative}.item-order .goods-info .g-cont .comment-box[data-v-f840458a]{width:100%;text-align:right;position:absolute;bottom:0}.g-cont .comment-box .btn-comment[data-v-f840458a]{height:26px;line-height:26px;padding:0 15px;border:1px #ed3005 solid;font-size:16px;color:#ed3005;display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex;border-radius:6px}.item-order .goods-info .g-cont .name[data-v-f840458a]{color:#2d3133;font-size:16px}.item-order .goods-info .g-cont .sku[data-v-f840458a]{width:100%;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;margin-top:16px;color:#666;font-size:14px}.item-order .g-desc[data-v-f840458a]{width:100%;height:52px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;-webkit-box-pack:end;-webkit-justify-content:flex-end;-ms-flex-pack:end;justify-content:flex-end;padding:0 15px;color:#333;font-size:14px;border-bottom:1px solid #ccc}.item-order .bottom-info[data-v-f840458a]{width:100%;height:67px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;padding:0 10px;-webkit-box-pack:end;-webkit-justify-content:flex-end;-ms-flex-pack:end;justify-content:flex-end}.btn-01[data-v-f840458a]{height:32px;line-height:32px;padding:0 12px;color:#000;font-size:14px;border:1px solid #ccc;border-radius:4px;margin:15px 5px}.btn-02[data-v-f840458a]{height:32px;line-height:32px;padding:0 12px;font-size:14px;border-radius:4px;margin:15px 5px;color:#ed3005;border:1px solid #ed3005}.btn-03[data-v-f840458a]{height:32px;line-height:32px;padding:0 12px;font-size:14px;border-radius:4px;margin:15px 5px;color:#fff;border:1px solid #ed3005;background:#ed3005}.btn-delete[data-v-f840458a]{width:32px;height:32px;margin:15px 5px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;-webkit-box-pack:center;-webkit-justify-content:center;-ms-flex-pack:center;justify-content:center;border-radius:4px;border:1px #ccc solid;color:#aaafb3}",""])},"79e52":function(t,e,i){"use strict";i.r(e);var n=i("9012"),a=i.n(n);for(var o in n)"default"!==o&&function(t){i.d(e,t,function(){return n[t]})}(o);e["default"]=a.a},9012:function(t,e,i){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n=a(i("9219"));function a(t){return t&&t.__esModule?t:{default:t}}var o={data:function(){return{userid:0,tindex:0,tabBars:[{name:"全部",id:"0"},{name:"待付款",id:"1"},{name:"待发货",id:"2"},{name:"待收货",id:"3"},{name:"待评价",id:"4"},{name:"退款售后",id:"5"}],type:"",page:1,more:0,list:[],topHeight:0,imgBaseUrl:""}},components:{uniCountdown:n.default},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl,"h5"==this.wxb.device&&(this.$data.topHeight=44)},onLoad:function(t){var e=this,i=uni.getStorageSync("user_id");void 0!=i&&""!=i&&(e.$data.userid=i),void 0!=t.pid&&""!=t.pid&&uni.setStorageSync("pid",t.pid),e.wxb.printLog(t),t.tabIndex&&(e.$data.tindex=t.tabIndex-0,e.$data.type=t.tabIndex-0),e.wxb.addPage(this),e.wxb.Init(t,function(t){4==e.$data.type?e.getCommentOrderList():e.getUserOrderList()})},onUnload:function(){this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:""==t.$data.companyName?"订单中心":t.$data.companyName,path:"/pages/mine/order/index?pid="+t.$data.userid}},methods:{cancelApply:function(t){var e=this;e.wxb.Post("/shop/api.order/cancelOrder",{order_id:t},function(t){e.$data.page=1,e.getUserOrderList()})},toOrderDetail:function(t){uni.navigateTo({url:"./detail?order_id="+t})},toComment:function(t){uni.navigateTo({url:"./comment?model="+JSON.stringify(t)})},toLogistics:function(t){console.log("order_id=>"+t),uni.navigateTo({url:"./logistics?order_id="+t})},toHome:function(){uni.reLaunch({url:"/pages/index/index"})},toRefund:function(t){uni.navigateTo({url:"./refund/index?order_id="+t})},toCancel:function(t){var e=this;e.wxb.Post("/shop/api.order/cancelOrder",{order_id:t},function(t){e.$data.page=1,e.getUserOrderList()})},toConfirmOrder:function(t){var e=this;e.wxb.Post("/shop/api.order/confirmOrder",{order_id:t},function(t){e.$data.page=1,e.getUserOrderList()})},deleteOrder:function(t){var e=this;e.wxb.Post("/shop/api.order/delOrder",{order_id:t},function(t){e.$data.page=1,e.getUserOrderList()})},getUserOrderList:function(t){var e=this,i=e.$data.page,n=e.$data.list;1==i&&(n=[]),e.wxb.Post("/shop/api.order/index",{type:e.$data.type,page:e.$data.page},function(t){for(var i in t.list)n.push(t.list[i]);e.$data.list=n,e.$data.more=t.isMore,e.$data.page+=1,console.log(n)})},tapTabListener:function(t){this.$data.type=t,this.$data.page=1,4==t?this.getCommentOrderList():this.getUserOrderList()},getCommentOrderList:function(t){var e=this,i=e.$data.page,n=e.$data.list;1==i&&(n=[]),e.wxb.Post("/shop/api.order/getCommnet",{page:e.$data.page},function(t){for(var i in t.list)n.push(t.list[i]);e.$data.list=n,e.$data.more=t.isMore,e.$data.page+=1,console.log(n)})}}};e.default=o},"99ee":function(t,e,i){"use strict";var n=i("eade"),a=i.n(n);a.a},db58:function(t,e,i){"use strict";var n=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("v-uni-view",{staticClass:"order-box"},[i("v-uni-view",{style:"top:"+t.topHeight+"px;width: 100%;background: #fff!important; display: inline-flex; position: fixed; z-index: 999;"},[i("tab-view",{attrs:{type:1,tabBars:t.tabBars,color:"#ED3005;",tabIndex:t.tindex},on:{tapTab:function(e){e=t.$handleEvent(e),t.tapTabListener(e)}}})],1),i("v-uni-view",{staticClass:"order-list"},[t._l(t.list,function(e,n){return 4==t.type?i("v-uni-view",{key:n,staticClass:"item-order",staticStyle:{background:"#fff"}},[i("v-uni-view",{staticClass:"goods-info",staticStyle:{background:"rgba(0,0,0,0)"}},[i("v-uni-image",{staticClass:"g-img",attrs:{src:e.photo}}),i("v-uni-view",{staticClass:"g-cont"},[i("v-uni-view",{staticClass:"name ellipsis-02"},[t._v(t._s(e.title))]),i("v-uni-view",{staticClass:"comment-box"},[i("v-uni-text",{staticClass:"btn-comment",on:{click:function(i){i=t.$handleEvent(i),t.toComment(e)}}},[t._v("评价")])],1)],1)],1)],1):t._e()}),t._l(t.list,function(e,n){return 4!=t.type?i("v-uni-view",{key:n,staticClass:"item-order"},[i("v-uni-navigator",{attrs:{url:"detail?order_id="+e.order_id}},[i("v-uni-view",{staticClass:"order-top"},[i("v-uni-text"),i("v-uni-text",{staticStyle:{flex:"1"}},[t._v("订单号："+t._s(e.order_sn?e.order_sn:e.order_id))]),i("v-uni-text",[t._v(t._s(e.order_status_mean))])],1),t._l(e.order_goods,function(e,n){return i("v-uni-view",{key:n,staticClass:"goods-info"},[i("v-uni-image",{staticClass:"g-img",attrs:{src:e.goods_photo}}),i("v-uni-view",{staticClass:"g-cont"},[i("v-uni-view",{staticClass:"name ellipsis-02"},[t._v(t._s(e.goods_name))]),i("v-uni-view",{staticClass:"sku"},[i("v-uni-text",{staticStyle:{flex:"1"}},[t._v(t._s(e.spec_key_name))]),i("v-uni-text",[t._v("x"+t._s(e.goods_num))])],1)],1)],1)}),i("v-uni-view",{staticClass:"g-desc"},[i("v-uni-text",[t._v("共"+t._s(e.goods_num)+"件商品")]),i("v-uni-text",{staticStyle:{"margin-left":"10px"}},[t._v("合计：")]),i("v-uni-text",{staticStyle:{color:"#000000","font-size":"20px"}},[t._v("¥"+t._s(e.all_price))]),i("v-uni-text",{staticStyle:{"margin-left":"4px"}},[t._v("(含运费 ¥"+t._s(e.shipping_price)+")")])],1)],2),i("v-uni-view",{staticClass:"bottom-info"},[0==e.order_status?[i("v-uni-view",{staticStyle:{flex:"1",display:"flex","align-items":"center"}},[i("uni-countdown",{attrs:{color:"#ffffff",splitorColor:"#ffffff","background-color":"#ED3005","border-color":"rgba(0,0,0,0)",second:e.expire_time,"show-day":!1,styleNum:2}})],1),i("v-uni-text",{staticClass:"btn-03",on:{click:function(i){i=t.$handleEvent(i),t.toOrderDetail(e.order_id)}}},[t._v("立即付款")])]:t._e(),1==e.order_status?[i("v-uni-text",{staticClass:"btn-01",on:{click:function(i){i=t.$handleEvent(i),t.toOrderDetail(e.order_id)}}},[t._v("取消订单")])]:t._e(),2==e.order_status?[i("v-uni-text",{staticClass:"btn-02",on:{click:function(i){i=t.$handleEvent(i),t.toRefund(e.order_id)}}},[t._v("申请退款")]),i("v-uni-text",{staticClass:"btn-01",on:{click:function(i){i=t.$handleEvent(i),t.toLogistics(e.order_id)}}},[t._v("查看物流")]),i("v-uni-text",{staticClass:"btn-01",on:{click:function(i){i=t.$handleEvent(i),t.toConfirmOrder(e.order_id)}}},[t._v("确认收货")])]:t._e(),9==e.order_status?[i("v-uni-view",{staticClass:"btn-delete",on:{click:function(i){i=t.$handleEvent(i),t.deleteOrder(e.order_id)}}},[i("v-uni-text",{staticClass:"iconfont icon-btn_delete"})],1),i("v-uni-text",{staticClass:"btn-01",on:{click:function(i){i=t.$handleEvent(i),t.toLogistics(e.order_id)}}},[t._v("查看物流")]),i("v-uni-text",{staticClass:"btn-02",on:{click:function(e){e=t.$handleEvent(e),t.toHome(e)}}},[t._v("再次购买")])]:t._e(),4==e.order_status?[i("v-uni-view",{staticClass:"btn-delete",on:{click:function(i){i=t.$handleEvent(i),t.deleteOrder(e.order_id)}}},[i("v-uni-text",{staticClass:"iconfont icon-btn_delete"})],1),i("v-uni-text",{staticClass:"btn-01",on:{click:function(i){i=t.$handleEvent(i),t.toLogistics(e.order_id)}}},[t._v("查看物流")]),i("v-uni-text",{staticClass:"btn-02",on:{click:function(e){e=t.$handleEvent(e),t.toHome(e)}}},[t._v("再次购买")])]:t._e(),5==e.order_status?[i("v-uni-view",{staticClass:"btn-delete",on:{click:function(i){i=t.$handleEvent(i),t.deleteOrder(e.order_id)}}},[i("v-uni-text",{staticClass:"iconfont icon-btn_delete"})],1),i("v-uni-text",{staticClass:"btn-02",on:{click:function(e){e=t.$handleEvent(e),t.toHome(e)}}},[t._v("再次购买")])]:t._e(),6==e.order_status||7==e.order_status||8==e.order_status?i("v-uni-view",{staticClass:"btn-delete",on:{click:function(i){i=t.$handleEvent(i),t.deleteOrder(e.order_id)}}},[i("v-uni-text",{staticClass:"iconfont icon-btn_delete"})],1):t._e()],2)],1):t._e()}),t.more?i("v-uni-view",{staticClass:"more",on:{click:function(e){e=t.$handleEvent(e),t.getUserOrderList(e)}}},[t._v("点击查看更多")]):t._e(),t.more?t._e():i("v-uni-view",{staticClass:"nodata"},[t._v("已经全部为你呈现了")])],2),i("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif"}}),i("ToastView")],1)},a=[];i.d(e,"a",function(){return n}),i.d(e,"b",function(){return a})},e610:function(t,e,i){"use strict";i.r(e);var n=i("db58"),a=i("79e52");for(var o in a)"default"!==o&&function(t){i.d(e,t,function(){return a[t]})}(o);i("99ee");var s=i("2877"),d=Object(s["a"])(a["default"],n["a"],n["b"],!1,null,"f840458a",null);e["default"]=d.exports},eade:function(t,e,i){var n=i("3cf8");"string"===typeof n&&(n=[[t.i,n,""]]),n.locals&&(t.exports=n.locals);var a=i("4f06").default;a("76004088",n,!0,{sourceMap:!1,shadowMode:!1})}}]);