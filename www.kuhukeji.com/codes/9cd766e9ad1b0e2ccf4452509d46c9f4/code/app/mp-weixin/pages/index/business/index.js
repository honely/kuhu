(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/index/business/index","common/base"],{"19b8":function(t,n,o){"use strict";o.r(n);var e=o("3583"),a=o.n(e);for(var i in e)"default"!==i&&function(t){o.d(n,t,function(){return e[t]})}(i);n["default"]=a.a},"1fad":function(t,n,o){},"1ff4":function(t,n,o){"use strict";o.r(n);var e=o("fbcc"),a=o("19b8");for(var i in a)"default"!==i&&function(t){o.d(n,t,function(){return a[t]})}(i);o("a079");var r=o("2877"),s=Object(r["a"])(a["default"],e["a"],e["b"],!1,null,null,null);n["default"]=s.exports},"2e97":function(t,n,o){"use strict";o.r(n);var e=o("7b9a"),a=o.n(e);for(var i in e)"default"!==i&&function(t){o.d(n,t,function(){return e[t]})}(i);n["default"]=a.a},3583:function(t,n,o){"use strict";(function(t){Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var e=a(o("9751"));function a(t){return t&&t.__esModule?t:{default:t}}var i={extends:e.default,data:function(){return{page:1,list:[],more:0}},methods:{_Init:function(t){console.log("我被执行了");var n=this;n.$data.footers=n.$data.skin.footer.list,n.$data.selectColor=n.$data.skin.footer.selectColor,n.getBusinessList()},getBusinessList:function(){var n=this,o=this,e=o.$data.list;o.$data.page<=1&&(e=[]),o.$request.post("/website/api.business/index",{token:t.getStorageSync("token"),page:o.$data.page}).then(function(t){n.setBaiduPageInfo(t.data.seo);var a=t.data;for(var i in console.log(a),a.list)e.push(a.list[i]);o.$data.list=e,o.$data.more=a.isMore,o.$data.page=o.$data.page+1})},linkListener:function(t){this.config.onLinkListener(t)}}};n.default=i}).call(this,o("543d")["default"])},"7b9a":function(t,n,o){"use strict";(function(t){Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var o=!1,e={data:function(){return{loading:{show:!1,loading:{show:!1},error:{show:!1,icon:"http://open.woyaou.com/static/uimage/mall/error/icon_none_network@2x.png",title:"网络异常, 请稍后重试"}},token:"",skin:"",bgColor:"",mainColor:"",topHeight:0,footers:[{title:"首页",link:"/pages/index/index",icon:"icontabbar",sel_icon:"icontabbar_pre3"},{title:"分类",link:"/pages/classify/index",icon:"icontabbar2",sel_icon:"icontabbar_pre2"},{title:"发布",link:"/pages/publish/index",icon:"icontabbar1",sel_icon:"icontabbar_pre1"},{title:"好店",link:"/pages/shop/index",icon:"icontabbar3",sel_icon:"icontabbar_pre4"},{title:"我的",link:"/pages/mine/index",icon:"icontabbar4",sel_icon:"icontabbar_pre"}],baseUrl:""}},onLoad:function(n){console.log(o?"Debug模式":"发布模式");var e=this;void 0!=n.app_id&&(e.config.app_id=n.app_id),e.$data.topHeight="h5"==e.config.device?44:0,e.$data.baseUrl=e.config.baseUrl+"/wanneng",console.log("topHeight:"+e.$data.topHeight),e.showLoading(),e.$request.post("/website/api.initialization/Init",{app_id:e.config.app_id,device:e.config.device,scene_id:e.config.scene_id}).then(function(o){e.hideLoading(),e.printf(o.data.token),t.setStorageSync("token",o.data.token),e.$data.token=o.data.token,"toutiao"!=e.config.device&&t.setNavigationBarColor({backgroundColor:o.data.skin.theme.navigationBarBackgroundColor,frontColor:o.data.skin.theme.navigationBarFrontColor}),e.$data.skin=o.data.skin,e.$data.bgColor=o.data.skin.theme.bgColor,e.$data.mainColor=o.data.skin.theme.mainColor,e._Init(n)}).catch(function(t){e.printf(t),e.showErrorView(e.config.errorNodata,t.msg)})},methods:{setBaiduPageInfo:function(t){console.log("百度SEO配置"),console.log(t),"baidu"==this.config.device&&swan.setPageInfo&&swan.setPageInfo({title:t.title?"":t.title,keywords:t.keywords?"":t.keywords,description:t.description?"":t.description,releaseDate:t.releaseDate?"":t.releaseDate,image:t.image?"":t.image,success:function(){console.log("页面基础信息设置完成")}})},_Init:function(t){},printf:function(t){o&&console.log(t)},showLoading:function(){var t=this.$data.loading;t.show=!0,t.loading.show=!0,t.error.show=!1},hideLoading:function(){var t=this.$data.loading;t.show=!1,this.$data.loading=t},showErrorView:function(t,n){var o=this.$data.loading;o.show=!0,o.loading.show=!1,o.loading.show=!1,o.error.show=!0,o.error.icon=t,o.error.title=n,this.$data.loading=o}}};n.default=e}).call(this,o("543d")["default"])},9751:function(t,n,o){"use strict";o.r(n);var e=o("a1af"),a=o("2e97");for(var i in a)"default"!==i&&function(t){o.d(n,t,function(){return a[t]})}(i);var r=o("2877"),s=Object(r["a"])(a["default"],e["a"],e["b"],!1,null,null,null);n["default"]=s.exports},a079:function(t,n,o){"use strict";var e=o("1fad"),a=o.n(e);a.a},a1af:function(t,n,o){"use strict";var e=function(){var t=this,n=t.$createElement;t._self._c},a=[];o.d(n,"a",function(){return e}),o.d(n,"b",function(){return a})},fbcc:function(t,n,o){"use strict";var e=function(){var t=this,n=t.$createElement;t._self._c},a=[];o.d(n,"a",function(){return e}),o.d(n,"b",function(){return a})}},[["7f57","common/runtime","common/vendor"]]]);