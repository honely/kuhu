(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/about/index","common/base"],{"1f03":function(t,n,e){"use strict";(function(t){Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var o=a(e("9751"));function a(t){return t&&t.__esModule?t:{default:t}}var i={extends:o.default,data:function(){return{currIndex:1,pLength:0,aboutInfo:"",page:1,list:[],more:0,marker:{latitude:31.877737,longitude:117.307435,iconPath:"../../static/logo.png"},tab_index:0,tabIndex:2,selectColor:"#00B5DE",footers:[{icon:"",sel_icon:"",name:"首页",link:"/pages/index/index",action:"link"},{icon:"",sel_icon:"",name:"产品",link:"/pages/product/index",action:"link"},{icon:"",sel_icon:"",name:"关于",link:"/pages/about/index",action:"link"},{icon:"",sel_icon:"",name:"联系",link:"",action:"phone"}]}},methods:{_Init:function(t){var n=this;n.bgColor=n.$data.skin.theme.bgColor,n.$data.footers=n.$data.skin.footer.list,n.$data.tabIndex=n.config.getCurrPageIndex("/pages/about/index",n.$data.footers)-0,n.$data.selectColor=n.$data.skin.footer.selectColor,n.getAboutInfo()},onSwiperChangeListener:function(t){this.currIndex=t.detail.current+1},onTabListener:function(t){this.tab_index=t.currentTarget.dataset.index,0==this.tab_index?this.getAboutInfo():(this.$data.page=1,this.showLoading(),this.getDevelopInfo())},getAboutInfo:function(){var n=this,e=this;e.$request.post("/website/api.about/about",{token:t.getStorageSync("token")}).then(function(t){var o=t.data;n.setBaiduPageInfo(t.data.seo),e.$data.pLength=o.banner.length,e.$data.marker.latitude=o.lat,e.$data.marker.longitude=o.lng,e.$data.aboutInfo=o})},getDevelopInfo:function(){var n=this,e=n.$data.list;n.$data.page<=1&&(e=[]),n.$request.post("/website/api.about/develop",{token:t.getStorageSync("token"),page:n.$data.page}).then(function(t){n.hideLoading();var o=t.data;for(var a in console.log(o),o.list)e.push(o.list[a]);n.$data.list=e,n.$data.more=o.isMore,n.$data.page=n.$data.page+1})}}};n.default=i}).call(this,e("543d")["default"])},"2e97":function(t,n,e){"use strict";e.r(n);var o=e("7b9a"),a=e.n(o);for(var i in o)"default"!==i&&function(t){e.d(n,t,function(){return o[t]})}(i);n["default"]=a.a},"58bd":function(t,n,e){"use strict";e.r(n);var o=e("5c2f"),a=e("5ecf");for(var i in a)"default"!==i&&function(t){e.d(n,t,function(){return a[t]})}(i);e("c67d");var r=e("2877"),s=Object(r["a"])(a["default"],o["a"],o["b"],!1,null,null,null);n["default"]=s.exports},"5c2f":function(t,n,e){"use strict";var o=function(){var t=this,n=t.$createElement;t._self._c},a=[];e.d(n,"a",function(){return o}),e.d(n,"b",function(){return a})},"5ecf":function(t,n,e){"use strict";e.r(n);var o=e("1f03"),a=e.n(o);for(var i in o)"default"!==i&&function(t){e.d(n,t,function(){return o[t]})}(i);n["default"]=a.a},"7b9a":function(t,n,e){"use strict";(function(t){Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var e=!1,o={data:function(){return{loading:{show:!1,loading:{show:!1},error:{show:!1,icon:"http://open.woyaou.com/static/uimage/mall/error/icon_none_network@2x.png",title:"网络异常, 请稍后重试"}},token:"",skin:"",bgColor:"",mainColor:"",topHeight:0,footers:[{title:"首页",link:"/pages/index/index",icon:"icontabbar",sel_icon:"icontabbar_pre3"},{title:"分类",link:"/pages/classify/index",icon:"icontabbar2",sel_icon:"icontabbar_pre2"},{title:"发布",link:"/pages/publish/index",icon:"icontabbar1",sel_icon:"icontabbar_pre1"},{title:"好店",link:"/pages/shop/index",icon:"icontabbar3",sel_icon:"icontabbar_pre4"},{title:"我的",link:"/pages/mine/index",icon:"icontabbar4",sel_icon:"icontabbar_pre"}],baseUrl:""}},onLoad:function(n){console.log(e?"Debug模式":"发布模式");var o=this;void 0!=n.app_id&&(o.config.app_id=n.app_id),o.$data.topHeight="h5"==o.config.device?44:0,o.$data.baseUrl=o.config.baseUrl+"/wanneng",console.log("topHeight:"+o.$data.topHeight),o.showLoading(),o.$request.post("/website/api.initialization/Init",{app_id:o.config.app_id,device:o.config.device,scene_id:o.config.scene_id}).then(function(e){o.hideLoading(),o.printf(e.data.token),t.setStorageSync("token",e.data.token),o.$data.token=e.data.token,console.log(e.data.skin.theme.navigationBarFrontColor),"toutiao"!=o.config.device&&t.setNavigationBarColor({backgroundColor:e.data.skin.theme.navigationBarBackgroundColor,frontColor:e.data.skin.theme.navigationBarFrontColor}),o.$data.skin=e.data.skin,o.$data.bgColor=e.data.skin.theme.bgColor,o.$data.mainColor=e.data.skin.theme.mainColor,o._Init(n)}).catch(function(t){o.printf(t),o.showErrorView(o.config.errorNodata,t.msg)})},methods:{setBaiduPageInfo:function(t){console.log("百度SEO配置"),console.log(t),"baidu"==this.config.device&&swan.setPageInfo&&swan.setPageInfo({title:t.title?"":t.title,keywords:t.keywords?"":t.keywords,description:t.description?"":t.description,releaseDate:t.releaseDate?"":t.releaseDate,image:t.image?"":t.image,success:function(){console.log("页面基础信息设置完成")}})},_Init:function(t){},printf:function(t){e&&console.log(t)},showLoading:function(){var t=this.$data.loading;t.show=!0,t.loading.show=!0,t.error.show=!1},hideLoading:function(){var t=this.$data.loading;t.show=!1,this.$data.loading=t},showErrorView:function(t,n){var e=this.$data.loading;e.show=!0,e.loading.show=!1,e.loading.show=!1,e.error.show=!0,e.error.icon=t,e.error.title=n,this.$data.loading=e}}};n.default=o}).call(this,e("543d")["default"])},9751:function(t,n,e){"use strict";e.r(n);var o=e("cff4"),a=e("2e97");for(var i in a)"default"!==i&&function(t){e.d(n,t,function(){return a[t]})}(i);var r=e("2877"),s=Object(r["a"])(a["default"],o["a"],o["b"],!1,null,null,null);n["default"]=s.exports},c36c:function(t,n,e){},c67d:function(t,n,e){"use strict";var o=e("c36c"),a=e.n(o);a.a},cff4:function(t,n,e){"use strict";var o=function(){var t=this,n=t.$createElement;t._self._c},a=[];e.d(n,"a",function(){return o}),e.d(n,"b",function(){return a})}},[["5499","common/runtime","common/vendor"]]]);