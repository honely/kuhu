(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/index/pintuan/open"],{5648:function(t,e,s){"use strict";var i=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("view",{staticClass:"open-main"},[t.detail?s("view",[s("view",{staticClass:"address-info"},[""==t.model?s("view",{staticClass:"no-addr",attrs:{eventid:"3e48b357-0"},on:{click:t.showAddressListListener}},[s("view",{staticClass:"na-lt"},[t._v("选择收货地址")]),s("text",{staticClass:"iconfont icon-btn_arrowr"})]):t._e(),""!=t.model?s("view",{staticClass:"show-addr",attrs:{eventid:"3e48b357-1"},on:{click:t.showAddressListListener}},[s("view",{staticClass:"addr-lt"},[s("view",{staticClass:"name"},[s("text",[t._v(t._s(t.model.name))]),s("text",[t._v(t._s(t.model.mobile))])]),s("view",{staticClass:"desc ellipsis-01"},[t._v(t._s(t.model.address))])]),s("text",{staticClass:"iconfont icon-btn_arrowr"})]):t._e()]),s("view",{staticClass:"member-info"},[t._m(0),s("view",{staticClass:"m-cont"},[s("view",{staticClass:"item-member"},[s("image",{attrs:{src:t.detail.this_user_face}}),s("view",{staticClass:"m-state"},[t._v("待支付")])]),t._m(1)])]),s("view",{staticClass:"goods-info"},[s("view",{staticClass:"g-lt"},[s("view",{staticClass:"group-num"},[t._v("4人团")]),s("image",{staticStyle:{width:"100%",height:"100%"},attrs:{src:t.detail.goods_info.goods_photo}})]),s("view",{staticClass:"g-rt"},[s("view",{staticClass:"gname ellipsis-01"},[t._v(t._s(t.detail.goods_info.goods_name))]),s("view",{staticClass:"gsku"},[t._v(t._s(t.detail.goods_info.key_name))]),s("view",{staticClass:"gdesc"},[s("view",{staticClass:"price"},[s("text",[t._v("¥")]),s("text",{staticStyle:{"margin-left":"4px","font-size":"20px"}},[t._v(t._s(t.detail.goods_info.groupbuy_price))])]),t._m(2)])])]),s("view",{staticClass:"order-info"},[s("view",{staticClass:"item-order"},[s("view",{staticClass:"o-lt"},[t._v("商品总额")]),s("view",{staticClass:"o-rt"},[t._v("¥"+t._s(t.detail._tital_price))])]),s("view",{staticClass:"item-order",staticStyle:{"border-bottom-width":"0"}},[s("view",{staticClass:"o-lt"},[t._v("配送费")]),s("view",{staticClass:"o-rt"},[s("text",[t._v("¥"+t._s(t.detail._shipping_price))])])])]),s("view",{staticClass:"order-info"},[s("view",{staticClass:"item-order",staticStyle:{"border-bottom-width":"0"}},[s("view",{staticClass:"o-lt"},[t._v("是否使用余额支付")]),s("view",{staticClass:"o-rt"},[s("text",{staticClass:"iconfont icon-radio",class:1==t.use_money?"icon-selector_enable1 ":"icon-selector_disable1 ",style:"color:"+(1==t.use_money?"#ED3005":"#999999")+";",attrs:{eventid:"3e48b357-2"},on:{click:t.onUseMoneyListener}})])])]),s("view",{staticStyle:{width:"100%",height:"78px"}}),s("view",{staticClass:"bottom-info"},[s("view",{staticClass:"b-price"},[s("text",[t._v("¥")]),s("text",{staticStyle:{"font-size":"24px","margin-left":"4px"}},[t._v(t._s(t.detail._tital_price))])]),s("view",{staticClass:"b-num",attrs:{eventid:"3e48b357-3"},on:{click:t.showPaymentDialog}},[t._v("结算(1)")])])]):t._e(),t.showAddressFlag?s("view",{staticClass:"mask"},[s("view",{staticClass:"dialog-address"},[s("view",{staticClass:"d-header"},[s("text",{staticStyle:{flex:"1"}},[t._v("选择收货地址")]),s("text",{staticClass:"iconfont icon-btn_close_black",staticStyle:{"padding-left":"15px"},attrs:{eventid:"3e48b357-4"},on:{click:t.hideAddressListListener}})]),s("addressView",{attrs:{list:t.list,eventid:"3e48b357-5",mpcomid:"3e48b357-0"},on:{selectEvent:t.selectAddrListener,deleteEvent:t.deleteCallBack}})],1)]):t._e(),t.paymentFlag?s("view",{staticClass:"mask"},[s("view",{staticClass:"dialog-detailed"},[s("view",{staticClass:"dd-header"},[s("text",{staticClass:"h-tit"},[t._v("选择支付方式")]),s("text",{staticClass:"h-close iconfont icon-btn_close_black",attrs:{eventid:"3e48b357-6"},on:{click:t.hidePaymentDialog}})]),s("view",{staticClass:"dd-payment"},[s("view",{staticClass:"item-payment",attrs:{"data-type":"weixin",eventid:"3e48b357-7"},on:{click:t.paymentListener}},[t._m(3),s("text",{staticClass:"p-radio iconfont",class:"weixin"==t.pay_type?" icon-selector_enable":"icon-selector_disable",style:"color:"+("weixin"==t.pay_type?"#3A96E6":"#EDEDED")})]),s("view",{staticClass:"item-payment",attrs:{"data-type":"ali",eventid:"3e48b357-8"},on:{click:t.paymentListener}},[t._m(4),s("text",{staticClass:"p-radio iconfont",class:"ali"==t.pay_type?" icon-selector_enable":"icon-selector_disable",style:"color:"+("ali"==t.pay_type?"#3A96E6":"#EDEDED")})])])])]):t._e()])},a=[function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("view",{staticClass:"m-header"},[s("text",{staticClass:"iconfont icon-icon_pintuan",staticStyle:{color:"#ED3005","font-size":"20px"}}),s("text",{staticStyle:{color:"#ED3005","margin-left":"8px"}},[t._v("[正在开团]]")]),s("text",{staticStyle:{"margin-left":"8px"}},[t._v("只差1人的团，完成支付即可拼购成功")])])},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("view",{staticClass:"item-member"},[s("image")])},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("view",{staticClass:"number"},[s("text",[t._v("x1")])])},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("view",{staticClass:"p-lt"},[s("text",{staticClass:"iconfont icon-icon_pay_wepay",staticStyle:{"font-size":"30px",color:"#41B035"}}),s("text",{staticStyle:{color:"#333333","font-size":"16px","margin-left":"15px"}},[t._v("微信支付")])])},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("view",{staticClass:"p-lt"},[s("text",{staticClass:"iconfont icon-icon_pay_alipay",staticStyle:{"font-size":"30px",color:"#00AAEE"}}),s("text",{staticStyle:{color:"#333333","font-size":"16px","margin-left":"15px"}},[t._v("支付宝支付")])])}];s.d(e,"a",function(){return i}),s.d(e,"b",function(){return a})},"59c3":function(t,e,s){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i=a(s("0eb2"));function a(t){return t&&t.__esModule?t:{default:t}}var o={components:{addressView:i.default},data:function(){return{userid:0,model:"",showAddressFlag:!1,groupbuy_id:"",spec_key:"",address_id:"",item_id:"",skuMsg:"",use_money:0,detail:"",paymentFlag:!1,pay_type:"",list:[]}},onLoad:function(e){var s=this,i=t.getStorageSync("user_id");void 0!=i&&""!=i&&(s.$data.userid=i),void 0!=e.pid&&""!=e.pid&&t.setStorageSync("pid",e.pid),s.wxb.printLog("=============onLoad================"),s.wxb.addPage(this),s.wxb.Init(e,function(t){console.log(e);var i=e.groupbuy_id,a=e.goodsNum,o=e.spec_key;s.$data.groupbuy_id=i,s.$data.goodsNum=a,s.$data.spec_key=o,s.getDefaultAddress(),s.getAddressList()})},onUnload:function(){this.wxb.printLog("=============onUnload================"),this.wxb.removePage()},methods:{deleteCallBack:function(t){this.getAddressList()},getAddressList:function(t){var e=this;e.wxb.Post("/shop/api.address/getIndex",{},function(t){e.$data.list=t.list;var s=e.$data.model;for(var i in t.list)if(t.list[i].address_id==s.address_id)return;e.$data.model="",e.getDefaultAddress()})},onUseMoneyListener:function(){0==this.$data.use_money?this.$data.use_money=1:this.$data.use_money=0},paymentListener:function(t){var e=t.currentTarget.dataset.type;void 0!=e&&(this.$data.pay_type=e,this.settlementListener()),this.hidePaymentDialog()},showPaymentDialog:function(t){"h5"==this.wxb.device?this.$data.paymentFlag=!0:this.settlementListener()},hidePaymentDialog:function(t){this.$data.paymentFlag=!1},settlementListener:function(e){var s=this;s.wxb.Post("/shop/api.groupbuy/GroupBuyOrder",{groupbuy_id:s.$data.groupbuy_id,spec_key:s.$data.spec_key,address_id:s.$data.address_id,item_id:s.$data.item_id,use_money:s.$data.use_money,pay_type:"h5"==s.wxb.device?s.$data.pay_type:""},function(e){if(0==e.is_pay)t.redirectTo({url:"assemble?item_id="+e.item_id});else if("h5"==s.wxb.device)if(console.log("h5端支付跳转超链接"),"weixin"==s.$data.pay_type)console.log("h5端支付跳转超链接"),window.location.href=e.order_info;else{var i=window.document.createElement("div");i.innerHTML=e.order_info,window.document.body.appendChild(i),window.document.forms.alipaysubmit.submit()}else s.wxb.paymentOrder(e,function(s){var i=e.order_id;t.redirectTo({url:"../../mine/order/detail?order_id="+i})})})},selectAddrListener:function(t){this.$data.list;this.$data.model=JSON.parse(t),console.log(this.$data.model),this.getCheckGroupBuyPrice(),this.hideAddressListListener()},showAddressListListener:function(){this.$data.showAddressFlag=!0},hideAddressListListener:function(){this.$data.showAddressFlag=!1,""!=this.$data.model&&this.getDefaultAddress(),this.getAddressList()},getDefaultAddress:function(){var t=this;t.wxb.Post("/shop/api.address/getDefault",{},function(e){void 0!=e&&(t.$data.model=e,t.$data.address_id=e.address_id),t.getCheckGroupBuyPrice()})},getCheckGroupBuyPrice:function(){var t=this;t.wxb.Post("/shop/api.groupbuy/getGroupBuyPrice",{groupbuy_id:t.$data.groupbuy_id,spec_key:t.$data.spec_key,address_id:t.$data.address_id,item_id:""},function(e){t.$data.detail=e})}}};e.default=o}).call(this,s("543d")["default"])},a496:function(t,e,s){},aabc:function(t,e,s){"use strict";var i=s("a496"),a=s.n(i);a.a},bdf5:function(t,e,s){"use strict";s("2346");var i=o(s("b0ce")),a=o(s("e491"));function o(t){return t&&t.__esModule?t:{default:t}}Page((0,i.default)(a.default))},e382:function(t,e,s){"use strict";s.r(e);var i=s("59c3"),a=s.n(i);for(var o in i)"default"!==o&&function(t){s.d(e,t,function(){return i[t]})}(o);e["default"]=a.a},e491:function(t,e,s){"use strict";s.r(e);var i=s("5648"),a=s("e382");for(var o in a)"default"!==o&&function(t){s.d(e,t,function(){return a[t]})}(o);s("aabc");var n=s("2877"),d=Object(n["a"])(a["default"],i["a"],i["b"],!1,null,null,null);e["default"]=d.exports}},[["bdf5","common/runtime","common/vendor"]]]);