(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-mine-order-refund-index"],{"0acc":function(t,e,i){"use strict";var a=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("v-uni-view",{staticClass:"refund-box"},[i("v-uni-view",{staticClass:"refund-cont"},[t._l(t.detail.order_goods,function(e,a){return i("v-uni-view",{key:a,staticClass:"goods-base"},[i("v-uni-image",{staticClass:"g-img",attrs:{src:e.goods_photo}}),i("v-uni-view",{staticClass:"g-info"},[i("v-uni-view",{staticClass:"gi-name ellipsis-02"},[t._v(t._s(e.goods_name))]),i("v-uni-view",{staticClass:"gi-sku"},[i("v-uni-view",{staticClass:"sku-desc"},[t._v(t._s(e.spec_key_name))]),i("v-uni-view",{staticClass:"goods-num"},[t._v("x"+t._s(e.goods_num))])],1)],1)],1)}),i("v-uni-view",{staticClass:"refund-desc"},[i("v-uni-view",{staticClass:"item-refund",on:{click:function(e){e=t.$handleEvent(e),t.showOrderStateDialog(e)}}},[i("v-uni-view",{staticClass:"ir-lt"},[t._v("货物状态")]),i("v-uni-view",{staticClass:"ir-rt"},[i("v-uni-text",{staticStyle:{color:"#000"}},[t._v(t._s(0==t.stateIndex?"未收到货":"已收到货"))]),i("v-uni-text",{staticClass:"iconfont icon-btn_arrowr"})],1)],1),i("v-uni-view",{staticClass:"item-refund",staticStyle:{"border-bottom-width":"0"},on:{click:function(e){e=t.$handleEvent(e),t.showOrderReasonDialog(e)}}},[i("v-uni-view",{staticClass:"ir-lt"},[t._v("退款原因")]),i("v-uni-view",{staticClass:"ir-rt"},[i("v-uni-text",{style:"color:"+(""==t.resonDesc?"":"#000;")},[t._v(t._s(""==t.resonDesc?"请选择":t.resonDesc))]),i("v-uni-text",{staticClass:"iconfont icon-btn_arrowr"})],1)],1)],1),i("v-uni-view",{staticClass:"refund-money"},[i("v-uni-view",{staticClass:"rm-lt"},[t._v("退款金额")]),i("v-uni-view",{staticClass:"rm-rt"},[t._v("¥"+t._s(t.detail.final_price))])],1),i("v-uni-view",{staticClass:"shopping-num"},[t._v("含发货运费¥"+t._s(t.detail.shipping_price))]),i("v-uni-view",{staticClass:"reason-cont"},[i("v-uni-textarea",{staticClass:"rc-area",attrs:{placeholder:"退款说明（选填）"},on:{input:function(e){e=t.$handleEvent(e),t.reasonChangeListener(e)}}})],1),i("v-uni-view",{staticClass:"reason-img"},[i("v-uni-view",{staticClass:"ri-tit"},[t._v("上传凭证")]),i("v-uni-view",{staticClass:"ri-cont"},[t._l(t.list,function(e,a){return i("v-uni-view",{key:a,staticClass:"model-img"},[i("v-uni-image",{staticStyle:{width:"100%",height:"100%"},attrs:{src:e}}),i("v-uni-image",{staticClass:"iv-delete",attrs:{src:t.imgBaseUrl+"/order/btn_deletePhoto@3x.png"},on:{click:function(e){e=t.$handleEvent(e),t.deletePhotoListener(a)}}})],1)}),t.list.length<6?i("v-uni-view",{staticClass:"model-img"},[i("v-uni-view",{staticClass:"add-img",on:{click:function(e){e=t.$handleEvent(e),t.addPhotoListener(e)}}},[i("v-uni-view",{staticClass:"iconfont icon-btn_photo",staticStyle:{"font-size":"24px"}}),i("v-uni-view",{staticStyle:{"margin-top":"10px"}},[t._v("添加图片")])],1)],1):t._e()],2)],1),i("v-uni-view",{staticStyle:{width:"100%",height:"70px"}}),i("v-uni-view",{staticClass:"bottom-box"},[i("v-uni-button",{staticClass:"btn-submit",on:{click:function(e){e=t.$handleEvent(e),t.submitApplyListener(e)}}},[t._v("提交")])],1)],2),t.stateFlag?i("v-uni-view",{staticClass:"mask"},[i("v-uni-view",{staticClass:"dialog-box"},[i("v-uni-view",{staticClass:"dialog-detailed db-header"},[i("v-uni-view",{staticClass:"h-lt"},[t._v("选择货物状态")]),i("v-uni-view",{staticClass:"h-rt iconfont icon-btn_close_black",on:{click:function(e){e=t.$handleEvent(e),t.hideOrderStateDialog(e)}}})],1),i("v-uni-view",{staticClass:"db-cont"},[i("v-uni-view",{staticClass:"item-options"},[i("v-uni-view",{staticClass:"io-lt"},[t._v("未收到货")]),i("v-uni-view",{staticClass:"io-rt iconfont",class:0==t.stateIndex?"icon-selector_enable":"icon-selector_disable",style:"color:"+(0==t.stateIndex?"#ED3005;":"#CCCCCC;"),on:{click:function(e){e=t.$handleEvent(e),t.radioStateListener(0)}}})],1),i("v-uni-view",{staticClass:"item-options"},[i("v-uni-view",{staticClass:"io-lt"},[t._v("已收到货")]),i("v-uni-view",{staticClass:"io-rt iconfont",class:1==t.stateIndex?"icon-selector_enable":"icon-selector_disable",style:"color:"+(1==t.stateIndex?"#ED3005;":"#CCCCCC;"),on:{click:function(e){e=t.$handleEvent(e),t.radioStateListener(1)}}})],1)],1)],1)],1):t._e(),t.reasonFlag?i("v-uni-view",{staticClass:"mask"},[i("v-uni-view",{staticClass:"dialog-box"},[i("v-uni-view",{staticClass:"db-header"},[i("v-uni-view",{staticClass:"h-lt"},[t._v("选择退款原因")]),i("v-uni-view",{staticClass:"h-rt iconfont icon-btn_close_black",on:{click:function(e){e=t.$handleEvent(e),t.hideOrderReasonDialog(e)}}})],1),i("v-uni-view",{staticClass:"db-cont",staticStyle:{height:"700px"}},t._l(t.reasonList,function(e,a){return i("v-uni-view",{key:a,staticClass:"item-options"},[i("v-uni-view",{staticClass:"io-lt"},[t._v(t._s(e.value))]),i("v-uni-view",{staticClass:"io-rt iconfont",class:t.reasonIndex==e.key?"icon-selector_enable":"icon-selector_disable",style:"color:"+(t.reasonIndex==e.key?"#ED3005;":"#CCCCCC;"),on:{click:function(i){i=t.$handleEvent(i),t.radioReasonListener(e)}}})],1)}),1)],1)],1):t._e()],1)},n=[];i.d(e,"a",function(){return a}),i.d(e,"b",function(){return n})},"2a2b":function(t,e,i){var a=i("2ce5");"string"===typeof a&&(a=[[t.i,a,""]]),a.locals&&(t.exports=a.locals);var n=i("4f06").default;n("f2935c1c",a,!0,{sourceMap:!1,shadowMode:!1})},"2ce5":function(t,e,i){e=t.exports=i("2350")(!1),e.push([t.i,".dialog-box[data-v-2e0c1f2b]{width:100%;min-width:100%;min-height:460px;background:#f2f4f7;position:absolute;left:50%;bottom:0;display:block;\n\t\t/* animation: action_translateY 1s ease 0s 1 both;\n\t\t-webkit-animation: action_translateY 1s ease 0s 1 both; */border-radius:8px 8px 0 0;top:50%;-webkit-box-sizing:bordre-box;box-sizing:bordre-box;-webkit-transform:translate(-50%);-ms-transform:translate(-50%);transform:translate(-50%);z-index:1000;overflow-y:scroll}.dialog-box .db-header[data-v-2e0c1f2b]{width:100%;height:54px;line-height:54px;border-radius:8px 8px 0 0;background:#fff;padding:0 15px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex}.db-header .h-lt[data-v-2e0c1f2b]{-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1;color:#000;font-size:18px}.db-header .h-rt[data-v-2e0c1f2b]{font-size:16px;color:#333}.dialog-box .db-cont[data-v-2e0c1f2b]{width:100%;padding:8px 15px;display:block;height:410px;overflow-y:scroll;position:absolute;-ms-overflow-scrolling:touch;-webkit-overflow-scrolling:touch}.dialog-box .db-cont .item-options[data-v-2e0c1f2b]{width:100%;height:60px;line-height:60px;border-radius:8px;background:#fff;display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex;margin:6px 0;padding:0 15px}.item-options .io-lt[data-v-2e0c1f2b]{width:100%;-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1;color:#333;font-size:16px}.item-options .io-rt[data-v-2e0c1f2b]{font-size:32px}.refund-box[data-v-2e0c1f2b]{width:100%;padding:6px 15px;display:block}.refund-box .refund-cont[data-v-2e0c1f2b]{display:block}.refund-cont .goods-base[data-v-2e0c1f2b]{width:100%;border-radius:8px;background:#fff;padding:15px;display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex;margin:6px 0}.goods-base .g-img[data-v-2e0c1f2b]{width:100px;height:100px;background:red}.goods-base .g-info[data-v-2e0c1f2b]{width:100%;display:block;-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1;margin-left:10px}.goods-base .g-info .gi-name[data-v-2e0c1f2b]{width:100%;color:#2d3133;font-size:16px}.goods-base .g-info .gi-sku[data-v-2e0c1f2b]{width:100%;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;margin-top:16px}.g-info .gi-sku .sku-desc[data-v-2e0c1f2b]{color:#666;font-size:14px;-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1}.g-info .gi-sku .goods-num[data-v-2e0c1f2b]{color:#666;font-size:14px}.refund-cont .refund-desc[data-v-2e0c1f2b]{width:100%;display:block;margin:6px 0;background:#fff;border-radius:8px;padding:0 15px}.refund-desc .item-refund[data-v-2e0c1f2b]{width:100%;height:60px;line-height:60px;border-bottom:1px solid #dfe6eb;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex}.item-refund .ir-lt[data-v-2e0c1f2b]{width:100%;-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1;color:#000;font-size:16px}.item-refund .ir-rt[data-v-2e0c1f2b]{color:#999;font-size:16px}.refund-cont .refund-money[data-v-2e0c1f2b]{width:100%;height:60px;line-height:60px;display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex;margin:6px 0;background:#fff;padding:0 15px;border-radius:8px}.refund-cont .refund-money .rm-lt[data-v-2e0c1f2b]{width:100%;-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1;color:#000;font-size:16px}.refund-cont .refund-money .rm-rt[data-v-2e0c1f2b]{color:#ed3005;font-size:24px}.refund-cont .shopping-num[data-v-2e0c1f2b]{width:100%;padding:0 15px;margin:2px 0;display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex;color:#999;font-size:14px}.refund-cont .reason-cont[data-v-2e0c1f2b]{width:100%;height:140px;background:#fff;border-radius:8px;margin:8px 0}.refund-cont .reason-cont .rc-area[data-v-2e0c1f2b]{width:92%;height:110px;padding:15px;color:#000;font-size:16px;line-height:28px}.refund-cont .reason-img[data-v-2e0c1f2b]{width:100%;display:inline-block;background:#fff;border-radius:8px;margin:8px 0}.refund-cont .reason-img .ri-tit[data-v-2e0c1f2b]{color:#000;font-size:16px;padding:22px 15px 0 15px}.refund-cont .reason-img .ri-cont[data-v-2e0c1f2b]{width:100%;display:inline-block;padding:16px 2%;text-align:center}.reason-img .ri-cont .model-img[data-v-2e0c1f2b]{width:95px;height:95px;border:1px dotted #999;float:left;margin-left:7px;margin-right:8px;margin-bottom:15px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;-webkit-box-pack:center;-webkit-justify-content:center;-ms-flex-pack:center;justify-content:center;position:relative}.model-img .iv-delete[data-v-2e0c1f2b]{width:30px;height:30px;position:absolute;top:0;right:0}.reason-img .ri-cont .model-img .add-img[data-v-2e0c1f2b]{font-size:14px;color:#999;display:block}.bottom-box[data-v-2e0c1f2b]{width:100%;height:60px;position:fixed;left:0;right:0;bottom:0;background:#fff;-webkit-box-shadow:0 0 4px 0 rgba(0,0,0,.04);box-shadow:0 0 4px 0 rgba(0,0,0,.04)}.bottom-box .btn-submit[data-v-2e0c1f2b]{width:92%;height:48px;margin:6px 4%;background:#ed3005;font-size:18px;color:#fff}.mask[data-v-2e0c1f2b]{z-index:998}",""])},3174:function(t,e,i){"use strict";var a=i("2a2b"),n=i.n(a);n.a},"487c":function(t,e,i){"use strict";i.r(e);var a=i("0acc"),n=i("5efb");for(var o in n)"default"!==o&&function(t){i.d(e,t,function(){return n[t]})}(o);i("3174");var s=i("2877"),l=Object(s["a"])(n["default"],a["a"],a["b"],!1,null,"2e0c1f2b",null);e["default"]=l.exports},"5efb":function(t,e,i){"use strict";i.r(e);var a=i("87e0"),n=i.n(a);for(var o in a)"default"!==o&&function(t){i.d(e,t,function(){return a[t]})}(o);e["default"]=n.a},"87e0":function(t,e,i){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var a={data:function(){return{stateFlag:!1,stateIndex:0,reasonFlag:!1,reasonIndex:0,resonDesc:"",order_id:"",detail:"",list:[],reasonData:"",reasonList:[],resonCont:"",imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(t){var e=this;e.wxb.printLog(t),e.wxb.addPage(this),e.wxb.Init(t,function(i){t.order_id&&(e.$data.order_id=t.order_id,e.getOrderDetail(),e.getApplyRefund())})},onUnload:function(){this.wxb.removePage()},methods:{getApplyRefund:function(t){var e=this;e.wxb.Post("/shop/api.order/applyRefund",{order_id:e.$data.order_id},function(t){console.log(t),e.$data.reasonData=t,0==e.$data.stateIndex?e.$data.reasonList=t.no_goods_reject_reason:e.$data.reasonList=t.has_goods_reject_reason})},reasonChangeListener:function(t){var e=t.detail.value;this.$data.resonCont=e},addPhotoListener:function(t){var e=this;e.$data.list.length<6&&uni.chooseImage({count:1,sizeType:["compressed"],success:function(t){console.log(t),uni.uploadFile({url:e.wxb.shopUrl+"/shop/api.upload/imageUpload",fileType:"image",filePath:t.tempFilePaths[0],name:"file",success:function(t){var i=JSON.parse(t.data);console.log(i),200==t.statusCode&&200==i.code?(e.$data.list.push(i.data.img_url),console.log(e.$data.list)):uni.showModal({title:"提示",content:"上传失败",showCancel:!1})},fail:function(t){uni.showModal({title:"提示",content:"上传失败",showCancel:!1})},complete:function(){uni.hideToast()}})}})},submitApplyListener:function(t){var e=this;e.wxb.Post("/shop/api.order/applyRefundSub",{order_id:e.$data.order_id,reject_goods_status:e.$data.stateIndex,reject_reason:e.$data.reasonIndex,reject_content:e.$data.resonCont,reject_photos:JSON.stringify(e.$data.list)},function(t){uni.showToast({title:"提交成功",duration:2e3}),setTimeout(function(){uni.navigateTo({url:"/pages/mine/order/index"})},3e3)})},deletePhotoListener:function(t){var e=this.$data.list;e.splice(t,1),this.$data.list=e},radioStateListener:function(t){this.$data.stateIndex=t,this.$data.reasonList=0==t?this.reasonData.no_goods_reject_reason:this.reasonData.has_goods_reject_reason},showOrderStateDialog:function(t){this.$data.stateFlag=!0},hideOrderStateDialog:function(t){this.$data.stateFlag=!1},radioReasonListener:function(t){this.$data.reasonIndex=t.key,this.$data.resonDesc=t.value,this.hideOrderReasonDialog()},showOrderReasonDialog:function(t){this.$data.reasonFlag=!0},hideOrderReasonDialog:function(t){this.$data.reasonFlag=!1},getOrderDetail:function(t){var e=this;e.wxb.Post("/shop/api.order/getDetail",{order_id:e.$data.order_id},function(t){e.$data.detail=t})}}};e.default=a}}]);