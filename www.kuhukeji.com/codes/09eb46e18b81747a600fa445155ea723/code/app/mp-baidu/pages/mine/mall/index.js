(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/mine/mall/index"],{"0918":function(t,a,i){"use strict";var s=i("0b42"),e=i.n(s);e.a},"0b42":function(t,a,i){},"28fa":function(t,a,i){"use strict";var s=function(){var t=this,a=t.$createElement,i=t._self._c||a;return i("view",{staticClass:"mall-box",attrs:{_hid:0}},[t._ri(!!t.userInfo,1)?i("view",{attrs:{_hid:1}},[i("view",{staticClass:"base-info",attrs:{_hid:2}},[i("image",{staticClass:"b-face",attrs:{src:t.userInfo.face,_hid:3,_batrs:"src"}}),i("view",{staticClass:"b-mid",attrs:{_hid:4}},[i("view",{staticClass:"bm-tit",attrs:{_hid:5}},[t._v(t._s(t.userInfo.nickname),6)]),i("view",{staticClass:"bm-num",attrs:{_hid:7}},[i("text",{staticClass:"iconfont icon-",attrs:{_hid:8}}),i("text",{staticClass:"num",attrs:{_hid:9}},[t._v(t._s(t.userInfo.integral),10)])])]),i("navigator",{staticClass:"b-record",staticStyle:{height:"40px"},attrs:{url:"./order/index",_hid:11}},[])],1),i("view",{staticStyle:{background:"#fff","margin-top":"12px"},attrs:{_hid:13}},[i("tab-view",{attrs:{tabBars:t.cat,color:t.selectColor,type:1,_hid:14,_batrs:"tabBars,color,type",_cid:0},on:{tapTab:t.tabClickListener}})],1),i("view",{staticClass:"goods-list",attrs:{_hid:1016}},t._l(t.list,function(a,s,e){var r=void 0!==e?e:s;return i("view",{key:s,staticClass:"item-goods",style:"padding-right:"+(s%2==0?"2px":"0px")+";padding-left:"+(s%2==1?"2px":"0px")+";",attrs:{_hid:1017,_fid:r,_fk:"index"}},[i("navigator",{attrs:{url:"detail?id="+a.goods_id,_hid:1018,_fid:r,_batrs:"url"}},[i("view",{staticClass:"g-cont",attrs:{_hid:1019,_fid:r}},[i("view",{staticClass:"thumb-img",attrs:{_hid:1020,_fid:r}},[i("image",{staticClass:"img",attrs:{src:a.photo,_hid:1021,_fid:r,_batrs:"src"}}),i("text",{staticClass:"g-num",attrs:{_hid:1022,_fid:r}},[t._v("剩余"+t._s(a.goods_num),1023,r)])]),i("view",{staticClass:"desc-info",attrs:{_hid:1024,_fid:r}},[i("view",{staticClass:"g-name ellipsis-02",attrs:{_hid:1025,_fid:r}},[t._v(t._s(a.goods_name),1026,r)]),i("view",{staticClass:"g-price",attrs:{_hid:1027,_fid:r}},[i("view",{staticClass:"gp-detail",attrs:{_hid:1028,_fid:r}},[i("view",{staticClass:"coin-num",attrs:{_hid:1029,_fid:r}},[i("image",{staticStyle:{width:"16px",height:"16px"},attrs:{src:t.imgBaseUrl+"/mine/icon_integral@3x.png",_hid:1030,_fid:r,_batrs:"src"}}),i("text",{attrs:{_hid:1031,_fid:r}},[t._v(t._s(a.integral),1032,r)])]),i("text",{staticClass:"money-num",attrs:{_hid:1033,_fid:r}},[t._v("+"+t._s(a.shop_price),1034,r)])]),i("view",{staticClass:"gp-exchange",attrs:{_hid:1035,_fid:r}},[])])])])])],1)},1017,t._self)),t._ri(!(1!=t.more),1037)?i("view",{staticClass:"more",staticStyle:{"border-bottom-width":"0"},attrs:{_hid:1037},on:{click:t.getPinTuanList}},[]):t._e(),t._ri(!(0!=t.more),1039)?i("view",{staticClass:"nodata",staticStyle:{"border-bottom-width":"0"},attrs:{_hid:1039}},[]):t._e()]):t._e(),i("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",_hid:1041,_batrs:"img",_cid:1}}),i("ToastView",{attrs:{_hid:2043,_cid:2}})],1)},e=[];i.d(a,"a",function(){return s}),i.d(a,"b",function(){return e})},"704b":function(t,a,i){"use strict";i("2346");var s=r(i("a681")),e=r(i("3a53"));function r(t){return t&&t.__esModule?t:{default:t}}s.default.mpType="page";var n=new e.default(s.default);n.$mount()},"8fdc":function(t,a,i){"use strict";i.r(a);var s=i("9128"),e=i.n(s);for(var r in s)"default"!==r&&function(t){i.d(a,t,function(){return s[t]})}(r);a["default"]=e.a},9128:function(t,a,i){"use strict";(function(t){Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var i={data:function(){return{userid:0,selectColor:"#ED3005",cat:[],list:[],userInfo:"",cat_id:"-1",page:1,more:0,imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(a){var i=this,s=t.getStorageSync("user_id");void 0!=s&&""!=s&&(i.$data.userid=s),void 0!=a.pid&&""!=a.pid&&t.setStorageSync("pid",a.pid),i.wxb.printLog("=============onLoad================"),i.wxb.addPage(this),i.wxb.Init(a,function(t){i.getMallInfo()})},onUnload:function(){this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:""==t.$data.companyName?"积分商城":t.$data.companyName,path:"/pages/mine/mall/index?pid="+t.$data.userid}},methods:{getMallInfo:function(t){var a=this,i=a.$data.page,s=a.$data.list;1==i&&(s=[]),a.wxb.Post("/shop/api.integral/index",{cat_id:a.$data.cat_id,page:a.$data.page},function(t){for(var i in"baidu"==a.wxb.device&&swan.setPageInfo&&swan.setPageInfo({title:t.seo.title?"":t.seo.title,keywords:t.seo.keywords?"":t.seo.keywords,description:t.seo.description?"":t.seo.description,releaseDate:t.seo.releaseDate?"":t.seo.releaseDate,image:t.seo.image?"":t.seo.image,success:function(){console.log("百度SEO信息设置完成")}}),t.list)s.push(t.list[i]);a.$data.list=s,a.$data.userInfo=t.user,a.$data.more=t.isMore;var e=[];for(var r in e.push({cat_id:"-1",name:"全部",is_hot:0}),e.push({cat_id:"0",name:"推荐",is_hot:0}),t.cat)e.push(t.cat[r]);console.log(e),a.$data.cat=e,console.log(a.$data.cat)})},tabClickListener:function(t){var a=this.$data.cat;this.$data.cat_id=a[t].cat_id,this.$data.page=1,this.getMallInfo()}}};a.default=i}).call(this,i("5486")["default"])},a681:function(t,a,i){"use strict";i.r(a);var s=i("28fa"),e=i("8fdc");for(var r in e)"default"!==r&&function(t){i.d(a,t,function(){return e[t]})}(r);i("0918");var n=i("2877"),o=Object(n["a"])(e["default"],s["a"],s["b"],!1,null,null,null);a["default"]=o.exports}},[["704b","common/runtime","common/vendor"]]]);