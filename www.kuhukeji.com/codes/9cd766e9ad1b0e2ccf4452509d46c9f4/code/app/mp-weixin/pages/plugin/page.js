(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/plugin/page","common/base"],{"2e97":function(t,a,o){"use strict";o.r(a);var e=o("7b9a"),n=o.n(e);for(var i in e)"default"!==i&&function(t){o.d(a,t,function(){return e[t]})}(i);a["default"]=n.a},"3e31":function(t,a,o){"use strict";(function(t){Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var e=n(o("9751"));function n(t){return t&&t.__esModule?t:{default:t}}var i={extends:e.default,data:function(){return{bgColor:"",tData_business:{type:0,m_title:"我们的业务",s_title:"Services",p_left:"70px",p_right:"70px"},tData_center:{type:0,m_title:"资讯中心",s_title:"News Center",p_left:"70px",p_right:"70px"},tData_about:{type:0,m_title:"关于我们",s_title:"About us",p_left:"70px",p_right:"70px"},iData_Info:{isMore:1,data:[{title:"中关村尽责社会 持续发展产业园设计",date:"2018-09-20",cont:"拜耳在中国的第二轮开放式创新项目Grants4Apps之“拜耳初创计划上海2017”于今日申请 ..."},{title:"上海生命科学研究院携手提高作物产量",date:"2018-07-12",cont:"由国务院发展研究中心与广东省政府联合指导的首届中国创新大会在广州开幕中国的第二轮开放式创新项目百年來我们助力汽车产业成长迈进 ..."}]},aData_about:{imgUrl:"http://img5.mtime.cn/mg/2019/01/15/221621.33660198_120X90X4.jpg",title:"中泰高科控股集团股份有限公司",content:"集团由中国知名金融师马岩松于1987年建立，是一所以东方自然体验为基础和出发点进行设计的国际建筑事务所。近年围绕“山水城市”这一核心设计哲学，MAD期望通过创新建筑创造社会和人们之间的平衡年，通过竞赛赢得卢卡斯叙事艺术博物馆设计权 ...",isMore:1},tabIndex:4,footers:[{icon:"icon-tabbar",sel_icon:"icon-tabbar_pre",name:"首页",link:"/pages/index/index",action:"link"},{icon:"icon-tabbar3",sel_icon:"icon-tabbar_pre1",name:"产品",link:"/pages/product/index",action:"link"},{icon:"icon-tabbar2",sel_icon:"icon-tabbar_pre4",name:"关于",link:"/pages/about/index",action:"link"},{icon:"icon-tabbar4",sel_icon:"icon-tabbar_pre3",name:"联系",link:"",action:"phone"},{icon:"icon-tabbar1",sel_icon:"icon-tabbar_pre2",name:"留言",link:"/pages/message/index",action:"link"}],data:"",selectColor:"#00B5DE",plugins:[],fData:[],page_id:""}},methods:{_Init:function(t){var a=this;void 0!=t.page_id&&(a.$data.page_id=t.page_id,a.$data.footers=a.$data.skin.footer.list,a.$data.selectColor=a.$data.skin.footer.selectColor,a.$data.tabIndex=a.config.getCurrPageIndex("/pages/plugin/page",a.$data.footers)-0,a.getPageInfo())},getPageInfo:function(){var a=this,o=this;o.$request.post("/website/api.page/getPage",{page_id:o.$data.page_id,token:t.getStorageSync("token")}).then(function(e){var n=e.data;o.$data.data=n;var i=n.plugins;if("h5"!=a.config.device){for(var r in i){var s=i[r];s.datas.ml=t.upx2px(2*s.datas.ml),s.datas.mt=t.upx2px(2*s.datas.mt),s.datas.mb=t.upx2px(2*s.datas.mb),s.datas.pl=t.upx2px(2*s.datas.pl),s.datas.pt=t.upx2px(2*s.datas.pt),s.datas.pb=t.upx2px(2*s.datas.pb),s.datas.pr=t.upx2px(2*s.datas.pr),s.datas.radius=t.upx2px(2*s.datas.radius),s.datas.width=t.upx2px(2*s.datas.height),s.datas.height=t.upx2px(2*s.datas.height),i[r]=s}o.$data.plugins=i}else o.$data.plugins=n.plugins;t.setNavigationBarTitle({title:n.title}),1==n.is_theme?(t.setNavigationBarColor({frontColor:n.theme.navigationBarFrontColor,backgroundColor:n.theme.navigationBarBackgroundColor}),o.$data.bgColor=n.theme.bgColor):0==n.is_theme&&(t.setNavigationBarColor({frontColor:o.$data.skin.theme.navigationBarFrontColor,backgroundColor:o.$data.skin.theme.navigationBarBackgroundColor}),o.$data.bgColor=o.$data.skin.theme.bgColor),console.log("bgColor:"+o.$data.bgColor),0==n.footer_type?o.$data.footers=[]:1==n.footer_type?(o.$data.footers=o.$data.skin.footer.list,o.$data.selectColor=o.$data.skin.selectColor):2==n.footer_type&&(o.$data.footers=n.footer.list,o.$data.selectColor=n.selectColor);i=o.$data.data.plugins;for(var l in i)"plugin-formwn"==i[l].plug&&o.getFormInfo(i[l].datas.formId);console.log(o.$data.data)})},getFormInfo:function(a){var o=this;o.$request.post("/website/api.about/getWnFormById",{token:t.getStorageSync("token"),form_id:a}).then(function(t){var a=t.data;console.log(a),o.$data.fData=a,o.$data.footers=o.$data.skin.footer.list,o.$data.tabIndex=o.config.getCurrPageIndex("/pages/plugin/page",o.$data.footers)-0})},templateListListener:function(){t.navigateTo({url:"../plugin/list"})}}};a.default=i}).call(this,o("543d")["default"])},"42b7":function(t,a,o){"use strict";var e=o("6eb4"),n=o.n(e);n.a},5093:function(t,a,o){"use strict";o.r(a);var e=o("3e31"),n=o.n(e);for(var i in e)"default"!==i&&function(t){o.d(a,t,function(){return e[t]})}(i);a["default"]=n.a},"6eb4":function(t,a,o){},"7b9a":function(t,a,o){"use strict";(function(t){Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var o=!1,e={data:function(){return{loading:{show:!1,loading:{show:!1},error:{show:!1,icon:"http://open.woyaou.com/static/uimage/mall/error/icon_none_network@2x.png",title:"网络异常, 请稍后重试"}},token:"",skin:"",bgColor:"",mainColor:"",topHeight:0,footers:[{title:"首页",link:"/pages/index/index",icon:"icontabbar",sel_icon:"icontabbar_pre3"},{title:"分类",link:"/pages/classify/index",icon:"icontabbar2",sel_icon:"icontabbar_pre2"},{title:"发布",link:"/pages/publish/index",icon:"icontabbar1",sel_icon:"icontabbar_pre1"},{title:"好店",link:"/pages/shop/index",icon:"icontabbar3",sel_icon:"icontabbar_pre4"},{title:"我的",link:"/pages/mine/index",icon:"icontabbar4",sel_icon:"icontabbar_pre"}],baseUrl:""}},onLoad:function(a){console.log(o?"Debug模式":"发布模式");var e=this;void 0!=a.app_id&&(e.config.app_id=a.app_id),e.$data.topHeight="h5"==e.config.device?44:0,e.$data.baseUrl=e.config.baseUrl+"/wanneng",console.log("topHeight:"+e.$data.topHeight),e.showLoading(),e.$request.post("/website/api.initialization/Init",{app_id:e.config.app_id,device:e.config.device,scene_id:e.config.scene_id}).then(function(o){e.hideLoading(),e.printf(o.data.token),t.setStorageSync("token",o.data.token),e.$data.token=o.data.token,"toutiao"!=e.config.device&&t.setNavigationBarColor({backgroundColor:o.data.skin.theme.navigationBarBackgroundColor,frontColor:o.data.skin.theme.navigationBarFrontColor}),e.$data.skin=o.data.skin,e.$data.bgColor=o.data.skin.theme.bgColor,e.$data.mainColor=o.data.skin.theme.mainColor,e._Init(a)}).catch(function(t){e.printf(t),e.showErrorView(e.config.errorNodata,t.msg)})},methods:{setBaiduPageInfo:function(t){console.log("百度SEO配置"),console.log(t),"baidu"==this.config.device&&swan.setPageInfo&&swan.setPageInfo({title:t.title?"":t.title,keywords:t.keywords?"":t.keywords,description:t.description?"":t.description,releaseDate:t.releaseDate?"":t.releaseDate,image:t.image?"":t.image,success:function(){console.log("页面基础信息设置完成")}})},_Init:function(t){},printf:function(t){o&&console.log(t)},showLoading:function(){var t=this.$data.loading;t.show=!0,t.loading.show=!0,t.error.show=!1},hideLoading:function(){var t=this.$data.loading;t.show=!1,this.$data.loading=t},showErrorView:function(t,a){var o=this.$data.loading;o.show=!0,o.loading.show=!1,o.loading.show=!1,o.error.show=!0,o.error.icon=t,o.error.title=a,this.$data.loading=o}}};a.default=e}).call(this,o("543d")["default"])},"968f":function(t,a,o){"use strict";o.r(a);var e=o("ca76"),n=o("5093");for(var i in n)"default"!==i&&function(t){o.d(a,t,function(){return n[t]})}(i);o("42b7");var r=o("2877"),s=Object(r["a"])(n["default"],e["a"],e["b"],!1,null,null,null);a["default"]=s.exports},9751:function(t,a,o){"use strict";o.r(a);var e=o("a1af"),n=o("2e97");for(var i in n)"default"!==i&&function(t){o.d(a,t,function(){return n[t]})}(i);var r=o("2877"),s=Object(r["a"])(n["default"],e["a"],e["b"],!1,null,null,null);a["default"]=s.exports},a1af:function(t,a,o){"use strict";var e=function(){var t=this,a=t.$createElement;t._self._c},n=[];o.d(a,"a",function(){return e}),o.d(a,"b",function(){return n})},ca76:function(t,a,o){"use strict";var e=function(){var t=this,a=t.$createElement;t._self._c},n=[];o.d(a,"a",function(){return e}),o.d(a,"b",function(){return n})}},[["b8bf","common/runtime","common/vendor"]]]);