(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-92ff5ee6"],{"299c7":function(t,e,a){"use strict";var i=a("c8b0"),s=a.n(i);s.a},"4a4f":function(t,e,a){"use strict";a.r(e);var i=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",[a("top-nav",{attrs:{title:"统计中心"}}),t._m(0),a("div",{staticClass:"wyu-main"},[a("div",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticClass:"wyu-block"},[a("el-tabs",{on:{"tab-click":t.handleClick},model:{value:t.activeName,callback:function(e){t.activeName=e},expression:"activeName"}},[a("el-tab-pane",{attrs:{label:"最近三天",name:"1"}}),a("el-tab-pane",{attrs:{label:"最近七天",name:"2"}}),a("el-tab-pane",{attrs:{label:"最近半个月",name:"3"}}),a("el-tab-pane",{attrs:{label:"最近一个月",name:"4"}})],1),a("div",[a("nav",{attrs:{title:"统计中心"}}),a("div",{staticClass:"wyu-main"},[a("div",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticClass:"wyu-block"},[a("el-row",[a("el-col",{attrs:{span:24}},[a("h1",[t._v("热门业务TOP10")])])],1),a("el-row",[a("el-col",{attrs:{span:24}},[a("v-chart",{attrs:{options:t.hotProducts}})],1)],1)],1)])])],1)])],1)},s=[function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"wyu-tips wyu-tips-warning"},[a("p",[t._v("这里展示业务浏览TOP10")])])}],n=(a("ac6a"),a("7f7f"),a("d722")),o=a("9ca8"),l=(a("ef97"),a("c037"),a("94b1"),a("007d"),a("d28f"),a("627c"),a("b11c"),a("95a8"),a("5200")),r={components:{TopNav:l["a"],"v-chart":o["a"]},data:function(){return{searchForm:{timearea:0},hotProducts:{tooltip:{trigger:"axis",axisPointer:{type:"shadow"}},legend:{data:["微信小程序","头条小程序","支付宝小程序","百度小程序","h5"]},toolbox:{show:!0,feature:{mark:{show:!0},dataView:{show:!0,readOnly:!1},magicType:{show:!0,type:["line","bar","stack","tiled"]},restore:{show:!0},saveAsImage:{show:!0}}},calculable:!0,xAxis:[{type:"value"}],yAxis:[{type:"category",data:[]}],series:[{name:"微信小程序",type:"bar",stack:"总量",key:"weixin",itemStyle:{normal:{label:{show:!0,position:"insideRight"}}},data:[]},{name:"百度小程序",type:"bar",stack:"总量",key:"baidu",itemStyle:{normal:{label:{show:!0,position:"insideRight"}}},data:[]},{name:"支付宝小程序",type:"bar",stack:"总量",key:"ali",itemStyle:{normal:{label:{show:!0,position:"insideRight"}}},data:[]},{name:"头条小程序",type:"bar",stack:"总量",key:"toutiao",itemStyle:{normal:{label:{show:!0,position:"insideRight"}}},data:[]},{name:"h5",type:"bar",stack:"总量",key:"h5",itemStyle:{normal:{label:{show:!0,position:"insideRight"}}},data:[]}]},loading:!1,activeName:"1",timearea:1,datas:[]}},created:function(){this.getHotExample()},methods:{handleClick:function(t,e){this.timearea=t._props.name,this.getHotExample()},getHotExample:function(){var t=this;this.loading=!0,n["a"]("/website/admin.tongji/getHotExample",{appToken:this.$store.getters.appToken,timearea:this.timearea}).then(function(e){t.hotProducts.yAxis[0].data=e.title,t.hotProducts.series.forEach(function(a,i){t.hotProducts.series[i].data=e.count[t.hotProducts.series[i].key]}),t.loading=!1}).catch(function(e){t.loading=!1})}}},c=r,d=(a("299c7"),a("2877")),m=Object(d["a"])(c,i,s,!1,null,null,null);e["default"]=m.exports},ac6a:function(t,e,a){for(var i=a("cadf"),s=a("0d58"),n=a("2aba"),o=a("7726"),l=a("32e9"),r=a("84f2"),c=a("2b4c"),d=c("iterator"),m=c("toStringTag"),u=r.Array,h={CSSRuleList:!0,CSSStyleDeclaration:!1,CSSValueList:!1,ClientRectList:!1,DOMRectList:!1,DOMStringList:!1,DOMTokenList:!0,DataTransferItemList:!1,FileList:!1,HTMLAllCollection:!1,HTMLCollection:!1,HTMLFormElement:!1,HTMLSelectElement:!1,MediaList:!0,MimeTypeArray:!1,NamedNodeMap:!1,NodeList:!0,PaintRequestList:!1,Plugin:!1,PluginArray:!1,SVGLengthList:!1,SVGNumberList:!1,SVGPathSegList:!1,SVGPointList:!1,SVGStringList:!1,SVGTransformList:!1,SourceBufferList:!1,StyleSheetList:!0,TextTrackCueList:!1,TextTrackList:!1,TouchList:!1},p=s(h),g=0;g<p.length;g++){var b,y=p[g],f=h[y],v=o[y],w=v&&v.prototype;if(w&&(w[d]||l(w,d,u),w[m]||l(w,m,y),r[y]=u,f))for(b in i)w[b]||n(w,b,i[b],!0)}},c8b0:function(t,e,a){}}]);
//# sourceMappingURL=chunk-92ff5ee6.ad11355a.js.map