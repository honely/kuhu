(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-78bbf632"],{"13eb":function(t,n,e){},"8a4a":function(t,n,e){"use strict";e.r(n);var i=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"layout"},[e("img",{attrs:{width:"180",src:t.imgUrl+"cdn/system/loading.gif"}})])},a=[],o=(e("a481"),e("d722")),s=e("863e"),c={name:"LoginApp",data:function(){return{imgUrl:"",setting:s}},created:function(){this.imgUrl="https://"+document.domain+"/",this.loginApp()},methods:{loginApp:function(){var t=this;o["a"]("web/toapp/loginApp",{appid:this.$route.params.id,token:this.$route.params.token}).then(function(n){var e=t;t.$store.dispatch("setAppInfo",n).then(function(){setTimeout(function(){e.$router.replace("/dashboard/index")},1e3)})}).catch(function(){})}}},r=c,u=(e("fa2b"),e("2877")),p=Object(u["a"])(r,i,a,!1,null,"7a5ce1a5",null);n["default"]=p.exports},fa2b:function(t,n,e){"use strict";var i=e("13eb"),a=e.n(i);a.a}}]);
//# sourceMappingURL=chunk-78bbf632.28fe17a9.js.map