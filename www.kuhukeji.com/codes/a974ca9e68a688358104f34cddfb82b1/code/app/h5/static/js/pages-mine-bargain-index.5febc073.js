(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-mine-bargain-index"],{"153e":function(i,a,t){a=i.exports=t("2350")(!1),a.push([i.i,".bargain-box[data-v-cabc5788]{width:100%;position:absolute;bottom:0;top:0;display:block;overflow-y:scroll}.bargain-list[data-v-cabc5788]{width:100%;display:block;padding:6px 15px}.bargain-list .item-bargain[data-v-cabc5788]{width:100%;display:inline-block;background:#fff;border-radius:8px;margin:6px 0}.bargain-list .item-bargain .bargain-top[data-v-cabc5788]{width:100%;height:48px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;padding:0 15px}.item-bargain .goods-info[data-v-cabc5788]{width:100%;padding:10px 15px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;background:#f5f6f7}.item-bargain .goods-info .g-img[data-v-cabc5788]{width:100px;height:100px;\n\t/* background: #f00; */position:relative}.item-bargain .goods-info .g-img uni-image[data-v-cabc5788]{width:100%;height:100%}.item-bargain .goods-info .g-img .t-num[data-v-cabc5788]{position:absolute;top:0;left:0;height:20px;line-height:20px;color:#fff;font-size:12px;border-bottom-right-radius:10px;background:#ff8c00;padding:0 8px}.item-bargain .goods-info .g-cont[data-v-cabc5788]{width:100%;-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1;display:block;margin-left:10px}.item-bargain .goods-info .g-cont .price[data-v-cabc5788]{width:100%;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;margin-top:8px}.g-cont .price .item-price[data-v-cabc5788]{font-size:14px;color:#666;margin-right:20px}.item-bargain .goods-info .g-cont .name[data-v-cabc5788]{color:#2d3133;font-size:16px}.item-bargain .goods-info .g-cont .sku[data-v-cabc5788]{width:100%;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;margin-top:12px;color:#666;font-size:14px}.item-bargain .goods-info .g-cont .state[data-v-cabc5788]{height:18px;line-height:18px;border:1px solid #ed3005;border-radius:2px;color:#ed3005;font-size:14px;padding:0 6px;margin-top:6px;display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex}.item-bargain .bottom-info[data-v-cabc5788]{width:100%;height:67px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;padding:0 10px;-webkit-box-pack:end;-webkit-justify-content:flex-end;-ms-flex-pack:end;justify-content:flex-end}.btn-01[data-v-cabc5788]{height:36px;line-height:36px;padding:0 10px;color:#000;font-size:16px;border:1px solid #ccc;border-radius:4px;margin:15px 5px}.btn-02[data-v-cabc5788]{height:36px;line-height:36px;padding:0 10px;font-size:16px;border-radius:4px;margin:15px 5px;color:#ed3005;border:1px solid #ed3005}.btn-03[data-v-cabc5788]{height:36px;line-height:36px;padding:0 10px;font-size:16px;border-radius:4px;margin:15px 5px;color:#fff;border:1px solid #ed3005;background:#ed3005}",""])},"8fa4":function(i,a,t){"use strict";var e=function(){var i=this,a=i.$createElement,t=i._self._c||a;return t("v-uni-view",{staticClass:"bargain-box"},[i.list.length>0?t("v-uni-view",{staticClass:"bargain-list"},[i._l(i.list,function(a,e){return t("v-uni-view",{key:e,staticClass:"item-bargain"},[t("v-uni-view",{staticClass:"bargain-top"},[t("v-uni-text",{staticStyle:{flex:"1"}},[i._v("砍价记录")])],1),t("v-uni-view",{staticClass:"goods-info"},[t("v-uni-view",{staticClass:"g-img"},[t("v-uni-image",{attrs:{src:a.photo}})],1),t("v-uni-view",{staticClass:"g-cont"},[t("v-uni-view",{staticClass:"name ellipsis-02"},[i._v(i._s(a.goods_name))]),t("v-uni-view",{staticClass:"sku"},[t("v-uni-text",{staticStyle:{flex:"1"}},[i._v(i._s(a.key_name))]),t("v-uni-text",[i._v("x1")])],1),t("v-uni-view",{staticClass:"price"},[t("v-uni-view",{staticClass:"item-price"},[t("v-uni-text",[i._v("已砍")]),t("v-uni-text",{staticStyle:{color:"#ED3005","margin-left":"4px"}},[i._v("¥"+i._s(a.now_price))])],1),t("v-uni-view",{staticClass:"item-price"},[t("v-uni-text",[i._v("还剩")]),t("v-uni-text",{staticStyle:{color:"#ED3005","margin-left":"4px"}},[i._v("¥"+i._s(a.surplus_price))])],1)],1)],1)],1),t("v-uni-view",{staticClass:"bottom-info"},[t("v-uni-text",{staticClass:"btn-01",on:{click:function(t){t=i.$handleEvent(t),i.toBargainDetail(a.bargain_item_id)}}},[i._v("查看砍价详情")])],1)],1)}),i.more?t("v-uni-view",{staticClass:"more",attrs:{bindtap:"loadMore"}},[i._v("点击查看更多")]):i._e(),i.more?i._e():t("v-uni-view",{staticClass:"nodata"},[i._v("已经全部为你呈现了")])],2):i._e(),t("LoadingView",{attrs:{img:i.imgBaseUrl+"/loading.gif"}}),t("ToastView")],1)},n=[];t.d(a,"a",function(){return e}),t.d(a,"b",function(){return n})},ac0c:function(i,a,t){"use strict";t.r(a);var e=t("c534"),n=t.n(e);for(var o in e)"default"!==o&&function(i){t.d(a,i,function(){return e[i]})}(o);a["default"]=n.a},b375:function(i,a,t){"use strict";var e=t("e191"),n=t.n(e);n.a},c534:function(i,a,t){"use strict";Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var e={data:function(){return{page:1,more:0,list:[],imgBaseUrl:"",userid:0}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(i){var a=this,t=uni.getStorageSync("user_id");void 0!=t&&""!=t&&(a.$data.userid=t),void 0!=i.pid&&""!=i.pid&&uni.setStorageSync("pid",i.pid),a.wxb.addPage(this),a.wxb.Init(i,function(i){a.getBargainList()})},onUnload:function(){this.wxb.removePage()},onShareAppMessage:function(){var i=this;return{title:""==i.$data.companyName?"O2O电商小程序":i.$data.companyName,path:"/pages/index/index?pid="+i.$data.userid}},methods:{toBargainDetail:function(i){uni.navigateTo({url:"/pages/index/bargain/join?bargain_item_id="+i+"&kan_price=0"})},getBargainList:function(i){var a=this,t=a.$data.page,e=a.$data.list;1==t&&(e=[]),a.wxb.Post("/shop/api.bargain/getMyBargain",{page:a.$data.page},function(i){for(var t in i.list)e.push(i.list[t]);a.$data.list=i.list,a.$data.more=i.isMore,a.$data.page+=1})}}};a.default=e},e191:function(i,a,t){var e=t("153e");"string"===typeof e&&(e=[[i.i,e,""]]),e.locals&&(i.exports=e.locals);var n=t("4f06").default;n("1e7aa497",e,!0,{sourceMap:!1,shadowMode:!1})},e929:function(i,a,t){"use strict";t.r(a);var e=t("8fa4"),n=t("ac0c");for(var o in n)"default"!==o&&function(i){t.d(a,i,function(){return n[i]})}(o);t("b375");var s=t("2877"),d=Object(s["a"])(n["default"],e["a"],e["b"],!1,null,"cabc5788",null);a["default"]=d.exports}}]);