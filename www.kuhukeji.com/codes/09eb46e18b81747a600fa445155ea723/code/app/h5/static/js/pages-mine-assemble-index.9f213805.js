(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-mine-assemble-index"],{3394:function(e,t,i){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var s={data:function(){return{tabIndex:0,list:"",page:1,more:0,imgBaseUrl:"",userid:0}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(e){var t=this,i=uni.getStorageSync("user_id");void 0!=i&&""!=i&&(t.$data.userid=i),void 0!=e.pid&&""!=e.pid&&uni.setStorageSync("pid",e.pid),t.wxb.addPage(this),t.wxb.Init(e,function(e){t.getAssembleList()})},onUnload:function(){this.wxb.removePage()},onShareAppMessage:function(){var e=this;return{title:""==e.$data.companyName?"O2O电商小程序":e.$data.companyName,path:"/pages/index/index?pid="+e.$data.userid}},methods:{tabListener:function(e){this.$data.tabIndex=e,this.$data.page=1,this.$data.list=[],this.getAssembleList()},getAssembleList:function(e){var t=this,i=t.$data.list,s=t.$data.page;1==s&&(i=[]),t.wxb.Post("/shop/api.groupbuy/getMyGroupBuy",{type:t.$data.tabIndex,page:s},function(e){for(var s in e.list)i.push(e.list[s]);t.$data.list=i,t.$data.more=e.isMore,t.$data.page+=1})}}};t.default=s},"48a5":function(e,t,i){"use strict";var s=i("f79f"),a=i.n(s);a.a},"4f6f":function(e,t,i){t=e.exports=i("2350")(!1),t.push([e.i,".assemble-box[data-v-816e8566]{width:100%;position:absolute;bottom:0;top:0;display:block;overflow-y:scroll}.assemble-box .assemble-tab[data-v-816e8566]{width:100%;height:50px;background:#fff;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-pack:center;-webkit-justify-content:center;-ms-flex-pack:center;justify-content:center}.assemble-box .assemble-tab .item-tab[data-v-816e8566]{height:46px;display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;color:#333;font-size:16px;border-bottom:4px solid #ed3005;border-bottom-color:#fff;margin:0 16px}.assemble-box .assemble-tab .item-tab.active[data-v-816e8566]{color:#ed3005;font-size:20px;border-bottom-color:#ed3005}.assemble-list[data-v-816e8566]{width:100%;display:block;padding:6px 15px}.assemble-list .item-assemble[data-v-816e8566]{width:100%;display:inline-block;background:#fff;border-radius:8px;margin:6px 0}.assemble-list .item-assemble .assemble-top[data-v-816e8566]{width:100%;height:48px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;padding:0 15px}.item-assemble .goods-info[data-v-816e8566]{width:100%;padding:10px 15px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;background:#f5f6f7}.item-assemble .goods-info .g-img[data-v-816e8566]{width:100px;height:100px;\n\t/* background: #f00; */position:relative}.item-assemble .goods-info .g-img uni-image[data-v-816e8566]{width:100%;height:100%}.item-assemble .goods-info .g-img .t-num[data-v-816e8566]{position:absolute;top:0;left:0;height:20px;line-height:20px;color:#fff;font-size:12px;border-bottom-right-radius:10px;background:#ff8c00;padding:0 8px}.item-assemble .goods-info .g-cont[data-v-816e8566]{width:100%;-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1;display:block;margin-left:10px}.item-assemble .goods-info .g-cont .name[data-v-816e8566]{color:#2d3133;font-size:16px}.item-assemble .goods-info .g-cont .sku[data-v-816e8566]{width:100%;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;margin-top:12px;color:#666;font-size:14px}.item-assemble .goods-info .g-cont .state[data-v-816e8566]{height:18px;line-height:18px;border:1px solid #ed3005;border-radius:2px;color:#ed3005;font-size:14px;padding:0 6px;margin-top:6px;display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex}.item-assemble .g-desc[data-v-816e8566]{width:100%;height:52px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;-webkit-box-pack:end;-webkit-justify-content:flex-end;-ms-flex-pack:end;justify-content:flex-end;padding:0 15px;color:#333;font-size:14px;border-bottom:1px solid #ccc}.item-assemble .bottom-info[data-v-816e8566]{width:100%;height:67px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;padding:0 10px;-webkit-box-pack:end;-webkit-justify-content:flex-end;-ms-flex-pack:end;justify-content:flex-end}.btn-01[data-v-816e8566]{height:36px;line-height:36px;padding:0 10px;color:#000;font-size:16px;border:1px solid #ccc;border-radius:4px;margin:15px 5px}.btn-02[data-v-816e8566]{height:36px;line-height:36px;padding:0 10px;font-size:16px;border-radius:4px;margin:15px 5px;color:#ed3005;border:1px solid #ed3005}.btn-03[data-v-816e8566]{height:36px;line-height:36px;padding:0 10px;font-size:16px;border-radius:4px;margin:15px 5px;color:#fff;border:1px solid #ed3005;background:#ed3005}.btn-delete[data-v-816e8566]{width:36px;height:36px;margin:15px 5px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;-webkit-box-pack:center;-webkit-justify-content:center;-ms-flex-pack:center;justify-content:center;border-radius:4px;border:1px #ccc solid;color:#aaafb3}",""])},a90f:function(e,t,i){"use strict";var s=function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("v-uni-view",{staticClass:"assemble-box"},[i("v-uni-view",{staticClass:"assemble-tab"},[i("v-uni-text",{staticClass:"item-tab",class:0==e.tabIndex?"active":"",on:{click:function(t){t=e.$handleEvent(t),e.tabListener(0)}}},[e._v("我发起的")]),i("v-uni-text",{staticClass:"item-tab",class:1==e.tabIndex?"active":"",on:{click:function(t){t=e.$handleEvent(t),e.tabListener(1)}}},[e._v("我参与的")])],1),0==e.tabIndex&&e.list?i("v-uni-view",{staticClass:"assemble-list"},[e._l(e.list,function(t,s){return i("v-uni-view",{key:s,staticClass:"item-assemble"},[i("v-uni-view",{staticClass:"assemble-top"},[i("v-uni-text",{staticStyle:{flex:"1"}}),i("v-uni-text",{staticStyle:{"font-size":"16px",color:"#ED3005"}},[e._v(e._s(t.status_mean))])],1),i("v-uni-view",{staticClass:"goods-info"},[i("v-uni-view",{staticClass:"g-img"},[i("v-uni-image",{attrs:{src:t.photo}}),i("v-uni-text",{staticClass:"t-num"},[e._v(e._s(t.need_num)+"人团")])],1),i("v-uni-view",{staticClass:"g-cont"},[i("v-uni-view",{staticClass:"name ellipsis-02"},[e._v(e._s(t.goods_name))]),i("v-uni-view",{staticClass:"sku"},[i("v-uni-text",{staticStyle:{flex:"1"}},[e._v(e._s(t.key_name))])],1),i("v-uni-text",{staticClass:"state"},[e._v("开团")])],1)],1),i("v-uni-view",{staticClass:"g-desc"},[i("v-uni-text",{staticStyle:{"margin-left":"10px"}},[e._v("合计：")]),i("v-uni-text",{staticStyle:{color:"#000000","font-size":"20px"}},[e._v("¥"+e._s(t.payment_price))]),i("v-uni-text",{staticStyle:{"margin-left":"4px"}},[e._v("(含运费 ¥"+e._s(t.shipping_price)+")")])],1),i("v-uni-view",{staticClass:"bottom-info"},[i("v-uni-navigator",{staticClass:"btn-01",attrs:{url:"../../index/pintuan/assemble?item_id="+t.groupbuy_item_id}},[e._v("查看团详情")])],1)],1)}),1==e.more?i("v-uni-view",{staticClass:"more",on:{click:function(t){t=e.$handleEvent(t),e.getAssembleList(t)}}},[e._v("点击查看更多")]):e._e(),0==e.more?i("v-uni-view",{staticClass:"nodata"},[e._v("已经全部为你呈现了")]):e._e()],2):e._e(),1==e.tabIndex&&e.list?i("v-uni-view",{staticClass:"assemble-list"},[e._l(e.list,function(t,s){return i("v-uni-view",{key:s,staticClass:"item-assemble"},[i("v-uni-view",{staticClass:"assemble-top"},[i("v-uni-text",{staticStyle:{flex:"1"}}),i("v-uni-text",{staticStyle:{"font-size":"16px",color:"#ED3005"}},[e._v(e._s(t.status_mean))])],1),i("v-uni-view",{staticClass:"goods-info"},[i("v-uni-view",{staticClass:"g-img"},[i("v-uni-image",{attrs:{src:t.photo}}),i("v-uni-text",{staticClass:"t-num"},[e._v(e._s(t.need_num)+"人团")])],1),i("v-uni-view",{staticClass:"g-cont"},[i("v-uni-view",{staticClass:"name ellipsis-02"},[e._v(e._s(t.goods_name))]),i("v-uni-view",{staticClass:"sku"},[i("v-uni-text",{staticStyle:{flex:"1"}},[e._v(e._s(t.key_name))]),i("v-uni-text",[e._v("x2")])],1),i("v-uni-text",{staticClass:"state"},[e._v("参团")])],1)],1),i("v-uni-view",{staticClass:"g-desc"},[i("v-uni-text",{staticStyle:{"margin-left":"10px"}},[e._v("合计：")]),i("v-uni-text",{staticStyle:{color:"#000000","font-size":"20px"}},[e._v("¥"+e._s(t.payment_price))]),i("v-uni-text",{staticStyle:{"margin-left":"4px"}},[e._v("(含运费 ¥"+e._s(t.shipping_price)+")")])],1),i("v-uni-view",{staticClass:"bottom-info"},[i("v-uni-navigator",{staticClass:"btn-01",attrs:{url:"../../index/pintuan/assemble?item_id="+t.groupbuy_item_id}},[e._v("查看团详情")])],1)],1)}),1==e.more?i("v-uni-view",{staticClass:"more",on:{click:function(t){t=e.$handleEvent(t),e.getAssembleList(t)}}},[e._v("点击查看更多")]):e._e(),0==e.more?i("v-uni-view",{staticClass:"nodata"},[e._v("已经全部为你呈现了")]):e._e()],2):e._e(),i("LoadingView",{attrs:{img:e.imgBaseUrl+"/loading.gif"}}),i("ToastView")],1)},a=[];i.d(t,"a",function(){return s}),i.d(t,"b",function(){return a})},b2ca:function(e,t,i){"use strict";i.r(t);var s=i("3394"),a=i.n(s);for(var n in s)"default"!==n&&function(e){i.d(t,e,function(){return s[e]})}(n);t["default"]=a.a},c9ab:function(e,t,i){"use strict";i.r(t);var s=i("a90f"),a=i("b2ca");for(var n in a)"default"!==n&&function(e){i.d(t,e,function(){return a[e]})}(n);i("48a5");var l=i("2877"),o=Object(l["a"])(a["default"],s["a"],s["b"],!1,null,"816e8566",null);t["default"]=o.exports},f79f:function(e,t,i){var s=i("4f6f");"string"===typeof s&&(s=[[e.i,s,""]]),s.locals&&(e.exports=s.locals);var a=i("4f06").default;a("a8d613b2",s,!0,{sourceMap:!1,shadowMode:!1})}}]);