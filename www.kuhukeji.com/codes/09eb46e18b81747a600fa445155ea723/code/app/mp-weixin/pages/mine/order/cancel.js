(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/mine/order/cancel"],{"75e8":function(t,e,s){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var s={data:function(){return{}},onLoad:function(){this.$showDialog()},methods:{btnClickListener:function(){console.log("立即前往"),this.$showDialog(!1),t.redirectTo({url:"refund"})}}};e.default=s}).call(this,s("543d")["default"])},7699:function(t,e,s){"use strict";s.r(e);var a=s("9671"),c=s("7978");for(var i in c)"default"!==i&&function(t){s.d(e,t,function(){return c[t]})}(i);s("7f99");var n=s("2877"),l=Object(n["a"])(c["default"],a["a"],a["b"],!1,null,null,null);e["default"]=l.exports},7978:function(t,e,s){"use strict";s.r(e);var a=s("75e8"),c=s.n(a);for(var i in a)"default"!==i&&function(t){s.d(e,t,function(){return a[t]})}(i);e["default"]=c.a},"7a1c":function(t,e,s){},"7f99":function(t,e,s){"use strict";var a=s("7a1c"),c=s.n(a);c.a},9671:function(t,e,s){"use strict";var a=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("view",{staticClass:"cancel-box"},[t._m(0),t._m(1),t._m(2),s("dialog-view",{attrs:{title:"提示",message:"订单已取消，并成功发起退款，请前往订单详情页查看退款进度",btn:"前往",eventid:"6c484233-0",mpcomid:"6c484233-0"},on:{btnEvent:t.btnClickListener}})],1)},c=[function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("view",{staticClass:"cancel-cont"},[s("view",{staticClass:"cc-tit"},[t._v("退还内容")]),s("view",{staticClass:"cc-cont"},[s("view",{staticClass:"item-cont"},[s("text",{staticClass:"lt-cont"},[t._v("积分")]),s("text",{staticClass:"rt-cont"},[t._v("10积分")])]),s("view",{staticClass:"item-cont"},[s("text",{staticClass:"lt-cont"},[t._v("运费")]),s("text",{staticClass:"rt-cont"},[t._v("10元")])])])])},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("view",{staticClass:"cancel-cont"},[s("view",{staticClass:"cc-tit"},[t._v("退还方式")]),s("view",{staticClass:"cc-cont"},[s("view",{staticClass:"item-cont"},[s("text",{staticClass:"lt-cont"},[t._v("原路退回")]),s("text",{staticClass:"rt-cont"},[t._v("(1-7个工作日内退款到原支付方)")])])])])},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("view",{staticClass:"cancel-cont"},[s("view",{staticClass:"cc-tit"},[t._v("退款原因")]),s("view",{staticClass:"cc-cont"},[s("view",{staticClass:"item-reason"},[s("text",{staticClass:"r-text"},[t._v("付款一周内商家未发货")]),s("image",{staticClass:"r-radio"})]),s("view",{staticClass:"item-reason"},[s("text",{staticClass:"r-text"},[t._v("买多了/买错了")]),s("image",{staticClass:"r-radio"})]),s("view",{staticClass:"item-reason",staticStyle:{"border-bottom-width":"0"}},[s("text",{staticClass:"r-text"},[t._v("计划有变，不想买了")]),s("image",{staticClass:"r-radio"})])])])}];s.d(e,"a",function(){return a}),s.d(e,"b",function(){return c})},f6c9:function(t,e,s){"use strict";s("2346");var a=i(s("b0ce")),c=i(s("7699"));function i(t){return t&&t.__esModule?t:{default:t}}Page((0,a.default)(c.default))}},[["f6c9","common/runtime","common/vendor"]]]);