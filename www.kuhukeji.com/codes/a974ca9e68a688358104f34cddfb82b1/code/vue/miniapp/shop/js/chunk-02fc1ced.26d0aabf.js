(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-02fc1ced"],{5200:function(t,n,e){"use strict";var i=function(){var t=this,n=t.$createElement,i=t._self._c||n;return i("div",{staticClass:"wyu-top"},[i("div",{staticClass:"wyu-header"},[t.title?t._e():i("div",{staticClass:"wyu-tab"},[i("ul",t._l(t.showMenu,function(n,e){return i("li",{key:e,class:e==t.select?"on":""},[i("router-link",{attrs:{to:n.link}},[t._v(t._s(n.title))])],1)}),0)]),t.title?i("div",{staticClass:"wyu-tab"},[i("ul",[i("li",[t._v(t._s(t.title))])])]):t._e(),i("div",{staticClass:"wyu-header-status"},[i("div",{staticClass:"login-info"},[i("img",{attrs:{src:e("741c")}}),i("el-dropdown",{staticStyle:{cursor:"pointer"}},[i("span",{staticClass:"el-dropdown-link"},[t._v("\n                          "+t._s(t.$store.getters.appInfo.app_name)+"  "),i("i",{staticClass:"el-icon-arrow-down el-icon--right"})]),i("el-dropdown-menu",{attrs:{slot:"dropdown"},slot:"dropdown"},[i("el-dropdown-item",[i("span",{on:{click:t.LogOut}},[t._v("退出登录")])])],1)],1)],1)])])])},s=[],a=(e("a481"),{props:["mdl","select","title"],name:"TopNav",data:function(){return{showMenu:[],menu:{sms:[{title:"发送短信",link:"/marketing/sms/send"},{title:"短信记录",link:"/marketing/sms/census"}],paymentSetting:[{title:"微信小程序支付设置",link:"/setting/payment/weixin"},{title:"支付宝小程序支付设置",link:"/setting/payment/ali"},{title:"百度小程序支付设置",link:"/setting/payment/baidu"}],employ:[{title:"员工管理",link:"/setting/employ"},{title:"角色管理",link:"/setting/employ/role"}],agent:[{title:"分销代理设置",link:"/agent/setting/index"},{title:"顾问申请设置",link:"/agent/setting/apply"}],coupon:[{title:"优惠券管理",link:"/marketing/coupon/index"},{title:"优惠券设置",link:"/marketing/coupon/setting"},{title:"赠送优惠券",link:"/marketing/coupon/send"}],sucai:[{title:"素材管理",link:"/resource/index"},{title:"素材分类 ",link:"/resource/category"}],wuliu:[{title:"运费模板",link:"/shipping/area/index/"},{title:"快递公司 ",link:"/shipping/index"}]}}},created:function(){this.menu[this.mdl]?this.showMenu=this.menu[this.mdl]:this.showMenu=[]},methods:{LogOut:function(){var t=this;this.$store.dispatch("LogOut").then(function(){t.$router.replace("/")})}}}),o=a,l=e("2877"),r=Object(l["a"])(o,i,s,!1,null,"5665e029",null);n["a"]=r.exports},"741c":function(t,n){t.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAAAXNSR0IArs4c6QAAA9VJREFUWAnNmctKJDEUQFNt2T5oH/gAH+BOFy3MR8xC8D9mM5tZzIfMTtz4H4ILP2LABnUn+ABBFBvftnNPpm9NOlaqOo12z4WQVHJv7umbR6XSifHk+Ph4/e3t7ZukDUkr0lzzVD76sZkkyYmkPUk7q6urB66DRB8Epnp0dPRLnr9LuaL1/cwFsCX+ttfW1n5K+QnfFrANtyv5134ChXwJ3L5AbgJpI0Xk/hc4oGFpj6ZJmHOtVuu3VA5kWAui2KpUKl9SAWNB9AxXrVbN1NSUGR8fN8PDw9bf8/Ozubu7Mzc3N+bpyU6lEEewHibYksPDwwMp1IOaBQ3z8/MWrkDFQl5eXhapBNtkDjaIIFtJtCwtLZmxsTHmS6Ht5OSkjezZ2VmhXl4jbAxt9D43OztrRkZGjMzdrhK62PQgtei5xzybmJiwkSN63SZsdI7GgEYD1mo1C0X0FE7Lbq7RRUfrsY2VNNZAhxY7nKtoWfO8emxjJRpQ9iYbEdeRrLYOWP8ZXeqwjZVoQD9COPTr/GfVyasvA44GZBPuZbIDgm2sRAM+Pj6aoaGhWD9WH9tYiQbkFcYG3YtgGyvRgK+vr/Y9Ozo6GuXr4eHBYBsr0YA4aDabdkV2OxeZe9j0IqWAoZXHSYUTTFkkiVzR0LL9FEkuYAjK7wjHALABE03d53hzEDUWBeUicX3lwXYAuspFnbptANzf39vk1vdSVv8uaAaojWUdd6sX6sd1HtLBh+pZwDKnofZQve9YnVHv2rj1vg16tHNg9duyZ7+t7DkzLCkomPanz74Z7dkQ5zVqnXbEmY7ERp2mabYoVC+UM09fXl7sPL29vTUkRMHoX8t+H7mACqQ528nCwsK7d3DZCnWd8YP0B7LCLy4usu0HuBDkO0CF0nx6etrwcYTEALlwfpl3+fLysuFj6vr6OoPLg+wAVChyEr+Yb4mPAvNB6Zuhd4fch8wAXTg6Yp7Nzc19GpzC4gNINnyF0xydDFANyFGYmZmxuYK77R9dxtfp6WnuQrGACkFO4tXFPPmsofV/IL7wqedFd9EAyDGjppAYs2r7BYc/BJ8KCEt722myUZ9Iu736oIHEfQt5P8X1qXsibKmcQPYkWtndDCcSUr8jqH7dwMCWyvjvCMwPaeA2yZ7v+g2nI8U85GSESBRbsFXad8LbqsSOD+AgEr4d2YYtuwJuNBq7AvWVJU+4ByEE5erqCv/79Xr93xWwhJNbxk0J6RahHUT08Nke1i1Y2kx/L9HdaJ2fn6/L1xe3rhuitCJ5/I2P22FJWXw0xYf9G4I5t7i42PE3xB9oWTpXj6b+tQAAAABJRU5ErkJggg=="},abc7:function(t,n,e){"use strict";e.r(n);var i=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",[e("TopNav",{attrs:{mdl:"agent",select:"1"}}),t._m(0),e("div",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticClass:"wyu-main"},[e("div",{staticClass:"wyu-block"},[t._m(1),e("el-form",{staticStyle:{padding:"20px"},attrs:{"label-width":"150px"},model:{value:t.setting,callback:function(n){t.setting=n},expression:"setting"}},[e("el-form-item",{attrs:{label:"成为顾问条件"}},[e("el-radio-group",{on:{change:t.agentApply},model:{value:t.setting.condition,callback:function(n){t.$set(t.setting,"condition",n)},expression:"setting.condition"}},t._l(t.setting.agent_apply_audit,function(n){return e("el-radio",{attrs:{label:n.id}},[t._v(t._s(n.name))])}),1)],1)],1)],1)]),e("div",{staticClass:"wyu-btn-div"},[e("el-button",{attrs:{size:"small",type:"primary"},on:{click:function(n){return t.saveForm()}}},[t._v("立即保存")]),e("el-button",{attrs:{size:"small"}},[t._v("取消")])],1)],1)},s=[function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"wyu-tips wyu-tips-warning"},[e("p",[t._v(" 1）这里设置分销代理的成为顾问条件以及发展下线条件")])])},function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"wyu-title"},[e("h2",[t._v("成为顾问条件以及发展下线条件")])])}],a=e("5200"),o=e("d722"),l={name:"adminRole",components:{TopNav:a["a"]},data:function(){return{loading:!1,setting:{agent_apply_audit:[],agent_junior:[],condition:0,junior:0}}},created:function(){this.getDetail()},methods:{agentApply:function(){},getDetail:function(){var t=this;this.loading=!0,o["a"]("/shop/admin.agent.setting/getApplyJunior",{appToken:this.$store.getters.appToken}).then(function(n){t.setting=n,t.loading=!1}).catch(function(n){t.loading=!1})},saveForm:function(){var t=this;this.loading=!0,o["a"]("/shop/admin.agent.setting/setApplyJunior",{appToken:this.$store.getters.appToken,condition:this.setting.condition,shopping_num:this.setting.shopping_num,shopping_money:this.setting.shopping_money,junior:this.setting.junior}).then(function(n){t.$message({message:"恭喜你，操作成功",type:"success"}),t.loading=!1}).catch(function(n){t.loading=!1})}}},r=l,u=e("2877"),c=Object(u["a"])(r,i,s,!1,null,null,null);n["default"]=c.exports}}]);
//# sourceMappingURL=chunk-02fc1ced.26d0aabf.js.map