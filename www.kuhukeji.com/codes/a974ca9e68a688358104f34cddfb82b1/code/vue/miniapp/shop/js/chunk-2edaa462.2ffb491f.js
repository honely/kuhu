(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-2edaa462"],{5200:function(t,e,n){"use strict";var i=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"wyu-top"},[i("div",{staticClass:"wyu-header"},[t.title?t._e():i("div",{staticClass:"wyu-tab"},[i("ul",t._l(t.showMenu,function(e,n){return i("li",{key:n,class:n==t.select?"on":""},[i("router-link",{attrs:{to:e.link}},[t._v(t._s(e.title))])],1)}),0)]),t.title?i("div",{staticClass:"wyu-tab"},[i("ul",[i("li",[t._v(t._s(t.title))])])]):t._e(),i("div",{staticClass:"wyu-header-status"},[i("div",{staticClass:"login-info"},[i("img",{attrs:{src:n("741c")}}),i("el-dropdown",{staticStyle:{cursor:"pointer"}},[i("span",{staticClass:"el-dropdown-link"},[t._v("\n                          "+t._s(t.$store.getters.appInfo.app_name)+"  "),i("i",{staticClass:"el-icon-arrow-down el-icon--right"})]),i("el-dropdown-menu",{attrs:{slot:"dropdown"},slot:"dropdown"},[i("el-dropdown-item",[i("span",{on:{click:t.LogOut}},[t._v("退出登录")])])],1)],1)],1)])])])},a=[],s=(n("a481"),{props:["mdl","select","title"],name:"TopNav",data:function(){return{showMenu:[],menu:{sms:[{title:"发送短信",link:"/marketing/sms/send"},{title:"短信记录",link:"/marketing/sms/census"}],paymentSetting:[{title:"微信小程序支付设置",link:"/setting/payment/weixin"},{title:"支付宝小程序支付设置",link:"/setting/payment/ali"},{title:"百度小程序支付设置",link:"/setting/payment/baidu"}],employ:[{title:"员工管理",link:"/setting/employ"},{title:"角色管理",link:"/setting/employ/role"}],agent:[{title:"分销代理设置",link:"/agent/setting/index"},{title:"顾问申请设置",link:"/agent/setting/apply"}],coupon:[{title:"优惠券管理",link:"/marketing/coupon/index"},{title:"优惠券设置",link:"/marketing/coupon/setting"},{title:"赠送优惠券",link:"/marketing/coupon/send"}],sucai:[{title:"素材管理",link:"/resource/index"},{title:"素材分类 ",link:"/resource/category"}],wuliu:[{title:"运费模板",link:"/shipping/area/index/"},{title:"快递公司 ",link:"/shipping/index"}]}}},created:function(){this.menu[this.mdl]?this.showMenu=this.menu[this.mdl]:this.showMenu=[]},methods:{LogOut:function(){var t=this;this.$store.dispatch("LogOut").then(function(){t.$router.replace("/")})}}}),l=s,o=n("2877"),r=Object(o["a"])(l,i,a,!1,null,"5665e029",null);e["a"]=r.exports},"741c":function(t,e){t.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAAAXNSR0IArs4c6QAAA9VJREFUWAnNmctKJDEUQFNt2T5oH/gAH+BOFy3MR8xC8D9mM5tZzIfMTtz4H4ILP2LABnUn+ABBFBvftnNPpm9NOlaqOo12z4WQVHJv7umbR6XSifHk+Ph4/e3t7ZukDUkr0lzzVD76sZkkyYmkPUk7q6urB66DRB8Epnp0dPRLnr9LuaL1/cwFsCX+ttfW1n5K+QnfFrANtyv5134ChXwJ3L5AbgJpI0Xk/hc4oGFpj6ZJmHOtVuu3VA5kWAui2KpUKl9SAWNB9AxXrVbN1NSUGR8fN8PDw9bf8/Ozubu7Mzc3N+bpyU6lEEewHibYksPDwwMp1IOaBQ3z8/MWrkDFQl5eXhapBNtkDjaIIFtJtCwtLZmxsTHmS6Ht5OSkjezZ2VmhXl4jbAxt9D43OztrRkZGjMzdrhK62PQgtei5xzybmJiwkSN63SZsdI7GgEYD1mo1C0X0FE7Lbq7RRUfrsY2VNNZAhxY7nKtoWfO8emxjJRpQ9iYbEdeRrLYOWP8ZXeqwjZVoQD9COPTr/GfVyasvA44GZBPuZbIDgm2sRAM+Pj6aoaGhWD9WH9tYiQbkFcYG3YtgGyvRgK+vr/Y9Ozo6GuXr4eHBYBsr0YA4aDabdkV2OxeZe9j0IqWAoZXHSYUTTFkkiVzR0LL9FEkuYAjK7wjHALABE03d53hzEDUWBeUicX3lwXYAuspFnbptANzf39vk1vdSVv8uaAaojWUdd6sX6sd1HtLBh+pZwDKnofZQve9YnVHv2rj1vg16tHNg9duyZ7+t7DkzLCkomPanz74Z7dkQ5zVqnXbEmY7ERp2mabYoVC+UM09fXl7sPL29vTUkRMHoX8t+H7mACqQ528nCwsK7d3DZCnWd8YP0B7LCLy4usu0HuBDkO0CF0nx6etrwcYTEALlwfpl3+fLysuFj6vr6OoPLg+wAVChyEr+Yb4mPAvNB6Zuhd4fch8wAXTg6Yp7Nzc19GpzC4gNINnyF0xydDFANyFGYmZmxuYK77R9dxtfp6WnuQrGACkFO4tXFPPmsofV/IL7wqedFd9EAyDGjppAYs2r7BYc/BJ8KCEt722myUZ9Iu736oIHEfQt5P8X1qXsibKmcQPYkWtndDCcSUr8jqH7dwMCWyvjvCMwPaeA2yZ7v+g2nI8U85GSESBRbsFXad8LbqsSOD+AgEr4d2YYtuwJuNBq7AvWVJU+4ByEE5erqCv/79Xr93xWwhJNbxk0J6RahHUT08Nke1i1Y2kx/L9HdaJ2fn6/L1xe3rhuitCJ5/I2P22FJWXw0xYf9G4I5t7i42PE3xB9oWTpXj6b+tQAAAABJRU5ErkJggg=="},a7ea:function(t,e,n){"use strict";n.r(e);var i=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",[n("top-nav",{attrs:{title:"添加素材"}}),t._m(0)],1)},a=[function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"wyu-main"},[n("div",{staticClass:"wyu-block"},[n("div",{staticClass:"wyu-tips wyu-tips-warning"},[n("p",{staticClass:"tit"},[t._v("您单次最多上传10张图片")])]),n("div",{staticClass:"wyu-title"},[n("h2",[t._v("上传素材")])])])])}],s=n("d722"),l=n("5200"),o=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",[n("el-select",{directives:[{name:"loading",rawName:"v-loading",value:t.catLoad,expression:"catLoad"}],staticStyle:{float:"left"},attrs:{value:t.catId,size:"mini",placeholder:"请选择分组"},on:{input:t.setCatId}},t._l(t.local,function(t,e){return n("el-option",{key:e,attrs:{label:t.name,value:t.id}})}),1)],1)},r=[],c={name:"ResourceSelect",props:["catId"],data:function(){return{catLoad:!1,local:[]}},created:function(){this.apiGetCategory()},methods:{setCatId:function(t){this.$emit("input",t)},apiGetCategory:function(t){var e=this;this.catLoad=!0;var n=[{name:"全部图片",id:0}];s["a"]("shop/admin.resource.category/index",{appToken:this.$store.getters.appToken}).then(function(t){for(var i in t.list)n.push({name:t.list[i].title,id:t.list[i].category_id});e.local=n,e.catLoad=!1}).catch(function(){e.catLoad=!1})}}},u=c,d=n("2877"),p=Object(d["a"])(u,o,r,!1,null,"955dcab8",null),m=p.exports,k={name:"SucaiIndex",components:{ResourceSelect:m,TopNav:l["a"]},data:function(){return{catId:0}}},A=k,g=(n("a90b"),Object(d["a"])(A,i,a,!1,null,"cf87f946",null));e["default"]=g.exports},a90b:function(t,e,n){"use strict";var i=n("b897"),a=n.n(i);a.a},b897:function(t,e,n){}}]);
//# sourceMappingURL=chunk-2edaa462.2ffb491f.js.map