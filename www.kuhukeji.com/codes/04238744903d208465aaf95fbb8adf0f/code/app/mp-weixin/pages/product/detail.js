(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/product/detail","common/base"],{"0c70":function(t,o,n){},"2cf0":function(t,o,n){"use strict";n.r(o);var e=n("aa45"),a=n.n(e);for(var i in e)"default"!==i&&function(t){n.d(o,t,function(){return e[t]})}(i);o["default"]=a.a},"2e97":function(t,o,n){"use strict";n.r(o);var e=n("7b9a"),a=n.n(e);for(var i in e)"default"!==i&&function(t){n.d(o,t,function(){return e[t]})}(i);o["default"]=a.a},"7b9a":function(t,o,n){"use strict";(function(t){Object.defineProperty(o,"__esModule",{value:!0}),o.default=void 0;var n=!1,e={data:function(){return{loading:{show:!1,loading:{show:!1},error:{show:!1,icon:"http://open.woyaou.com/static/uimage/mall/error/icon_none_network@2x.png",title:"网络异常, 请稍后重试"}},token:"",skin:"",bgColor:"",mainColor:"",topHeight:0,footers:[{title:"首页",link:"/pages/index/index",icon:"icontabbar",sel_icon:"icontabbar_pre3"},{title:"分类",link:"/pages/classify/index",icon:"icontabbar2",sel_icon:"icontabbar_pre2"},{title:"发布",link:"/pages/publish/index",icon:"icontabbar1",sel_icon:"icontabbar_pre1"},{title:"好店",link:"/pages/shop/index",icon:"icontabbar3",sel_icon:"icontabbar_pre4"},{title:"我的",link:"/pages/mine/index",icon:"icontabbar4",sel_icon:"icontabbar_pre"}],baseUrl:""}},onLoad:function(o){console.log(n?"Debug模式":"发布模式");var e=this;void 0!=o.app_id&&(e.config.app_id=o.app_id),e.$data.topHeight="h5"==e.config.device?44:0,e.$data.baseUrl=e.config.baseUrl+"/wanneng",console.log("topHeight:"+e.$data.topHeight),e.showLoading(),e.$request.post("/website/api.initialization/Init",{app_id:e.config.app_id,device:e.config.device,scene_id:e.config.scene_id}).then(function(n){e.hideLoading(),e.printf(n.data.token),t.setStorageSync("token",n.data.token),e.$data.token=n.data.token,console.log(n.data.skin.theme.navigationBarFrontColor),"toutiao"!=e.config.device&&t.setNavigationBarColor({backgroundColor:n.data.skin.theme.navigationBarBackgroundColor,frontColor:n.data.skin.theme.navigationBarFrontColor}),e.$data.skin=n.data.skin,e.$data.bgColor=n.data.skin.theme.bgColor,e.$data.mainColor=n.data.skin.theme.mainColor,e._Init(o)}).catch(function(t){e.printf(t),e.showErrorView(e.config.errorNodata,t.msg)})},methods:{setBaiduPageInfo:function(t){console.log("百度SEO配置"),console.log(t),"baidu"==this.config.device&&swan.setPageInfo&&swan.setPageInfo({title:t.title?"":t.title,keywords:t.keywords?"":t.keywords,description:t.description?"":t.description,releaseDate:t.releaseDate?"":t.releaseDate,image:t.image?"":t.image,success:function(){console.log("页面基础信息设置完成")}})},_Init:function(t){},printf:function(t){n&&console.log(t)},showLoading:function(){var t=this.$data.loading;t.show=!0,t.loading.show=!0,t.error.show=!1},hideLoading:function(){var t=this.$data.loading;t.show=!1,this.$data.loading=t},showErrorView:function(t,o){var n=this.$data.loading;n.show=!0,n.loading.show=!1,n.loading.show=!1,n.error.show=!0,n.error.icon=t,n.error.title=o,this.$data.loading=n}}};o.default=e}).call(this,n("543d")["default"])},9751:function(t,o,n){"use strict";n.r(o);var e=n("cff4"),a=n("2e97");for(var i in a)"default"!==i&&function(t){n.d(o,t,function(){return a[t]})}(i);var r=n("2877"),s=Object(r["a"])(a["default"],e["a"],e["b"],!1,null,null,null);o["default"]=s.exports},a9c3:function(t,o,n){"use strict";var e=n("0c70"),a=n.n(e);a.a},aa36:function(t,o,n){"use strict";var e=function(){var t=this,o=t.$createElement;t._self._c},a=[];n.d(o,"a",function(){return e}),n.d(o,"b",function(){return a})},aa45:function(t,o,n){"use strict";(function(t){Object.defineProperty(o,"__esModule",{value:!0}),o.default=void 0;var e=a(n("9751"));function a(t){return t&&t.__esModule?t:{default:t}}var i={extends:e.default,data:function(){return{showDialog:!1,currIndex:1,product_id:0,detail:"",pLength:0}},methods:{_Init:function(t){var o=this;o.bgColor=o.$data.skin.theme.bgColor,o.$data.footers=o.$data.skin.footer.list,o.$data.selectColor=o.$data.skin.footer.selectColor,t.id&&(o.$data.product_id=t.id,o.getProductDetail())},callPhoneListener:function(){var o=this;t.makePhoneCall({phoneNumber:o.$data.detail.mobile})},onSwiperChangeListener:function(t){this.currIndex=t.detail.current+1},getProductDetail:function(){var o=this,n=this;n.showLoading(),n.$request.post("/website/api.product/detail",{token:t.getStorageSync("token"),product_id:n.$data.product_id}).then(function(t){n.hideLoading();var e=t.data;o.setBaiduPageInfo(t.data.seo),n.$data.detail=e,n.$data.pLength=e.photos.length}).catch(function(t){n.printf(t),n.showErrorView(n.config.errorNodata,t.msg)})},showDialogListener:function(t){var o=this.$data.showDialog;this.$data.showDialog=!o},subMessageListener:function(o){var n=this,e=o.detail.value;console.log(o),""!=e.name?""!=e.phone?""!=e.message?(t.showLoading({title:"提交中"}),n.$request.post("/website/api.about/subMessage",{token:t.getStorageSync("token"),name:e.name,mobile:e.phone,message:e.message}).then(function(o){t.hideLoading(),t.showToast({title:"留言成功,感谢!"}),n.$data.showDialog=!1}).catch(function(o){n.printf(o),t.showToast({title:"留言失败,请重试~"})})):t.showToast({title:"消息不能为空",icon:"none"}):t.showToast({title:"手机号不能为空",icon:"none"}):t.showToast({title:"姓名不能为空",icon:"none"})}}};o.default=i}).call(this,n("543d")["default"])},bdf9:function(t,o,n){"use strict";n.r(o);var e=n("aa36"),a=n("2cf0");for(var i in a)"default"!==i&&function(t){n.d(o,t,function(){return a[t]})}(i);n("a9c3");var r=n("2877"),s=Object(r["a"])(a["default"],e["a"],e["b"],!1,null,null,null);o["default"]=s.exports},cff4:function(t,o,n){"use strict";var e=function(){var t=this,o=t.$createElement;t._self._c},a=[];n.d(o,"a",function(){return e}),n.d(o,"b",function(){return a})}},[["b893","common/runtime","common/vendor"]]]);