(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/promoters/index"],{"1c11":function(t,a,s){"use strict";s.r(a);var i=s("4622"),e=s("5c87");for(var r in e)"default"!==r&&function(t){s.d(a,t,function(){return e[t]})}(r);s("6c58");var n=s("2877"),c=Object(n["a"])(e["default"],i["a"],i["b"],!1,null,null,null);a["default"]=c.exports},3048:function(t,a,s){"use strict";(function(t){Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var s={data:function(){return{userid:0,ratio:1,rate:0,data:{},imgBaseUrl:"",company_name:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(a){var s=this,i=t.getStorageSync("user_id");void 0!=i&&""!=i&&(s.$data.userid=i),void 0!=a.pid&&""!=a.pid&&t.setStorageSync("pid",a.pid),s.wxb.addPage(this),s.wxb.Init(a,function(t){s.$data.company_name=t.info.company_name,s.getPromotersInfo()})},onShareAppMessage:function(){return{title:"推广中心",path:"/pages/promoters/index?pid="+that.$data.userid}},onUnload:function(){this.wxb.removePage()},onReady:function(){var a=this;t.getSystemInfo({success:function(t){console.log(t),a.$data.ratio=750/t.windowWidth,a.initRateInfo()}})},methods:{getPromotersInfo:function(t){var a=this;a.wxb.Post("/shop/api.Agent/index",{},function(t){a.$data.data=t,a.$data.rate=10*(t.agent_rate-0),a.initRateInfo()})},initRateInfo:function(){var a=42,s="#FFAE19",i=t.createCanvasContext("rateCanvas");i.setLineWidth(6),i.setStrokeStyle("#d2d2d2"),i.setLineCap("round"),i.beginPath(),i.arc(a,a,a-4,0,2*Math.PI,!1),i.stroke(),i.setLineWidth(6),i.setStrokeStyle(s),i.setLineCap("round"),i.beginPath();var e=0==this.$data.rate?.7:.7+1.6*this.$data.rate/1e3;console.log(e),console.log(e.toFixed(1)*Math.PI),i.arc(a,a,a-4,.7*Math.PI,e.toFixed(1)*Math.PI,!1),i.stroke(),i.draw()}}};a.default=s}).call(this,s("5486")["default"])},4622:function(t,a,s){"use strict";var i=function(){var t=this,a=t.$createElement,s=t._self._c||a;return s("view",{staticClass:"promoters-box",attrs:{_hid:0}},[s("view",{staticClass:"base-promoters",attrs:{_hid:1}},[s("view",{staticClass:"p-info",attrs:{_hid:2}},[s("image",{staticClass:"u-lt",attrs:{src:t.data.face?t.data.face:t.imgBaseUrl+"/mine/img_my_head@3x.png",_hid:3,_batrs:"src"}}),s("view",{staticClass:"u-mid",attrs:{_hid:4}},[s("view",{staticClass:"name",attrs:{_hid:5}},[t._v(t._s(t.data.nickname?t.data.nickname:"用户昵称"),6)]),s("navigator",{staticClass:"grade",attrs:{_hid:7}},[s("image",{staticClass:"g-icon",attrs:{mode:"aspectFill",src:t.imgBaseUrl+"/mine/icon_promoters01@2x.png",_hid:8,_batrs:"src"}}),s("text",{staticClass:"g-name",attrs:{_hid:9}},[t._v(t._s(t.data.agent_group_mean?t.data.agent_group_mean:"普通顾问"),10)]),s("text",{staticClass:"iconfont icon-btn_arrowr",staticStyle:{"margin-left":"8px",color:"#FFAE19","font-size":"12px"},attrs:{_hid:11}})]),s("view",{staticStyle:{color:"#fff",opacity:"0.6","font-size":"14px","margin-top":"2px"},attrs:{_hid:12}},[t._v(t._s(t.company_name),13)])],1),s("view",{staticClass:"u-rt",attrs:{_hid:14}},[s("canvas",{staticClass:"cir",staticStyle:{width:"84px",height:"64px"},attrs:{"canvas-id":"rateCanvas",_hid:15}}),s("navigator",{staticClass:"extract-cont",attrs:{url:"extract",_hid:16}},[s("view",{staticClass:"e-num",staticStyle:{color:"#FFAE19"},attrs:{_hid:17}},[t._v(t._s(t.data.agent_rate)+"%",18)]),s("view",{staticClass:"e-hint",attrs:{_hid:19}},[])])],1)]),s("view",{staticClass:"rank-info",attrs:{_hid:21}},[s("navigator",{staticClass:"r-lt",attrs:{url:"rank",_hid:22}},[s("image",{staticClass:"r-icon",attrs:{src:t.imgBaseUrl+"/mine/icon_paiming@2x.png",_hid:23,_batrs:"src"}}),s("text",{staticClass:"r-num",attrs:{_hid:24}},[t._v("第"+t._s(t.data.rank?t.data.rank:"1")+"名",25)]),s("text",{staticClass:"r-arrow iconfont icon-btn_arrowr",staticStyle:{color:"#888888"},attrs:{_hid:26}})]),s("view",{staticClass:"r-rt",attrs:{_hid:27}},[s("navigator",{attrs:{url:"promoCode",_hid:28}},[s("text",{attrs:{_hid:29}},[])])],1)],1)]),s("view",{staticClass:"score-info",attrs:{_hid:31}},[s("view",{staticClass:"s-header",attrs:{_hid:32}},[s("view",{staticClass:"h-tit",attrs:{_hid:33}},[s("image",{staticClass:"icon-award",attrs:{src:t.imgBaseUrl+"/mine/icon_award@2x.png",_hid:34,_batrs:"src"}}),s("text",{attrs:{_hid:35}},[])]),s("navigator",{attrs:{url:"score",_hid:37}},[s("view",{staticClass:"h-detail",attrs:{_hid:38}},[s("text",{attrs:{_hid:39}},[]),s("image",{staticClass:"arrow",attrs:{src:t.imgBaseUrl+"/mine/btn_arrowr_gray@2x.png",_hid:41,_batrs:"src"}})])])],1),s("view",{staticClass:"s-cont",attrs:{_hid:42}},[s("view",{staticClass:"item-score",attrs:{_hid:43}},[s("view",{staticClass:"s-num",attrs:{_hid:44}},[t._v(t._s(t.data.allAgentMoney?t.data.allAgentMoney:"0"),45)]),s("view",{staticClass:"s-hint",attrs:{_hid:46}},[])]),s("view",{staticClass:"item-score",attrs:{_hid:48}},[s("view",{staticClass:"s-num",attrs:{_hid:49}},[t._v(t._s(t.data.yesterday_register?t.data.yesterday_register:"0"),50)]),s("view",{staticClass:"s-hint",attrs:{_hid:51}},[])]),s("view",{staticClass:"item-score",attrs:{_hid:53}},[s("view",{staticClass:"s-num",attrs:{_hid:54}},[t._v(t._s(t.data.history_agent_money?t.data.history_agent_money:"0"),55)]),s("view",{staticClass:"s-hint",attrs:{_hid:56}},[])])]),s("view",{staticClass:"s-money",attrs:{_hid:58}},[s("view",{staticClass:"wd-num",attrs:{_hid:59}},[s("text",{attrs:{_hid:60}},[]),s("text",{staticStyle:{color:"#000","font-size":"24px"},attrs:{_hid:62}},[t._v("¥"+t._s(t.data.agent_money?t.data.agent_money:"0.00"),63)])]),s("navigator",{staticClass:"btn-wd",attrs:{url:"withdraw",_hid:64}},[])],1)]),s("view",{staticClass:"count-cont",attrs:{_hid:66}},[s("view",{staticClass:"item-count",attrs:{_hid:67}},[s("view",{staticClass:"cc-num",attrs:{_hid:68}},[t._v(t._s(t.data.agent_num?t.data.agent_num:"0"),69)]),s("view",{staticClass:"cc-hint",attrs:{_hid:70}},[])]),s("view",{staticClass:"item-count",attrs:{_hid:72}},[s("view",{staticClass:"cc-num",attrs:{_hid:73}},[t._v(t._s(t.data.agent_register?t.data.agent_register:"0"),74)]),s("view",{staticClass:"cc-hint",attrs:{_hid:75}},[])]),s("view",{staticClass:"item-count",staticStyle:{"border-right-width":"0"},attrs:{_hid:77}},[s("view",{staticClass:"cc-num",attrs:{_hid:78}},[t._v(t._s(t.data.agent_order?t.data.agent_order:"0"),79)]),s("view",{staticClass:"cc-hint",attrs:{_hid:80}},[])])]),s("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",_hid:82,_batrs:"img",_cid:0}}),s("ToastView",{attrs:{_hid:1084,_cid:1}})],1)},e=[];s.d(a,"a",function(){return i}),s.d(a,"b",function(){return e})},"4d74":function(t,a,s){"use strict";s("2346");var i=r(s("1c11")),e=r(s("3a53"));function r(t){return t&&t.__esModule?t:{default:t}}i.default.mpType="page";var n=new e.default(i.default);n.$mount()},"5c87":function(t,a,s){"use strict";s.r(a);var i=s("3048"),e=s.n(i);for(var r in i)"default"!==r&&function(t){s.d(a,t,function(){return i[t]})}(r);a["default"]=e.a},"6c58":function(t,a,s){"use strict";var i=s("ac5e"),e=s.n(i);e.a},ac5e:function(t,a,s){}},[["4d74","common/runtime","common/vendor"]]]);