(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/mine/order/detail"],{"17c3":function(t,i,e){"use strict";e.r(i);var a=e("339c"),s=e.n(a);for(var o in a)"default"!==o&&function(t){e.d(i,t,function(){return a[t]})}(o);i["default"]=s.a},"339c":function(t,i,e){"use strict";(function(t){Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;var a=s(e("9219"));function s(t){return t&&t.__esModule?t:{default:t}}var o={data:function(){return{userid:0,order_id:"",detail:"",pay_type:"",paymentFlag:!1,imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},components:{uniCountdown:a.default},onLoad:function(i){var e=this,a=t.getStorageSync("user_id");void 0!=a&&""!=a&&(e.$data.userid=a),void 0!=i.pid&&""!=i.pid&&t.setStorageSync("pid",i.pid),e.wxb.printLog(i),e.wxb.addPage(this),e.wxb.Init(i,function(t){i.order_id&&(e.$data.order_id=i.order_id,e.getOrderDetail())})},onUnload:function(){this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:""==t.$data.companyName?"订单详情":t.$data.companyName,path:"/pages/mine/order/detail?pid="+t.$data.userid}},methods:{getOrderDetail:function(t){var i=this;i.wxb.Post("/shop/api.order/getDetail",{order_id:i.$data.order_id},function(t){i.$data.detail=t})},showPaymentDialog:function(t){"h5"==this.wxb.device?this.$data.paymentFlag=!0:this.toPayment()},hidePaymentDialog:function(t){this.$data.paymentFlag=!1},paymentListener:function(t){var i=t.currentTarget.dataset.type;void 0!=i&&(this.$data.pay_type=i,this.toPayment()),this.hidePaymentDialog()},toPayment:function(){var t=this;t.wxb.Post("/shop/api.order/continuePay",{order_id:t.$data.order_id,pay_type:t.$data.pay_type},function(i){if(0==i.is_pay)t.getOrderDetail();else if("h5"==t.wxb.device)if("weixin"==t.$data.pay_type)console.log("h5端支付跳转超链接"),window.location.href=i.order_info;else{var e=window.document.createElement("div");e.innerHTML=i.order_info,window.document.body.appendChild(e),window.document.forms.alipaysubmit.submit()}else t.wxb.paymentOrder(i,function(e){console.log(i),t.getOrderDetail()});t.$data.pay_type=""})},showCancelDialog:function(){this.$showDialog()},deleteOrder:function(){var i=this;i.wxb.Post("/shop/api.order/delOrder",{order_id:i.$data.order_id},function(i){t.navigateBack({})})},toLogistics:function(){t.navigateTo({url:"./logistics?order_id="+this.$data.order_id})},toHome:function(){t.reLaunch({url:"/pages/index/index"})},toRefund:function(){t.navigateTo({url:"./refund/index?order_id="+this.$data.order_id})},toCancel:function(){var t=this;t.wxb.Post("/shop/api.order/cancelOrder",{order_id:t.$data.order_id},function(i){t.getOrderDetail()})},toConfirmOrder:function(){var t=this;t.wxb.Post("/shop/api.order/confirmOrder",{order_id:t.$data.order_id},function(i){t.getOrderDetail()})},cancelListener:function(i){console.log("取消订单"),t.navigateTo({url:"cancel"}),this.$showDialog(!1)},sureListener:function(t){console.log("确定订单"),this.$showDialog(!1)}}};i.default=o}).call(this,e("5486")["default"])},"8e64":function(t,i,e){"use strict";e.r(i);var a=e("a0bf"),s=e("17c3");for(var o in s)"default"!==o&&function(t){e.d(i,t,function(){return s[t]})}(o);e("b004");var r=e("2877"),n=Object(r["a"])(s["default"],a["a"],a["b"],!1,null,null,null);i["default"]=n.exports},a0bf:function(t,i,e){"use strict";var a=function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("view",{staticClass:"order-detail",attrs:{_hid:0}},[t._ri(!!t.detail,1)?e("block",{attrs:{_hid:1}},[e("view",{staticClass:"base-info",attrs:{_hid:2}},[e("view",{staticClass:"o-state",attrs:{_hid:3}},[e("view",{staticStyle:{width:"100%",height:"100%",position:"relative"},attrs:{_hid:4}},[e("text",{staticClass:"iconfont icon-icon_order6 s-icon",attrs:{_hid:5}}),e("text",{staticClass:"s-state",attrs:{_hid:6}},[t._v(t._s(t.detail.order_status_mean),7)]),e("image",{staticClass:"os-img",attrs:{src:t.imgBaseUrl+"/order/img_order_status@3x.png",_hid:8,_batrs:"src"}})])]),e("view",{staticClass:"o-addr",attrs:{_hid:9}},[e("view",{staticClass:"a-icon iconfont icon-icon_location",attrs:{_hid:10}}),e("view",{staticClass:"a-cont",attrs:{_hid:11}},[e("view",{staticClass:"ac-name",attrs:{_hid:12}},[t._v(t._s(t.detail.name)+" "+t._s(t.detail.mobile),13)]),e("view",{staticClass:"ac-addr ellipsis-02",attrs:{_hid:14}},[t._v(t._s(t.detail.address),15)])])])]),e("view",{staticClass:"detailed-list",attrs:{_hid:16}},[t._l(t.detail.order_goods,function(i,a,s){var o=void 0!==s?s:a;return e("view",{key:a,staticClass:"item-goods",attrs:{_hid:17,_fid:o,_fk:"i"}},[e("image",{staticClass:"g-img",attrs:{src:i.goods_photo,_hid:18,_fid:o,_batrs:"src"}}),e("view",{staticClass:"g-cont",attrs:{_hid:19,_fid:o}},[e("view",{staticClass:"gc-name ellipsis-02",attrs:{_hid:20,_fid:o}},[t._v(t._s(i.goods_name),21,o)]),e("view",{staticClass:"gc-sku",attrs:{_hid:22,_fid:o}},[e("text",{staticStyle:{flex:"1","margin-right":"5px"},attrs:{_hid:23,_fid:o}},[t._v(t._s(i.spec_key_name),24,o)]),e("text",{attrs:{_hid:25,_fid:o}},[t._v("x"+t._s(i.goods_num),26,o)])])])])},17,t._self),e("view",{staticClass:"cost-info",attrs:{_hid:27}},[e("view",{staticClass:"item-cost",attrs:{_hid:28}},[e("text",{staticStyle:{flex:"1"},attrs:{_hid:29}},[]),e("text",{staticStyle:{"font-size":"18px",color:"#000000"},attrs:{_hid:31}},[t._v("¥"+t._s(t.detail.goods_price),32)])]),e("view",{staticClass:"item-cost",attrs:{_hid:33}},[e("text",{staticStyle:{flex:"1"},attrs:{_hid:34}},[]),e("text",{staticStyle:{"font-size":"18px",color:"#000000"},attrs:{_hid:36}},[t._v("¥"+t._s(t.detail.youhui_price),37)])]),e("view",{staticClass:"item-cost",attrs:{_hid:38}},[e("text",{staticStyle:{flex:"1"},attrs:{_hid:39}},[]),e("text",{staticStyle:{"font-size":"18px",color:"#000000"},attrs:{_hid:41}},[t._v("¥"+t._s(t.detail.user_money),42)])]),e("view",{staticClass:"item-cost",attrs:{_hid:43}},[e("text",{staticStyle:{flex:"1"},attrs:{_hid:44}},[]),e("text",{staticStyle:{"font-size":"18px",color:"#000000"},attrs:{_hid:46}},[t._v("¥"+t._s(t.detail.shipping_price),47)])])]),e("view",{staticClass:"payment-money",attrs:{_hid:48}},[e("text",{attrs:{_hid:49}},[]),e("text",{staticStyle:{color:"#ED3005","font-size":"24px"},attrs:{_hid:51}},[t._v("¥"+t._s(t.detail.final_price),52)])])],1),e("view",{staticClass:"order-info",attrs:{_hid:53}},[e("view",{staticClass:"oi-tit",attrs:{_hid:54}},[]),e("view",{staticClass:"oi-cont",attrs:{_hid:56}},[e("view",{staticClass:"item-oinfo",attrs:{_hid:57}},[e("text",{attrs:{_hid:58}},[]),e("text",{attrs:{_hid:60}},[t._v(t._s(t.detail.order_sn),61)])]),e("view",{staticClass:"item-oinfo",attrs:{_hid:62}},[e("text",{attrs:{_hid:63}},[]),e("text",{attrs:{_hid:65}},[t._v(t._s(t.detail.add_time),66)])]),e("view",{staticClass:"item-oinfo",attrs:{_hid:67}},[e("text",{attrs:{_hid:68}},[]),e("text",{attrs:{_hid:70}},[t._v(t._s(t.detail.pay_type_mean),71)])]),e("view",{staticClass:"item-oinfo",attrs:{_hid:72}},[e("text",{attrs:{_hid:73}},[]),e("text",{attrs:{_hid:75}},[])])]),e("view",{staticClass:"oi-bottom",attrs:{_hid:77}},[e("text",{staticClass:"iconfont icon-btn_call",staticStyle:{color:"","font-size":"#4197DD22px"},attrs:{_hid:78}}),e("text",{staticStyle:{"margin-left":"12px"},attrs:{_hid:79}},[])])]),e("view",{staticClass:"temp-view-60",attrs:{_hid:81}}),e("view",{staticClass:"bottom-btns",attrs:{_hid:82}},[t._ri(!(0!=t.detail.order_status),83)?e("block",{attrs:{_hid:83}},[e("view",{staticStyle:{flex:"1",display:"flex","align-items":"center"},attrs:{_hid:84}},[e("uni-countdown",{attrs:{color:"#ffffff",splitorColor:"#ffffff","background-color":"#ED3005","border-color":"rgba(0,0,0,0)",second:t.detail.expire_time,"show-day":!1,styleNum:2,_hid:85,_batrs:"second,show-day,styleNum",_cid:0}})],1),e("text",{staticClass:"btn-01",attrs:{_hid:1087},on:{click:function(i){t.toCancel()}}},[]),e("text",{staticClass:"btn-03",attrs:{_hid:1089},on:{click:function(i){t.showPaymentDialog()}}},[])]):t._e(),t._ri(!(1!=t.detail.order_status),1091)?e("block",{attrs:{_hid:1091}},[e("text",{staticClass:"btn-01",attrs:{_hid:1092},on:{click:function(i){t.toRefund()}}},[]),e("navigator",{staticClass:"btn-01",attrs:{url:"index",_hid:1094}},[e("text",{attrs:{_hid:1095}},[])])],1):t._e(),t._ri(!(2!=t.detail.order_status),1097)?e("block",{attrs:{_hid:1097}},[e("text",{staticClass:"btn-02",attrs:{_hid:1098},on:{click:function(i){t.toRefund()}}},[]),e("text",{staticClass:"btn-01",attrs:{_hid:1100},on:{click:function(i){t.toLogistics()}}},[]),e("text",{staticClass:"btn-01",attrs:{_hid:1102},on:{click:function(i){t.toConfirmOrder()}}},[])]):t._e(),t._ri(!(9!=t.detail.order_status),1104)?e("block",{attrs:{_hid:1104}},[e("view",{staticClass:"btn-delete",attrs:{_hid:1105},on:{click:t.deleteOrder}},[e("text",{staticClass:"iconfont icon-btn_delete",attrs:{_hid:1106}})]),e("text",{staticClass:"btn-01",attrs:{_hid:1107},on:{click:function(i){t.toLogistics()}}},[]),e("text",{staticClass:"btn-01",attrs:{_hid:1109}},[]),e("text",{staticClass:"btn-02",attrs:{_hid:1111},on:{click:t.toHome}},[])]):t._e(),t._ri(!(4!=t.detail.order_status),1113)?e("block",{attrs:{_hid:1113}},[e("view",{staticClass:"btn-delete",attrs:{_hid:1114},on:{click:t.deleteOrder}},[e("text",{staticClass:"iconfont icon-btn_delete",attrs:{_hid:1115}})]),e("text",{staticClass:"btn-01",attrs:{_hid:1116},on:{click:function(i){t.toLogistics()}}},[]),e("text",{staticClass:"btn-02",attrs:{_hid:1118},on:{click:t.toHome}},[])]):t._e(),t._ri(!(5!=t.detail.order_status),1120)?e("block",{attrs:{_hid:1120}},[e("view",{staticClass:"btn-delete",attrs:{_hid:1121},on:{click:t.deleteOrder}},[e("text",{staticClass:"iconfont icon-btn_delete",attrs:{_hid:1122}})]),e("text",{staticClass:"btn-02",attrs:{_hid:1123},on:{click:t.toHome}},[])]):t._e(),t._ri(!(6!=t.detail.order_status),1125)?e("text",{staticClass:"btn-02",attrs:{_hid:1125}},[]):t._e(),e("text",{staticClass:"btn-01",attrs:{_hid:1127},on:{click:t.toHome}},[]),t._ri(!(7!=t.detail.order_status&&8!=t.detail.order_status),1129)?e("view",{staticClass:"btn-delete",attrs:{_hid:1129},on:{click:t.deleteOrder}},[e("text",{staticClass:"iconfont icon-btn_delete",attrs:{_hid:1130}})]):t._e()],1)]):t._e(),t._ri(!!t.paymentFlag,1131)?e("view",{staticClass:"mask",attrs:{_hid:1131}},[e("view",{staticClass:"dialog-detailed",attrs:{_hid:1132}},[e("view",{staticClass:"dd-header",attrs:{_hid:1133}},[e("text",{staticClass:"h-tit",attrs:{_hid:1134}},[]),e("text",{staticClass:"h-close iconfont icon-btn_close_black",attrs:{_hid:1136},on:{click:t.hidePaymentDialog}})]),e("view",{staticClass:"dd-payment",attrs:{_hid:1137}},[e("view",{staticClass:"item-payment",attrs:{"data-type":"weixin",_hid:1138},on:{click:t.paymentListener}},[t._m(0),e("text",{staticClass:"p-radio iconfont",class:"weixin"==t.pay_type?" icon-selector_enable":"icon-selector_disable",style:"color:"+("weixin"==t.pay_type?"#3A96E6":"#EDEDED"),attrs:{_hid:1143}})]),e("view",{staticClass:"item-payment",attrs:{"data-type":"ali",_hid:1144},on:{click:t.paymentListener}},[t._m(1),e("text",{staticClass:"p-radio iconfont",class:"ali"==t.pay_type?" icon-selector_enable":"icon-selector_disable",style:"color:"+("ali"==t.pay_type?"#3A96E6":"#EDEDED"),attrs:{_hid:1149}})])])])]):t._e(),e("dialog-view",{attrs:{title:"确定取消订单？",btnCancel:"确定",btnSure:"再想想",_hid:1150,_cid:1},on:{cancelEvent:t.cancelListener,sureEvent:t.sureListener}}),e("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",_hid:2152,_batrs:"img",_cid:2}}),e("ToastView",{attrs:{_hid:3154,_cid:3}})],1)},s=[function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("view",{staticClass:"p-lt",attrs:{_hid:1139}},[e("text",{staticClass:"iconfont icon-icon_pay_wepay",staticStyle:{"font-size":"30px",color:"#41B035"},attrs:{_hid:1140}}),e("text",{staticStyle:{color:"#333333","font-size":"16px","margin-left":"15px"},attrs:{_hid:1141}},[])])},function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("view",{staticClass:"p-lt",attrs:{_hid:1145}},[e("text",{staticClass:"iconfont icon-icon_pay_alipay",staticStyle:{"font-size":"30px",color:"#00AAEE"},attrs:{_hid:1146}}),e("text",{staticStyle:{color:"#333333","font-size":"16px","margin-left":"15px"},attrs:{_hid:1147}},[])])}];e.d(i,"a",function(){return a}),e.d(i,"b",function(){return s})},b004:function(t,i,e){"use strict";var a=e("ce4f"),s=e.n(a);s.a},ce4f:function(t,i,e){},d611:function(t,i,e){"use strict";e("2346");var a=o(e("8e64")),s=o(e("3a53"));function o(t){return t&&t.__esModule?t:{default:t}}a.default.mpType="page";var r=new s.default(a.default);r.$mount()}},[["d611","common/runtime","common/vendor"]]]);