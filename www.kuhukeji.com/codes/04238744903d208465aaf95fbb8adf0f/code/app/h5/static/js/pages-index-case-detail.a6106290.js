(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-index-case-detail","common-base"],{1212:function(t,a,e){"use strict";var o=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("v-uni-view",{staticClass:"pageContainer",style:"top:"+t.topHeight+"px;background-color:"+t.bgColor},[t.loading.show?t._e():e("v-uni-view",{staticClass:"case-detail-box"},[e("v-uni-image",{staticClass:"cd-thumb-img",attrs:{src:t.detail.photo}}),e("v-uni-view",{staticClass:"cd-title"},[t._v(t._s(t.detail.title))]),e("v-uni-view",{staticClass:"cd-date"},[t._v(t._s(t.detail.add_time)+"发布")]),e("v-uni-view",{staticClass:"cd-baseInfo"},t._l(t.detail.info,function(a,o){return e("v-uni-view",{key:o,staticClass:"item-desc"},[t._v(t._s(a.key)+"："+t._s(a.val))])}),1),e("v-uni-view",{staticClass:"cd-cont"},[e("rich-view",{attrs:{rDatas:t.detail.detail}})],1)],1),e("ui-loading",{attrs:{loading:t.loading}})],1)},i=[];e.d(a,"a",function(){return o}),e.d(a,"b",function(){return i})},"29ce":function(t,a,e){"use strict";e.r(a);var o=e("b13c"),i=e.n(o);for(var n in o)"default"!==n&&function(t){e.d(a,t,function(){return o[t]})}(n);a["default"]=i.a},"2e97":function(t,a,e){"use strict";e.r(a);var o=e("caee"),i=e.n(o);for(var n in o)"default"!==n&&function(t){e.d(a,t,function(){return o[t]})}(n);a["default"]=i.a},"589a":function(t,a,e){a=t.exports=e("2350")(!1),a.push([t.i,".case-detail-box[data-v-a5cf56b6]{width:100%;padding:0 15px;background:#fff}.case-detail-box .cd-thumb-img[data-v-a5cf56b6]{width:100%;height:230px;margin:24px 0}.case-detail-box .cd-title[data-v-a5cf56b6]{color:#333;font-size:18px}.case-detail-box .cd-date[data-v-a5cf56b6]{padding:16px 0 24px 0;border-bottom:1px solid #ccc;color:#999;font-size:16px}.case-detail-box .cd-baseInfo[data-v-a5cf56b6]{padding:16px 0;border-bottom:1px solid #ccc}.case-detail-box .cd-baseInfo .item-desc[data-v-a5cf56b6]{color:grey;font-size:16px;padding-bottom:6px}.case-detail-box .cd-cont[data-v-a5cf56b6]{width:100%;padding:16px 0}.case-detail-box .cd-cont .cd-cont-desc[data-v-a5cf56b6]{color:grey;font-size:16px}.case-detail-box .cd-cont .cd-cont-img[data-v-a5cf56b6]{width:100%;height:126px;background:red;margin-top:16px}",""])},"67fe":function(t,a,e){"use strict";var o=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("div")},i=[];e.d(a,"a",function(){return o}),e.d(a,"b",function(){return i})},7998:function(t,a,e){var o=e("589a");"string"===typeof o&&(o=[[t.i,o,""]]),o.locals&&(t.exports=o.locals);var i=e("4f06").default;i("95a5e83a",o,!0,{sourceMap:!1,shadowMode:!1})},9751:function(t,a,e){"use strict";e.r(a);var o=e("67fe"),i=e("2e97");for(var n in i)"default"!==n&&function(t){e.d(a,t,function(){return i[t]})}(n);var c=e("2877"),r=Object(c["a"])(i["default"],o["a"],o["b"],!1,null,"723c30c7",null);a["default"]=r.exports},b13c:function(t,a,e){"use strict";Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var o=i(e("9751"));function i(t){return t&&t.__esModule?t:{default:t}}var n={extends:o.default,data:function(){return{detail:""}},methods:{_Init:function(t){var a=this;a.bgColor=a.$data.skin.theme.bgColor,a.$data.footers=a.$data.skin.footer.list,a.$data.selectColor=a.$data.skin.footer.selectColor,a.getCaseDetailInfo(t.example_id)},getCaseDetailInfo:function(t){var a=this,e=this;e.$request.post("/website/api.example/detail",{token:uni.getStorageSync("token"),example_id:t}).then(function(t){a.setBaiduPageInfo(t.data.seo),e.$data.detail=t.data}).catch(function(t){console.log("================="),e.printf(t),e.showErrorView(e.config.errorNodata,t.msg)})}}};a.default=n},bd1a:function(t,a,e){"use strict";e.r(a);var o=e("1212"),i=e("29ce");for(var n in i)"default"!==n&&function(t){e.d(a,t,function(){return i[t]})}(n);e("dd60");var c=e("2877"),r=Object(c["a"])(i["default"],o["a"],o["b"],!1,null,"a5cf56b6",null);a["default"]=r.exports},caee:function(t,a,e){"use strict";Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var o=!1,i={data:function(){return{loading:{show:!1,loading:{show:!1},error:{show:!1,icon:"http://kuhukeji.com/static/uimage/mall/error/icon_none_network@2x.png",title:"网络异常, 请稍后重试"}},token:"",skin:"",bgColor:"",mainColor:"",topHeight:0,footers:[{title:"首页",link:"/pages/index/index",icon:"icontabbar",sel_icon:"icontabbar_pre3"},{title:"分类",link:"/pages/classify/index",icon:"icontabbar2",sel_icon:"icontabbar_pre2"},{title:"发布",link:"/pages/publish/index",icon:"icontabbar1",sel_icon:"icontabbar_pre1"},{title:"好店",link:"/pages/shop/index",icon:"icontabbar3",sel_icon:"icontabbar_pre4"},{title:"我的",link:"/pages/mine/index",icon:"icontabbar4",sel_icon:"icontabbar_pre"}],baseUrl:""}},onLoad:function(t){console.log(o?"Debug模式":"发布模式");var a=this;void 0!=t.app_id&&(a.config.app_id=t.app_id),a.$data.topHeight="h5"==a.config.device?44:0,a.$data.baseUrl=a.config.baseUrl+"/wanneng",console.log("topHeight:"+a.$data.topHeight),a.showLoading(),a.$request.post("/website/api.initialization/Init",{app_id:a.config.app_id,device:a.config.device,scene_id:a.config.scene_id}).then(function(e){a.hideLoading(),a.printf(e.data.token),uni.setStorageSync("token",e.data.token),a.$data.token=e.data.token,console.log(e.data.skin.theme.navigationBarFrontColor),"toutiao"!=a.config.device&&uni.setNavigationBarColor({backgroundColor:e.data.skin.theme.navigationBarBackgroundColor,frontColor:e.data.skin.theme.navigationBarFrontColor}),a.$data.skin=e.data.skin,a.$data.bgColor=e.data.skin.theme.bgColor,a.$data.mainColor=e.data.skin.theme.mainColor,a._Init(t)}).catch(function(t){a.printf(t),a.showErrorView(a.config.errorNodata,t.msg)})},methods:{setBaiduPageInfo:function(t){console.log("百度SEO配置"),console.log(t),"baidu"==this.config.device&&swan.setPageInfo&&swan.setPageInfo({title:t.title?"":t.title,keywords:t.keywords?"":t.keywords,description:t.description?"":t.description,releaseDate:t.releaseDate?"":t.releaseDate,image:t.image?"":t.image,success:function(){console.log("页面基础信息设置完成")}})},_Init:function(t){},printf:function(t){o&&console.log(t)},showLoading:function(){var t=this.$data.loading;t.show=!0,t.loading.show=!0,t.error.show=!1},hideLoading:function(){var t=this.$data.loading;t.show=!1,this.$data.loading=t},showErrorView:function(t,a){var e=this.$data.loading;e.show=!0,e.loading.show=!1,e.loading.show=!1,e.error.show=!0,e.error.icon=t,e.error.title=a,this.$data.loading=e}}};a.default=i},dd60:function(t,a,e){"use strict";var o=e("7998"),i=e.n(o);i.a}}]);