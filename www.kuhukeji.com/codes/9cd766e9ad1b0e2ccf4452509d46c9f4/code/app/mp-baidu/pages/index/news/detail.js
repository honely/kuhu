(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/index/news/detail"],{"1b73":function(t,e,a){},7210:function(t,e,a){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i=n(a("9751"));function n(t){return t&&t.__esModule?t:{default:t}}var s={extends:i.default,data:function(){return{detail:"",bgColor:"#FFF"}},methods:{_Init:function(t){var e=this;e.bgColor=e.$data.skin.theme.bgColor,e.$data.footers=e.$data.skin.footer.list,e.$data.selectColor=e.$data.skin.footer.selectColor,e.getNewsDetailInfo(t.id)},getNewsDetailInfo:function(e){var a=this,i=this;i.$request.post("/website/api.news/detail",{token:t.getStorageSync("token"),news_id:e}).then(function(t){i.hideLoading(),i.$data.detail=t.data,a.setBaiduPageInfo(t.data.seo)}).catch(function(t){console.log("================="),i.printf(t),i.showErrorView(i.config.errorNodata,t.msg)})},linkListener:function(t){this.config.onLinkListener(t)}}};e.default=s}).call(this,a("5486")["default"])},"7a91":function(t,e,a){"use strict";a("6346");var i=s(a("7baf")),n=s(a("3a53"));function s(t){return t&&t.__esModule?t:{default:t}}i.default.mpType="page";var d=new n.default(i.default);d.$mount()},"7baf":function(t,e,a){"use strict";a.r(e);var i=a("dc9b"),n=a("c197");for(var s in n)"default"!==s&&function(t){a.d(e,t,function(){return n[t]})}(s);a("d7df");var d=a("2877"),r=Object(d["a"])(n["default"],i["a"],i["b"],!1,null,null,null);e["default"]=r.exports},c197:function(t,e,a){"use strict";a.r(e);var i=a("7210"),n=a.n(i);for(var s in i)"default"!==s&&function(t){a.d(e,t,function(){return i[t]})}(s);e["default"]=n.a},d7df:function(t,e,a){"use strict";var i=a("1b73"),n=a.n(i);n.a},dc9b:function(t,e,a){"use strict";var i=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("view",{staticClass:"pageContainer",style:"top:"+t.topHeight+"px;background-color:"+t.bgColor,attrs:{_hid:0}},[t._ri(!!t.detail.datas,1)?a("view",{staticClass:"news-detail-box",attrs:{_hid:1}},[a("view",{staticClass:"nd-tit",attrs:{_hid:2}},[t._v(t._s(t.detail.datas.title),3)]),a("view",{staticClass:"nd-date",attrs:{_hid:4}},[t._v(t._s(t.detail.datas.add_time)+"发布",5)]),a("view",{staticClass:"nd-cont",attrs:{_hid:6}},[a("rich-view",{attrs:{rDatas:t.detail.datas.detail,_hid:7,_batrs:"rDatas",_cid:0}}),t._ri(!!t.detail.datas.photo,1009)?a("image",{staticClass:"nd-img",attrs:{src:t.detail.datas.photo,mode:"widthFix",_hid:1009,_batrs:"src"}}):t._e()],1),a("view",{staticClass:"relevant-recommend",attrs:{_hid:1010}},[a("view",{staticClass:"rr-header",attrs:{_hid:1011}},[a("text",{style:"border-bottom-color:"+t.mainColor+";",attrs:{_hid:1012}},[])]),a("view",{staticClass:"recommend-box",attrs:{_hid:1014}},t._l(t.detail.recommend,function(e,i,n){var s=void 0!==n?n:i;return a("view",{key:i,staticClass:"item-recommend",attrs:{"open-type":"redirect",_hid:1015,_fid:s,_fk:"index"},on:{click:function(a){t.linkListener("detail?id="+e.news_id)}}},[a("view",{staticClass:"ir-title ellipsis-01",attrs:{_hid:1016,_fid:s}},[t._v(t._s(e.title),1017,s)]),a("view",{staticClass:"ir-date",attrs:{_hid:1018,_fid:s}},[t._v(t._s(e.add_time),1019,s)])])},1015,t._self))])]):t._e(),a("ui-loading",{attrs:{loading:t.loading,_hid:1020,_batrs:"loading",_cid:1}})],1)},n=[];a.d(e,"a",function(){return i}),a.d(e,"b",function(){return n})}},[["7a91","common/runtime","common/vendor"]]]);