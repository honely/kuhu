(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/mine/mall/order/detail"],{"06f7":function(t,e,i){"use strict";var a=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("view",{staticClass:"order-detail"},[t.detail?i("block",[i("view",{staticClass:"base-info"},[i("view",{staticClass:"o-state"},[i("view",{staticStyle:{width:"100%",height:"100%",position:"relative"}},[i("text",{staticClass:"iconfont icon-icon_order6 s-icon"}),i("text",{staticClass:"s-state"},[t._v(t._s(t.detail.order_status_mean))]),i("image",{staticClass:"os-img",attrs:{src:t.imgBaseUrl+"/order/img_order_status@3x.png"}})])]),i("view",{staticClass:"o-addr"},[i("view",{staticClass:"a-icon iconfont icon-icon_location"}),i("view",{staticClass:"a-cont"},[i("view",{staticClass:"ac-name"},[t._v(t._s(t.detail.name)+" "+t._s(t.detail.mobile))]),i("view",{staticClass:"ac-addr ellipsis-02"},[t._v(t._s(t.detail.address))])])])]),i("view",{staticClass:"detailed-list"},[i("view",{staticClass:"item-goods"},[i("image",{staticClass:"g-img",attrs:{src:t.detail.photo}}),i("view",{staticClass:"g-cont"},[i("view",{staticClass:"gc-name ellipsis-02"},[t._v(t._s(t.detail.goods_name))]),i("view",{staticClass:"gc-sku"},[i("text",[t._v("x1")])])])]),i("view",{staticClass:"cost-info"},[i("view",{staticClass:"item-cost"},[i("text",{staticStyle:{flex:"1"}},[t._v("积分扣除：")]),i("text",{staticStyle:{"font-size":"18px",color:"#000000"}},[t._v("¥"+t._s(t.detail.integral))])]),i("view",{staticClass:"item-cost"},[i("text",{staticStyle:{flex:"1"}},[t._v("商品金额：")]),i("text",{staticStyle:{"font-size":"18px",color:"#000000"}},[t._v("¥"+t._s(t.detail.shop_price))])]),i("view",{staticClass:"item-cost"},[i("text",{staticStyle:{flex:"1"}},[t._v("运费：")]),i("text",{staticStyle:{"font-size":"18px",color:"#000000"}},[t._v("¥"+t._s(t.detail.shipping_price))])])]),i("view",{staticClass:"payment-money"},[i("text",[t._v("实付款：")]),i("text",{staticStyle:{color:"#ED3005","font-size":"24px"}},[t._v("¥"+t._s(t.detail.all_money))])])]),0!=t.detail.order_status?i("view",{staticClass:"order-info"},[i("view",{staticClass:"oi-tit"},[t._v("订单信息")]),i("view",{staticClass:"oi-cont"},[i("view",{staticClass:"item-oinfo"},[i("text",[t._v("订单编号：")]),i("text",[t._v(t._s(t.detail.order_sn))])]),i("view",{staticClass:"item-oinfo"},[i("text",[t._v("下单时间：")]),i("text",[t._v(t._s(t.detail.add_time))])]),i("view",{staticClass:"item-oinfo"},[i("text",[t._v("支付方式：")]),i("text",[t._v(t._s(t.detail.pay_type))])]),i("view",{staticClass:"item-oinfo"},[i("text",[t._v("配送方式：")]),i("text",[t._v(t._s(t.detail.shipping_name))])])]),i("view",{staticClass:"oi-bottom"},[i("text",{staticClass:"iconfont icon-btn_call",staticStyle:{color:"","font-size":"#4197DD22px"}}),i("text",{staticStyle:{"margin-left":"12px"}},[t._v("联系客服")])])]):t._e(),i("view",{staticClass:"temp-view-60",staticStyle:{background:"#f8f8f8"}}),i("view",{staticClass:"bottom-btns"},[0==t.detail.order_status?i("block",[i("view",{staticStyle:{flex:"1",display:"flex","align-items":"center"}},[i("uni-countdown",{attrs:{color:"#ffffff",splitorColor:"#ffffff","background-color":"#ED3005","border-color":"rgba(0,0,0,0)",second:t.detail.expire_time,"show-day":!1,styleNum:2,mpcomid:"1d39e375-0"}})],1),i("view",{staticClass:"btn-delete",attrs:{eventid:"1d39e375-0"},on:{click:function(e){t.deleteOrder(t.detail.order_id)}}},[i("text",{staticClass:"iconfont icon-btn_delete"})]),i("text",{staticClass:"btn-03",attrs:{eventid:"1d39e375-1"},on:{click:function(e){t.showPaymentDialog()}}},[t._v("立即付款")])]):t._e(),1==t.detail.order_status?i("block",[i("view",{staticClass:"btn-delete",attrs:{eventid:"1d39e375-2"},on:{click:function(e){t.deleteOrder(t.detail.order_id)}}},[i("text",{staticClass:"iconfont icon-btn_delete"})])]):t._e(),2==t.detail.order_status?i("block",[i("text",{staticClass:"btn-02",attrs:{eventid:"1d39e375-3"},on:{click:function(e){t.toRefund(t.detail.order_id)}}},[t._v("申请退款")]),i("text",{staticClass:"btn-01",attrs:{eventid:"1d39e375-4"},on:{click:function(e){t.toLogistics(t.detail.order_id)}}},[t._v("查看物流")]),i("text",{staticClass:"btn-01",attrs:{eventid:"1d39e375-5"},on:{click:function(e){t.toConfirmOrder(t.detail.order_id)}}},[t._v("确认收货")])]):t._e(),9==t.detail.order_status?i("block",[i("view",{staticClass:"btn-delete",attrs:{eventid:"1d39e375-6"},on:{click:function(e){t.deleteOrder(t.detail.order_id)}}},[i("text",{staticClass:"iconfont icon-btn_delete"})]),i("text",{staticClass:"btn-01",attrs:{eventid:"1d39e375-7"},on:{click:function(e){t.toLogistics(t.detail.order_id)}}},[t._v("查看物流")]),i("text",{staticClass:"btn-01",attrs:{eventid:"1d39e375-8"},on:{click:function(e){t.toComment(t.detail)}}},[t._v("评价晒单")]),i("text",{staticClass:"btn-02",attrs:{eventid:"1d39e375-9"},on:{click:t.toHome}},[t._v("再次购买")])]):t._e(),4==t.detail.order_status?i("block",[i("view",{staticClass:"btn-delete",attrs:{eventid:"1d39e375-10"},on:{click:function(e){t.deleteOrder(t.detail.order_id)}}},[i("text",{staticClass:"iconfont icon-btn_delete"})]),i("text",{staticClass:"btn-01",attrs:{eventid:"1d39e375-11"},on:{click:function(e){t.toLogistics(t.detail.order_id)}}},[t._v("查看物流")]),i("text",{staticClass:"btn-02",attrs:{eventid:"1d39e375-12"},on:{click:t.toHome}},[t._v("再次购买")])]):t._e(),5==t.detail.order_status?i("block",[i("view",{staticClass:"btn-delete",attrs:{eventid:"1d39e375-13"},on:{click:function(e){t.deleteOrder(t.detail.order_id)}}},[i("text",{staticClass:"iconfont icon-btn_delete"})]),i("text",{staticClass:"btn-02",attrs:{eventid:"1d39e375-14"},on:{click:t.toHome}},[t._v("再次购买")])]):t._e(),6==t.detail.order_status||7==t.detail.order_status||8==t.detail.order_status?i("view",{staticClass:"btn-delete",attrs:{eventid:"1d39e375-15"},on:{click:function(e){t.deleteOrder(t.detail.order_id)}}},[i("text",{staticClass:"iconfont icon-btn_delete"})]):t._e()],1)]):t._e(),t.paymentFlag?i("view",{staticClass:"mask"},[i("view",{staticClass:"dialog-detailed"},[i("view",{staticClass:"dd-header"},[i("text",{staticClass:"h-tit"},[t._v("选择支付方式")]),i("text",{staticClass:"h-close iconfont icon-btn_close_black",attrs:{eventid:"1d39e375-16"},on:{click:t.hidePaymentDialog}})]),i("view",{staticClass:"dd-payment"},[i("view",{staticClass:"item-payment",attrs:{"data-type":"weixin",eventid:"1d39e375-17"},on:{click:t.paymentListener}},[t._m(0),i("text",{staticClass:"p-radio iconfont",class:"weixin"==t.pay_type?" icon-selector_enable":"icon-selector_disable",style:"color:"+("weixin"==t.pay_type?"#3A96E6":"#EDEDED")})]),i("view",{staticClass:"item-payment",attrs:{"data-type":"ali",eventid:"1d39e375-18"},on:{click:t.paymentListener}},[t._m(1),i("text",{staticClass:"p-radio iconfont",class:"ali"==t.pay_type?" icon-selector_enable":"icon-selector_disable",style:"color:"+("ali"==t.pay_type?"#3A96E6":"#EDEDED")})])])])]):t._e(),i("dialog-view",{attrs:{title:"确定取消订单？",btnCancel:"确定",btnSure:"再想想",eventid:"1d39e375-19",mpcomid:"1d39e375-1"},on:{cancelEvent:t.cancelListener,sureEvent:t.sureListener}}),i("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",mpcomid:"1d39e375-2"}}),i("ToastView",{attrs:{mpcomid:"1d39e375-3"}})],1)},s=[function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("view",{staticClass:"p-lt"},[i("text",{staticClass:"iconfont icon-icon_pay_wepay",staticStyle:{"font-size":"30px",color:"#41B035"}}),i("text",{staticStyle:{color:"#333333","font-size":"16px","margin-left":"15px"}},[t._v("微信支付")])])},function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("view",{staticClass:"p-lt"},[i("text",{staticClass:"iconfont icon-icon_pay_alipay",staticStyle:{"font-size":"30px",color:"#00AAEE"}}),i("text",{staticStyle:{color:"#333333","font-size":"16px","margin-left":"15px"}},[t._v("支付宝支付")])])}];i.d(e,"a",function(){return a}),i.d(e,"b",function(){return s})},"0d00":function(t,e,i){"use strict";i.r(e);var a=i("06f7"),s=i("5745");for(var o in s)"default"!==o&&function(t){i.d(e,t,function(){return s[t]})}(o);i("91a7");var n=i("2877"),d=Object(n["a"])(s["default"],a["a"],a["b"],!1,null,null,null);e["default"]=d.exports},5745:function(t,e,i){"use strict";i.r(e);var a=i("93b8"),s=i.n(a);for(var o in a)"default"!==o&&function(t){i.d(e,t,function(){return a[t]})}(o);e["default"]=s.a},"91a7":function(t,e,i){"use strict";var a=i("aa57"),s=i.n(a);s.a},"93b8":function(t,e,i){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var a=s(i("9219"));function s(t){return t&&t.__esModule?t:{default:t}}var o={data:function(){return{user_id:0,order_id:"",detail:"",paymentFlag:!1,imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(e){var i=this,a=t.getStorageSync("user_id");void 0!=a&&""!=a&&(i.$data.userid=a),void 0!=e.pid&&""!=e.pid&&t.setStorageSync("pid",e.pid),i.wxb.printLog(e),i.wxb.addPage(this),i.wxb.Init(e,function(t){e.order_id&&(i.$data.order_id=e.order_id,i.getOrderDetail())})},components:{uniCountdown:a.default},onUnload:function(){this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:""==t.$data.companyName?"积分商城":t.$data.companyName,path:"/pages/mine/mall/index?pid="+t.$data.userid}},methods:{showPaymentDialog:function(t){"h5"==this.wxb.device?this.$data.paymentFlag=!0:this.toPayment()},hidePaymentDialog:function(t){this.$data.paymentFlag=!1},paymentListener:function(t){var e=t.currentTarget.dataset.type;void 0!=e&&(this.$data.pay_type=e,this.toPayment()),this.hidePaymentDialog()},toPayment:function(){var t=this;t.wxb.Post("/shop/api.integral/continuePay",{order_id:t.$data.order_id,pay_type:t.$data.pay_type},function(e){if(0==e.is_pay)t.getOrderDetail();else if("h5"==t.wxb.device)if("weixin"==t.$data.pay_type)console.log("h5端支付跳转超链接"),window.location.href=e.order_info;else{var i=window.document.createElement("div");i.innerHTML=e.order_info,window.document.body.appendChild(i),window.document.forms.alipaysubmit.submit()}else t.wxb.paymentOrder(e,function(i){console.log(e),t.getOrderDetail()});t.$data.pay_type=""})},toComment:function(e){t.navigateTo({url:"../../order/comment?model="+JSON.stringify(e)})},getOrderDetail:function(t){var e=this;e.wxb.Post("/shop/api.integral/orderDetail",{order_id:e.$data.order_id},function(t){e.$data.detail=t.detail})},showCancelDialog:function(){this.$showDialog()},deleteOrder:function(){var e=this;e.wxb.Post("/shop/api.order/delOrder",{order_id:e.$data.order_id},function(e){t.navigateBack({})})},toLogistics:function(){t.navigateTo({url:"./logistics?order_id="+this.$data.order_id})},toHome:function(){t.redirectTo({url:"/pages/mine/mall/index"})},toRefund:function(){t.navigateTo({url:"./refund/index?order_id="+this.$data.order_id})},toCancel:function(){var t=this;t.wxb.Post("/shop/api.order/cancelOrder",{order_id:t.$data.order_id},function(e){t.getOrderDetail()})},toConfirmOrder:function(){var t=this;t.wxb.Post("/shop/api.order/confirmOrder",{order_id:t.$data.order_id},function(e){t.getOrderDetail()})},cancelListener:function(e){console.log("取消订单"),t.navigateTo({url:"cancel"}),this.$showDialog(!1)},sureListener:function(t){console.log("确定订单"),this.$showDialog(!1)}}};e.default=o}).call(this,i("543d")["default"])},aa57:function(t,e,i){},b2dd:function(t,e,i){"use strict";i("2346");var a=o(i("b0ce")),s=o(i("0d00"));function o(t){return t&&t.__esModule?t:{default:t}}Page((0,a.default)(s.default))}},[["b2dd","common/runtime","common/vendor"]]]);