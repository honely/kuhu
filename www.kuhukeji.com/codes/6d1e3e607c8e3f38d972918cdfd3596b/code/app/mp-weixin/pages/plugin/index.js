(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/plugin/index","common/base"],{"159a":function(t,a,o){"use strict";o.r(a);var e=o("388d"),n=o.n(e);for(var i in e)"default"!==i&&function(t){o.d(a,t,function(){return e[t]})}(i);a["default"]=n.a},"246d":function(t,a,o){},"2e97":function(t,a,o){"use strict";o.r(a);var e=o("7b9a"),n=o.n(e);for(var i in e)"default"!==i&&function(t){o.d(a,t,function(){return e[t]})}(i);a["default"]=n.a},3877:function(t,a,o){"use strict";var e=function(){var t=this,a=t.$createElement;t._self._c},n=[];o.d(a,"a",function(){return e}),o.d(a,"b",function(){return n})},"388d":function(t,a,o){"use strict";(function(t){Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var e=n(o("9751"));function n(t){return t&&t.__esModule?t:{default:t}}var i={extends:e.default,data:function(){return{bgColor:"",tmp_id:"6",tabIndex:0,footers:[],data:"",selectColor:"#00B5DE",plugins:[],fData:{}}},methods:{_Init:function(a){if(void 0!=a.tmp_id){var o=this;return o.tmp_id=a.tmp_id,o.$data.selectColor=o.$data.skin.footer.selectColor,o.getPageTemplateInfo(),void console.log(o.config.app_id)}t.reLaunch({url:"/pages/index/index"})},getPageTemplateInfo:function(){var a=this,o=this;o.$request.post("/website/api.page/getTmpDetail",{tmp_id:o.$data.tmp_id,token:t.getStorageSync("token")}).then(function(e){var n=e.data;o.$data.data=n;var i=n.plugins;if("h5"!=a.config.device){for(var r in i){var d=i[r];d.datas.ml=t.upx2px(2*d.datas.ml),d.datas.mt=t.upx2px(2*d.datas.mt),d.datas.mb=t.upx2px(2*d.datas.mb),d.datas.pl=t.upx2px(2*d.datas.pl),d.datas.pt=t.upx2px(2*d.datas.pt),d.datas.pb=t.upx2px(2*d.datas.pb),d.datas.pr=t.upx2px(2*d.datas.pr),d.datas.radius=t.upx2px(2*d.datas.radius),d.datas.width=t.upx2px(2*d.datas.height),d.datas.height=t.upx2px(2*d.datas.height),i[r]=d}o.$data.plugins=i}else o.$data.plugins=n.plugins;t.setNavigationBarTitle({title:n.title}),1==n.is_theme?(t.setNavigationBarColor({frontColor:n.theme.navigationBarFrontColor,backgroundColor:n.theme.navigationBarBackgroundColor}),o.$data.bgColor=n.theme.bgColor):0==n.is_theme&&(t.setNavigationBarColor({frontColor:n.public_style.theme.navigationBarFrontColor,backgroundColor:n.public_style.theme.navigationBarBackgroundColor}),o.$data.bgColor=o.$data.skin.theme.bgColor),0==n.footer_type?o.$data.footers=[]:1==n.footer_type?(o.$data.footers=n.public_style.footer.list,o.$data.selectColor=n.public_style.selectColor):2==n.footer_type&&(o.$data.footers=n.footer.list,o.$data.selectColor=n.selectColor);var s=[];for(var r in o.$data.footers)s.push(o.$data.footers[r].link);o.config.ToReLaunch=s;i=o.$data.data.plugins;for(var l in i)"plugin-formwn"==i[l].plug&&o.getFormInfo(i[l].datas.formId);console.log(o.$data.data)})},getFormInfo:function(a){var o=this;o.$request.post("/website/api.about/getWnFormById",{token:t.getStorageSync("token"),form_id:a}).then(function(t){var a=t.data;console.log(a),o.$data.fData=a})},clearListener:function(){t.clearStorageSync("page_id"),t.reLaunch({url:"/pages/index/index"})}}};a.default=i}).call(this,o("543d")["default"])},"5dd8":function(t,a,o){"use strict";var e=o("246d"),n=o.n(e);n.a},"7b9a":function(t,a,o){"use strict";(function(t){Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var o=!1,e={data:function(){return{loading:{show:!1,loading:{show:!1},error:{show:!1,icon:"http://open.woyaou.com/static/uimage/mall/error/icon_none_network@2x.png",title:"网络异常, 请稍后重试"}},token:"",skin:"",bgColor:"",mainColor:"",topHeight:0,footers:[{title:"首页",link:"/pages/index/index",icon:"icontabbar",sel_icon:"icontabbar_pre3"},{title:"分类",link:"/pages/classify/index",icon:"icontabbar2",sel_icon:"icontabbar_pre2"},{title:"发布",link:"/pages/publish/index",icon:"icontabbar1",sel_icon:"icontabbar_pre1"},{title:"好店",link:"/pages/shop/index",icon:"icontabbar3",sel_icon:"icontabbar_pre4"},{title:"我的",link:"/pages/mine/index",icon:"icontabbar4",sel_icon:"icontabbar_pre"}],baseUrl:""}},onLoad:function(a){console.log(o?"Debug模式":"发布模式");var e=this;void 0!=a.app_id&&(e.config.app_id=a.app_id),e.$data.topHeight="h5"==e.config.device?44:0,e.$data.baseUrl=e.config.baseUrl+"/wanneng",console.log("topHeight:"+e.$data.topHeight),e.showLoading(),e.$request.post("/website/api.initialization/Init",{app_id:e.config.app_id,device:e.config.device,scene_id:e.config.scene_id}).then(function(o){e.hideLoading(),e.printf(o.data.token),t.setStorageSync("token",o.data.token),e.$data.token=o.data.token,"toutiao"!=e.config.device&&t.setNavigationBarColor({backgroundColor:o.data.skin.theme.navigationBarBackgroundColor,frontColor:o.data.skin.theme.navigationBarFrontColor}),e.$data.skin=o.data.skin,e.$data.bgColor=o.data.skin.theme.bgColor,e.$data.mainColor=o.data.skin.theme.mainColor,e._Init(a)}).catch(function(t){e.printf(t),e.showErrorView(e.config.errorNodata,t.msg)})},methods:{setBaiduPageInfo:function(t){console.log("百度SEO配置"),console.log(t),"baidu"==this.config.device&&swan.setPageInfo&&swan.setPageInfo({title:t.title?"":t.title,keywords:t.keywords?"":t.keywords,description:t.description?"":t.description,releaseDate:t.releaseDate?"":t.releaseDate,image:t.image?"":t.image,success:function(){console.log("页面基础信息设置完成")}})},_Init:function(t){},printf:function(t){o&&console.log(t)},showLoading:function(){var t=this.$data.loading;t.show=!0,t.loading.show=!0,t.error.show=!1},hideLoading:function(){var t=this.$data.loading;t.show=!1,this.$data.loading=t},showErrorView:function(t,a){var o=this.$data.loading;o.show=!0,o.loading.show=!1,o.loading.show=!1,o.error.show=!0,o.error.icon=t,o.error.title=a,this.$data.loading=o}}};a.default=e}).call(this,o("543d")["default"])},9751:function(t,a,o){"use strict";o.r(a);var e=o("a1af"),n=o("2e97");for(var i in n)"default"!==i&&function(t){o.d(a,t,function(){return n[t]})}(i);var r=o("2877"),d=Object(r["a"])(n["default"],e["a"],e["b"],!1,null,null,null);a["default"]=d.exports},a1af:function(t,a,o){"use strict";var e=function(){var t=this,a=t.$createElement;t._self._c},n=[];o.d(a,"a",function(){return e}),o.d(a,"b",function(){return n})},ee5e:function(t,a,o){"use strict";o.r(a);var e=o("3877"),n=o("159a");for(var i in n)"default"!==i&&function(t){o.d(a,t,function(){return n[t]})}(i);o("5dd8");var r=o("2877"),d=Object(r["a"])(n["default"],e["a"],e["b"],!1,null,null,null);a["default"]=d.exports}},[["a28c","common/runtime","common/vendor"]]]);