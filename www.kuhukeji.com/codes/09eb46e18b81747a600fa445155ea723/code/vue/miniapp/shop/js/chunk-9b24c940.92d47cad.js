(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-9b24c940"],{5200:function(t,e,i){"use strict";var s=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"wyu-top"},[s("div",{staticClass:"wyu-header"},[t.title?t._e():s("div",{staticClass:"wyu-tab"},[s("ul",t._l(t.showMenu,function(e,i){return s("li",{key:i,class:i==t.select?"on":""},[s("router-link",{attrs:{to:e.link}},[t._v(t._s(e.title))])],1)}),0)]),t.title?s("div",{staticClass:"wyu-tab"},[s("ul",[s("li",[t._v(t._s(t.title))])])]):t._e(),s("div",{staticClass:"wyu-header-status"},[s("div",{staticClass:"login-info"},[s("img",{attrs:{src:i("741c")}}),s("el-dropdown",{staticStyle:{cursor:"pointer"}},[s("span",{staticClass:"el-dropdown-link"},[t._v("\n                          "+t._s(t.$store.getters.appInfo.app_name)+"  "),s("i",{staticClass:"el-icon-arrow-down el-icon--right"})]),s("el-dropdown-menu",{attrs:{slot:"dropdown"},slot:"dropdown"},[s("el-dropdown-item",[s("span",{on:{click:t.LogOut}},[t._v("退出登录")])])],1)],1)],1)])])])},n=[],a=(i("a481"),{props:["mdl","select","title"],name:"TopNav",data:function(){return{showMenu:[],menu:{sms:[{title:"发送短信",link:"/marketing/sms/send"},{title:"短信记录",link:"/marketing/sms/census"}],paymentSetting:[{title:"微信小程序支付设置",link:"/setting/payment/weixin"},{title:"支付宝小程序支付设置",link:"/setting/payment/ali"},{title:"百度小程序支付设置",link:"/setting/payment/baidu"}],employ:[{title:"员工管理",link:"/setting/employ"},{title:"角色管理",link:"/setting/employ/role"}],agent:[{title:"分销代理设置",link:"/agent/setting/index"},{title:"顾问申请设置",link:"/agent/setting/apply"}],coupon:[{title:"优惠券管理",link:"/marketing/coupon/index"},{title:"优惠券设置",link:"/marketing/coupon/setting"},{title:"赠送优惠券",link:"/marketing/coupon/send"}],sucai:[{title:"素材管理",link:"/resource/index"},{title:"素材分类 ",link:"/resource/category"}],wuliu:[{title:"运费模板",link:"/shipping/area/index/"},{title:"快递公司 ",link:"/shipping/index"}]}}},created:function(){this.menu[this.mdl]?this.showMenu=this.menu[this.mdl]:this.showMenu=[]},methods:{LogOut:function(){var t=this;this.$store.dispatch("LogOut").then(function(){t.$router.replace("/")})}}}),o=a,l=i("2877"),r=Object(l["a"])(o,s,n,!1,null,"5665e029",null);e["a"]=r.exports},"741c":function(t,e){t.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAAAXNSR0IArs4c6QAAA9VJREFUWAnNmctKJDEUQFNt2T5oH/gAH+BOFy3MR8xC8D9mM5tZzIfMTtz4H4ILP2LABnUn+ABBFBvftnNPpm9NOlaqOo12z4WQVHJv7umbR6XSifHk+Ph4/e3t7ZukDUkr0lzzVD76sZkkyYmkPUk7q6urB66DRB8Epnp0dPRLnr9LuaL1/cwFsCX+ttfW1n5K+QnfFrANtyv5134ChXwJ3L5AbgJpI0Xk/hc4oGFpj6ZJmHOtVuu3VA5kWAui2KpUKl9SAWNB9AxXrVbN1NSUGR8fN8PDw9bf8/Ozubu7Mzc3N+bpyU6lEEewHibYksPDwwMp1IOaBQ3z8/MWrkDFQl5eXhapBNtkDjaIIFtJtCwtLZmxsTHmS6Ht5OSkjezZ2VmhXl4jbAxt9D43OztrRkZGjMzdrhK62PQgtei5xzybmJiwkSN63SZsdI7GgEYD1mo1C0X0FE7Lbq7RRUfrsY2VNNZAhxY7nKtoWfO8emxjJRpQ9iYbEdeRrLYOWP8ZXeqwjZVoQD9COPTr/GfVyasvA44GZBPuZbIDgm2sRAM+Pj6aoaGhWD9WH9tYiQbkFcYG3YtgGyvRgK+vr/Y9Ozo6GuXr4eHBYBsr0YA4aDabdkV2OxeZe9j0IqWAoZXHSYUTTFkkiVzR0LL9FEkuYAjK7wjHALABE03d53hzEDUWBeUicX3lwXYAuspFnbptANzf39vk1vdSVv8uaAaojWUdd6sX6sd1HtLBh+pZwDKnofZQve9YnVHv2rj1vg16tHNg9duyZ7+t7DkzLCkomPanz74Z7dkQ5zVqnXbEmY7ERp2mabYoVC+UM09fXl7sPL29vTUkRMHoX8t+H7mACqQ528nCwsK7d3DZCnWd8YP0B7LCLy4usu0HuBDkO0CF0nx6etrwcYTEALlwfpl3+fLysuFj6vr6OoPLg+wAVChyEr+Yb4mPAvNB6Zuhd4fch8wAXTg6Yp7Nzc19GpzC4gNINnyF0xydDFANyFGYmZmxuYK77R9dxtfp6WnuQrGACkFO4tXFPPmsofV/IL7wqedFd9EAyDGjppAYs2r7BYc/BJ8KCEt722myUZ9Iu736oIHEfQt5P8X1qXsibKmcQPYkWtndDCcSUr8jqH7dwMCWyvjvCMwPaeA2yZ7v+g2nI8U85GSESBRbsFXad8LbqsSOD+AgEr4d2YYtuwJuNBq7AvWVJU+4ByEE5erqCv/79Xr93xWwhJNbxk0J6RahHUT08Nke1i1Y2kx/L9HdaJ2fn6/L1xe3rhuitCJ5/I2P22FJWXw0xYf9G4I5t7i42PE3xB9oWTpXj6b+tQAAAABJRU5ErkJggg=="},ae53:function(t,e,i){"use strict";i.r(e);var s=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",[i("TopNav",{attrs:{mdl:"shopsetting",select:"1"}}),i("div",{staticClass:"wyu-main"},[i("div",{staticClass:"wyu-block"},[t._m(0),t._m(1),i("el-form",{ref:"form",attrs:{model:t.form,"label-width":"120px"}},[i("el-form-item",{attrs:{label:"是否弹出"}},[i("el-switch",{attrs:{"active-value":1,"inactive-value":0},model:{value:t.form.is_open,callback:function(e){t.$set(t.form,"is_open",e)},expression:"form.is_open"}})],1),i("el-form-item",{attrs:{label:"usinessid"}},[i("el-input",{staticStyle:{width:"500px"},attrs:{placeholder:"请输入快递鸟usinessid"},model:{value:t.form.usinessid,callback:function(e){t.$set(t.form,"usinessid",e)},expression:"form.usinessid"}})],1),i("el-form-item",{attrs:{label:"appkey"}},[i("el-input",{staticStyle:{width:"500px"},attrs:{placeholder:"请输入快递鸟appkey"},model:{value:t.form.appkey,callback:function(e){t.$set(t.form,"appkey",e)},expression:"form.appkey"}})],1),i("el-form-item",[i("el-button",{attrs:{size:"small",type:"primary"},on:{click:function(e){return t.setKdNiao()}}},[t._v("立即保存")]),i("el-button",{attrs:{size:"small"}},[t._v("取消")])],1)],1)],1)])],1)},n=[function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"wyu-tips wyu-tips-info",staticStyle:{"margin-bottom":"10px"}},[i("p",{staticClass:"tit"},[t._v(" 1）这里设置优惠券是否弹出以及弹出间隔等")])])},function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"wyu-title"},[i("h2",[t._v("弹出设置")])])}],a=i("5200"),o=i("d722"),l={name:"kdniaoSetting",components:{TopNav:a["a"]},data:function(){return{form:{is_open:0,usinessid:"",appkey:""}}},created:function(){console.log(this.$store.getters.appToken),this.getKdNiao()},methods:{getKdNiao:function(){var t=this;this.loading=!0,o["a"]("/shop/admin.setting/getKdNiao",{appToken:this.$store.getters.appToken}).then(function(e){t.form=e,t.loading=!1}).catch(function(e){t.loading=!1})},setKdNiao:function(){var t=this;this.loading=!0,o["a"]("/shop/admin.setting/setKdNiao",{appToken:this.$store.getters.appToken,is_open:this.form.is_open,usinessid:this.form.usinessid,appkey:this.form.appkey}).then(function(e){t.$message({message:"恭喜你，操作成功",type:"success"}),t.loading=!1}).catch(function(e){t.loading=!1})}}},r=l,u=i("2877"),p=Object(u["a"])(r,s,n,!1,null,null,null);e["default"]=p.exports}}]);
//# sourceMappingURL=chunk-9b24c940.92d47cad.js.map