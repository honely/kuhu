(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/mine/integral/index"],{"3ed8":function(t,e,a){"use strict";(function(t){function a(t,e){return n(t)||i(t,e)||s()}function s(){throw new TypeError("Invalid attempt to destructure non-iterable instance")}function i(t,e){var a=[],s=!0,i=!1,n=void 0;try{for(var r,o=t[Symbol.iterator]();!(s=(r=o.next()).done);s=!0)if(a.push(r.value),e&&a.length===e)break}catch(c){i=!0,n=c}finally{try{s||null==o["return"]||o["return"]()}finally{if(i)throw n}}return a}function n(t){if(Array.isArray(t))return t}Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var r={data:function(){for(var t=new Date,e=[],a=[],s=[],i=2016;i<=t.getFullYear();i++)e.push(i);for(var n=1;n<=12;n++)a.push(n);for(var r=1;r<=31;r++)s.push(r);return{userid:0,years:e,months:a,days:s,integerNum:0,list:[],page:1,more:0,type_means:[],typeId:"",selectMsg:"",startDate:"",endDate:"",screenType:0,screenTypeFlag:!1,msgType:0,dateType:0,dateValue:[9999,t.getMonth(),t.getDate()-2],screenDateFlag:!1,screenFlag:!1,imgBaseUrl:""}},onLoad:function(e){var a=this,s=t.getStorageSync("user_id");void 0!=s&&""!=s&&(a.$data.userid=s),void 0!=e.pid&&""!=e.pid&&t.setStorageSync("pid",e.pid),a.wxb.addPage(this),a.wxb.Init(e,function(t){a.getIntegralInfo()})},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onUnload:function(){this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:""==t.$data.companyName?"O2O电商小程序":t.$data.companyName,path:"/pages/index/index?pid="+t.$data.userid}},methods:{sureScreenListener:function(t){this.$data.page=1,this.getIntegralInfo(),this.onHiddenScreenDialog()},onHiddenScreenDialog:function(t){this.$data.screenFlag=!1},onShowScreenDialog:function(t){this.$data.screenFlag=!0},onSureDateListener:function(){console.log("完成日期选择");var t=this.$data.startDate,e=this.$data.endDate;return console.log(new Date(e).getTime()-new Date(t).getTime()),new Date(e)<=new Date(t)?(this.$data.msgType=1,void(this.$data.msg="开始日期必须小于结束日期")):new Date(e).getTime()-new Date(t).getTime()>31536e6?(this.$data.msgType=1,void(this.$data.msg="仅支持查找12个月跨度以内的数据")):(this.$data.selectMsg=t+"至"+e,void this.onHiddenScreenDateDialog())},bindChangeListener:function(t){var e=new Date,s=this.$data.years,i=this.$data.months,n=this.$data.days,r=a(t.detail.value,3),o=r[0],c=r[1],l=r[2],d=s[o],g=i[c];if(e.getFullYear()==d){i=[];for(var v=1;v<=e.getMonth()+1;v++)i.push(v);if(n=[],e.getFullYear()==d&&e.getMonth()+1==g)for(var u=1;u<=e.getDate();u++)n.push(u);else for(var p=new Date(d,g,0).getDate(),m=1;m<=p;m++)n.push(m)}else{i=[];for(var h=1;h<=12;h++)i.push(h);n=[];p=new Date(d,g,0).getDate();for(var f=1;f<=p;f++)n.push(f)}this.$data.years=s,this.$data.months=i,this.$data.days=n,this.$data.msgType=0;var y=this.$data.dateType,w=s[o]+"-"+(i[c]>9?i[c]:"0"+i[c])+"-"+(n[l]>9?n[l]:"0"+n[l]);console.log("选择的日期："+w),0==y?this.$data.startDate=w:1==y&&(this.$data.endDate=w)},onHiddenScreenDateDialog:function(t){this.$data.screenDateFlag=!1},onShowScreenDateDialog:function(t){var e=this;""!=e.$data.startDate&&""!=e.$data.endDate||(e.$data.startDate=e.getDateFormat(-1),e.$data.endDate=e.getDateFormat(0)),e.$data.screenDateFlag=!0},onShowScreenTypeDialog:function(t){this.$data.screenTypeFlag=!0},onHiddenScreenTypeDialog:function(t){this.$data.screenTypeFlag=!1},onDateTypeListener:function(t){var e=this,a=new Date,s=t.currentTarget.dataset.type,i=e.$data.selectMsg,n=e.$data.startDate;4==s?(""!=n&&""!=e.$data.endDate||(e.$data.startDate=e.getDateFormat(-1),e.$data.endDate=e.getDateFormat(0)),console.log(this.$data.startDate),console.log(this.$data.endDate),this.onHiddenScreenTypeDialog(),this.onShowScreenDateDialog()):(1==s?(i="近三月",n=e.timeFormatDate(a.getTime()-7776e6),console.log(n)):2==s?(i="近一月",n=e.timeFormatDate(a.getTime()-2592e6),console.log(n)):3==s&&(i="近一周",n=e.timeFormatDate(a.getTime()-6048e5),console.log(n)),e.$data.selectMsg=i,e.$data.endDate=e.getDateFormat(0),e.$data.startDate=n),e.$data.screenType=s,e.$data.screenTypeFlag=!1},onClickStartListener:function(t){var e=new Date(this.$data.startDate),a=e.getFullYear(),s=e.getMonth()+1,i=e.getDate();this.$data.dateType=0,this.$data.dateValue=this.getDateIndex(a,s,i),console.log("选择开始日期=>"+this.$data.dateValue)},getDateIndex:function(t,e,a){console.log(t),console.log(e),console.log(a);var s=this.$data.years,i=this.$data.months,n=this.$data.days,r=this.$data.dateValue;for(var o in s)if(s[o]==t&&r){this.wxb.printLog("length=>"+r.length),r[0]=o-0;break}for(var o in i)if(i[o]==e&&r){r[1]=o-0;break}for(var o in n)if(n[o]==a&&r){r[2]=o-0;break}return console.log(r),r},onClickEndListener:function(t){console.log(this.$data.endDate);var e=new Date(this.$data.endDate),a=e.getFullYear(),s=e.getMonth()+1,i=e.getDate(),n=this.getDateIndex(a,s,i);this.$data.dateType=1,this.$data.dateValue=n},getDateFormat:function(t){var e=new Date;e.setDate(e.getDate()+t);var a=e.getFullYear(),s=e.getMonth()+1;t=e.getDate();return s>=1&&s<=9&&(s="0"+s),t>=0&&t<=9&&(t="0"+t),a+"-"+s+"-"+t},timeFormatDate:function(t){var e=new Date(t),a=e.getFullYear(),s=e.getMonth()+1,i=e.getDate();return a+"-"+(s>9?s:"0"+s)+"-"+(i>9?i:"0"+i)},selectScreenTypeListener:function(t){var e=t.currentTarget.dataset.id;this.$data.typeId=e},getIntegralInfo:function(t){var e=this,a=e.$data.list;1==e.$data.page&&(a=[]),e.wxb.Post("/shop/api.user/myIntegral",{date_type:e.$data.screenType,date_area_start:e.$data.startDate,date_area_end:e.$data.endDate,type:e.$data.typeId,page:e.$data.page},function(t){if(t){for(var s in t.list)a.push(t.list[s]);e.$data.type_means=t.type_means,e.$data.typeId=t.type_means[0].key,e.$data.integerNum=t.integral,e.$data.list=t.list,e.$data.page=1,e.$data.more=t.more}})}}};e.default=r}).call(this,a("543d")["default"])},"70e9":function(t,e,a){"use strict";var s=a("bd38"),i=a.n(s);i.a},"870e":function(t,e,a){"use strict";a.r(e);var s=a("3ed8"),i=a.n(s);for(var n in s)"default"!==n&&function(t){a.d(e,t,function(){return s[t]})}(n);e["default"]=i.a},a72c:function(t,e,a){"use strict";a.r(e);var s=a("ec67"),i=a("870e");for(var n in i)"default"!==n&&function(t){a.d(e,t,function(){return i[t]})}(n);a("70e9");var r=a("2877"),o=Object(r["a"])(i["default"],s["a"],s["b"],!1,null,null,null);e["default"]=o.exports},bd38:function(t,e,a){},c64e:function(t,e,a){"use strict";a("2346");var s=n(a("b0ce")),i=n(a("a72c"));function n(t){return t&&t.__esModule?t:{default:t}}Page((0,s.default)(i.default))},ec67:function(t,e,a){"use strict";var s=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("scroll-view",{attrs:{"scroll-y":"true"}},[a("view",{staticClass:"integral-box"},[a("view",{staticClass:"integral-bg"}),a("view",{staticClass:"integral-info"},[a("view",{staticClass:"ii-tit"},[t._v("当前积分")]),a("view",{staticClass:"ii-num"},[t._v(t._s(t.integerNum))]),a("view",{staticClass:"ii-button"},[a("navigator",{staticClass:"item-button btn-mall",attrs:{url:"../mall/index"}},[t._v("积分商城")]),a("navigator",{staticClass:"item-button btn-record",attrs:{url:"../mall/order/index"}},[t._v("兑换记录")])],1)])]),a("view",{staticClass:"integral-desc"},[a("view",{staticClass:"header-integral"},[a("view",{staticClass:"hw-lt"},[a("text",{staticClass:"iconfont icon-icon_integral",staticStyle:{"margin-right":"8px"}}),a("text",{},[t._v("积分明细")])]),a("view",{staticClass:"hw-rt",attrs:{eventid:"4ad6aa87-0"},on:{click:t.onShowScreenDialog}},[a("text",{staticClass:"iconfont icon-btn_filter"}),a("text",{staticStyle:{"margin-left":"7px"}},[t._v("筛选")])])]),a("view",{staticClass:"integral-list"},[t._l(t.list,function(e,s){return a("view",{key:s,staticClass:"item-integral"},[a("view",{staticClass:"iw-lt"},[a("view",{staticClass:"pay-type"},[t._v(t._s(e.type_mean))]),a("view",{staticClass:"pay-date"},[t._v(t._s(e.add_time))])]),a("view",{staticClass:"iw-rt",style:"color:"+("add"==e.mark?"#000":"#f00")},[t._v(t._s("reduce"==e.mark?"-":"+")+t._s(e.num))])])}),t.more?a("view",{staticClass:"more",attrs:{bindtap:"loadMore"}},[t._v("点击查看更多")]):t._e(),t.more?t._e():a("view",{staticClass:"nodata"},[t._v("已经全部为你呈现了")])],2)]),a("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",mpcomid:"4ad6aa87-0"}}),a("ToastView",{attrs:{mpcomid:"4ad6aa87-1"}}),t.screenFlag?a("view",{staticClass:"mask",staticStyle:{"z-index":"0",top:"44px"}},[a("view",{staticClass:"dialog-content"},[a("view",{staticClass:"apply-header"},[a("view",{staticClass:"apply-tit"},[t._v("筛选")]),a("view",{staticClass:"apply-close",attrs:{eventid:"4ad6aa87-1"},on:{click:t.onHiddenScreenDialog}},[a("text",{staticClass:"iconfont icon-btn_close_black"})])]),a("view",{staticClass:"apply-cont"},[a("view",{staticClass:"screen-cont"},[a("view",{staticClass:"s-title"},[t._v("选择类型")]),a("view",{staticClass:"s-listBox"},t._l(t.type_means,function(e,s){return a("view",{key:s,staticClass:"item-screen",attrs:{"data-id":e.key,eventid:"4ad6aa87-2-"+s},on:{click:t.selectScreenTypeListener}},[a("view",{class:t.typeId==e.key?"screen-sel":"screen-nor"},[t._v(t._s(e.val))])])}))]),a("view",{staticClass:"screen-type"},[a("view",{staticClass:"screen-lt",attrs:{eventid:"4ad6aa87-3"},on:{click:t.onShowScreenDateDialog}},[t._v("选择日期")]),a("view",{staticClass:"screen-rt",attrs:{eventid:"4ad6aa87-4"},on:{click:t.onShowScreenTypeDialog}},[a("text",[t._v(t._s(""==t.selectMsg?"请选择":t.selectMsg))]),a("text",{staticClass:"iconfont icon-btn_arrowr"})])]),a("view",{staticClass:"btn-save",attrs:{eventid:"4ad6aa87-5"},on:{click:t.sureScreenListener}},[t._v("保存")])])])]):t._e(),t.screenTypeFlag?a("view",{staticClass:"mask"},[a("view",{staticClass:"time-listBox"},[a("view",{staticClass:"item-time",attrs:{"data-type":"1",eventid:"4ad6aa87-6"},on:{click:t.onDateTypeListener}},[a("text",{staticClass:"name"},[t._v("近三月")]),1==t.screenType?a("text",{staticClass:"arrow iconfont icon-icon_radio",staticStyle:{color:"#f00"}}):t._e()]),a("view",{staticClass:"item-time",attrs:{"data-type":"2",eventid:"4ad6aa87-7"},on:{click:t.onDateTypeListener}},[a("text",{staticClass:"name"},[t._v("近一月")]),2==t.screenType?a("text",{staticClass:"arrow iconfont icon-icon_radio",staticStyle:{color:"#f00"}}):t._e()]),a("view",{staticClass:"item-time",attrs:{"data-type":"3",eventid:"4ad6aa87-8"},on:{click:t.onDateTypeListener}},[a("text",{staticClass:"name"},[t._v("近一周")]),3==t.screenType?a("text",{staticClass:"arrow iconfont icon-icon_radio",staticStyle:{color:"#f00"}}):t._e()]),a("view",{staticClass:"item-time",attrs:{"data-type":"4",eventid:"4ad6aa87-9"},on:{click:t.onDateTypeListener}},[a("text",{staticClass:"name"},[t._v("自定义")]),4==t.screenType?a("text",{staticClass:"arrow iconfont icon-icon_radio",staticStyle:{color:"#f00"}}):t._e()])])]):t._e(),t.screenDateFlag?a("view",{staticClass:"mask"},[a("view",{staticClass:"time-listBox"},[a("view",{staticClass:"item-time"},[a("view",{staticClass:"date-cancel",attrs:{eventid:"4ad6aa87-10"},on:{click:t.onHiddenScreenDateDialog}},[t._v("取消")]),a("view",{staticClass:"date-title",style:"color:"+(0==t.msgType?"#2D3133":"#FF3200")},[t._v(t._s(0==t.msgType?"选择起始日期":t.msg))]),a("view",{staticClass:"date-sure",attrs:{eventid:"4ad6aa87-11"},on:{click:t.onSureDateListener}},[t._v("完成")])]),a("view",{staticClass:"date-cont"},[a("view",{staticClass:"item",attrs:{eventid:"4ad6aa87-12"},on:{click:t.onClickStartListener}},[a("text",{class:0==t.dateType?"blue":"gray"},[t._v(t._s(t.startDate))])]),a("view",{staticClass:"item"},[t._v("至")]),a("view",{staticClass:"item",attrs:{eventid:"4ad6aa87-13"},on:{click:t.onClickEndListener}},[a("text",{class:1==t.dateType?"blue":"gray"},[t._v(t._s(t.endDate))])])]),a("picker-view",{staticStyle:{width:"100%",height:"150px"},attrs:{"indicator-style":"height: 50px;",value:t.dateValue,eventid:"4ad6aa87-14"},on:{change:t.bindChangeListener}},[a("picker-view-column",{attrs:{mpcomid:"4ad6aa87-2"}},t._l(t.years,function(e,s){return a("view",{key:s,staticClass:"picker-date"},[t._v(t._s(e)+"年")])})),a("picker-view-column",{attrs:{mpcomid:"4ad6aa87-3"}},t._l(t.months,function(e,s){return a("view",{key:s,staticClass:"picker-date"},[t._v(t._s(e)+"月")])})),a("picker-view-column",{attrs:{mpcomid:"4ad6aa87-4"}},t._l(t.days,function(e,s){return a("view",{key:s,staticClass:"picker-date"},[t._v(t._s(e)+"日")])}))],1)],1)]):t._e()],1)},i=[];a.d(e,"a",function(){return s}),a.d(e,"b",function(){return i})}},[["c64e","common/runtime","common/vendor"]]]);