(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/mine/wallet/recharge"],{"20d9":function(e,t,a){"use strict";a("2346");var i=r(a("b0ce")),n=r(a("3e06"));function r(e){return e&&e.__esModule?e:{default:e}}Page((0,i.default)(n.default))},3780:function(e,t,a){"use strict";var i=a("3ac5"),n=a.n(i);n.a},"3ac5":function(e,t,a){},"3e06":function(e,t,a){"use strict";a.r(t);var i=a("ddf2"),n=a("7dbd");for(var r in n)"default"!==r&&function(e){a.d(t,e,function(){return n[e]})}(r);a("3780");var c=a("2877"),s=Object(c["a"])(n["default"],i["a"],i["b"],!1,null,null,null);t["default"]=s.exports},"7dbd":function(e,t,a){"use strict";a.r(t);var i=a("e181"),n=a.n(i);for(var r in i)"default"!==r&&function(e){a.d(t,e,function(){return i[e]})}(r);t["default"]=n.a},ddf2:function(e,t,a){"use strict";var i=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("view",{staticClass:"recharge-cont"},[e.user?a("scroll-view",{attrs:{"scroll-y":"true"}},[a("view",{staticClass:"recharge-box"},[a("view",{staticClass:"recharge-bg"},[a("image",{staticStyle:{width:"100%",height:"100%"},attrs:{src:e.imgBaseUrl+"/mine/bg_wallet@3x.png"}})]),a("view",{staticClass:"curr-money"},[a("view",{staticClass:"cm-lt"},[a("image",{staticClass:"coin-img",attrs:{src:e.imgBaseUrl+"/mine/icon_balance@3x.png"}}),a("view",{staticClass:"coin-hint"},[e._v("当前余额")])]),a("view",{staticClass:"cm-rt"},[e._v("¥"+e._s(e.user.money))])])]),a("view",{staticClass:"select-recharge-box"},[a("view",{staticClass:"rc-tit"},[e._v("选择充值金额")]),a("view",{staticClass:"recharge-cont"},[a("view",{staticClass:"item-recharge",class:500==e.currMoney?"active":"",attrs:{eventid:"cba1d1b6-0"},on:{click:function(t){e.radioRechargeListener(500)}}},[e._v("500元")]),a("view",{staticClass:"item-recharge",class:300==e.currMoney?"active":"",attrs:{eventid:"cba1d1b6-1"},on:{click:function(t){e.radioRechargeListener(300)}}},[e._v("300元")]),a("view",{staticClass:"item-recharge",class:200==e.currMoney?"active":"",attrs:{eventid:"cba1d1b6-2"},on:{click:function(t){e.radioRechargeListener(200)}}},[e._v("200元")]),a("view",{staticClass:"item-recharge",class:100==e.currMoney?"active":"",attrs:{eventid:"cba1d1b6-3"},on:{click:function(t){e.radioRechargeListener(100)}}},[e._v("100元")]),a("view",{staticClass:"item-recharge",class:50==e.currMoney?"active":"",attrs:{eventid:"cba1d1b6-4"},on:{click:function(t){e.radioRechargeListener(50)}}},[e._v("50元")]),a("view",{staticClass:"item-recharge",class:20==e.currMoney?"active":"",attrs:{eventid:"cba1d1b6-5"},on:{click:function(t){e.radioRechargeListener(20)}}},[e._v("20元")])])]),a("view",{staticClass:"recharge-input-box"},[a("view",{staticClass:"rib-tit"},[e._v("充值金额")]),a("view",{staticClass:"rib-input"},[a("text",{staticClass:"mark-hint"},[e._v("¥")]),a("input",{staticClass:"input",attrs:{placeholder:"请输入金额",type:"number",eventid:"cba1d1b6-6"},on:{input:e.inputMoneyListener}})])]),a("view",{staticClass:"btn-recharge",attrs:{eventid:"cba1d1b6-7"},on:{click:e.toRechargeListener}},[e._v("立即充值")])]):e._e(),a("LoadingView",{attrs:{img:e.imgBaseUrl+"/loading.gif",mpcomid:"cba1d1b6-0"}}),a("ToastView",{attrs:{mpcomid:"cba1d1b6-1"}})],1)},n=[];a.d(t,"a",function(){return i}),a.d(t,"b",function(){return n})},e181:function(e,t,a){"use strict";(function(e){Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var a={data:function(){return{user:"",currMoney:0,rechargeMoney:0,imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(e){var t=this;t.wxb.printLog("=============onLoad================"),t.wxb.addPage(this),t.wxb.Init(e,function(e){t.getUserInfo()})},onUnload:function(){this.wxb.printLog("=============onUnload================"),this.wxb.removePage()},methods:{getUserInfo:function(e){var t=this;t.wxb.Post("/shop/api.user/index",{},function(e){t.$data.user=e})},radioRechargeListener:function(e){this.$data.currMoney=e,this.$data.rechargeMoney=e},inputMoneyListener:function(e){console.log(e);var t=e.detail.value;this.$data.rechargeMoney=t},toRechargeListener:function(t){var a=this;0!=a.$data.rechargeMoney?a.wxb.Post("/shop/api.user/recharge",{money:a.$data.rechargeMoney},function(t){if("h5"==a.wxb.device)if("weixin"==a.$data.pay_type)console.log("h5端支付跳转超链接"),window.location.href=t.order_info;else{var i=window.document.createElement("div");i.innerHTML=t.order_info,window.document.body.appendChild(i),window.document.forms.alipaysubmit.submit()}else a.wxb.paymentOrder(t,function(t){e.reLaunch({url:"../index"})})}):a.$showToast({show:!0,content:"充值金额最少1元"})}}};t.default=a}).call(this,a("543d")["default"])}},[["20d9","common/runtime","common/vendor"]]]);