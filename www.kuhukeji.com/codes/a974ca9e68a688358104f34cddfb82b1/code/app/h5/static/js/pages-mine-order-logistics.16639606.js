(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-mine-order-logistics"],{"05fd":function(i,t,a){"use strict";var e=a("efc0"),d=a.n(e);d.a},"0772":function(i,t,a){"use strict";var e=function(){var i=this,t=i.$createElement,a=i._self._c||t;return a("v-uni-view",{staticClass:"logistics-box"},[i.data?a("v-uni-view",{staticClass:"lb-cont"},[a("v-uni-view",{staticClass:"base-info"},[a("v-uni-view",{staticClass:"b-header"},[a("v-uni-text",{staticClass:"bh-lt"},[i._v("物流状态")]),a("v-uni-text",{staticClass:"bh-rt"},[i._v(i._s(i.data.shipping_status))])],1),a("v-uni-view",{staticClass:"b-cont"},[a("v-uni-view",{staticClass:"item-cont"},[a("v-uni-text",{staticClass:"ic-tit"},[i._v("运单编号")]),a("v-uni-text",{staticClass:"ic-value"},[i._v(i._s(i.data.shipping_num))])],1),a("v-uni-view",{staticClass:"item-cont"},[a("v-uni-text",{staticClass:"ic-tit"},[i._v("快递公司")]),a("v-uni-text",{staticClass:"ic-value"},[i._v(i._s(i.data.shipping_name))])],1)],1)],1),a("v-uni-view",{staticClass:"logistics-detail"},[a("v-uni-view",{staticClass:"d-header"},[i._v("物流详情")]),0==i.data.data.length?a("v-uni-view",{staticStyle:{padding:"15px",color:"#8a8a8a","font-size":"14px"}},[i._v("暂无物流详情信息")]):i._e(),a("v-uni-view",{staticClass:"d-list"},i._l(i.data.data,function(t,e){return a("v-uni-view",{key:e,staticClass:"item-detail"},[a("v-uni-view",{staticClass:"di-lt"},[a("v-uni-text",{staticClass:"line"}),0==e?a("v-uni-view",{staticClass:"c-cir"},[a("v-uni-text",{staticClass:"point"})],1):i._e(),0!=e?a("v-uni-view",{staticClass:"gray-cir"}):i._e()],1),a("v-uni-view",{staticClass:"di-rt",style:"border-bottom-width:"+(e==i.data.data.length-1?0:"")},[a("v-uni-view",{staticClass:"desc"},[i._v(i._s(t.AcceptStation))]),a("v-uni-view",{staticClass:"date"},[i._v(i._s(t.AcceptTime))])],1)],1)}),1)],1)],1):i._e(),a("LoadingView",{attrs:{img:i.imgBaseUrl+"/loading.gif"}}),a("ToastView")],1)},d=[];a.d(t,"a",function(){return e}),a.d(t,"b",function(){return d})},4696:function(i,t,a){"use strict";a.r(t);var e=a("66ff"),d=a.n(e);for(var s in e)"default"!==s&&function(i){a.d(t,i,function(){return e[i]})}(s);t["default"]=d.a},"66ff":function(i,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var e={data:function(){return{order_id:"",data:"",imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(i){var t=this;t.wxb.printLog(i),t.wxb.addPage(this),t.wxb.Init(i,function(a){i.order_id&&(t.$data.order_id=i.order_id,t.getLogisticsInfo())})},onUnload:function(){this.wxb.removePage()},methods:{getLogisticsInfo:function(){var i=this;i.wxb.Post("/shop/api.order/getShippingInfo",{order_id:i.$data.order_id},function(t){i.$data.data=t})}}};t.default=e},9263:function(i,t,a){"use strict";a.r(t);var e=a("0772"),d=a("4696");for(var s in d)"default"!==s&&function(i){a.d(t,i,function(){return d[i]})}(s);a("05fd");var c=a("2877"),l=Object(c["a"])(d["default"],e["a"],e["b"],!1,null,"13cd92cc",null);t["default"]=l.exports},e757:function(i,t,a){t=i.exports=a("2350")(!1),t.push([i.i,".logistics-box[data-v-13cd92cc]{position:absolute;top:0;left:0;right:0;bottom:0;padding:6px 15px;overflow:scroll}.logistics-box .lb-cont[data-v-13cd92cc]{width:100%;display:block}.lb-cont .logistics-detail[data-v-13cd92cc]{width:100%;background:#fff;margin:6px 0;display:inline-block;border-radius:8px}.logistics-detail .d-header[data-v-13cd92cc]{width:100%;height:50px;line-height:50px;padding:0 15px;border-bottom:1px solid #ccc;color:#333;font-size:18px}.logistics-detail .d-list[data-v-13cd92cc]{width:100%;display:block}.d-list .item-detail[data-v-13cd92cc]{width:100%;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex}.d-list .item-detail .di-lt[data-v-13cd92cc]{width:55px;height:auto;position:relative}.di-lt .line[data-v-13cd92cc]{width:1px;height:100%;background:#ccc;margin:0 27px;display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex}.di-lt .c-cir[data-v-13cd92cc]{width:24px;height:24px;border-radius:50%;background:rgba(237,48,5,.5);display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex;position:absolute;top:25px;left:15px}.di-lt .gray-cir[data-v-13cd92cc]{width:10px;height:10px;border-radius:5px;background:#ccc;display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex;position:absolute;top:33px;left:23px}.di-lt .c-cir .point[data-v-13cd92cc]{width:14px;height:14px;border-radius:7px;background:#ed3005;margin:5px}.d-list .item-detail .di-rt[data-v-13cd92cc]{width:100%;-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1;padding:25px 15px 25px 4px;display:block;border-bottom:1px solid #ccc}.item-detail .di-rt .state[data-v-13cd92cc]{color:#000;font-size:18px}.item-detail .di-rt .desc[data-v-13cd92cc]{margin:12px 0;color:#000;font-size:14px}.item-detail .di-rt .date[data-v-13cd92cc]{font-size:16px;color:#999}.lb-cont .base-info[data-v-13cd92cc]{width:100%;border-radius:8px;background:#fff;margin:6px 0}.lb-cont .base-info .b-header[data-v-13cd92cc]{width:100%;height:50px;line-height:50px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;padding:0 15px;border-bottom:1px solid #ccc}.b-header .bh-lt[data-v-13cd92cc]{-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1;color:#333;font-size:18px}.b-header .bh-rt[data-v-13cd92cc]{color:#ed3005;font-size:18px}.lb-cont .base-info .b-cont[data-v-13cd92cc]{width:100%;padding:8px 16px;display:block}.base-info .b-cont .item-cont[data-v-13cd92cc]{margin:8px 0;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex}.b-cont .item-cont .ic-tit[data-v-13cd92cc]{color:#666;font-size:14px}.b-cont .item-cont .ic-value[data-v-13cd92cc]{margin-left:15px;color:#000;font-size:14px}",""])},efc0:function(i,t,a){var e=a("e757");"string"===typeof e&&(e=[[i.i,e,""]]),e.locals&&(i.exports=e.locals);var d=a("4f06").default;d("1532603a",e,!0,{sourceMap:!1,shadowMode:!1})}}]);