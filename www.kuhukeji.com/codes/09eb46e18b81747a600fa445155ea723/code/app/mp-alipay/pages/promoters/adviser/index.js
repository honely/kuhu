(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["pages/promoters/adviser/index"],{"3c12":function(t,s,a){"use strict";var i=a("87fa"),e=a.n(i);e.a},"87fa":function(t,s,a){},"97e7":function(t,s,a){"use strict";a("2346");var i=r(a("f72f")),e=r(a("3a53"));function r(t){return t&&t.__esModule?t:{default:t}}i.default.mpType="page";var _=new e.default(i.default);_.$mount()},b230:function(t,s,a){"use strict";a.r(s);var i=a("e7f3"),e=a.n(i);for(var r in i)"default"!==r&&function(t){a.d(s,t,function(){return i[t]})}(r);s["default"]=e.a},d6e4:function(t,s,a){"use strict";var i=function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("view",{staticClass:"adviser-box",attrs:{_hid:0}},[a("view",{staticClass:"adb-card",attrs:{_hid:1}},[a("view",{staticClass:"u-info",attrs:{_hid:2}},[a("image",{staticClass:"u-face",attrs:{src:t.data.face?t.data.face:t.imgBaseUrl+"/mine/img_my_head@3x.png",_hid:3,_batrs:"src"}}),a("view",{staticClass:"u-desc",attrs:{_hid:4}},[a("image",{staticClass:"g-icon",attrs:{mode:"aspectFill",src:t.imgBaseUrl+"/mine/icon_promoters01@2x.png",_hid:5,_batrs:"src"}}),a("text",{staticClass:"g-name",attrs:{_hid:6}},[t._v(t._s(t.data.agent_group_mean),7)])])]),t._m(0)]),a("view",{staticClass:"adb-data",attrs:{_hid:22}},[a("view",{staticClass:"item-data",attrs:{_hid:23}},[a("text",{staticClass:"id-name",attrs:{_hid:24}},[]),a("view",{staticClass:"id-desc",attrs:{_hid:26}},[a("view",{staticClass:"num",attrs:{_hid:27}},[t._v(t._s(t.data.now_rate)+"%",28)]),a("view",{staticClass:"hint",attrs:{_hid:29}},[])])]),a("view",{staticClass:"item-data",attrs:{_hid:31}},[a("text",{staticClass:"id-name",attrs:{_hid:32}},[]),a("view",{staticClass:"id-desc",attrs:{_hid:34}},[a("view",{staticClass:"num",attrs:{_hid:35}},[t._v(t._s(t.data.now_vip_rate)+" 元",36)]),a("view",{staticClass:"hint",attrs:{_hid:37}},[])])]),a("view",{staticClass:"item-data",staticStyle:{"border-bottom-width":"0"},attrs:{_hid:39}},[a("text",{staticClass:"id-name",attrs:{_hid:40}},[]),a("view",{staticClass:"id-desc",attrs:{_hid:42}},[a("view",{staticClass:"num",attrs:{_hid:43}},[t._v(t._s(t.data.now_child_rate)+"%",44)]),a("view",{staticClass:"hint",attrs:{_hid:45}},[])])]),a("view",{staticClass:"item-data",staticStyle:{"border-bottom-width":"0"},attrs:{_hid:47}},[a("text",{staticClass:"id-name",attrs:{_hid:48}},[]),a("view",{staticClass:"id-desc",attrs:{_hid:50}},[a("view",{staticClass:"num",attrs:{_hid:51}},[t._v(t._s(t.data.now_child_vip_rate)+" 元",52)]),a("view",{staticClass:"hint",attrs:{_hid:53}},[])])])]),t._ri(!!(t.data.agent_group<3),55)?a("view",{staticClass:"upgrade-info",attrs:{_hid:55}},[a("view",{staticClass:"ui-header",attrs:{_hid:56}},[]),a("view",{staticClass:"ui-cont",attrs:{_hid:58}},[t._ri(!!(t.data.next_level_num>0),59)?a("view",{staticClass:"item-upgrade",attrs:{_hid:59}},[a("text",{staticClass:"u-tag",attrs:{_hid:60}},[t._v(t._s(t.data.next_level_surplus_num?"未达标":"已达标"),61)]),a("view",{staticClass:"u-desc",attrs:{_hid:62}},[t._v("推广代理人数达 "+t._s(t.data.next_level_num)+" 人",63),a("text",{attrs:{_hid:64}},[a("text",{staticStyle:{color:"#FFAE19",margin:"0 4px"},attrs:{_hid:66}},[t._v(t._s(t.data.next_level_surplus_num),67)])])])]):t._e(),t._ri(!!(t.data.next_level_register>0),69)?a("view",{staticClass:"item-upgrade",attrs:{_hid:69}},[a("text",{staticClass:"u-tag",attrs:{_hid:70}},[t._v(t._s(t.data.next_level_surplus_register_num?"未达标":"已达标"),71)]),a("view",{staticClass:"u-desc",attrs:{_hid:72}},[t._v("推广注册人数"+t._s(t.data.next_level_register)+"人（还差",73),a("text",{staticStyle:{color:"#FFAE19",margin:"0 4px"},attrs:{_hid:74}},[t._v(t._s(t.data.next_level_surplus_register_num),75)])])]):t._e(),t._ri(!!(t.data.next_level_order>0),77)?a("view",{staticClass:"item-upgrade",attrs:{_hid:77}},[a("text",{staticClass:"u-tag",attrs:{_hid:78}},[t._v(t._s(t.data.next_level_surplus_order_num?"未达标":"已达标"),79)]),a("view",{staticClass:"u-desc",attrs:{_hid:80}},[t._v("推广订单数达 "+t._s(t.data.next_level_order)+" 笔（还差",81),a("text",{staticStyle:{color:"#FFAE19",margin:"0 4px"},attrs:{_hid:82}},[t._v(t._s(t.data.next_level_surplus_order_num),83)])])]):t._e(),t._ri(!!(t.data.next_level_vip>0),85)?a("view",{staticClass:"item-upgrade",attrs:{_hid:85}},[a("text",{staticClass:"u-tag",attrs:{_hid:86}},[t._v(t._s(t.data.next_level_vip_order_num?"未达标":"已达标"),87)]),a("view",{staticClass:"u-desc",attrs:{_hid:88}},[t._v("推广VIP人数"+t._s(t.data.next_level_vip)+"人（还差",89),a("text",{staticStyle:{color:"#FFAE19",margin:"0 4px"},attrs:{_hid:90}},[t._v(t._s(t.data.next_level_vip_order_num),91)])])]):t._e()])]):t._e(),a("view",{staticClass:"grade-rule",attrs:{_hid:93}},[a("view",{staticClass:"g-header",attrs:{_hid:94}},[]),a("view",{staticClass:"g-cont",attrs:{_hid:96}},[a("view",{staticClass:"item-rule",attrs:{_hid:97}},[t._m(1),a("view",{staticClass:"ir-cont",attrs:{_hid:101}},[a("view",{staticClass:"irc-tit",attrs:{_hid:102}},[]),t._l(t.data.ptgw_rule,function(s,i,e){var r=void 0!==e?e:i;return a("view",{staticClass:"irc-desc",staticStyle:{height:"15px"},attrs:{_hid:104,_fid:r}},[a("text",{attrs:{_hid:105,_fid:r}},[t._v(t._s(s),106,r)])])},104,t._self)],1),a("view",{staticClass:"ir-cont",attrs:{_hid:107}},[a("view",{staticClass:"irc-tit",attrs:{_hid:108}},[]),a("view",{staticClass:"irc-desc",attrs:{_hid:110}},[t._v(t._s(t.data.ptgw_perm),111)])])]),a("view",{staticClass:"item-rule",attrs:{_hid:112}},[t._m(2),a("view",{staticClass:"ir-cont",attrs:{_hid:116}},[a("view",{staticClass:"irc-tit",attrs:{_hid:117}},[]),t._l(t.data.zsgw_rule,function(s,i,e){var r=void 0!==e?e:i;return a("view",{staticClass:"irc-desc",staticStyle:{height:"15px"},attrs:{_hid:119,_fid:r}},[a("text",{attrs:{_hid:120,_fid:r}},[t._v(t._s(s),121,r)])])},119,t._self)],1),a("view",{staticClass:"ir-cont",attrs:{_hid:122}},[a("view",{staticClass:"irc-tit",attrs:{_hid:123}},[]),a("view",{staticClass:"irc-desc",attrs:{_hid:125}},[t._v(t._s(t.data.zsgw_perm),126)])])]),a("view",{staticClass:"item-rule",attrs:{_hid:127}},[t._m(3),a("view",{staticClass:"ir-cont",attrs:{_hid:131}},[a("view",{staticClass:"irc-tit",attrs:{_hid:132}},[]),t._l(t.data.zjgw_rule,function(s,i,e){var r=void 0!==e?e:i;return a("view",{staticClass:"irc-desc",staticStyle:{height:"15px"},attrs:{_hid:134,_fid:r}},[a("text",{attrs:{_hid:135,_fid:r}},[t._v(t._s(s),136,r)])])},134,t._self)],1),a("view",{staticClass:"ir-cont",attrs:{_hid:137}},[a("view",{staticClass:"irc-tit",attrs:{_hid:138}},[]),a("view",{staticClass:"irc-desc",attrs:{_hid:140}},[t._v(t._s(t.data.zjgw_perm),141)])])])])]),a("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",_hid:142,_batrs:"img",_cid:0}}),a("ToastView",{attrs:{_hid:1144,_cid:1}})],1)},e=[function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("view",{staticClass:"u-progress",attrs:{_hid:8}},[a("view",{staticClass:"up-progress",attrs:{_hid:9}},[a("view",{staticClass:"progress",attrs:{_hid:10}}),a("text",{staticClass:"b-point",attrs:{_hid:11}}),a("text",{staticClass:"point",staticStyle:{left:"4px",top:"4px"},attrs:{_hid:12}}),a("text",{staticClass:"point",staticStyle:{left:"50%",top:"4px"},attrs:{_hid:13}}),a("text",{staticClass:"point",staticStyle:{right:"-4px",top:"4px"},attrs:{_hid:14}})]),a("view",{staticClass:"up-desc",attrs:{_hid:15}},[a("view",{staticClass:"item-progress",staticStyle:{"text-align":"left"},attrs:{_hid:16}},[]),a("view",{staticClass:"item-progress",staticStyle:{"text-align":"center"},attrs:{_hid:18}},[]),a("view",{staticClass:"item-progress",staticStyle:{"text-align":"right"},attrs:{_hid:20}},[])])])},function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("view",{staticClass:"ir-tit",attrs:{_hid:98}},[a("text",{attrs:{_hid:99}},[])])},function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("view",{staticClass:"ir-tit",attrs:{_hid:113}},[a("text",{attrs:{_hid:114}},[])])},function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("view",{staticClass:"ir-tit",attrs:{_hid:128}},[a("text",{attrs:{_hid:129}},[])])}];a.d(s,"a",function(){return i}),a.d(s,"b",function(){return e})},e7f3:function(t,s,a){"use strict";Object.defineProperty(s,"__esModule",{value:!0}),s.default=void 0;var i={data:function(){return{imgBaseUrl:"",data:{}}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(t){var s=this;s.wxb.addPage(this),s.wxb.Init(t,function(t){s.getAdviserInfo()})},onUnload:function(){this.wxb.removePage()},methods:{getAdviserInfo:function(t){var s=this;s.wxb.Post("/shop/api.Agent/agentLevel",{},function(t){s.$data.data=t})}}};s.default=i},f72f:function(t,s,a){"use strict";a.r(s);var i=a("d6e4"),e=a("b230");for(var r in e)"default"!==r&&function(t){a.d(s,t,function(){return e[t]})}(r);a("3c12");var _=a("2877"),d=Object(_["a"])(e["default"],i["a"],i["b"],!1,null,null,null);s["default"]=d.exports}},[["97e7","common/runtime","common/vendor"]]]);