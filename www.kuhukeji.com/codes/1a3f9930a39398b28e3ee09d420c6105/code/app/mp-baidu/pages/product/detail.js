(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/product/detail"],{"0c70":function(t,i,a){},2445:function(t,i,a){"use strict";var e=function(){var t=this,i=t.$createElement,a=t._self._c||i;return a("view",{staticClass:"pageContainer",style:"top:"+t.topHeight+"px;",attrs:{_hid:0}},[t._ri(!t.loading.show,1)?a("view",{staticClass:"product-detail-box",attrs:{_hid:1}},[a("view",{staticClass:"banner-box",attrs:{_hid:2}},[a("swiper",{attrs:{"indicator-color":"true","indicator-active-color":"#FFFFFF",circular:"true",autoplay:"true",_hid:3},on:{change:t.onSwiperChangeListener}},t._l(t.detail.photos,function(t,i,e){var s=void 0!==e?e:i;return a("swiper-item",{key:i,attrs:{_hid:4,_fid:s,_fk:"index"}},[a("image",{staticClass:"swiper-img",attrs:{src:t,_hid:5,_fid:s,_batrs:"src"}})])},4,t._self)),a("view",{staticClass:"dot-box",attrs:{_hid:6}},[t._v(t._s(t.currIndex)+"/"+t._s(t.pLength),7)])],1),a("view",{staticClass:"price-box",attrs:{_hid:8}},[a("text",{staticStyle:{color:"#FD6329"},attrs:{_hid:9}},[]),a("text",{staticStyle:{"font-size":"32px","margin-left":"4px",color:"#FD6329"},attrs:{_hid:11}},[t._v(t._s(t.detail.price),12)]),a("text",{staticStyle:{"margin-left":"8px"},attrs:{_hid:13}},[]),a("text",{staticStyle:{"text-decoration":"line-through"},attrs:{_hid:15}},[t._v("¥"+t._s(t.detail.original_price),16)])]),a("view",{staticClass:"pd-title",attrs:{_hid:17}},[t._v(t._s(t.detail.title),18)]),a("view",{staticClass:"pd-notice",attrs:{_hid:19}},[a("view",{staticClass:"notice-tit",attrs:{_hid:20}},[]),a("view",{staticClass:"notice-desc",attrs:{_hid:22}},[a("text",{attrs:{_hid:23}},[t._v(t._s(t.detail.notice),24)])])]),a("view",{staticClass:"pd-introduce",attrs:{_hid:25}},[a("view",{staticClass:"intro-tit",attrs:{_hid:26}},[]),a("view",{staticClass:"intro-cont",attrs:{_hid:28}},[a("rich-view",{attrs:{rDatas:t.detail.detail,_hid:29,_batrs:"rDatas",_cid:0}})],1)]),a("view",{staticStyle:{width:"100%",height:"110rpx"},attrs:{_hid:1031}}),a("view",{staticClass:"bottom-box",attrs:{_hid:1032}},[a("navigator",{staticClass:"b-home",attrs:{"open-type":"reLaunch",url:"../index/index",_hid:1033}},[a("view",{staticClass:"iconfont icon-tabbar",staticStyle:{"font-size":"22px","margin-top":"10px"},attrs:{_hid:1034}}),a("view",{staticStyle:{color:"#666666","font-size":"12px","margin-top":"2px"},attrs:{_hid:1035}},[])]),a("view",{staticClass:"b-menu",attrs:{_hid:1037}},[a("view",{staticClass:"item-menu",staticStyle:{background:"#FFAE19"},attrs:{_hid:1038},on:{click:t.callPhoneListener}},[]),a("view",{staticClass:"item-menu",staticStyle:{background:"#FF5722"},attrs:{_hid:1040},on:{click:t.showDialogListener}},[])])],1),t._ri(!!t.showDialog,1042)?a("view",{staticClass:"mask",attrs:{_hid:1042}},[a("view",{staticClass:"subMessage-box",attrs:{_hid:1043}},[a("view",{staticClass:"sb-tit",attrs:{_hid:1044}},[]),a("text",{staticClass:"iconfont icon-btn_close1 close",attrs:{_hid:1046},on:{click:t.showDialogListener}}),a("form",{attrs:{_hid:1047},on:{submit:t.subMessageListener}},[a("view",{staticClass:"contBox",attrs:{_hid:1048}},[a("view",{staticClass:"input-box",attrs:{_hid:1049}},[a("input",{attrs:{name:"name",placeholder:"请输入姓名",_hid:1050}})]),a("view",{staticClass:"input-box",attrs:{_hid:1051}},[a("input",{attrs:{name:"phone",placeholder:"请输入电话号码",_hid:1052}})]),a("textarea",{staticClass:"text-box",attrs:{placeholder:"请输入留言信息",name:"message",_hid:1053}}),a("button",{staticClass:"btn-submit",style:"background-color:"+t.mainColor,attrs:{formType:"submit",_hid:1054}},[])],1)])],1)]):t._e()]):t._e(),a("ui-loading",{attrs:{loading:t.loading,_hid:1056,_batrs:"loading",_cid:1}})],1)},s=[];a.d(i,"a",function(){return e}),a.d(i,"b",function(){return s})},"2cf0":function(t,i,a){"use strict";a.r(i);var e=a("6ba7"),s=a.n(e);for(var o in e)"default"!==o&&function(t){a.d(i,t,function(){return e[t]})}(o);i["default"]=s.a},"6ba7":function(t,i,a){"use strict";(function(t){Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;var e=s(a("9751"));function s(t){return t&&t.__esModule?t:{default:t}}var o={extends:e.default,data:function(){return{showDialog:!1,currIndex:1,product_id:0,detail:"",pLength:0}},methods:{_Init:function(t){var i=this;i.$data.footers=i.$data.skin.footer.list,i.$data.selectColor=i.$data.skin.footer.selectColor,t.id&&(i.$data.product_id=t.id,i.getProductDetail())},callPhoneListener:function(){var i=this;t.makePhoneCall({phoneNumber:i.$data.detail.mobile})},onSwiperChangeListener:function(t){this.currIndex=t.detail.current+1},getProductDetail:function(){var i=this,a=this;a.showLoading(),a.$request.post("/website/api.product/detail",{token:t.getStorageSync("token"),product_id:a.$data.product_id}).then(function(t){a.hideLoading();var e=t.data;i.setBaiduPageInfo(t.data.seo),a.$data.detail=e,a.$data.pLength=e.photos.length}).catch(function(t){a.printf(t),a.showErrorView(a.config.errorNodata,t.msg)})},showDialogListener:function(t){var i=this.$data.showDialog;this.$data.showDialog=!i},subMessageListener:function(i){var a=this,e=i.detail.value;console.log(i),""!=e.name?""!=e.phone?""!=e.message?(t.showLoading({title:"提交中"}),a.$request.post("/website/api.about/subMessage",{token:t.getStorageSync("token"),name:e.name,mobile:e.phone,message:e.message}).then(function(i){console.log("留言成功"),t.hideLoading(),t.showToast({title:"留言成功,感谢!"}),a.$data.showDialog=!1}).catch(function(i){a.printf(i),t.showToast({title:"留言失败,请重试~"})})):console.log("消息不能为空"):console.log("手机号不能为空"):console.log("姓名不能为空")}}};i.default=o}).call(this,a("5486")["default"])},a9c3:function(t,i,a){"use strict";var e=a("0c70"),s=a.n(e);s.a},b893:function(t,i,a){"use strict";a("6346");var e=o(a("bdf9")),s=o(a("3a53"));function o(t){return t&&t.__esModule?t:{default:t}}e.default.mpType="page";var n=new s.default(e.default);n.$mount()},bdf9:function(t,i,a){"use strict";a.r(i);var e=a("2445"),s=a("2cf0");for(var o in s)"default"!==o&&function(t){a.d(i,t,function(){return s[t]})}(o);a("a9c3");var n=a("2877"),r=Object(n["a"])(s["default"],e["a"],e["b"],!1,null,null,null);i["default"]=r.exports}},[["b893","common/runtime","common/vendor"]]]);