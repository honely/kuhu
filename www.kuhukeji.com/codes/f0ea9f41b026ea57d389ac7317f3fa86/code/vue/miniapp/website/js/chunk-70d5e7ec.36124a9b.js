(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-70d5e7ec"],{"3f9a":function(t,e,a){},5306:function(t,e,a){"use strict";var i=a("c33d"),l=a.n(i);l.a},"93fb":function(t,e,a){"use strict";var i=a("3f9a"),l=a.n(i);l.a},9556:function(t,e,a){"use strict";var i=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"wyu-editor"},[a("div",{staticClass:"html-editor"},[a("div",{staticClass:"html-editor-tit"},[a("span",{staticClass:"el-icon-back"}),a("span",{staticClass:"tit"},[t._v(t._s(t.title?t.title:"富文本编辑器"))]),a("span",{staticClass:"act"},[a("a",{attrs:{href:"javascript:void(0);"},on:{click:function(e){t.showType=0==t.showType?1:0}}},[t._v(t._s(0==t.showType?"预览":"编辑"))])])]),a("div",{directives:[{name:"show",rawName:"v-show",value:0==t.showType,expression:"showType ==0"}],staticClass:"html-editor-main"},[a("div",{staticClass:"item"},[a("div",{staticClass:"editor-add"},[a("i",{staticClass:"el-icon-circle-plus",on:{click:function(e){t.addBtnIndex=-1}}}),a("transition",{attrs:{name:"el-zoom-in-center"}},[a("div",{directives:[{name:"show",rawName:"v-show",value:-1==t.addBtnIndex,expression:"addBtnIndex == -1"}],staticClass:"add-action-list"},[a("ul",[a("li",{on:{click:function(e){return t.addTxt(-1)}}},[a("i",{staticClass:"iconfont icon-wenben"})]),a("li",{on:{click:function(e){return t.addPhoto(-1)}}},[a("i",{staticClass:"iconfont icon-tupian"})]),a("li",{on:{click:function(e){return t.addVideo(-1)}}},[a("i",{staticClass:"iconfont icon-shipin"})]),a("li",{on:{click:function(e){t.addBtnIndex=-2}}},[t._v("取消")])])])])],1)]),t._l(t.htmldata,function(e,i){return a("div",{key:i,staticClass:"item",style:(e.mgTop?"margin-top:"+e.mgTop+"px;":"")+(e.mgBt?"margin-bottom:"+e.mgBt+"px;":"")},[a("div",{class:t.editIndex==i?"show-item on":"show-item",style:t.styleByIndex(i)},["txt"==e.mdl?a("div",[t._v(t._s(e.txt))]):t._e(),"pic"==e.mdl?a("div",[""!=e.img?a("img",{staticStyle:{"max-width":"100%"},attrs:{src:e.img}}):a("p",[t._v("等待上传图片")])]):t._e(),"video"==e.mdl?a("div",[e.video?a("video",{staticStyle:{"max-width":"100%"},attrs:{src:e.video,controls:"controls"}},[t._v("\n                      您的浏览器不支持 video 标签。\n                      ")]):a("p",[t._v("等待上传图片")])]):t._e(),a("div",{staticClass:"action"},[a("i",{staticClass:"el-icon-edit-outline",on:{click:function(e){t.editIndex=i}}}),a("i",{staticClass:"el-icon-delete",on:{click:function(e){return t.deleteObj(i)}}})])]),a("div",{staticClass:"editor-add"},[a("i",{staticClass:"el-icon-circle-plus",on:{click:function(e){t.addBtnIndex=i}}}),a("div",{directives:[{name:"show",rawName:"v-show",value:t.addBtnIndex==i,expression:"addBtnIndex == index"}],staticClass:"add-action-list"},[a("ul",[a("li",{on:{click:function(e){return t.addTxt(i)}}},[a("i",{staticClass:"iconfont icon-wenben"})]),a("li",{on:{click:function(e){return t.addPhoto(i)}}},[a("i",{staticClass:"iconfont icon-tupian"})]),a("li",{on:{click:function(e){return t.addVideo(i)}}},[a("i",{staticClass:"iconfont icon-shipin"})]),a("li",{on:{click:function(e){t.addBtnIndex=-2}}},[t._v("取消")])])])])])})],2),a("div",{directives:[{name:"show",rawName:"v-show",value:1==t.showType,expression:"showType ==1"}],staticClass:"html-editor-show"},t._l(t.htmldata,function(e,i){return a("div",{key:i,staticClass:"item",style:(e.mgTop?"margin-top:"+e.mgTop+"px;":"")+(e.mgBt?"margin-bottom:"+e.mgBt+"px;":"")},[a("div",{class:t.editIndex==i?"show-item on":"show-item",style:t.styleByIndex(i)},["txt"==e.mdl?a("div",[t._v(t._s(e.txt))]):t._e(),"pic"==e.mdl?a("div",[""!=e.img?a("img",{staticStyle:{"max-width":"100%"},attrs:{src:e.img}}):a("p",[t._v("等待上传图片")])]):t._e(),"video"==e.mdl?a("div",[e.video?a("video",{staticStyle:{"max-width":"100%"},attrs:{src:e.video,controls:"controls"}},[t._v("\n                      您的浏览器不支持 video 标签。\n                      ")]):a("p",[t._v("等待上传图片")])]):t._e()])])}),0)]),t.editIndex>=0?a("div",{staticClass:"html-editor-form"},[t._m(0),t._l(t.htmldata,function(e,i){return a("div",{key:i,staticClass:"form-item"},[t.editIndex==i?a("el-form",{attrs:{"label-width":"80px",size:"small"}},["video"==e.mdl?a("el-form-item",{attrs:{label:"上传视频"}},[a("wyu-video",{attrs:{video:t.htmldata[i].video},model:{value:t.htmldata[i].video,callback:function(e){t.$set(t.htmldata[i],"video",e)},expression:"htmldata[index].video"}})],1):t._e(),"pic"==e.mdl?a("el-form-item",{attrs:{label:"上传图片"}},[a("wyu-upload",{attrs:{img:t.htmldata[i].img},model:{value:t.htmldata[i].img,callback:function(e){t.$set(t.htmldata[i],"img",e)},expression:"htmldata[index].img"}})],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"输入内容"}},[a("el-input",{attrs:{type:"textarea"},model:{value:t.htmldata[i].txt,callback:function(e){t.$set(t.htmldata[i],"txt",e)},expression:"htmldata[index].txt"}})],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"排列方式"}},[a("el-radio",{attrs:{label:0},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居左")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:1},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居中")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:2},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居右")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:3},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("首行缩进")])],1):t._e(),"txt"!=e.mdl?a("el-form-item",{attrs:{label:"排列方式"}},[a("el-radio",{attrs:{label:0},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居左")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:1},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居中")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:2},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居右")])],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"字体大小"}},[a("el-input-number",{attrs:{size:"small",min:10,max:50},model:{value:t.htmldata[i].fontsize,callback:function(e){t.$set(t.htmldata[i],"fontsize",e)},expression:"htmldata[index].fontsize"}})],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"字体加粗"}},[a("el-radio",{attrs:{label:0},model:{value:t.htmldata[i].isb,callback:function(e){t.$set(t.htmldata[i],"isb",e)},expression:"htmldata[index].isb"}},[t._v("默认")]),a("el-radio",{attrs:{label:1},model:{value:t.htmldata[i].isb,callback:function(e){t.$set(t.htmldata[i],"isb",e)},expression:"htmldata[index].isb"}},[t._v("加粗")])],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"颜色"}},[a("el-color-picker",{attrs:{size:"mini"},model:{value:t.htmldata[i].color,callback:function(e){t.$set(t.htmldata[i],"color",e)},expression:"htmldata[index].color"}})],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"行高"}},[a("el-input-number",{attrs:{size:"small",min:10,max:50},model:{value:t.htmldata[i].lineH,callback:function(e){t.$set(t.htmldata[i],"lineH",e)},expression:"htmldata[index].lineH"}})],1):t._e(),a("el-form-item",{attrs:{label:"图片背景"}},[a("el-radio",{attrs:{label:0},model:{value:t.htmldata[i].isBgPic,callback:function(e){t.$set(t.htmldata[i],"isBgPic",e)},expression:"htmldata[index].isBgPic"}},[t._v("不启用")]),a("el-radio",{attrs:{label:1},model:{value:t.htmldata[i].isBgPic,callback:function(e){t.$set(t.htmldata[i],"isBgPic",e)},expression:"htmldata[index].isBgPic"}},[t._v("启用")])],1),1==t.htmldata[i].isBgPic?a("el-form-item",{attrs:{label:"背景图片"}},[a("wyu-upload",{attrs:{img:t.htmldata[i].bgPic},model:{value:t.htmldata[i].bgPic,callback:function(e){t.$set(t.htmldata[i],"bgPic",e)},expression:"htmldata[index].bgPic"}})],1):t._e(),1==t.htmldata[i].isBgPic?a("el-form-item",{attrs:{label:"背景排列"}},[a("el-radio",{attrs:{label:0},model:{value:t.htmldata[i].bgPicType,callback:function(e){t.$set(t.htmldata[i],"bgPicType",e)},expression:"htmldata[index].bgPicType"}},[t._v("顶部居中")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:1},model:{value:t.htmldata[i].bgPicType,callback:function(e){t.$set(t.htmldata[i],"bgPicType",e)},expression:"htmldata[index].bgPicType"}},[t._v("容器平铺")])],1):t._e(),a("el-form-item",{attrs:{label:"背景颜色"}},[a("el-color-picker",{attrs:{size:"mini"},model:{value:t.htmldata[i].bg,callback:function(e){t.$set(t.htmldata[i],"bg",e)},expression:"htmldata[index].bg"}})],1),a("el-form-item",{attrs:{label:"上内边距"}},[a("el-slider",{attrs:{min:0,max:20,step:1},model:{value:t.htmldata[i].pt,callback:function(e){t.$set(t.htmldata[i],"pt",e)},expression:"htmldata[index].pt"}})],1),a("el-form-item",{attrs:{label:"左内边距"}},[a("el-slider",{attrs:{min:0,max:20,step:1},model:{value:t.htmldata[i].pl,callback:function(e){t.$set(t.htmldata[i],"pl",e)},expression:"htmldata[index].pl"}})],1),a("el-form-item",{attrs:{label:"右内边距"}},[a("el-slider",{attrs:{min:0,max:20,step:1},model:{value:t.htmldata[i].pr,callback:function(e){t.$set(t.htmldata[i],"pr",e)},expression:"htmldata[index].pr"}})],1),a("el-form-item",{attrs:{label:"下内边距"}},[a("el-slider",{attrs:{min:0,max:20,step:1},model:{value:t.htmldata[i].pb,callback:function(e){t.$set(t.htmldata[i],"pb",e)},expression:"htmldata[index].pb"}})],1),a("el-form-item",{attrs:{label:"距离上面"}},[a("el-slider",{attrs:{min:0,max:50,step:1},model:{value:t.htmldata[i].mgTop,callback:function(e){t.$set(t.htmldata[i],"mgTop",e)},expression:"htmldata[index].mgTop"}})],1),a("el-form-item",{attrs:{label:"距离下面"}},[a("el-slider",{attrs:{min:0,max:50,step:1},model:{value:t.htmldata[i].mgBt,callback:function(e){t.$set(t.htmldata[i],"mgBt",e)},expression:"htmldata[index].mgBt"}})],1)],1):t._e()],1)})],2):t._e()])},l=[function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"wyu-title"},[a("h2",[t._v("设置内容")])])}],s=a("f499"),n=a.n(s),d=(a("9ec8"),a("5fed")),o=a("85e1"),c={mdl:"txt",type:0,txt:"请输入内容",fontsize:14,isb:0,color:"#333333",lineH:20,isBgPic:0,bg:"#ffffff",bgPic:"",bgPicType:0,pt:5,pl:5,pr:5,pb:5,mgTop:0,mgBt:0},r={mdl:"video",type:0,video:"",isBgPic:0,bg:"#ffffff",bgPic:"",bgPicType:0,pt:5,pl:5,pr:5,pb:5,mgTop:0,mgBt:0},m={mdl:"pic",type:0,img:"",isBgPic:0,bg:"#ffffff",bgPic:"",bgPicType:0,pt:5,pl:5,pr:5,pb:5,mgTop:0,mgBt:0},p={name:"htmlEditor",props:["html","title"],components:{WyuUpload:d["a"],WyuVideo:o["a"]},data:function(){return{addBtnIndex:-2,htmldata:[],editIndex:-1,showType:0}},watch:{html:function(t){""!=t&&t!=this.htmldata&&(this.htmldata=t)},htmldata:{handler:function(t,e){this.htmldata!=this.html&&this.$emit("input",this.htmldata)},immediate:!0,deep:!0}},created:function(){this.html!=this.htmldata&&(this.htmldata=this.html)},methods:{styleByIndex:function(t){if(this.htmldata[t]){var e=this.htmldata[t],a="";switch("txt"==e.mdl&&(a+="font-size:"+e.fontsize+"px;",a+="color:"+e.color+";",a+="line-height:"+e.lineH+"px;",a+="word-wrap:break-word;",1==e.isb&&(a+="font-weight:bold;")),e.type){case 1:a+="text-align:center;";break;case 2:a+="text-align:right;";break;case 3:a+="text-indent:"+2*e.fontsize+"px;";break;default:a+="text-align:left;";break}return e.pt&&(a+="padding-top:"+e.pt+"px;"),e.pl&&(a+="padding-left:"+e.pl+"px;"),e.pr&&(a+="padding-right:"+e.pr+"px;"),e.pb&&(a+="padding-bottom:"+e.pb+"px;"),e.isBgPic&&""!=e.bgPic?0==e.bgPicType?a+="background: "+e.bg+" url("+e.bgPic+") no-repeat center 0":a+="background: "+e.bg+" url("+e.bgPic+")":a+="background:"+e.bg+";",a}return""},addTxt:function(t){var e=JSON.parse(n()(c));this.addObj(e,t)},addVideo:function(t){var e=JSON.parse(n()(r));this.addObj(e,t)},addPhoto:function(t){var e=JSON.parse(n()(m));this.addObj(e,t)},addObj:function(t,e){""==this.htmldata?(e=0,this.htmldata.push(t)):(e+=1,this.htmldata.splice(e,0,t)),this.editIndex=e,this.addBtnIndex=-2},deleteObj:function(t){this.htmldata.splice(t,1),this.editIndex=-1,this.addBtnIndex=-2}}},h=p,u=(a("93fb"),a("2877")),f=Object(u["a"])(h,i,l,!1,null,"2544e57e",null);e["a"]=f.exports},"9f94":function(t,e,a){"use strict";var i=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",[a("el-select",{staticClass:"selectDestination",attrs:{size:"small",filterable:"",placeholder:"请选择"},model:{value:t.selectdId,callback:function(e){t.selectdId=e},expression:"selectdId"}},[a("el-option",{attrs:{label:"请选择",value:-100}}),t._l(t.cats,function(t){return a("el-option",{key:t.category_id,attrs:{label:t.title,value:t.category_id}})})],2),0!=t.isAdd||t.notadd?t._e():a("el-button",{attrs:{type:"text"},on:{click:function(e){t.isAdd=1}}},[t._v("+添加分类")]),1!=t.isAdd||t.notadd?t._e():a("div",{staticClass:"addCategory"},[a("input",{directives:[{name:"model",rawName:"v-model",value:t.title,expression:"title"}],staticClass:"addCategoryName",attrs:{placeholder:"请输入要添加的分类名称"},domProps:{value:t.title},on:{input:function(e){e.target.composing||(t.title=e.target.value)}}}),t._v("\n      排序: "),a("input",{directives:[{name:"model",rawName:"v-model",value:t.orderby,expression:"orderby"}],staticClass:"addCategoryName",attrs:{placeholder:"请输入要排序"},domProps:{value:t.orderby},on:{input:function(e){e.target.composing||(t.orderby=e.target.value)}}}),a("el-button",{directives:[{name:"loading",rawName:"v-loading",value:t.loadingbtn,expression:"loadingbtn"}],staticStyle:{"margin-left":"10px"},attrs:{size:"small",type:"primary"},on:{click:t.addCategory}},[t._v("确认")]),a("el-button",{attrs:{size:"small"},on:{click:function(e){t.isAdd=0}}},[t._v("取消")])],1)],1)},l=[],s=a("d722"),n={name:"Cat",props:["cat","notadd"],data:function(){return{title:"",orderby:0,loading:!1,loadingbtn:!1,cats:[],selectdId:"",isAdd:0,category_id:0}},watch:{cat:function(t){this.selectdId=t},selectdId:function(t){t!=this.category_id&&this.$emit("selectCatId",t)}},created:function(){this.getDatas()},methods:{addCategory:function(){var t=this;if(!t.title)return this.$message({message:"请填写分类名称分类",type:"error"}),!1;t.loadingbtn=!0,s["a"]("website/admin.example/catCreate",{appToken:this.$store.getters.appToken,title:t.title,orderby:t.orderby}).then(function(e){t.loadingbtn=!1,t.orderby=0,t.title="",t.isAdd=0,t.getDatas()}).catch(function(e){t.loadingbtn=!1})},selectId:function(t){},getDatas:function(){var t=this;t.loading=!0,s["a"]("website/admin.example/getCat",{appToken:this.$store.getters.appToken}).then(function(e){t.loading=!1,t.cats=e.list}).catch(function(e){t.loading=!1})}}},d=n,o=(a("5306"),a("2877")),c=Object(o["a"])(d,i,l,!1,null,"3bf39e8c",null);e["a"]=c.exports},ac6a:function(t,e,a){for(var i=a("cadf"),l=a("0d58"),s=a("2aba"),n=a("7726"),d=a("32e9"),o=a("84f2"),c=a("2b4c"),r=c("iterator"),m=c("toStringTag"),p=o.Array,h={CSSRuleList:!0,CSSStyleDeclaration:!1,CSSValueList:!1,ClientRectList:!1,DOMRectList:!1,DOMStringList:!1,DOMTokenList:!0,DataTransferItemList:!1,FileList:!1,HTMLAllCollection:!1,HTMLCollection:!1,HTMLFormElement:!1,HTMLSelectElement:!1,MediaList:!0,MimeTypeArray:!1,NamedNodeMap:!1,NodeList:!0,PaintRequestList:!1,Plugin:!1,PluginArray:!1,SVGLengthList:!1,SVGNumberList:!1,SVGPathSegList:!1,SVGPointList:!1,SVGStringList:!1,SVGTransformList:!1,SourceBufferList:!1,StyleSheetList:!0,TextTrackCueList:!1,TextTrackList:!1,TouchList:!1},u=l(h),f=0;f<u.length;f++){var b,x=u[f],v=h[x],g=n[x],y=g&&g.prototype;if(y&&(y[r]||d(y,r,p),y[m]||d(y,m,x),o[x]=p,v))for(b in i)y[b]||s(y,b,i[b],!0)}},c33d:function(t,e,a){}}]);
//# sourceMappingURL=chunk-70d5e7ec.36124a9b.js.map