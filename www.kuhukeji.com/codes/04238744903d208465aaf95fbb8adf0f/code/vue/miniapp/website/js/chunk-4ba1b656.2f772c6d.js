(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-4ba1b656"],{"122d":function(t,e,a){},"3f9a":function(t,e,a){},"71ff":function(t,e,a){"use strict";var i=a("122d"),l=a.n(i);l.a},"93fb":function(t,e,a){"use strict";var i=a("3f9a"),l=a.n(i);l.a},9556:function(t,e,a){"use strict";var i=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"wyu-editor"},[a("div",{staticClass:"html-editor"},[a("div",{staticClass:"html-editor-tit"},[a("span",{staticClass:"el-icon-back"}),a("span",{staticClass:"tit"},[t._v(t._s(t.title?t.title:"富文本编辑器"))]),a("span",{staticClass:"act"},[a("a",{attrs:{href:"javascript:void(0);"},on:{click:function(e){t.showType=0==t.showType?1:0}}},[t._v(t._s(0==t.showType?"预览":"编辑"))])])]),a("div",{directives:[{name:"show",rawName:"v-show",value:0==t.showType,expression:"showType ==0"}],staticClass:"html-editor-main"},[a("div",{staticClass:"item"},[a("div",{staticClass:"editor-add"},[a("i",{staticClass:"el-icon-circle-plus",on:{click:function(e){t.addBtnIndex=-1}}}),a("transition",{attrs:{name:"el-zoom-in-center"}},[a("div",{directives:[{name:"show",rawName:"v-show",value:-1==t.addBtnIndex,expression:"addBtnIndex == -1"}],staticClass:"add-action-list"},[a("ul",[a("li",{on:{click:function(e){return t.addTxt(-1)}}},[a("i",{staticClass:"iconfont icon-wenben"})]),a("li",{on:{click:function(e){return t.addPhoto(-1)}}},[a("i",{staticClass:"iconfont icon-tupian"})]),a("li",{on:{click:function(e){return t.addVideo(-1)}}},[a("i",{staticClass:"iconfont icon-shipin"})]),a("li",{on:{click:function(e){t.addBtnIndex=-2}}},[t._v("取消")])])])])],1)]),t._l(t.htmldata,function(e,i){return a("div",{key:i,staticClass:"item",style:(e.mgTop?"margin-top:"+e.mgTop+"px;":"")+(e.mgBt?"margin-bottom:"+e.mgBt+"px;":"")},[a("div",{class:t.editIndex==i?"show-item on":"show-item",style:t.styleByIndex(i)},["txt"==e.mdl?a("div",[t._v(t._s(e.txt))]):t._e(),"pic"==e.mdl?a("div",[""!=e.img?a("img",{staticStyle:{"max-width":"100%"},attrs:{src:e.img}}):a("p",[t._v("等待上传图片")])]):t._e(),"video"==e.mdl?a("div",[e.video?a("video",{staticStyle:{"max-width":"100%"},attrs:{src:e.video,controls:"controls"}},[t._v("\n                      您的浏览器不支持 video 标签。\n                      ")]):a("p",[t._v("等待上传图片")])]):t._e(),a("div",{staticClass:"action"},[a("i",{staticClass:"el-icon-edit-outline",on:{click:function(e){t.editIndex=i}}}),a("i",{staticClass:"el-icon-delete",on:{click:function(e){return t.deleteObj(i)}}})])]),a("div",{staticClass:"editor-add"},[a("i",{staticClass:"el-icon-circle-plus",on:{click:function(e){t.addBtnIndex=i}}}),a("div",{directives:[{name:"show",rawName:"v-show",value:t.addBtnIndex==i,expression:"addBtnIndex == index"}],staticClass:"add-action-list"},[a("ul",[a("li",{on:{click:function(e){return t.addTxt(i)}}},[a("i",{staticClass:"iconfont icon-wenben"})]),a("li",{on:{click:function(e){return t.addPhoto(i)}}},[a("i",{staticClass:"iconfont icon-tupian"})]),a("li",{on:{click:function(e){return t.addVideo(i)}}},[a("i",{staticClass:"iconfont icon-shipin"})]),a("li",{on:{click:function(e){t.addBtnIndex=-2}}},[t._v("取消")])])])])])})],2),a("div",{directives:[{name:"show",rawName:"v-show",value:1==t.showType,expression:"showType ==1"}],staticClass:"html-editor-show"},t._l(t.htmldata,function(e,i){return a("div",{key:i,staticClass:"item",style:(e.mgTop?"margin-top:"+e.mgTop+"px;":"")+(e.mgBt?"margin-bottom:"+e.mgBt+"px;":"")},[a("div",{class:t.editIndex==i?"show-item on":"show-item",style:t.styleByIndex(i)},["txt"==e.mdl?a("div",[t._v(t._s(e.txt))]):t._e(),"pic"==e.mdl?a("div",[""!=e.img?a("img",{staticStyle:{"max-width":"100%"},attrs:{src:e.img}}):a("p",[t._v("等待上传图片")])]):t._e(),"video"==e.mdl?a("div",[e.video?a("video",{staticStyle:{"max-width":"100%"},attrs:{src:e.video,controls:"controls"}},[t._v("\n                      您的浏览器不支持 video 标签。\n                      ")]):a("p",[t._v("等待上传图片")])]):t._e()])])}),0)]),t.editIndex>=0?a("div",{staticClass:"html-editor-form"},[t._m(0),t._l(t.htmldata,function(e,i){return a("div",{key:i,staticClass:"form-item"},[t.editIndex==i?a("el-form",{attrs:{"label-width":"80px",size:"small"}},["video"==e.mdl?a("el-form-item",{attrs:{label:"上传视频"}},[a("wyu-video",{attrs:{video:t.htmldata[i].video},model:{value:t.htmldata[i].video,callback:function(e){t.$set(t.htmldata[i],"video",e)},expression:"htmldata[index].video"}})],1):t._e(),"pic"==e.mdl?a("el-form-item",{attrs:{label:"上传图片"}},[a("wyu-upload",{attrs:{img:t.htmldata[i].img},model:{value:t.htmldata[i].img,callback:function(e){t.$set(t.htmldata[i],"img",e)},expression:"htmldata[index].img"}})],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"输入内容"}},[a("el-input",{attrs:{type:"textarea"},model:{value:t.htmldata[i].txt,callback:function(e){t.$set(t.htmldata[i],"txt",e)},expression:"htmldata[index].txt"}})],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"排列方式"}},[a("el-radio",{attrs:{label:0},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居左")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:1},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居中")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:2},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居右")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:3},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("首行缩进")])],1):t._e(),"txt"!=e.mdl?a("el-form-item",{attrs:{label:"排列方式"}},[a("el-radio",{attrs:{label:0},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居左")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:1},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居中")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:2},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居右")])],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"字体大小"}},[a("el-input-number",{attrs:{size:"small",min:10,max:50},model:{value:t.htmldata[i].fontsize,callback:function(e){t.$set(t.htmldata[i],"fontsize",e)},expression:"htmldata[index].fontsize"}})],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"字体加粗"}},[a("el-radio",{attrs:{label:0},model:{value:t.htmldata[i].isb,callback:function(e){t.$set(t.htmldata[i],"isb",e)},expression:"htmldata[index].isb"}},[t._v("默认")]),a("el-radio",{attrs:{label:1},model:{value:t.htmldata[i].isb,callback:function(e){t.$set(t.htmldata[i],"isb",e)},expression:"htmldata[index].isb"}},[t._v("加粗")])],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"颜色"}},[a("el-color-picker",{attrs:{size:"mini"},model:{value:t.htmldata[i].color,callback:function(e){t.$set(t.htmldata[i],"color",e)},expression:"htmldata[index].color"}})],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"行高"}},[a("el-input-number",{attrs:{size:"small",min:10,max:50},model:{value:t.htmldata[i].lineH,callback:function(e){t.$set(t.htmldata[i],"lineH",e)},expression:"htmldata[index].lineH"}})],1):t._e(),a("el-form-item",{attrs:{label:"图片背景"}},[a("el-radio",{attrs:{label:0},model:{value:t.htmldata[i].isBgPic,callback:function(e){t.$set(t.htmldata[i],"isBgPic",e)},expression:"htmldata[index].isBgPic"}},[t._v("不启用")]),a("el-radio",{attrs:{label:1},model:{value:t.htmldata[i].isBgPic,callback:function(e){t.$set(t.htmldata[i],"isBgPic",e)},expression:"htmldata[index].isBgPic"}},[t._v("启用")])],1),1==t.htmldata[i].isBgPic?a("el-form-item",{attrs:{label:"背景图片"}},[a("wyu-upload",{attrs:{img:t.htmldata[i].bgPic},model:{value:t.htmldata[i].bgPic,callback:function(e){t.$set(t.htmldata[i],"bgPic",e)},expression:"htmldata[index].bgPic"}})],1):t._e(),1==t.htmldata[i].isBgPic?a("el-form-item",{attrs:{label:"背景排列"}},[a("el-radio",{attrs:{label:0},model:{value:t.htmldata[i].bgPicType,callback:function(e){t.$set(t.htmldata[i],"bgPicType",e)},expression:"htmldata[index].bgPicType"}},[t._v("顶部居中")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:1},model:{value:t.htmldata[i].bgPicType,callback:function(e){t.$set(t.htmldata[i],"bgPicType",e)},expression:"htmldata[index].bgPicType"}},[t._v("容器平铺")])],1):t._e(),a("el-form-item",{attrs:{label:"背景颜色"}},[a("el-color-picker",{attrs:{size:"mini"},model:{value:t.htmldata[i].bg,callback:function(e){t.$set(t.htmldata[i],"bg",e)},expression:"htmldata[index].bg"}})],1),a("el-form-item",{attrs:{label:"上内边距"}},[a("el-slider",{attrs:{min:0,max:20,step:1},model:{value:t.htmldata[i].pt,callback:function(e){t.$set(t.htmldata[i],"pt",e)},expression:"htmldata[index].pt"}})],1),a("el-form-item",{attrs:{label:"左内边距"}},[a("el-slider",{attrs:{min:0,max:20,step:1},model:{value:t.htmldata[i].pl,callback:function(e){t.$set(t.htmldata[i],"pl",e)},expression:"htmldata[index].pl"}})],1),a("el-form-item",{attrs:{label:"右内边距"}},[a("el-slider",{attrs:{min:0,max:20,step:1},model:{value:t.htmldata[i].pr,callback:function(e){t.$set(t.htmldata[i],"pr",e)},expression:"htmldata[index].pr"}})],1),a("el-form-item",{attrs:{label:"下内边距"}},[a("el-slider",{attrs:{min:0,max:20,step:1},model:{value:t.htmldata[i].pb,callback:function(e){t.$set(t.htmldata[i],"pb",e)},expression:"htmldata[index].pb"}})],1),a("el-form-item",{attrs:{label:"距离上面"}},[a("el-slider",{attrs:{min:0,max:50,step:1},model:{value:t.htmldata[i].mgTop,callback:function(e){t.$set(t.htmldata[i],"mgTop",e)},expression:"htmldata[index].mgTop"}})],1),a("el-form-item",{attrs:{label:"距离下面"}},[a("el-slider",{attrs:{min:0,max:50,step:1},model:{value:t.htmldata[i].mgBt,callback:function(e){t.$set(t.htmldata[i],"mgBt",e)},expression:"htmldata[index].mgBt"}})],1)],1):t._e()],1)})],2):t._e()])},l=[function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"wyu-title"},[a("h2",[t._v("设置内容")])])}],s=a("f499"),n=a.n(s),o=(a("9ec8"),a("5fed")),d=a("85e1"),r={mdl:"txt",type:0,txt:"请输入内容",fontsize:14,isb:0,color:"#333333",lineH:20,isBgPic:0,bg:"#ffffff",bgPic:"",bgPicType:0,pt:5,pl:5,pr:5,pb:5,mgTop:0,mgBt:0},c={mdl:"video",type:0,video:"",isBgPic:0,bg:"#ffffff",bgPic:"",bgPicType:0,pt:5,pl:5,pr:5,pb:5,mgTop:0,mgBt:0},m={mdl:"pic",type:0,img:"",isBgPic:0,bg:"#ffffff",bgPic:"",bgPicType:0,pt:5,pl:5,pr:5,pb:5,mgTop:0,mgBt:0},p={name:"htmlEditor",props:["html","title"],components:{WyuUpload:o["a"],WyuVideo:d["a"]},data:function(){return{addBtnIndex:-2,htmldata:[],editIndex:-1,showType:0}},watch:{html:function(t){""!=t&&t!=this.htmldata&&(this.htmldata=t)},htmldata:{handler:function(t,e){this.htmldata!=this.html&&this.$emit("input",this.htmldata)},immediate:!0,deep:!0}},created:function(){this.html!=this.htmldata&&(this.htmldata=this.html)},methods:{styleByIndex:function(t){if(this.htmldata[t]){var e=this.htmldata[t],a="";switch("txt"==e.mdl&&(a+="font-size:"+e.fontsize+"px;",a+="color:"+e.color+";",a+="line-height:"+e.lineH+"px;",a+="word-wrap:break-word;",1==e.isb&&(a+="font-weight:bold;")),e.type){case 1:a+="text-align:center;";break;case 2:a+="text-align:right;";break;case 3:a+="text-indent:"+2*e.fontsize+"px;";break;default:a+="text-align:left;";break}return e.pt&&(a+="padding-top:"+e.pt+"px;"),e.pl&&(a+="padding-left:"+e.pl+"px;"),e.pr&&(a+="padding-right:"+e.pr+"px;"),e.pb&&(a+="padding-bottom:"+e.pb+"px;"),e.isBgPic&&""!=e.bgPic?0==e.bgPicType?a+="background: "+e.bg+" url("+e.bgPic+") no-repeat center 0":a+="background: "+e.bg+" url("+e.bgPic+")":a+="background:"+e.bg+";",a}return""},addTxt:function(t){var e=JSON.parse(n()(r));this.addObj(e,t)},addVideo:function(t){var e=JSON.parse(n()(c));this.addObj(e,t)},addPhoto:function(t){var e=JSON.parse(n()(m));this.addObj(e,t)},addObj:function(t,e){""==this.htmldata?(e=0,this.htmldata.push(t)):(e+=1,this.htmldata.splice(e,0,t)),this.editIndex=e,this.addBtnIndex=-2},deleteObj:function(t){this.htmldata.splice(t,1),this.editIndex=-1,this.addBtnIndex=-2}}},h=p,f=(a("93fb"),a("2877")),u=Object(f["a"])(h,i,l,!1,null,"2544e57e",null);e["a"]=u.exports},b60b:function(t,e,a){"use strict";a.r(e);var i=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",[a("top-nav",{attrs:{title:"关于我们"}}),a("div",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticClass:"wyu-main"},[a("div",{staticClass:"wyu-block"},[t._m(0),t._m(1),a("el-form",{ref:"form",attrs:{model:t.form,"label-width":"120px"}},[a("el-form-item",{attrs:{label:"公司名称"}},[a("el-input",{staticStyle:{width:"500px"},attrs:{placeholder:"请输入公司名称"},model:{value:t.form.company_name,callback:function(e){t.$set(t.form,"company_name",e)},expression:"form.company_name"}})],1),a("el-form-item",{attrs:{label:"公司位置"}},[a("amap-dr",{attrs:{address:t.addressInfo.address,lat:t.addressInfo.lat,lng:t.addressInfo.lng},model:{value:t.addressInfo,callback:function(e){t.addressInfo=e},expression:"addressInfo"}})],1),a("el-form-item",{attrs:{label:"轮播图"}},[a("wyu-upload",{attrs:{multi:!0,img:t.form.banner},model:{value:t.form.banner,callback:function(e){t.$set(t.form,"banner",e)},expression:"form.banner"}}),a("p",{staticClass:"tit"},[t._v(" 建议尺寸750px*500px或等比缩放")])],1),a("el-form-item",{attrs:{label:"公司电话"}},[a("el-input",{staticStyle:{width:"500px"},attrs:{placeholder:"请输入公司电话"},model:{value:t.form.tel,callback:function(e){t.$set(t.form,"tel",e)},expression:"form.tel"}})],1),a("el-form-item",{attrs:{label:"联系手机"}},[a("el-input",{staticStyle:{width:"500px"},attrs:{placeholder:"请输入联系手机"},model:{value:t.form.mobile,callback:function(e){t.$set(t.form,"mobile",e)},expression:"form.mobile"}})],1),a("el-form-item",{attrs:{label:"传真"}},[a("el-input",{staticStyle:{width:"500px"},attrs:{placeholder:"请输入传真"},model:{value:t.form.fax,callback:function(e){t.$set(t.form,"fax",e)},expression:"form.fax"}})],1),a("el-form-item",{attrs:{label:"邮箱"}},[a("el-input",{staticStyle:{width:"500px"},attrs:{placeholder:"请输入邮箱"},model:{value:t.form.email,callback:function(e){t.$set(t.form,"email",e)},expression:"form.email"}})],1),a("el-form-item",{attrs:{label:"二维码"}},[a("wyu-upload",{attrs:{img:t.form.qrcode},model:{value:t.form.qrcode,callback:function(e){t.$set(t.form,"qrcode",e)},expression:"form.qrcode"}}),a("p",{staticClass:"tit"},[t._v(" 建议尺寸160px*160px或等比缩放")])],1),a("el-form-item",{attrs:{label:"公司介绍"}},[a("html-editor",{attrs:{title:"公司介绍",html:t.form.introduce},model:{value:t.form.introduce,callback:function(e){t.$set(t.form,"introduce",e)},expression:"form.introduce"}})],1)],1)],1)]),a("div",{staticClass:"wyu-btn-div"},[a("el-button",{attrs:{size:"small",type:"primary"},on:{click:function(e){return t.setAbout()}}},[t._v("立即创建")]),a("el-button",{attrs:{size:"small"}},[t._v("取消")])],1)],1)},l=[function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"wyu-tips wyu-tips-info",staticStyle:{"margin-bottom":"10px"}},[a("p",{staticClass:"tit"},[t._v(" 1）这里设置关于我们")])])},function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"wyu-title"},[a("h2",[t._v("关于我们")])])}],s=a("f499"),n=a.n(s),o=a("5200"),d=a("9556"),r=a("5fed"),c=a("d722"),m=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",[a("div",[a("div",[a("el-input",{staticStyle:{width:"300px","margin-right":"10px"},attrs:{value:t.address,size:"mini"},on:{input:t.setAddressInfo}}),a("el-button",{attrs:{size:"mini"},on:{click:t.selectAddress}},[t._v("选择地址")])],1),a("div",{staticStyle:{"margin-top":"2px"}},[t._v("\n            经度："),a("el-input",{staticStyle:{width:"105px"},attrs:{disabled:!0,size:"mini"},model:{value:t.lng,callback:function(e){t.lng=e},expression:"lng"}}),t._v("\n            纬度："),a("el-input",{staticStyle:{width:"105px"},attrs:{disabled:!0,size:"mini"},model:{value:t.lat,callback:function(e){t.lat=e},expression:"lat"}})],1)]),a("el-dialog",{attrs:{width:"1000px",visible:t.dialogFormVisible,"modal-append-to-body":!1},on:{"update:visible":function(e){t.dialogFormVisible=e}}},[a("div",{staticClass:"miniapp-content",staticStyle:{"margin-top":"-30px"}},[a("div",{staticClass:"tip",staticStyle:{position:"relative","z-index":"999",top:"-30px"}},[a("p",[t._v("\n                    地址："+t._s(t.addressInfo.address)+"      经度："+t._s(t.addressInfo.lng)+"-纬度："+t._s(t.addressInfo.lat)+"\n                ")])]),a("div",{staticClass:"amap-page-container",staticStyle:{"margin-top":"-10px"}},[a("div",{staticClass:"search-box"},[a("el-col",{attrs:{xs:24,sm:16,md:16,lg:12,xl:12}},[a("div",{staticClass:"grid-content bg-purple-dark"}),a("el-input",{staticClass:"input-with-select",attrs:{placeholder:"请输入内容",id:"search",type:"search"},model:{value:t.searchKey,callback:function(e){t.searchKey=e},expression:"searchKey"}},[a("el-button",{attrs:{slot:"append",icon:"el-icon-search"},on:{click:t.searchByHand},slot:"append"},[t._v("搜索")])],1),a("div",{staticClass:"tip-box",attrs:{id:"searchTip"}})],1)],1),a("el-button",{staticClass:"map-ok",attrs:{slot:"append",type:"primary"},on:{click:t.sub},slot:"append"},[t._v("确定")]),t.toSearch?a("input",{staticClass:"search-input",attrs:{type:"text",id:"search1"}}):t._e(),a("el-amap",{staticClass:"amap-demo",attrs:{vid:"amap",zoom:t.zoom,center:t.center,amapManager:t.amapManager,events:t.events}})],1)])])],1)},p=[],h=(a("7f7f"),a("8f9b")),f=new h["AMapManager"],u={name:"AmapDr",props:["lat","lng","address"],data:function(){var t=this;return{dialogFormVisible:!1,zoom:16,center:[121.59996,31.197646],result:[],searchKey:"",toSearch:!1,addressInfo:{address:"",lat:"",lng:""},addressText:"",amapManager:f,map:null,events:{init:function(e){t.map=e}}}},watch:{map:function(){null!=this.map&&this.startDrag()}},methods:{selectAddress:function(){this.dialogFormVisible=!0},setAddressInfo:function(t){this.addressInfo.address=t},startDrag:function(){var t=this,e=this.amapManager.getMap();AMapUI.loadUI(["misc/PositionPicker"],function(a){var i,l=new a({mode:"dragMap",map:e});""==t.lat||""==t.lng?(e.plugin("AMap.Geolocation",function(){i=new AMap.Geolocation({showButton:!0,showMarker:!0,extensions:"all"}),e.addControl(i),i.getCurrentPosition(),AMap.event.addListener(i,"complete",function(t){l.start()})}),l.start()):(t.center=[t.lng,t.lat],l.start());l.on("success",function(e){t.addressInfo.address=e.address,t.addressInfo.lat=e.position.lat,t.addressInfo.lng=e.position.lng}),l.on("fail",function(t){})}),this.initSearch()},initSearch:function(){var t=this,e=this.amapManager.getMap();AMapUI.loadUI(["misc/PoiPicker"],function(a){var i=new a({input:"search",placeSearchOptions:{map:e,pageSize:10},suggestContainer:"searchTip",searchResultsContainer:"searchTip"});t.poiPicker=i,i.on("poiPicked",function(e){var a=e.source,l=e.item;"search"!==a?i.searchByKeyword(l.name):(i.clearSearchResults(),t.searchKey=l.name)})})},sub:function(){this.$emit("input",this.addressInfo),this.$emit("change",this.addressInfo),this.dialogFormVisible=!1},searchByHand:function(){""!=this.searchKey&&this.poiPicker.searchByKeyword(this.searchKey)}}},b=u,v=(a("71ff"),a("2877")),x=Object(v["a"])(b,m,p,!1,null,"008715d2",null),g=x.exports,y={name:"adminRole",components:{AmapDr:g,TopNav:o["a"],HtmlEditor:d["a"],WyuUpload:r["a"]},data:function(){return{loading:!1,addressInfo:{lat:"",lng:"",address:""},form:{company_name:"",introduce:[],banner:[],address:"",lat:"",lng:"",tel:"",mobile:"",fax:"",email:"",qrcode:""}}},created:function(){this.getAbout()},methods:{getAbout:function(){var t=this;this.loading=!0,c["a"]("/website/admin.setting/getSetting",{appToken:this.$store.getters.appToken}).then(function(e){t.form=e.detail,t.addressInfo.address=e.detail.address,t.addressInfo.lat=e.detail.lat,t.addressInfo.lng=e.detail.lng,t.loading=!1}).catch(function(e){t.loading=!1})},setAbout:function(){var t=this;this.loading=!0,c["a"]("/website/admin.setting/setSetting",{appToken:this.$store.getters.appToken,company_name:this.form.company_name,introduce:n()(this.form.introduce),banner:n()(this.form.banner),address:this.addressInfo.address,lat:this.addressInfo.lat,lng:this.addressInfo.lng,tel:this.form.tel,mobile:this.form.mobile,fax:this.form.fax,email:this.form.email,qrcode:this.form.qrcode}).then(function(e){t.$message({message:"恭喜你，操作成功",type:"success"}),t.loading=!1}).catch(function(e){t.loading=!1})}}},_=y,k=Object(v["a"])(_,i,l,!1,null,null,null);e["default"]=k.exports}}]);
//# sourceMappingURL=chunk-4ba1b656.2f772c6d.js.map