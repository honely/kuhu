(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["pages/plugin/index"],{"0903":function(t,a,i){"use strict";i.r(a);var o=i("de7c"),e=i("fdbd");for(var n in e)"default"!==n&&function(t){i.d(a,t,function(){return e[t]})}(n);var d=i("2877"),r=Object(d["a"])(e["default"],o["a"],o["b"],!1,null,null,null);a["default"]=r.exports},"36b2":function(t,a,i){"use strict";(function(t){Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var i={data:function(){return{bgColor:"",plugins:[],cData:{type:1,pbottom:0,data:{icon:"icon_quan",title:"领取优惠券"}},tData:{type:1,pbottom:0,data:{icon:"icon_pintuan",title:"拼团速购"}},mDatas:[{icon:"",name:"9.8包邮"},{icon:"",name:"免单"},{icon:"",name:"每日推荐"},{icon:"",name:"淘抢购"},{icon:"",name:"男装"},{icon:"",name:"女装"},{icon:"",name:"鞋帽"},{icon:"",name:"爱包包"}],tabIndex:0,footers:[],selectColor:"#ED3005",tIndex:0,tmp_id:"",imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(t){var a=this;a.wxb.addPage(this),a.wxb.Init(t,function(i){a.$data.footers=a.wxb.skin.footer.list,a.$data.tabIndex=a.wxb.getCurrPageIndex("/pages/plugin/index",a.$data.footers)-0,a.$data.selectColor=a.wxb.skin.footer.selectColor,console.log("tabIndex=>"+a.$data.tabIndex),void 0!=t.tmp_id&&(a.$data.tmp_id=t.tmp_id,a.getTemplateInfo())},0)},onUnload:function(){this.wxb.removePage()},methods:{receiveCoupon:function(t){console.log(t);var a=this;a.wxb.Post("/shop/api.coupon/receiveCoupon",{coupon_id:t},function(t){})},goodsTabListener:function(t){var a=this;a.$data.tIndex=t;var i=a.$data.plugins,o="";for(var e in i)"plugin-product"==i[e].plug&&(o=i[e]);a.wxb.Post("/shop/api.page/goods",{cat_id:o.show_data.cats[a.$data.tIndex].cat_id,num:o.datas.num,orerby:o.datas.orerby},function(t){for(var o in i)"plugin-product"==i[o].plug&&(i[o].show_data.list=t.list);a.$data.plugins=i})},getTemplateInfo:function(){var a=this;this.wxb.Post("/shop/api.page/getTmpDetail",{tmp_id:a.$data.tmp_id},function(i){a.$data.data=i;var o=i.plugins;for(var e in o)if("plugin-product"==o[e].plug){console.log(i.plugins[e]);var n=o[e].show_data.cats,d={name:"推荐",cat_id:"0"};n.splice(0,0,d),o[e].cats=n}a.$data.plugins=o,t.setNavigationBarTitle({title:i.title}),1==i.is_theme?(t.setNavigationBarColor({frontColor:i.theme.navigationBarFrontColor,backgroundColor:i.theme.navigationBarBackgroundColor}),a.$data.bgColor=i.theme.bgColor):0==i.is_theme&&(t.setNavigationBarColor({frontColor:a.wxb.skin.theme.navigationBarFrontColor,backgroundColor:a.wxb.skin.theme.navigationBarBackgroundColor}),a.$data.bgColor=a.wxb.skin.theme.bgColor),0==i.footer_type?a.$data.footers=[]:1==i.footer_type?(a.$data.footers=a.wxb.skin.footer.list,a.$data.selectColor=a.wxb.skin.footer.selectColor):2==i.footer_type&&(a.$data.footers=i.footer.list,a.$data.selectColor=i.selectColor)})}}};a.default=i}).call(this,i("c11b")["default"])},de7c:function(t,a,i){"use strict";var o=function(){var t=this,a=t.$createElement,i=t._self._c||a;return i("view",{staticClass:"main",attrs:{_hid:0}},[i("scroll-view",{attrs:{"scroll-y":"true",_hid:1}},[i("view",{staticClass:"page-box",style:"background:"+t.bgColor,attrs:{_hid:2}},t._l(t.plugins,function(a,o,e){var n=void 0!==e?e:o;return i("block",{key:o,attrs:{_hid:3,_fid:n,_fk:"index"}},[t._ri(!("plugin-title"!=a.plug),4,void 0!==e?e:o)?i("title-view",{attrs:{iData:a.datas,_hid:4,_fid:n,_batrs:"iData",_cid:0}}):t._e(),t._ri(!("plugin-txt"!=a.plug),1006,void 0!==e?e:o)?i("text-view",{attrs:{tData:a.datas,_hid:1006,_fid:n,_batrs:"tData",_cid:1}}):t._e(),t._ri(!("plugin-photo"!=a.plug),2008,void 0!==e?e:o)?i("image-view",{attrs:{iData:a.datas,_hid:2008,_fid:n,_batrs:"iData",_cid:2}}):t._e(),t._ri(!("plugin-gongge"!=a.plug),3010,void 0!==e?e:o)?i("lattice-view",{attrs:{iData:a.datas,_hid:3010,_fid:n,_batrs:"iData",_cid:3}}):t._e(),t._ri(!("plugin-lunbo"!=a.plug),4012,void 0!==e?e:o)?i("banner-view",{attrs:{iData:a.datas,_hid:4012,_fid:n,_batrs:"iData",_cid:4}}):t._e(),t._ri(!("plugin-tuwen"!=a.plug),5014,void 0!==e?e:o)?i("imgText-view",{attrs:{iData:a.datas,_hid:5014,_fid:n,_batrs:"iData",_cid:5}}):t._e(),t._ri(!("plugin-gonggejiu"!=a.plug),6016,void 0!==e?e:o)?i("pic-view",{attrs:{iData:a.datas,_hid:6016,_fid:n,_batrs:"iData",_cid:6}}):t._e(),t._ri(!("plugin-search"!=a.plug),7018,void 0!==e?e:o)?i("search-view",{attrs:{iData:a.datas,_hid:7018,_fid:n,_batrs:"iData",_cid:7}}):t._e(),t._ri(!("plugin-iconlist"!=a.plug),8020,void 0!==e?e:o)?i("grid-view",{attrs:{iData:a.datas,_hid:8020,_fid:n,_batrs:"iData",_cid:8}}):t._e(),t._ri(!("plugin-tab"!=a.plug),9022,void 0!==e?e:o)?i("tabBar-view",{attrs:{iData:a.datas,_hid:9022,_fid:n,_batrs:"iData",_cid:9}}):t._e(),t._ri(!("plugin-gonggao"!=a.plug),10024,void 0!==e?e:o)?i("notice-view",{attrs:{iData:a.datas,_hid:10024,_fid:n,_batrs:"iData",_cid:10}}):t._e(),t._ri(!("plugin-button"!=a.plug),11026,void 0!==e?e:o)?i("button-view",{attrs:{iData:a.datas,_hid:11026,_fid:n,_batrs:"iData",_cid:11}}):t._e(),t._ri(!("plugin-pintuan"!=a.plug||!a.show_data),12028,void 0!==e?e:o)?i("assemble-view",{attrs:{iData:a.datas,showData:a.show_data,_hid:12028,_fid:n,_batrs:"iData,showData",_cid:12}}):t._e(),t._ri(!("plugin-coupon"!=a.plug||!a.show_data),13030,void 0!==e?e:o)?i("coupon-view",{attrs:{iData:a.datas,showData:a.show_data,_hid:13030,_fid:n,_batrs:"iData,showData",_cid:13},on:{receiveCoupon:t.receiveCoupon}}):t._e(),t._ri(!("plugin-product"!=a.plug||!a.show_data),14032,void 0!==e?e:o)?i("goods-view",{attrs:{iData:a.datas,showData:a.show_data,tIndex:t.tIndex,_hid:14032,_fid:n,_batrs:"iData,showData,tIndex",_cid:14},on:{tapTab:t.goodsTabListener}}):t._e(),t._ri(!("plugin-kanjia"!=a.plug||!a.show_data),15034,void 0!==e?e:o)?i("bargain-view",{attrs:{iData:a.datas,showData:a.show_data,_hid:15034,_fid:n,_batrs:"iData,showData",_cid:15}}):t._e(),t._ri(!("plugin-miaosha"!=a.plug||!a.show_data),16036,void 0!==e?e:o)?i("rush-view",{attrs:{iData:a.datas,showData:a.show_data,_hid:16036,_fid:n,_batrs:"iData,showData",_cid:16}}):t._e()],1)},3,t._self))]),i("view",{staticClass:"temp-view-50",attrs:{_hid:17038}}),i("page-footer",{attrs:{footer:t.footers,length:t.footers.length,tabIndex:t.tabIndex,color:t.selectColor,_hid:17039,_batrs:"footer,length,tabIndex,color",_cid:17}}),i("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",_hid:18041,_batrs:"img",_cid:18}}),i("ToastView",{attrs:{_hid:19043,_cid:19}})],1)},e=[];i.d(a,"a",function(){return o}),i.d(a,"b",function(){return e})},fa11:function(t,a,i){"use strict";i("2346");var o=n(i("0903")),e=n(i("3a53"));function n(t){return t&&t.__esModule?t:{default:t}}o.default.mpType="page";var d=new e.default(o.default);d.$mount()},fdbd:function(t,a,i){"use strict";i.r(a);var o=i("36b2"),e=i.n(o);for(var n in o)"default"!==n&&function(t){i.d(a,t,function(){return o[t]})}(n);a["default"]=e.a}},[["fa11","common/runtime","common/vendor"]]]);