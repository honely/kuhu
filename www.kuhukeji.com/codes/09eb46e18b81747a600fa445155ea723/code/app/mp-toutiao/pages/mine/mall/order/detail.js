(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/mine/mall/order/detail"],{"06f7":function(t,i,e){"use strict";var a=function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("view",{staticClass:"order-detail",attrs:{_hid:0}},[t._ri(!!t.detail,1)?e("block",{attrs:{_hid:1}},[e("view",{staticClass:"base-info",attrs:{_hid:2}},[e("view",{staticClass:"o-state",attrs:{_hid:3}},[e("view",{staticStyle:{width:"100%",height:"100%",position:"relative"},attrs:{_hid:4}},[e("text",{staticClass:"iconfont icon-icon_order6 s-icon",attrs:{_hid:5}}),e("text",{staticClass:"s-state",attrs:{_hid:6}},[t._v(t._s(t.detail.order_status_mean),7)]),e("image",{staticClass:"os-img",attrs:{src:t.imgBaseUrl+"/order/img_order_status@3x.png",_hid:8,_batrs:"src"}})])]),e("view",{staticClass:"o-addr",attrs:{_hid:9}},[e("view",{staticClass:"a-icon iconfont icon-icon_location",attrs:{_hid:10}}),e("view",{staticClass:"a-cont",attrs:{_hid:11}},[e("view",{staticClass:"ac-name",attrs:{_hid:12}},[t._v(t._s(t.detail.name)+" "+t._s(t.detail.mobile),13)]),e("view",{staticClass:"ac-addr ellipsis-02",attrs:{_hid:14}},[t._v(t._s(t.detail.address),15)])])])]),e("view",{staticClass:"detailed-list",attrs:{_hid:16}},[e("view",{staticClass:"item-goods",attrs:{_hid:17}},[e("image",{staticClass:"g-img",attrs:{src:t.detail.photo,_hid:18,_batrs:"src"}}),e("view",{staticClass:"g-cont",attrs:{_hid:19}},[e("view",{staticClass:"gc-name ellipsis-02",attrs:{_hid:20}},[t._v(t._s(t.detail.goods_name),21)]),e("view",{staticClass:"gc-sku",attrs:{_hid:22}},[e("text",{attrs:{_hid:23}},[])])])]),e("view",{staticClass:"cost-info",attrs:{_hid:25}},[e("view",{staticClass:"item-cost",attrs:{_hid:26}},[e("text",{staticStyle:{flex:"1"},attrs:{_hid:27}},[]),e("text",{staticStyle:{"font-size":"18px",color:"#000000"},attrs:{_hid:29}},[t._v("¥"+t._s(t.detail.integral),30)])]),e("view",{staticClass:"item-cost",attrs:{_hid:31}},[e("text",{staticStyle:{flex:"1"},attrs:{_hid:32}},[]),e("text",{staticStyle:{"font-size":"18px",color:"#000000"},attrs:{_hid:34}},[t._v("¥"+t._s(t.detail.shop_price),35)])]),e("view",{staticClass:"item-cost",attrs:{_hid:36}},[e("text",{staticStyle:{flex:"1"},attrs:{_hid:37}},[]),e("text",{staticStyle:{"font-size":"18px",color:"#000000"},attrs:{_hid:39}},[t._v("¥"+t._s(t.detail.shipping_price),40)])])]),e("view",{staticClass:"payment-money",attrs:{_hid:41}},[e("text",{attrs:{_hid:42}},[]),e("text",{staticStyle:{color:"#ED3005","font-size":"24px"},attrs:{_hid:44}},[t._v("¥"+t._s(t.detail.all_money),45)])])]),t._ri(!(0==t.detail.order_status),46)?e("view",{staticClass:"order-info",attrs:{_hid:46}},[e("view",{staticClass:"oi-tit",attrs:{_hid:47}},[]),e("view",{staticClass:"oi-cont",attrs:{_hid:49}},[e("view",{staticClass:"item-oinfo",attrs:{_hid:50}},[e("text",{attrs:{_hid:51}},[]),e("text",{attrs:{_hid:53}},[t._v(t._s(t.detail.order_sn),54)])]),e("view",{staticClass:"item-oinfo",attrs:{_hid:55}},[e("text",{attrs:{_hid:56}},[]),e("text",{attrs:{_hid:58}},[t._v(t._s(t.detail.add_time),59)])]),e("view",{staticClass:"item-oinfo",attrs:{_hid:60}},[e("text",{attrs:{_hid:61}},[]),e("text",{attrs:{_hid:63}},[t._v(t._s(t.detail.pay_type),64)])]),e("view",{staticClass:"item-oinfo",attrs:{_hid:65}},[e("text",{attrs:{_hid:66}},[]),e("text",{attrs:{_hid:68}},[t._v(t._s(t.detail.shipping_name),69)])])]),e("view",{staticClass:"oi-bottom",attrs:{_hid:70}},[e("text",{staticClass:"iconfont icon-btn_call",staticStyle:{color:"","font-size":"#4197DD22px"},attrs:{_hid:71}}),e("text",{staticStyle:{"margin-left":"12px"},attrs:{_hid:72}},[])])]):t._e(),e("view",{staticClass:"temp-view-60",staticStyle:{background:"#f8f8f8"},attrs:{_hid:74}}),e("view",{staticClass:"bottom-btns",attrs:{_hid:75}},[t._ri(!(0!=t.detail.order_status),76)?e("block",{attrs:{_hid:76}},[e("view",{staticStyle:{flex:"1",display:"flex","align-items":"center"},attrs:{_hid:77}},[e("uni-countdown",{attrs:{color:"#ffffff",splitorColor:"#ffffff","background-color":"#ED3005","border-color":"rgba(0,0,0,0)",second:t.detail.expire_time,"show-day":!1,styleNum:2,_hid:78,_batrs:"second,show-day,styleNum",_cid:0}})],1),e("view",{staticClass:"btn-delete",attrs:{_hid:1080},on:{click:function(i){t.deleteOrder(t.detail.order_id)}}},[e("text",{staticClass:"iconfont icon-btn_delete",attrs:{_hid:1081}})]),e("text",{staticClass:"btn-03",attrs:{_hid:1082},on:{click:function(i){t.showPaymentDialog()}}},[])]):t._e(),t._ri(!(1!=t.detail.order_status),1084)?e("block",{attrs:{_hid:1084}},[e("view",{staticClass:"btn-delete",attrs:{_hid:1085},on:{click:function(i){t.deleteOrder(t.detail.order_id)}}},[e("text",{staticClass:"iconfont icon-btn_delete",attrs:{_hid:1086}})])]):t._e(),t._ri(!(2!=t.detail.order_status),1087)?e("block",{attrs:{_hid:1087}},[e("text",{staticClass:"btn-02",attrs:{_hid:1088},on:{click:function(i){t.toRefund(t.detail.order_id)}}},[]),e("text",{staticClass:"btn-01",attrs:{_hid:1090},on:{click:function(i){t.toLogistics(t.detail.order_id)}}},[]),e("text",{staticClass:"btn-01",attrs:{_hid:1092},on:{click:function(i){t.toConfirmOrder(t.detail.order_id)}}},[])]):t._e(),t._ri(!(9!=t.detail.order_status),1094)?e("block",{attrs:{_hid:1094}},[e("view",{staticClass:"btn-delete",attrs:{_hid:1095},on:{click:function(i){t.deleteOrder(t.detail.order_id)}}},[e("text",{staticClass:"iconfont icon-btn_delete",attrs:{_hid:1096}})]),e("text",{staticClass:"btn-01",attrs:{_hid:1097},on:{click:function(i){t.toLogistics(t.detail.order_id)}}},[]),e("text",{staticClass:"btn-01",attrs:{_hid:1099},on:{click:function(i){t.toComment(t.detail)}}},[]),e("text",{staticClass:"btn-02",attrs:{_hid:1101},on:{click:t.toHome}},[])]):t._e(),t._ri(!(4!=t.detail.order_status),1103)?e("block",{attrs:{_hid:1103}},[e("view",{staticClass:"btn-delete",attrs:{_hid:1104},on:{click:function(i){t.deleteOrder(t.detail.order_id)}}},[e("text",{staticClass:"iconfont icon-btn_delete",attrs:{_hid:1105}})]),e("text",{staticClass:"btn-01",attrs:{_hid:1106},on:{click:function(i){t.toLogistics(t.detail.order_id)}}},[]),e("text",{staticClass:"btn-02",attrs:{_hid:1108},on:{click:t.toHome}},[])]):t._e(),t._ri(!(5!=t.detail.order_status),1110)?e("block",{attrs:{_hid:1110}},[e("view",{staticClass:"btn-delete",attrs:{_hid:1111},on:{click:function(i){t.deleteOrder(t.detail.order_id)}}},[e("text",{staticClass:"iconfont icon-btn_delete",attrs:{_hid:1112}})]),e("text",{staticClass:"btn-02",attrs:{_hid:1113},on:{click:t.toHome}},[])]):t._e(),t._ri(!(6!=t.detail.order_status&&7!=t.detail.order_status&&8!=t.detail.order_status),1115)?e("view",{staticClass:"btn-delete",attrs:{_hid:1115},on:{click:function(i){t.deleteOrder(t.detail.order_id)}}},[e("text",{staticClass:"iconfont icon-btn_delete",attrs:{_hid:1116}})]):t._e()],1)]):t._e(),t._ri(!!t.paymentFlag,1117)?e("view",{staticClass:"mask",attrs:{_hid:1117}},[e("view",{staticClass:"dialog-detailed",attrs:{_hid:1118}},[e("view",{staticClass:"dd-header",attrs:{_hid:1119}},[e("text",{staticClass:"h-tit",attrs:{_hid:1120}},[]),e("text",{staticClass:"h-close iconfont icon-btn_close_black",attrs:{_hid:1122},on:{click:t.hidePaymentDialog}})]),e("view",{staticClass:"dd-payment",attrs:{_hid:1123}},[e("view",{staticClass:"item-payment",attrs:{"data-type":"weixin",_hid:1124},on:{click:t.paymentListener}},[t._m(0),e("text",{staticClass:"p-radio iconfont",class:"weixin"==t.pay_type?" icon-selector_enable":"icon-selector_disable",style:"color:"+("weixin"==t.pay_type?"#3A96E6":"#EDEDED"),attrs:{_hid:1129}})]),e("view",{staticClass:"item-payment",attrs:{"data-type":"ali",_hid:1130},on:{click:t.paymentListener}},[t._m(1),e("text",{staticClass:"p-radio iconfont",class:"ali"==t.pay_type?" icon-selector_enable":"icon-selector_disable",style:"color:"+("ali"==t.pay_type?"#3A96E6":"#EDEDED"),attrs:{_hid:1135}})])])])]):t._e(),e("dialog-view",{attrs:{title:"确定取消订单？",btnCancel:"确定",btnSure:"再想想",_hid:1136,_cid:1},on:{cancelEvent:t.cancelListener,sureEvent:t.sureListener}}),e("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",_hid:2138,_batrs:"img",_cid:2}}),e("ToastView",{attrs:{_hid:3140,_cid:3}})],1)},s=[function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("view",{staticClass:"p-lt",attrs:{_hid:1125}},[e("text",{staticClass:"iconfont icon-icon_pay_wepay",staticStyle:{"font-size":"30px",color:"#41B035"},attrs:{_hid:1126}}),e("text",{staticStyle:{color:"#333333","font-size":"16px","margin-left":"15px"},attrs:{_hid:1127}},[])])},function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("view",{staticClass:"p-lt",attrs:{_hid:1131}},[e("text",{staticClass:"iconfont icon-icon_pay_alipay",staticStyle:{"font-size":"30px",color:"#00AAEE"},attrs:{_hid:1132}}),e("text",{staticStyle:{color:"#333333","font-size":"16px","margin-left":"15px"},attrs:{_hid:1133}},[])])}];e.d(i,"a",function(){return a}),e.d(i,"b",function(){return s})},"0d00":function(t,i,e){"use strict";e.r(i);var a=e("06f7"),s=e("5745");for(var o in s)"default"!==o&&function(t){e.d(i,t,function(){return s[t]})}(o);e("91a7");var r=e("2877"),d=Object(r["a"])(s["default"],a["a"],a["b"],!1,null,null,null);i["default"]=d.exports},5745:function(t,i,e){"use strict";e.r(i);var a=e("93b8"),s=e.n(a);for(var o in a)"default"!==o&&function(t){e.d(i,t,function(){return a[t]})}(o);i["default"]=s.a},"91a7":function(t,i,e){"use strict";var a=e("aa57"),s=e.n(a);s.a},"93b8":function(t,i,e){"use strict";(function(t){Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;var a=s(e("9219"));function s(t){return t&&t.__esModule?t:{default:t}}var o={data:function(){return{user_id:0,order_id:"",detail:"",paymentFlag:!1,imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(i){var e=this,a=t.getStorageSync("user_id");void 0!=a&&""!=a&&(e.$data.userid=a),void 0!=i.pid&&""!=i.pid&&t.setStorageSync("pid",i.pid),e.wxb.printLog(i),e.wxb.addPage(this),e.wxb.Init(i,function(t){i.order_id&&(e.$data.order_id=i.order_id,e.getOrderDetail())})},components:{uniCountdown:a.default},onUnload:function(){this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:""==t.$data.companyName?"积分商城":t.$data.companyName,path:"/pages/mine/mall/index?pid="+t.$data.userid}},methods:{showPaymentDialog:function(t){"h5"==this.wxb.device?this.$data.paymentFlag=!0:this.toPayment()},hidePaymentDialog:function(t){this.$data.paymentFlag=!1},paymentListener:function(t){var i=t.currentTarget.dataset.type;void 0!=i&&(this.$data.pay_type=i,this.toPayment()),this.hidePaymentDialog()},toPayment:function(){var t=this;t.wxb.Post("/shop/api.integral/continuePay",{order_id:t.$data.order_id,pay_type:t.$data.pay_type},function(i){if(0==i.is_pay)t.getOrderDetail();else if("h5"==t.wxb.device)if("weixin"==t.$data.pay_type)console.log("h5端支付跳转超链接"),window.location.href=i.order_info;else{var e=window.document.createElement("div");e.innerHTML=i.order_info,window.document.body.appendChild(e),window.document.forms.alipaysubmit.submit()}else t.wxb.paymentOrder(i,function(e){console.log(i),t.getOrderDetail()});t.$data.pay_type=""})},toComment:function(i){t.navigateTo({url:"../../order/comment?model="+JSON.stringify(i)})},getOrderDetail:function(t){var i=this;i.wxb.Post("/shop/api.integral/orderDetail",{order_id:i.$data.order_id},function(t){i.$data.detail=t.detail})},showCancelDialog:function(){this.$showDialog()},deleteOrder:function(){var i=this;i.wxb.Post("/shop/api.order/delOrder",{order_id:i.$data.order_id},function(i){t.navigateBack({})})},toLogistics:function(){t.navigateTo({url:"./logistics?order_id="+this.$data.order_id})},toHome:function(){t.redirectTo({url:"/pages/mine/mall/index"})},toRefund:function(){t.navigateTo({url:"./refund/index?order_id="+this.$data.order_id})},toCancel:function(){var t=this;t.wxb.Post("/shop/api.order/cancelOrder",{order_id:t.$data.order_id},function(i){t.getOrderDetail()})},toConfirmOrder:function(){var t=this;t.wxb.Post("/shop/api.order/confirmOrder",{order_id:t.$data.order_id},function(i){t.getOrderDetail()})},cancelListener:function(i){console.log("取消订单"),t.navigateTo({url:"cancel"}),this.$showDialog(!1)},sureListener:function(t){console.log("确定订单"),this.$showDialog(!1)}}};i.default=o}).call(this,e("f266")["default"])},aa57:function(t,i,e){},b2dd:function(t,i,e){"use strict";e("2346");var a=o(e("0d00")),s=o(e("3a53"));function o(t){return t&&t.__esModule?t:{default:t}}a.default.mpType="page";var r=new s.default(a.default);r.$mount()}},[["b2dd","common/runtime","common/vendor"]]]);