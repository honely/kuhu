(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-mine-order-comment"],{"27f5":function(t,e,i){"use strict";var n=i("9bdb"),o=i.n(n);o.a},"29c0":function(t,e,i){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n={data:function(){return{model:"",list:[],storeNum:[0,0,0,0,0],rankNum:0,content:"",imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(t){var e=this;e.wxb.printLog(t),t.tabIndex&&(e.$data.tindex=t.tabIndex-0,e.$data.type=t.tabIndex-0),e.wxb.addPage(this),e.wxb.Init(t,function(i){var n=JSON.parse(t.model);e.$data.model=n})},onUnload:function(){this.wxb.removePage()},methods:{inputChangeListener:function(t){this.$data.content=t.detail.value},submitCommentListener:function(t){var e=this;""!=e.$data.content||0!=e.$data.list.length?e.wxb.Post("/shop/api.order/setOrderComment",{comment_id:e.$data.model.comment_id,content:e.$data.content,photos:JSON.stringify(e.$data.list),rank:e.$data.rankNum},function(t){uni.redirectTo({url:"./index"})}):e.$showToast({show:!0,content:"评论内容不能为空"})},storeNumListener:function(t){var e=[];for(var i in this.$data.rankNum=t-0+1,this.$data.storeNum)this.$data.storeNum[i]=i<=t?1:0,e.push(this.$data.storeNum[i]);this.$data.storeNum=e},deletePhotoListener:function(t){var e=this.$data.list;e.splice(t,1),this.$data.list=e},addPhotoListener:function(t){var e=this;e.$data.list.length<6&&uni.chooseImage({count:1,sizeType:["compressed"],success:function(t){console.log(t),uni.uploadFile({url:e.wxb.shopUrl+"/shop/api.upload/imageUpload",fileType:"image",filePath:t.tempFilePaths[0],name:"file",success:function(t){var i=JSON.parse(t.data);console.log(i),200==t.statusCode&&200==i.code?(e.$data.list.push(i.data.img_url),console.log(e.$data.list)):uni.showModal({title:"提示",content:"上传失败",showCancel:!1})},fail:function(t){uni.showModal({title:"提示",content:"上传失败",showCancel:!1})},complete:function(){uni.hideToast()}})}})}}};e.default=n},"8e14":function(t,e,i){"use strict";i.r(e);var n=i("ac69"),o=i("9092");for(var a in o)"default"!==a&&function(t){i.d(e,t,function(){return o[t]})}(a);i("27f5");var s=i("2877"),c=Object(s["a"])(o["default"],n["a"],n["b"],!1,null,"96843c58",null);e["default"]=c.exports},9092:function(t,e,i){"use strict";i.r(e);var n=i("29c0"),o=i.n(n);for(var a in n)"default"!==a&&function(t){i.d(e,t,function(){return n[t]})}(a);e["default"]=o.a},"9bdb":function(t,e,i){var n=i("f5b2");"string"===typeof n&&(n=[[t.i,n,""]]),n.locals&&(t.exports=n.locals);var o=i("4f06").default;o("cb5408fc",n,!0,{sourceMap:!1,shadowMode:!1})},ac69:function(t,e,i){"use strict";var n=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("v-uni-view",{staticClass:"comment-box"},[i("v-uni-view",{staticClass:"cb-list"},[i("v-uni-view",{staticClass:"item-comment"},[i("v-uni-view",{staticClass:"goods-info"},[i("v-uni-image",{staticClass:"g-img",attrs:{src:t.model.photo}}),i("v-uni-view",{staticClass:"g-score"},[t._l(t.storeNum,function(e,n){return[1==e?i("v-uni-text",{key:n+"_0",staticClass:"icon-score iconfont icon-Star_c",staticStyle:{color:"#FFAE19"},on:{click:function(e){e=t.$handleEvent(e),t.storeNumListener(n)}}}):t._e(),0==e?i("v-uni-text",{key:n+"_1",staticClass:"icon-score iconfont icon-Star_c",staticStyle:{color:"#eaeaea"},on:{click:function(e){e=t.$handleEvent(e),t.storeNumListener(n)}}}):t._e()]})],2)],1),i("v-uni-view",{staticClass:"comment-cont"},[i("v-uni-textarea",{attrs:{placeholder:"给个好评，送你10个积分，去说点啥～"},on:{input:function(e){e=t.$handleEvent(e),t.inputChangeListener(e)}}})],1),i("v-uni-view",{staticClass:"comment-img"},[t._l(t.list,function(e,n){return i("v-uni-view",{key:n,staticClass:"model-img"},[i("v-uni-image",{staticStyle:{width:"100%",height:"100%"},attrs:{src:e}}),i("v-uni-image",{staticClass:"iv-delete",attrs:{src:t.imgBaseUrl+"/order/btn_deletePhoto@3x.png"},on:{click:function(e){e=t.$handleEvent(e),t.deletePhotoListener(n)}}})],1)}),t.list.length<6?i("v-uni-view",{staticClass:"model-img"},[i("v-uni-view",{staticClass:"add-img",on:{click:function(e){e=t.$handleEvent(e),t.addPhotoListener(e)}}},[i("v-uni-view",{staticClass:"iconfont icon-btn_photo",staticStyle:{"font-size":"24px"}}),i("v-uni-view",{staticStyle:{"margin-top":"10px"}},[t._v("添加图片")])],1)],1):t._e()],2)],1),i("v-uni-view",{staticStyle:{width:"100%",height:"70px"}}),i("v-uni-view",{staticClass:"bottom-box"},[i("v-uni-button",{staticClass:"submit-comment",on:{click:function(e){e=t.$handleEvent(e),t.submitCommentListener(e)}}},[t._v("提交评价")])],1)],1),i("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif"}}),i("ToastView")],1)},o=[];i.d(e,"a",function(){return n}),i.d(e,"b",function(){return o})},f5b2:function(t,e,i){e=t.exports=i("2350")(!1),e.push([t.i,".bottom-box[data-v-96843c58]{height:60px;bottom:0;position:fixed;left:0;right:0;background:#fff}.bottom-box .submit-comment[data-v-96843c58]{width:92%;height:48px;line-height:48px;background:#ed3005;text-align:center;margin:6px 4%;font-size:18px;color:#fff}.comment-box[data-v-96843c58]{width:100%;position:absolute;top:0;bottom:0;overflow:scroll;padding:6px 0}.comment-box .cb-list[data-v-96843c58]{width:100%;padding:0 15px}.comment-box .cb-list .item-comment[data-v-96843c58]{width:100%;margin:6px 0;display:inline-block;background:#fff;border-radius:8px}.item-comment .goods-info[data-v-96843c58]{width:100%;height:110px;padding:15px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center}.item-comment .goods-info .g-img[data-v-96843c58]{width:80px;height:80px\n\t/* background: #f00; */}.item-comment .goods-info .g-score[data-v-96843c58]{padding:0 10px;-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex}.item-comment .goods-info .g-score .icon-score[data-v-96843c58]{font-size:24px;margin:0 6px;color:#dfe6eb}.item-comment .comment-cont[data-v-96843c58]{width:92%;height:160px;margin:0 4%;padding:15px;display:inline-block;border:1px solid #ccc}.item-comment .comment-cont uni-textarea[data-v-96843c58]{width:100%;height:130px}.item-comment .comment-img[data-v-96843c58]{width:100%;display:inline-block;padding:16px 2%;text-align:center}.item-comment .comment-img .model-img[data-v-96843c58]{width:95px;height:95px;border:1px dotted #999;float:left;margin-left:7px;margin-right:8px;margin-bottom:15px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;-webkit-box-pack:center;-webkit-justify-content:center;-ms-flex-pack:center;justify-content:center;position:relative}.model-img .iv-delete[data-v-96843c58]{width:30px;height:30px;position:absolute;top:0;right:0}.comment-img .model-img .add-img[data-v-96843c58]{font-size:14px;color:#999;display:block}",""])}}]);