(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/index/bargain/join"],{"4ea3":function(t,i,a){},"6ecf":function(t,i,a){"use strict";var s=function(){var t=this,i=t.$createElement,a=t._self._c||i;return a("view",{staticClass:"bargain-box",attrs:{_hid:0}},[t._ri(!!t.detail,1)?a("view",{attrs:{_hid:1}},[a("view",{staticClass:"bargain-cont",attrs:{_hid:2}},[a("view",{staticClass:"b-cont",attrs:{_hid:3}},[a("view",{staticClass:"bc-user",attrs:{_hid:4}},[a("image",{staticClass:"u-face",attrs:{src:t.detail.face,_hid:5,_batrs:"src"}}),a("view",{staticClass:"u-info",attrs:{_hid:6}},[a("view",{staticClass:"uname",attrs:{_hid:7}},[t._v(t._s(t.detail.nickname),8)]),a("view",{staticClass:"uhint",attrs:{_hid:9}},[t._v("我发现一件好货，来一起砍价"+t._s(t.detail.bargain_price)+"元拿",10)])])]),a("view",{staticClass:"bc-goods",attrs:{_hid:11}},[a("image",{staticClass:"g-img",attrs:{src:t.detail.photo,_hid:12,_batrs:"src"}}),a("view",{staticClass:"g-cont",attrs:{_hid:13}},[a("view",{staticClass:"cname ellipsis-03",attrs:{_hid:14}},[t._v(t._s(t.detail.goods_name),15)]),a("view",{staticClass:"cnum",attrs:{_hid:16}}),a("view",{staticClass:"cprice",attrs:{_hid:17}},[a("text",{staticStyle:{color:"#ED3005"},attrs:{_hid:18}},[]),a("text",{staticStyle:{color:"#ED3005","font-size":"18px"},attrs:{_hid:20}},[t._v(t._s(t.detail.bargain_price),21)]),a("text",{staticStyle:{"margin-left":"8px","text-decoration":"line-through"},attrs:{_hid:22}},[t._v("原价 ¥"+t._s(t.detail.init_price),23)])])])]),a("view",{staticClass:"countDown-cont",attrs:{_hid:24}},[a("text",{staticClass:"hint",attrs:{_hid:25}},[]),a("uni-countdown",{attrs:{color:"#ffffff",splitorColor:"#ED3005","background-color":"#ED3005","border-color":"rgba(0,0,0,0)",hour:t.hour,minute:t.minute,second:t.second,"show-day":!1,_hid:27,_batrs:"hour,minute,second,show-day",_cid:0}}),a("text",{staticClass:"hint",staticStyle:{color:"#333333"},attrs:{_hid:1029}},[])],1),a("view",{staticClass:"b-progress",attrs:{_hid:1031}},[a("view",{staticClass:"p-data",attrs:{_hid:1032}},[a("view",{staticClass:"pd-lt",attrs:{_hid:1033}},[a("text",{attrs:{_hid:1034}},[]),a("text",{staticStyle:{"font-size":"16px",color:"#ED3005",margin:"0 4px"},attrs:{_hid:1036}},[]),a("text",{staticStyle:{"font-size":"20px",color:"#ED3005"},attrs:{_hid:1038}},[t._v(t._s(t.detail.kan_price),1039)])]),a("view",{staticClass:"pd-rt",attrs:{_hid:1040}},[a("text",{attrs:{_hid:1041}},[]),a("text",{staticStyle:{"font-size":"16px",color:"#ED3005",margin:"0 4px"},attrs:{_hid:1043}},[]),a("text",{staticStyle:{"font-size":"20px",color:"#ED3005"},attrs:{_hid:1045}},[t._v(t._s(t.detail.now_price),1046)])])]),a("view",{staticClass:"p-progress",attrs:{_hid:1047}},[a("progress",{attrs:{percent:t.percentNum,active:"true","stroke-width":"8",backgroundColor:"#E6E6E6",activeColor:"#FFC900",_hid:1048,_batrs:"percent"}})],1)]),a("view",{staticClass:"b-button",attrs:{_hid:1049}},[t._ri(!(1!=t.detail.type),1050)?a("button",{staticClass:"btn-kan",attrs:{"open-type":"share",_hid:1050}},[]):t._e(),t._ri(!(2!=t.detail.type),1052)?a("button",{staticClass:"btn-kan",attrs:{_hid:1052},on:{click:t.helpBargainListener}},[]):t._e(),t._ri(!(3!=t.detail.type),1054)?a("button",{staticClass:"btn-kan",attrs:{_hid:1054}},[]):t._e(),t._ri(!(4!=t.detail.type),1056)?a("button",{staticClass:"btn-kan",attrs:{_hid:1056},on:{click:t.helpBargainListener}},[]):t._e(),t._ri(!(5!=t.detail.type),1058)?a("button",{staticClass:"btn-kan",attrs:{_hid:1058},on:{click:t.buyGoods}},[]):t._e(),t._ri(!(6!=t.detail.type),1060)?a("button",{staticClass:"btn-kan",attrs:{_hid:1060},on:{click:t.chongkan}},[]):t._e()],1),t._ri(!(1!=t.detail.type),1062)?a("view",{staticClass:"b-record",attrs:{_hid:1062}},[a("view",{staticClass:"record-cont",attrs:{_hid:1063}},[a("view",{staticClass:"rc-tit",attrs:{_hid:1064}},[]),a("view",{staticClass:"rc-list",attrs:{_hid:1066}},t._l(t.detail.bargain_log,function(i,s,e){var r=void 0!==e?e:s;return a("view",{key:s,staticClass:"item-record",attrs:{_hid:1067,_fid:r,_fk:"i"}},[a("image",{staticClass:"r-img",attrs:{src:i.face,_hid:1068,_fid:r,_batrs:"src"}}),a("view",{staticClass:"r-cont",attrs:{_hid:1069,_fid:r}},[a("view",{staticClass:"rc-name",attrs:{_hid:1070,_fid:r}},[t._v(t._s(i.nickname),1071,r)]),a("view",{staticClass:"rc-hint",attrs:{_hid:1072,_fid:r}},[t._v("来一起砍价"+t._s(t.detail.bargain_price)+"元拿",1073,r)])]),a("view",{staticClass:"r-time",staticStyle:{display:"flex","align-items":"center"},attrs:{_hid:1074,_fid:r}},[a("image",{staticStyle:{width:"26px",height:"26px"},attrs:{src:t.imgBaseUrl+"/business/icon_kan@3x.png",_hid:1075,_fid:r,_batrs:"src"}}),a("text",{staticStyle:{"margin-left":"5px",color:"#333333","font-size":"14px"},attrs:{_hid:1076,_fid:r}},[t._v("砍掉"+t._s(i.price)+"元",1077,r)])])])},1067,t._self))])]):t._e(),t._ri(!(1==t.detail.type),1078)?a("view",{staticClass:"b-record",attrs:{_hid:1078}},[a("view",{staticClass:"record-cont",attrs:{_hid:1079}},[a("view",{staticClass:"rc-tit",attrs:{_hid:1080}},[]),a("view",{staticClass:"rc-list",attrs:{_hid:1082}},t._l(t.detail.bargain_log,function(i,s,e){var r=void 0!==e?e:s;return a("view",{key:s,staticClass:"item-record",attrs:{_hid:1083,_fid:r,_fk:"i"}},[a("image",{staticClass:"r-img",attrs:{src:i.face,_hid:1084,_fid:r,_batrs:"src"}}),a("view",{staticClass:"r-cont",attrs:{_hid:1085,_fid:r}},[a("view",{staticClass:"rc-name",attrs:{_hid:1086,_fid:r}},[t._v(t._s(i.nickname),1087,r)]),a("view",{staticClass:"rc-hint",attrs:{_hid:1088,_fid:r}},[t._v("帮助砍了"+t._s(i.price)+"元",1089,r)])])])},1083,t._self))])]):t._e()])]),a("view",{staticClass:"recommend-list",attrs:{_hid:1090}},[t._m(0),a("view",{staticClass:"r-list",attrs:{_hid:1095}},[t._l(t.list,function(i,s,e){var r=void 0!==e?e:s;return a("view",{key:s,staticClass:"item-bargain",attrs:{_hid:1096,_fid:r,_fk:"index"},on:{click:function(a){t.$linkListener("detail?id="+i.bargain_id)}}},[a("view",{staticClass:"lt-bargain",attrs:{_hid:1097,_fid:r}},[a("image",{attrs:{src:i.photo,_hid:1098,_fid:r,_batrs:"src"}}),t._ri(!!i.is_vip_more_bargain,1099,void 0!==e?e:s)?a("view",{staticClass:"hint",attrs:{_hid:1099,_fid:r}},[]):t._e()]),a("view",{staticClass:"rt-bargain",attrs:{_hid:1101,_fid:r}},[a("view",{staticClass:"b-name ellipsis-02",attrs:{_hid:1102,_fid:r}},[t._v(t._s(i.goods_name),1103,r)]),a("view",{staticClass:"b-sellNum",attrs:{_hid:1104,_fid:r}},[t._v("已送出"+t._s(i.sold_num)+"件",1105,r)]),a("view",{staticClass:"b-desc",attrs:{_hid:1106,_fid:r}},[a("view",{staticClass:"lt-desc",attrs:{_hid:1107,_fid:r}},[a("view",{staticClass:"price",attrs:{_hid:1108,_fid:r}},[a("text",{staticStyle:{"font-size":"14px"},attrs:{_hid:1109,_fid:r}},[]),a("text",{staticStyle:{"font-size":"18px","margin-left":"2px"},attrs:{_hid:1111,_fid:r}},[t._v(t._s(i.bargain_price),1112,r)])]),a("view",{staticClass:"cost-price",attrs:{_hid:1113,_fid:r}},[a("text",{attrs:{_hid:1114,_fid:r}},[]),a("text",{staticStyle:{"margin-left":"4px","text-decoration":"line-through"},attrs:{_hid:1116,_fid:r}},[t._v("¥"+t._s(i.init_price),1117,r)])])]),a("view",{staticClass:"rt-desc",attrs:{_hid:1118,_fid:r}},[t._v(t._s(i.bargain_price)+"元砍",1119,r)])])])])},1096,t._self),t._ri(!(1!=t.more),1120)?a("view",{staticClass:"more",attrs:{_hid:1120},on:{click:t.getBargainDetail}},[]):t._e(),t._ri(!(0!=t.more),1122)?a("view",{staticClass:"nodata",attrs:{_hid:1122}},[]):t._e()],1)])]):t._e(),t._ri(!!t.kanFlag,1124)?a("view",{staticClass:"mask",attrs:{_hid:1124}},[a("view",{staticClass:"dialog-kan-box",attrs:{_hid:1125}},[a("view",{staticClass:"dkan-cont",attrs:{_hid:1126}},[a("view",{staticClass:"dc-img",attrs:{_hid:1127}},[a("image",{staticClass:"img",attrs:{src:t.imgBaseUrl+"/business/img_pop_kan@3x.png",_hid:1128,_batrs:"src"}}),a("view",{staticClass:"info",attrs:{_hid:1129}},[a("view",{staticClass:"tit",attrs:{_hid:1130}},[]),a("view",{staticClass:"desc",attrs:{_hid:1132}},[a("text",{attrs:{_hid:1133}},[]),a("text",{staticStyle:{color:"#FFE600","font-size":"24px","margin-left":"4px"},attrs:{_hid:1135}},[t._v(t._s(t.kan_price)+"元",1136)])])])]),a("view",{staticClass:"dkan-bottom",attrs:{_hid:1137}})]),a("image",{staticClass:"img-close",attrs:{src:t.imgBaseUrl+"/business/btn_close@3x.png",_hid:1138,_batrs:"src"},on:{click:t.hideKanDialog}}),a("button",{staticClass:"btn-share",attrs:{_hid:1139}},[])],1)]):t._e(),t._ri(!!t.helpFlag,1141)?a("view",{staticClass:"mask",attrs:{_hid:1141}},[a("view",{staticClass:"dialog-help-box",attrs:{_hid:1142}},[a("view",{staticClass:"hkan-cont",attrs:{_hid:1143}},[t._m(1),a("view",{staticClass:"cont",attrs:{_hid:1146}},[a("view",{staticClass:"c-tit",attrs:{_hid:1147}},[]),t._m(2),a("button",{staticClass:"btn-take",attrs:{_hid:1154}},[])],1)]),a("image",{staticClass:"img-close",attrs:{src:t.imgBaseUrl+"/business/btn_close@3x.png",_hid:1156,_batrs:"src"},on:{click:t.hideHelpDialog}})])]):t._e(),a("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",_hid:1157,_batrs:"img",_cid:1}}),a("ToastView",{attrs:{_hid:2159,_cid:2}})],1)},e=[function(){var t=this,i=t.$createElement,a=t._self._c||i;return a("view",{staticClass:"r-header",attrs:{_hid:1091}},[a("text",{staticClass:"iconfont icon-icon_kanjia",staticStyle:{"font-size":"22px",color:"#ED3005","margin-right":"8px"},attrs:{_hid:1092}}),a("text",{attrs:{_hid:1093}},[])])},function(){var t=this,i=t.$createElement,a=t._self._c||i;return a("view",{staticClass:"face-box",attrs:{_hid:1144}},[a("image",{staticClass:"f-img",attrs:{_hid:1145}})])},function(){var t=this,i=t.$createElement,a=t._self._c||i;return a("view",{staticClass:"c-desc",attrs:{_hid:1149}},[a("text",{attrs:{_hid:1150}},[]),a("text",{staticStyle:{color:"#ED3005","margin-left":"8px","font-size":"24px"},attrs:{_hid:1152}},[])])}];a.d(i,"a",function(){return s}),a.d(i,"b",function(){return e})},"7d99":function(t,i,a){"use strict";a.r(i);var s=a("e2b6"),e=a.n(s);for(var r in s)"default"!==r&&function(t){a.d(i,t,function(){return s[t]})}(r);i["default"]=e.a},"8e32":function(t,i,a){"use strict";a.r(i);var s=a("6ecf"),e=a("7d99");for(var r in e)"default"!==r&&function(t){a.d(i,t,function(){return e[t]})}(r);a("be78");var n=a("2877"),d=Object(n["a"])(e["default"],s["a"],s["b"],!1,null,null,null);i["default"]=d.exports},be78:function(t,i,a){"use strict";var s=a("4ea3"),e=a.n(s);e.a},e269:function(t,i,a){"use strict";a("2346");var s=r(a("8e32")),e=r(a("3a53"));function r(t){return t&&t.__esModule?t:{default:t}}s.default.mpType="page";var n=new e.default(s.default);n.$mount()},e2b6:function(t,i,a){"use strict";(function(t){Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;var s=e(a("9219"));function e(t){return t&&t.__esModule?t:{default:t}}var r={components:{uniCountdown:s.default},data:function(){return{userid:0,hour:0,minute:0,second:0,expire_time:0,list:[],page:1,more:0,kanFlag:!1,helpFlag:!1,bargain_item_id:"",kan_price:"",detail:"",percentNum:0,imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(i){var a=this,s=t.getStorageSync("user_id");void 0!=s&&""!=s&&(a.$data.userid=s),void 0!=i.pid&&""!=i.pid&&t.setStorageSync("pid",i.pid),a.wxb.printLog("=============onLoad================"),a.wxb.addPage(this),a.wxb.Init(i,function(t){if(i.bargain_item_id){var s=i.bargain_item_id,e=i.kan_price;a.$data.bargain_item_id=s,a.$data.kan_price=e,a.getBargainDetail()}})},onUnload:function(){this.wxb.printLog("=============onUnload================"),this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:t.$data.detail&&""!=t.$data.detail.goods_name?t.$data.detail.goods_name:"商品详情",path:"/pages/index/bargain/join?id="+t.$data.bargain_item_id+"&pid="+t.$data.userid}},methods:{chongkan:function(){t.navigateTo({url:"/pages/index/bargain/detail?id="+this.$data.detail.bargain_id})},helpBargainListener:function(t){var i=this;i.wxb.Post("/shop/api.bargain/helpBargain",{bargain_item_id:i.$data.bargain_item_id},function(t){i.$data.kan_price=t.kan_price,i.$data.page=1,i.getBargainDetail()})},getBargainDetail:function(t){var i=this,a=i.$data.list,s=i.$data.page;1==s&&(a=[]),i.wxb.Post("/shop/api.bargain/helpBargainDetail",{bargain_item_id:i.$data.bargain_item_id,page:i.$data.page},function(t){i.$data.percentNum=t.detail.kan_price/t.detail.init_price*100|0,console.log("percentNum=>"+i.$data.percentNum);var s=t.tuijian;for(var e in s)a.push(s[e]);i.$data.list=s,i.$data.more=t.isMore,i.$data.page+=1,i.$data.detail=t.detail,i.$data.expire_time=t.detail.expire_time,console.log("倒计时->"+t.detail.expire_time);var r=i.$data.expire_time,n=r/3600|0,d=(Math.round(r)-3600*n)/60|0;r=r%60|0;console.log("hour->"+n),console.log("minute->"+d),console.log("second->"+r),i.$data.hour=n,i.$data.minute=d,i.$data.second=r,i.$data.kan_price>0&&i.showKanDialog()})},buyGoods:function(i){t.redirectTo({url:"buy?bargain_item_id="+this.$data.bargain_item_id})},showKanDialog:function(){this.$data.kanFlag=!0},hideKanDialog:function(){this.$data.kanFlag=!1},showHelpDialog:function(){this.$data.helpFlag=!0},hideHelpDialog:function(){this.$data.helpFlag=!1}}};i.default=r}).call(this,a("f266")["default"])}},[["e269","common/runtime","common/vendor"]]]);