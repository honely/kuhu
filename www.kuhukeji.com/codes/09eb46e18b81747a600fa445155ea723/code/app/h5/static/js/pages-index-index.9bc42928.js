(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-index-index"],{"352f":function(t,a,e){"use strict";var o=e("9471"),i=e.n(o);i.a},7847:function(t,a,e){"use strict";e.r(a);var o=e("cce5"),i=e.n(o);for(var n in o)"default"!==n&&function(t){e.d(a,t,function(){return o[t]})}(n);a["default"]=i.a},"83d8":function(t,a,e){"use strict";e.r(a);var o=e("b5a4"),i=e("7847");for(var n in i)"default"!==n&&function(t){e.d(a,t,function(){return i[t]})}(n);e("352f");var s=e("2877"),r=Object(s["a"])(i["default"],o["a"],o["b"],!1,null,"f5d26aac",null);a["default"]=r.exports},9471:function(t,a,e){var o=e("cec7");"string"===typeof o&&(o=[[t.i,o,""]]),o.locals&&(t.exports=o.locals);var i=e("4f06").default;i("1fe8896e",o,!0,{sourceMap:!1,shadowMode:!1})},b5a4:function(t,a,e){"use strict";var o=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("v-uni-view",{staticClass:"main"},[e("v-uni-scroll-view",{attrs:{"scroll-y":""}},[e("v-uni-view",{staticClass:"page-box",style:"background:"+t.bgColor},[t._l(t.plugins,function(a,o){return["plugin-title"==a.plug?e("title-view",{key:o+"_0",attrs:{iData:a.datas}}):t._e(),"plugin-txt"==a.plug?e("text-view",{key:o+"_1",attrs:{tData:a.datas}}):t._e(),"plugin-photo"==a.plug?e("image-view",{key:o+"_2",attrs:{iData:a.datas}}):t._e(),"plugin-gongge"==a.plug?e("lattice-view",{key:o+"_3",attrs:{iData:a.datas}}):t._e(),"plugin-lunbo"==a.plug?e("banner-view",{key:o+"_4",attrs:{iData:a.datas}}):t._e(),"plugin-tuwen"==a.plug?e("imgText-view",{key:o+"_5",attrs:{iData:a.datas}}):t._e(),"plugin-gonggejiu"==a.plug?e("pic-view",{key:o+"_6",attrs:{iData:a.datas}}):t._e(),"plugin-search"==a.plug?e("search-view",{key:o+"_7",attrs:{iData:a.datas}}):t._e(),"plugin-iconlist"==a.plug?e("grid-view",{key:o+"_8",attrs:{iData:a.datas}}):t._e(),"plugin-tab"==a.plug?e("tabBar-view",{key:o+"_9",attrs:{iData:a.datas}}):t._e(),"plugin-gonggao"==a.plug?e("notice-view",{key:o+"_10",attrs:{iData:a.datas}}):t._e(),"plugin-button"==a.plug?e("button-view",{key:o+"_11",attrs:{iData:a.datas}}):t._e(),"plugin-pintuan"==a.plug&&a.show_data?e("assemble-view",{key:o+"_12",attrs:{iData:a.datas,showData:a.show_data}}):t._e(),"plugin-coupon"==a.plug&&a.show_data?e("coupon-view",{key:o+"_13",attrs:{iData:a.datas,showData:a.show_data},on:{receiveCoupon:function(a){a=t.$handleEvent(a),t.receiveCoupon(a)}}}):t._e(),"plugin-product"==a.plug&&a.show_data?e("goods-view",{key:o+"_14",attrs:{iData:a.datas,showData:a.show_data,tIndex:t.tIndex},on:{tapTab:function(a){a=t.$handleEvent(a),t.goodsTabListener(a)}}}):t._e(),"plugin-kanjia"==a.plug&&a.show_data?e("bargain-view",{key:o+"_15",attrs:{iData:a.datas,showData:a.show_data}}):t._e(),"plugin-miaosha"==a.plug&&a.show_data?e("rush-view",{key:o+"_16",attrs:{iData:a.datas,showData:a.show_data}}):t._e()]})],2)],1),e("v-uni-view",{staticClass:"temp-view-50"}),e("page-footer",{attrs:{footer:t.footers,length:t.footers.length,tabIndex:t.tabIndex,color:t.selectColor}}),e("LoadingView"),e("ToastView")],1)},i=[];e.d(a,"a",function(){return o}),e.d(a,"b",function(){return i})},cce5:function(t,a,e){"use strict";Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var o={data:function(){return{userid:0,shareTitle:"",bgColor:"",plugins:[],cData:{type:1,pbottom:0,data:{icon:"icon_quan",title:"领取优惠券"}},tData:{type:1,pbottom:0,data:{icon:"icon_pintuan",title:"拼团速购"}},mDatas:[{icon:"",name:"9.8包邮"},{icon:"",name:"免单"},{icon:"",name:"每日推荐"},{icon:"",name:"淘抢购"},{icon:"",name:"男装"},{icon:"",name:"女装"},{icon:"",name:"鞋帽"},{icon:"",name:"爱包包"}],tabIndex:0,footers:[],selectColor:"#ED3005",tIndex:0}},onLoad:function(t){var a=this,e=uni.getStorageSync("user_id");void 0!=e&&""!=e&&(a.$data.userid=e),void 0!=t.pid&&""!=t.pid&&uni.setStorageSync("pid",t.pid),a.wxb.addPage(this),a.wxb.Init(t,function(t){a.$data.footers=a.wxb.skin.footer.list,a.$data.tabIndex=a.wxb.getCurrPageIndex("/pages/index/index",a.$data.footers)-0,a.$data.selectColor=a.wxb.skin.footer.selectColor,a.getPageInfo()},0)},onUnload:function(){this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:t.$data.shareTitle?t.$data.shareTitle:"营销电商",path:"/pages/index/index?pid="+t.$data.userid}},methods:{receiveCoupon:function(t){console.log(t);var a=this;a.wxb.Post("/shop/api.coupon/receiveCoupon",{coupon_id:t},function(t){})},goodsTabListener:function(t){var a=this;a.$data.tIndex=t;var e=a.$data.plugins,o="";for(var i in e)if("plugin-product"==e[i].plug){o=e[i];break}a.wxb.Post("/shop/api.page/goods",{cat_id:o.show_data.cats[a.$data.tIndex].cat_id,num:o.datas.num,orerby:o.datas.orerby},function(t){for(var o in e)"plugin-product"==e[o].plug&&(e[o].show_data.list=t.list);a.$data.plugins=e})},getPageInfo:function(){var t=this;uni.setNavigationBarTitle({title:"加载中..."}),this.wxb.Post("/shop/api.page/getPage",{page_id:""},function(a){"baidu"==t.wxb.device&&swan.setPageInfo&&swan.setPageInfo({title:a.seo.title?"":a.seo.title,keywords:a.seo.keywords?"":a.seo.keywords,description:a.seo.description?"":a.seo.description,releaseDate:a.seo.releaseDate?"":a.seo.releaseDate,image:a.seo.image?"":a.seo.image,success:function(){console.log("百度SEO信息设置完成")}}),t.$data.data=a,document.title=a.title;var e=a.plugins;for(var o in e)if("plugin-product"==e[o].plug){var i=e[o].show_data.cats,n={name:"推荐",cat_id:"0"};i.splice(0,0,n),e[o].cats=i}t.$data.plugins=e,uni.setNavigationBarTitle({title:a.title}),t.$data.shareTitle=a.title,1==a.is_theme?(uni.setNavigationBarColor({frontColor:a.theme.navigationBarFrontColor,backgroundColor:a.theme.navigationBarBackgroundColor}),t.$data.bgColor=a.theme.bgColor):0==a.is_theme&&(uni.setNavigationBarColor({frontColor:t.wxb.skin.theme.navigationBarFrontColor,backgroundColor:t.wxb.skin.theme.navigationBarBackgroundColor}),t.$data.bgColor=t.wxb.skin.theme.bgColor),0==a.footer_type?t.$data.footers=[]:1==a.footer_type?(t.$data.footers=t.wxb.skin.footer.list,t.$data.selectColor=t.wxb.skin.footer.selectColor):2==a.footer_type&&(t.$data.footers=a.footer.list,t.$data.selectColor=a.selectColor)})}}};a.default=o},cec7:function(t,a,e){a=t.exports=e("2350")(!1),a.push([t.i,".buy-info[data-v-f5d26aac]{width:100%;height:60px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;background:#fff;position:fixed;bottom:49px;-webkit-box-shadow:0 0 4px 0 rgba(0,0,0,.04);box-shadow:0 0 4px 0 rgba(0,0,0,.04)}.buy-info .buy-desc[data-v-f5d26aac]{width:100%;height:60px;-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;padding:0 15px}",""])}}]);