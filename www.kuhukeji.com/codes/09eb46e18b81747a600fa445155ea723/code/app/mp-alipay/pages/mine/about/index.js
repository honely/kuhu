(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["pages/mine/about/index"],{"3e2d":function(t,a,i){"use strict";var e=i("55c3"),s=i.n(e);s.a},"55c3":function(t,a,i){},"749d":function(t,a,i){"use strict";var e=function(){var t=this,a=t.$createElement,i=t._self._c||a;return i("view",{staticClass:"about-box",attrs:{_hid:0}},[i("view",{staticClass:"ab-logo",attrs:{_hid:1}},[t._ri(!!t.data.banner,2)?i("image",{attrs:{src:t.data.banner?t.data.banner:"",mode:"aspectFill",_hid:2,_batrs:"src"}}):t._e()]),i("view",{staticClass:"ab-intro",attrs:{_hid:3}},[i("rich-view",{attrs:{iDatas:t.data.introduce,_hid:4,_batrs:"iDatas",_cid:0}})],1),i("view",{staticClass:"item-about",attrs:{_hid:1006}},[t._v("公司："+t._s(t.data.company_name),1007)]),i("view",{staticClass:"item-about",attrs:{_hid:1008}},[t._v("电话："+t._s(t.data.tel),1009)]),i("view",{staticClass:"item-about",attrs:{_hid:1010}},[t._v("手机号："+t._s(t.data.mobile),1011)]),i("view",{staticClass:"item-about",attrs:{_hid:1012}},[t._v("邮箱："+t._s(t.data.email),1013)]),i("view",{staticClass:"item-about",attrs:{_hid:1014}},[t._v("地址："+t._s(t.data.address),1015)]),i("view",{staticClass:"qrcode-cont",attrs:{_hid:1016}},[i("image",{staticClass:"qr-img",attrs:{src:t.data.qrcode,_hid:1017,_batrs:"src"}}),i("view",{staticClass:"qr-hint",attrs:{_hid:1018}},[])])])},s=[];i.d(a,"a",function(){return e}),i.d(a,"b",function(){return s})},7968:function(t,a,i){"use strict";i.r(a);var e=i("749d"),s=i("9298");for(var n in s)"default"!==n&&function(t){i.d(a,t,function(){return s[t]})}(n);i("3e2d");var r=i("2877"),d=Object(r["a"])(s["default"],e["a"],e["b"],!1,null,null,null);a["default"]=d.exports},9298:function(t,a,i){"use strict";i.r(a);var e=i("b068"),s=i.n(e);for(var n in e)"default"!==n&&function(t){i.d(a,t,function(){return e[t]})}(n);a["default"]=s.a},b068:function(t,a,i){"use strict";(function(t){Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var i={data:function(){return{userid:0,data:""}},onLoad:function(a){var i=this,e=t.getStorageSync("user_id");void 0!=e&&""!=e&&(i.$data.userid=e),void 0!=a.pid&&""!=a.pid&&t.setStorageSync("pid",a.pid),i.wxb.addPage(this),i.wxb.Init(a,function(t){i.getAboutInfo()})},onUnload:function(){this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:""==t.$data.companyName?"O2O电商小程序":t.$data.companyName,path:"/pages/index/index?pid="+t.$data.userid}},methods:{getAboutInfo:function(t){var a=this;a.wxb.Post("/shop/api.user/getabout",{},function(t){a.$data.data=t})}}};a.default=i}).call(this,i("c11b")["default"])},d9c0:function(t,a,i){"use strict";i("2346");var e=n(i("7968")),s=n(i("3a53"));function n(t){return t&&t.__esModule?t:{default:t}}e.default.mpType="page";var r=new s.default(e.default);r.$mount()}},[["d9c0","common/runtime","common/vendor"]]]);