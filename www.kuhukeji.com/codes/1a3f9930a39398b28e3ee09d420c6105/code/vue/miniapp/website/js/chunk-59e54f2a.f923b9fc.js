(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-59e54f2a"],{3403:function(t,n,e){"use strict";var i=e("d05e"),a=e.n(i);a.a},"8a4a":function(t,n,e){"use strict";e.r(n);var i=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"layout"},[e("img",{attrs:{width:"180",src:t.imgUrl+"cdn/system/loading.gif"}})])},a=[],o=(e("a481"),e("d722")),s=e("863e"),r={name:"LoginApp",data:function(){return{imgUrl:"",setting:s}},created:function(){this.imgUrl="https://"+document.domain+"/",this.loginApp()},methods:{loginApp:function(){var t=this;o["a"]("web/toapp/loginApp",{appid:this.$route.params.id,token:this.$route.params.token}).then(function(n){var e=t;t.$store.dispatch("setAppInfo",n).then(function(){setTimeout(function(){e.$router.replace("/dashboard/index")},1e3)})}).catch(function(){})}}},c=r,u=(e("3403"),e("2877")),p=Object(u["a"])(c,i,a,!1,null,"56ee6da0",null);n["default"]=p.exports},d05e:function(t,n,e){}}]);
//# sourceMappingURL=chunk-59e54f2a.f923b9fc.js.map