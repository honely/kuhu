(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/plugin/list"],{"01d0":function(t,e,a){"use strict";var i=a("92ce"),n=a.n(i);n.a},"6aaf":function(t,e,a){"use strict";a("6346");var i=s(a("80b2")),n=s(a("3a53"));function s(t){return t&&t.__esModule?t:{default:t}}i.default.mpType="page";var r=new n.default(i.default);r.$mount()},"6ec6":function(t,e,a){"use strict";a.r(e);var i=a("fc1a"),n=a.n(i);for(var s in i)"default"!==s&&function(t){a.d(e,t,function(){return i[t]})}(s);e["default"]=n.a},"80b2":function(t,e,a){"use strict";a.r(e);var i=a("a3c5"),n=a("6ec6");for(var s in n)"default"!==s&&function(t){a.d(e,t,function(){return n[t]})}(s);a("01d0");var r=a("2877"),u=Object(r["a"])(n["default"],i["a"],i["b"],!1,null,null,null);e["default"]=u.exports},"92ce":function(t,e,a){},a3c5:function(t,e,a){"use strict";var i=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("view",{staticClass:"plugin-box",attrs:{_hid:0}},t._l(t.list,function(e,i,n){var s=void 0!==n?n:i;return a("view",{key:i,staticClass:"item-plugin",attrs:{_hid:1,_fid:s,_fk:"index"}},[a("view",{staticClass:"p-cont",attrs:{_hid:2,_fid:s}},[a("image",{staticClass:"p-img",attrs:{src:e.photo,_hid:3,_fid:s,_batrs:"src"}}),a("view",{staticClass:"p-desc",attrs:{_hid:4,_fid:s}},[a("view",{staticClass:"pd-name ellipsis-01",attrs:{_hid:5,_fid:s}},[t._v(t._s(e.page_name),6,s)]),a("view",{staticClass:"pd-preview",attrs:{_hid:7,_fid:s},on:{click:function(a){t.linkListener("index?page_id="+e.page_id)}}},[])])])])},1,t._self))},n=[];a.d(e,"a",function(){return i}),a.d(e,"b",function(){return n})},fc1a:function(t,e,a){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i=n(a("9751"));function n(t){return t&&t.__esModule?t:{default:t}}var s={extends:i.default,data:function(){return{list:[],page:1,more:0}},methods:{_Init:function(t){that.getTemplateList()},getTemplateList:function(){var e=this,a=e.$data.page,i=e.$data.list;a>1&&(a=1,i=[]),e.$request.post("/website/api.page/getList",{token:t.getStorageSync("token"),page:e.$data.page}).then(function(t){var a=t.data.list;for(var n in a)i.push(a[n]);e.$data.list=i,e.$data.more=data.more,e.$data.page+=1})},linkListener:function(t){this.config.onLinkListener(t)}}};e.default=s}).call(this,a("5486")["default"])}},[["6aaf","common/runtime","common/vendor"]]]);