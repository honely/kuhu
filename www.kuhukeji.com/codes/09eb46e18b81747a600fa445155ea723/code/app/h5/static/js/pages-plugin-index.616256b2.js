(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-plugin-index"],{"0903":function(t,a,e){"use strict";e.r(a);var o=e("4529"),i=e("fdbd");for(var n in i)"default"!==n&&function(t){e.d(a,t,function(){return i[t]})}(n);var s=e("2877"),r=Object(s["a"])(i["default"],o["a"],o["b"],!1,null,"0b3e4596",null);a["default"]=r.exports},"1a19":function(t,a,e){"use strict";Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var o={data:function(){return{bgColor:"",plugins:[],cData:{type:1,pbottom:0,data:{icon:"icon_quan",title:"领取优惠券"}},tData:{type:1,pbottom:0,data:{icon:"icon_pintuan",title:"拼团速购"}},mDatas:[{icon:"",name:"9.8包邮"},{icon:"",name:"免单"},{icon:"",name:"每日推荐"},{icon:"",name:"淘抢购"},{icon:"",name:"男装"},{icon:"",name:"女装"},{icon:"",name:"鞋帽"},{icon:"",name:"爱包包"}],tabIndex:0,footers:[],selectColor:"#ED3005",tIndex:0,tmp_id:"",imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(t){var a=this;a.wxb.addPage(this),a.wxb.Init(t,function(e){a.$data.footers=a.wxb.skin.footer.list,a.$data.tabIndex=a.wxb.getCurrPageIndex("/pages/plugin/index",a.$data.footers)-0,a.$data.selectColor=a.wxb.skin.footer.selectColor,console.log("tabIndex=>"+a.$data.tabIndex),void 0!=t.tmp_id&&(a.$data.tmp_id=t.tmp_id,a.getTemplateInfo())},0)},onUnload:function(){this.wxb.removePage()},methods:{receiveCoupon:function(t){console.log(t);var a=this;a.wxb.Post("/shop/api.coupon/receiveCoupon",{coupon_id:t},function(t){})},goodsTabListener:function(t){var a=this;a.$data.tIndex=t;var e=a.$data.plugins,o="";for(var i in e)"plugin-product"==e[i].plug&&(o=e[i]);a.wxb.Post("/shop/api.page/goods",{cat_id:o.show_data.cats[a.$data.tIndex].cat_id,num:o.datas.num,orerby:o.datas.orerby},function(t){for(var o in e)"plugin-product"==e[o].plug&&(e[o].show_data.list=t.list);a.$data.plugins=e})},getTemplateInfo:function(){var t=this;this.wxb.Post("/shop/api.page/getTmpDetail",{tmp_id:t.$data.tmp_id},function(a){t.$data.data=a;var e=a.plugins;for(var o in e)if("plugin-product"==e[o].plug){console.log(a.plugins[o]);var i=e[o].show_data.cats,n={name:"推荐",cat_id:"0"};i.splice(0,0,n),e[o].cats=i}t.$data.plugins=e,uni.setNavigationBarTitle({title:a.title}),1==a.is_theme?(uni.setNavigationBarColor({frontColor:a.theme.navigationBarFrontColor,backgroundColor:a.theme.navigationBarBackgroundColor}),t.$data.bgColor=a.theme.bgColor):0==a.is_theme&&(uni.setNavigationBarColor({frontColor:t.wxb.skin.theme.navigationBarFrontColor,backgroundColor:t.wxb.skin.theme.navigationBarBackgroundColor}),t.$data.bgColor=t.wxb.skin.theme.bgColor),0==a.footer_type?t.$data.footers=[]:1==a.footer_type?(t.$data.footers=t.wxb.skin.footer.list,t.$data.selectColor=t.wxb.skin.footer.selectColor):2==a.footer_type&&(t.$data.footers=a.footer.list,t.$data.selectColor=a.selectColor)})}}};a.default=o},4529:function(t,a,e){"use strict";var o=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("v-uni-view",{staticClass:"main"},[e("v-uni-scroll-view",{attrs:{"scroll-y":""}},[e("v-uni-view",{staticClass:"page-box",style:"background:"+t.bgColor},[t._l(t.plugins,function(a,o){return["plugin-title"==a.plug?e("title-view",{key:o+"_0",attrs:{iData:a.datas}}):t._e(),"plugin-txt"==a.plug?e("text-view",{key:o+"_1",attrs:{tData:a.datas}}):t._e(),"plugin-photo"==a.plug?e("image-view",{key:o+"_2",attrs:{iData:a.datas}}):t._e(),"plugin-gongge"==a.plug?e("lattice-view",{key:o+"_3",attrs:{iData:a.datas}}):t._e(),"plugin-lunbo"==a.plug?e("banner-view",{key:o+"_4",attrs:{iData:a.datas}}):t._e(),"plugin-tuwen"==a.plug?e("imgText-view",{key:o+"_5",attrs:{iData:a.datas}}):t._e(),"plugin-gonggejiu"==a.plug?e("pic-view",{key:o+"_6",attrs:{iData:a.datas}}):t._e(),"plugin-search"==a.plug?e("search-view",{key:o+"_7",attrs:{iData:a.datas}}):t._e(),"plugin-iconlist"==a.plug?e("grid-view",{key:o+"_8",attrs:{iData:a.datas}}):t._e(),"plugin-tab"==a.plug?e("tabBar-view",{key:o+"_9",attrs:{iData:a.datas}}):t._e(),"plugin-gonggao"==a.plug?e("notice-view",{key:o+"_10",attrs:{iData:a.datas}}):t._e(),"plugin-button"==a.plug?e("button-view",{key:o+"_11",attrs:{iData:a.datas}}):t._e(),"plugin-pintuan"==a.plug&&a.show_data?e("assemble-view",{key:o+"_12",attrs:{iData:a.datas,showData:a.show_data}}):t._e(),"plugin-coupon"==a.plug&&a.show_data?e("coupon-view",{key:o+"_13",attrs:{iData:a.datas,showData:a.show_data},on:{receiveCoupon:function(a){a=t.$handleEvent(a),t.receiveCoupon(a)}}}):t._e(),"plugin-product"==a.plug&&a.show_data?e("goods-view",{key:o+"_14",attrs:{iData:a.datas,showData:a.show_data,tIndex:t.tIndex},on:{tapTab:function(a){a=t.$handleEvent(a),t.goodsTabListener(a)}}}):t._e(),"plugin-kanjia"==a.plug&&a.show_data?e("bargain-view",{key:o+"_15",attrs:{iData:a.datas,showData:a.show_data}}):t._e(),"plugin-miaosha"==a.plug&&a.show_data?e("rush-view",{key:o+"_16",attrs:{iData:a.datas,showData:a.show_data}}):t._e()]})],2)],1),e("v-uni-view",{staticClass:"temp-view-50"}),e("page-footer",{attrs:{footer:t.footers,length:t.footers.length,tabIndex:t.tabIndex,color:t.selectColor}}),e("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif"}}),e("ToastView")],1)},i=[];e.d(a,"a",function(){return o}),e.d(a,"b",function(){return i})},fdbd:function(t,a,e){"use strict";e.r(a);var o=e("1a19"),i=e.n(o);for(var n in o)"default"!==n&&function(t){e.d(a,t,function(){return o[t]})}(n);a["default"]=i.a}}]);