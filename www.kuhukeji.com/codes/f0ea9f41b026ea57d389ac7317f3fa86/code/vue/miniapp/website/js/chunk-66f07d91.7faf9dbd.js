(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-66f07d91"],{"3f9a":function(t,e,a){},"93fb":function(t,e,a){"use strict";var i=a("3f9a"),l=a.n(i);l.a},9556:function(t,e,a){"use strict";var i=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"wyu-editor"},[a("div",{staticClass:"html-editor"},[a("div",{staticClass:"html-editor-tit"},[a("span",{staticClass:"el-icon-back"}),a("span",{staticClass:"tit"},[t._v(t._s(t.title?t.title:"富文本编辑器"))]),a("span",{staticClass:"act"},[a("a",{attrs:{href:"javascript:void(0);"},on:{click:function(e){t.showType=0==t.showType?1:0}}},[t._v(t._s(0==t.showType?"预览":"编辑"))])])]),a("div",{directives:[{name:"show",rawName:"v-show",value:0==t.showType,expression:"showType ==0"}],staticClass:"html-editor-main"},[a("div",{staticClass:"item"},[a("div",{staticClass:"editor-add"},[a("i",{staticClass:"el-icon-circle-plus",on:{click:function(e){t.addBtnIndex=-1}}}),a("transition",{attrs:{name:"el-zoom-in-center"}},[a("div",{directives:[{name:"show",rawName:"v-show",value:-1==t.addBtnIndex,expression:"addBtnIndex == -1"}],staticClass:"add-action-list"},[a("ul",[a("li",{on:{click:function(e){return t.addTxt(-1)}}},[a("i",{staticClass:"iconfont icon-wenben"})]),a("li",{on:{click:function(e){return t.addPhoto(-1)}}},[a("i",{staticClass:"iconfont icon-tupian"})]),a("li",{on:{click:function(e){return t.addVideo(-1)}}},[a("i",{staticClass:"iconfont icon-shipin"})]),a("li",{on:{click:function(e){t.addBtnIndex=-2}}},[t._v("取消")])])])])],1)]),t._l(t.htmldata,function(e,i){return a("div",{key:i,staticClass:"item",style:(e.mgTop?"margin-top:"+e.mgTop+"px;":"")+(e.mgBt?"margin-bottom:"+e.mgBt+"px;":"")},[a("div",{class:t.editIndex==i?"show-item on":"show-item",style:t.styleByIndex(i)},["txt"==e.mdl?a("div",[t._v(t._s(e.txt))]):t._e(),"pic"==e.mdl?a("div",[""!=e.img?a("img",{staticStyle:{"max-width":"100%"},attrs:{src:e.img}}):a("p",[t._v("等待上传图片")])]):t._e(),"video"==e.mdl?a("div",[e.video?a("video",{staticStyle:{"max-width":"100%"},attrs:{src:e.video,controls:"controls"}},[t._v("\n                      您的浏览器不支持 video 标签。\n                      ")]):a("p",[t._v("等待上传图片")])]):t._e(),a("div",{staticClass:"action"},[a("i",{staticClass:"el-icon-edit-outline",on:{click:function(e){t.editIndex=i}}}),a("i",{staticClass:"el-icon-delete",on:{click:function(e){return t.deleteObj(i)}}})])]),a("div",{staticClass:"editor-add"},[a("i",{staticClass:"el-icon-circle-plus",on:{click:function(e){t.addBtnIndex=i}}}),a("div",{directives:[{name:"show",rawName:"v-show",value:t.addBtnIndex==i,expression:"addBtnIndex == index"}],staticClass:"add-action-list"},[a("ul",[a("li",{on:{click:function(e){return t.addTxt(i)}}},[a("i",{staticClass:"iconfont icon-wenben"})]),a("li",{on:{click:function(e){return t.addPhoto(i)}}},[a("i",{staticClass:"iconfont icon-tupian"})]),a("li",{on:{click:function(e){return t.addVideo(i)}}},[a("i",{staticClass:"iconfont icon-shipin"})]),a("li",{on:{click:function(e){t.addBtnIndex=-2}}},[t._v("取消")])])])])])})],2),a("div",{directives:[{name:"show",rawName:"v-show",value:1==t.showType,expression:"showType ==1"}],staticClass:"html-editor-show"},t._l(t.htmldata,function(e,i){return a("div",{key:i,staticClass:"item",style:(e.mgTop?"margin-top:"+e.mgTop+"px;":"")+(e.mgBt?"margin-bottom:"+e.mgBt+"px;":"")},[a("div",{class:t.editIndex==i?"show-item on":"show-item",style:t.styleByIndex(i)},["txt"==e.mdl?a("div",[t._v(t._s(e.txt))]):t._e(),"pic"==e.mdl?a("div",[""!=e.img?a("img",{staticStyle:{"max-width":"100%"},attrs:{src:e.img}}):a("p",[t._v("等待上传图片")])]):t._e(),"video"==e.mdl?a("div",[e.video?a("video",{staticStyle:{"max-width":"100%"},attrs:{src:e.video,controls:"controls"}},[t._v("\n                      您的浏览器不支持 video 标签。\n                      ")]):a("p",[t._v("等待上传图片")])]):t._e()])])}),0)]),t.editIndex>=0?a("div",{staticClass:"html-editor-form"},[t._m(0),t._l(t.htmldata,function(e,i){return a("div",{key:i,staticClass:"form-item"},[t.editIndex==i?a("el-form",{attrs:{"label-width":"80px",size:"small"}},["video"==e.mdl?a("el-form-item",{attrs:{label:"上传视频"}},[a("wyu-video",{attrs:{video:t.htmldata[i].video},model:{value:t.htmldata[i].video,callback:function(e){t.$set(t.htmldata[i],"video",e)},expression:"htmldata[index].video"}})],1):t._e(),"pic"==e.mdl?a("el-form-item",{attrs:{label:"上传图片"}},[a("wyu-upload",{attrs:{img:t.htmldata[i].img},model:{value:t.htmldata[i].img,callback:function(e){t.$set(t.htmldata[i],"img",e)},expression:"htmldata[index].img"}})],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"输入内容"}},[a("el-input",{attrs:{type:"textarea"},model:{value:t.htmldata[i].txt,callback:function(e){t.$set(t.htmldata[i],"txt",e)},expression:"htmldata[index].txt"}})],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"排列方式"}},[a("el-radio",{attrs:{label:0},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居左")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:1},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居中")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:2},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居右")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:3},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("首行缩进")])],1):t._e(),"txt"!=e.mdl?a("el-form-item",{attrs:{label:"排列方式"}},[a("el-radio",{attrs:{label:0},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居左")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:1},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居中")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:2},model:{value:t.htmldata[i].type,callback:function(e){t.$set(t.htmldata[i],"type",e)},expression:"htmldata[index].type"}},[t._v("居右")])],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"字体大小"}},[a("el-input-number",{attrs:{size:"small",min:10,max:50},model:{value:t.htmldata[i].fontsize,callback:function(e){t.$set(t.htmldata[i],"fontsize",e)},expression:"htmldata[index].fontsize"}})],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"字体加粗"}},[a("el-radio",{attrs:{label:0},model:{value:t.htmldata[i].isb,callback:function(e){t.$set(t.htmldata[i],"isb",e)},expression:"htmldata[index].isb"}},[t._v("默认")]),a("el-radio",{attrs:{label:1},model:{value:t.htmldata[i].isb,callback:function(e){t.$set(t.htmldata[i],"isb",e)},expression:"htmldata[index].isb"}},[t._v("加粗")])],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"颜色"}},[a("el-color-picker",{attrs:{size:"mini"},model:{value:t.htmldata[i].color,callback:function(e){t.$set(t.htmldata[i],"color",e)},expression:"htmldata[index].color"}})],1):t._e(),"txt"==e.mdl?a("el-form-item",{attrs:{label:"行高"}},[a("el-input-number",{attrs:{size:"small",min:10,max:50},model:{value:t.htmldata[i].lineH,callback:function(e){t.$set(t.htmldata[i],"lineH",e)},expression:"htmldata[index].lineH"}})],1):t._e(),a("el-form-item",{attrs:{label:"图片背景"}},[a("el-radio",{attrs:{label:0},model:{value:t.htmldata[i].isBgPic,callback:function(e){t.$set(t.htmldata[i],"isBgPic",e)},expression:"htmldata[index].isBgPic"}},[t._v("不启用")]),a("el-radio",{attrs:{label:1},model:{value:t.htmldata[i].isBgPic,callback:function(e){t.$set(t.htmldata[i],"isBgPic",e)},expression:"htmldata[index].isBgPic"}},[t._v("启用")])],1),1==t.htmldata[i].isBgPic?a("el-form-item",{attrs:{label:"背景图片"}},[a("wyu-upload",{attrs:{img:t.htmldata[i].bgPic},model:{value:t.htmldata[i].bgPic,callback:function(e){t.$set(t.htmldata[i],"bgPic",e)},expression:"htmldata[index].bgPic"}})],1):t._e(),1==t.htmldata[i].isBgPic?a("el-form-item",{attrs:{label:"背景排列"}},[a("el-radio",{attrs:{label:0},model:{value:t.htmldata[i].bgPicType,callback:function(e){t.$set(t.htmldata[i],"bgPicType",e)},expression:"htmldata[index].bgPicType"}},[t._v("顶部居中")]),a("el-radio",{staticStyle:{"margin-left":"10px"},attrs:{label:1},model:{value:t.htmldata[i].bgPicType,callback:function(e){t.$set(t.htmldata[i],"bgPicType",e)},expression:"htmldata[index].bgPicType"}},[t._v("容器平铺")])],1):t._e(),a("el-form-item",{attrs:{label:"背景颜色"}},[a("el-color-picker",{attrs:{size:"mini"},model:{value:t.htmldata[i].bg,callback:function(e){t.$set(t.htmldata[i],"bg",e)},expression:"htmldata[index].bg"}})],1),a("el-form-item",{attrs:{label:"上内边距"}},[a("el-slider",{attrs:{min:0,max:20,step:1},model:{value:t.htmldata[i].pt,callback:function(e){t.$set(t.htmldata[i],"pt",e)},expression:"htmldata[index].pt"}})],1),a("el-form-item",{attrs:{label:"左内边距"}},[a("el-slider",{attrs:{min:0,max:20,step:1},model:{value:t.htmldata[i].pl,callback:function(e){t.$set(t.htmldata[i],"pl",e)},expression:"htmldata[index].pl"}})],1),a("el-form-item",{attrs:{label:"右内边距"}},[a("el-slider",{attrs:{min:0,max:20,step:1},model:{value:t.htmldata[i].pr,callback:function(e){t.$set(t.htmldata[i],"pr",e)},expression:"htmldata[index].pr"}})],1),a("el-form-item",{attrs:{label:"下内边距"}},[a("el-slider",{attrs:{min:0,max:20,step:1},model:{value:t.htmldata[i].pb,callback:function(e){t.$set(t.htmldata[i],"pb",e)},expression:"htmldata[index].pb"}})],1),a("el-form-item",{attrs:{label:"距离上面"}},[a("el-slider",{attrs:{min:0,max:50,step:1},model:{value:t.htmldata[i].mgTop,callback:function(e){t.$set(t.htmldata[i],"mgTop",e)},expression:"htmldata[index].mgTop"}})],1),a("el-form-item",{attrs:{label:"距离下面"}},[a("el-slider",{attrs:{min:0,max:50,step:1},model:{value:t.htmldata[i].mgBt,callback:function(e){t.$set(t.htmldata[i],"mgBt",e)},expression:"htmldata[index].mgBt"}})],1)],1):t._e()],1)})],2):t._e()])},l=[function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"wyu-title"},[a("h2",[t._v("设置内容")])])}],s=a("f499"),n=a.n(s),o=(a("9ec8"),a("5fed")),d=a("85e1"),r={mdl:"txt",type:0,txt:"请输入内容",fontsize:14,isb:0,color:"#333333",lineH:20,isBgPic:0,bg:"#ffffff",bgPic:"",bgPicType:0,pt:5,pl:5,pr:5,pb:5,mgTop:0,mgBt:0},c={mdl:"video",type:0,video:"",isBgPic:0,bg:"#ffffff",bgPic:"",bgPicType:0,pt:5,pl:5,pr:5,pb:5,mgTop:0,mgBt:0},m={mdl:"pic",type:0,img:"",isBgPic:0,bg:"#ffffff",bgPic:"",bgPicType:0,pt:5,pl:5,pr:5,pb:5,mgTop:0,mgBt:0},p={name:"htmlEditor",props:["html","title"],components:{WyuUpload:o["a"],WyuVideo:d["a"]},data:function(){return{addBtnIndex:-2,htmldata:[],editIndex:-1,showType:0}},watch:{html:function(t){""!=t&&t!=this.htmldata&&(this.htmldata=t)},htmldata:{handler:function(t,e){this.htmldata!=this.html&&this.$emit("input",this.htmldata)},immediate:!0,deep:!0}},created:function(){this.html!=this.htmldata&&(this.htmldata=this.html)},methods:{styleByIndex:function(t){if(this.htmldata[t]){var e=this.htmldata[t],a="";switch("txt"==e.mdl&&(a+="font-size:"+e.fontsize+"px;",a+="color:"+e.color+";",a+="line-height:"+e.lineH+"px;",a+="word-wrap:break-word;",1==e.isb&&(a+="font-weight:bold;")),e.type){case 1:a+="text-align:center;";break;case 2:a+="text-align:right;";break;case 3:a+="text-indent:"+2*e.fontsize+"px;";break;default:a+="text-align:left;";break}return e.pt&&(a+="padding-top:"+e.pt+"px;"),e.pl&&(a+="padding-left:"+e.pl+"px;"),e.pr&&(a+="padding-right:"+e.pr+"px;"),e.pb&&(a+="padding-bottom:"+e.pb+"px;"),e.isBgPic&&""!=e.bgPic?0==e.bgPicType?a+="background: "+e.bg+" url("+e.bgPic+") no-repeat center 0":a+="background: "+e.bg+" url("+e.bgPic+")":a+="background:"+e.bg+";",a}return""},addTxt:function(t){var e=JSON.parse(n()(r));this.addObj(e,t)},addVideo:function(t){var e=JSON.parse(n()(c));this.addObj(e,t)},addPhoto:function(t){var e=JSON.parse(n()(m));this.addObj(e,t)},addObj:function(t,e){""==this.htmldata?(e=0,this.htmldata.push(t)):(e+=1,this.htmldata.splice(e,0,t)),this.editIndex=e,this.addBtnIndex=-2},deleteObj:function(t){this.htmldata.splice(t,1),this.editIndex=-1,this.addBtnIndex=-2}}},h=p,u=(a("93fb"),a("2877")),b=Object(u["a"])(h,i,l,!1,null,"2544e57e",null);e["a"]=b.exports},ac6a:function(t,e,a){for(var i=a("cadf"),l=a("0d58"),s=a("2aba"),n=a("7726"),o=a("32e9"),d=a("84f2"),r=a("2b4c"),c=r("iterator"),m=r("toStringTag"),p=d.Array,h={CSSRuleList:!0,CSSStyleDeclaration:!1,CSSValueList:!1,ClientRectList:!1,DOMRectList:!1,DOMStringList:!1,DOMTokenList:!0,DataTransferItemList:!1,FileList:!1,HTMLAllCollection:!1,HTMLCollection:!1,HTMLFormElement:!1,HTMLSelectElement:!1,MediaList:!0,MimeTypeArray:!1,NamedNodeMap:!1,NodeList:!0,PaintRequestList:!1,Plugin:!1,PluginArray:!1,SVGLengthList:!1,SVGNumberList:!1,SVGPathSegList:!1,SVGPointList:!1,SVGStringList:!1,SVGTransformList:!1,SourceBufferList:!1,StyleSheetList:!0,TextTrackCueList:!1,TextTrackList:!1,TouchList:!1},u=l(h),b=0;b<u.length;b++){var f,v=u[b],g=h[v],x=n[v],_=x&&x.prototype;if(_&&(_[c]||o(_,c,p),_[m]||o(_,m,v),d[v]=p,g))for(f in i)_[f]||s(_,f,i[f],!0)}},b571:function(t,e,a){"use strict";var i=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",[a("el-button",{attrs:{type:"text"},on:{click:t.add}},[t._v("选择产品")]),a("el-dialog",{attrs:{title:"选择产品",visible:t.dialogTableVisible,"modal-append-to-body":!1,width:"80%"},on:{"update:visible":function(e){t.dialogTableVisible=e}}},[a("div",{staticClass:"wyu-main"},[a("div",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticClass:"wyu-block"},[a("el-form",{staticClass:"search-form",attrs:{"label-width":"80px",size:"mini",inline:!0},model:{value:t.searchForm,callback:function(e){t.searchForm=e},expression:"searchForm"}},[a("el-form-item",{attrs:{label:"产品名称","label-width":"100"}},[a("el-input",{model:{value:t.searchForm.title,callback:function(e){t.$set(t.searchForm,"title",e)},expression:"searchForm.title"}})],1),a("el-form-item",{attrs:{label:"类型"}},[a("el-select",{attrs:{placeholder:"请选择"},model:{value:t.searchForm.category_id,callback:function(e){t.$set(t.searchForm,"category_id",e)},expression:"searchForm.category_id"}},[a("el-option",{key:-100,attrs:{label:"请选择",value:-100}}),t._l(t.cats,function(t){return a("el-option",{key:t.category,attrs:{label:t.title,value:t.category}})})],2)],1),a("el-form-item",{attrs:{label:"状态"}},[a("el-select",{attrs:{placeholder:"请选择"},model:{value:t.searchForm.is_online,callback:function(e){t.$set(t.searchForm,"is_online",e)},expression:"searchForm.is_online"}},[a("el-option",{key:-100,attrs:{label:"请选择",value:-100}}),a("el-option",{key:0,attrs:{label:"已下架",value:0}}),a("el-option",{key:1,attrs:{label:"上架中",value:1}})],1)],1),a("el-form-item",{attrs:{label:"添加时间"}},[a("el-date-picker",{attrs:{type:"datetime",placeholder:"选择日期时间"},model:{value:t.searchForm.bg_add_time,callback:function(e){t.$set(t.searchForm,"bg_add_time",e)},expression:"searchForm.bg_add_time"}}),t._v("\n                        至\n                        "),a("el-date-picker",{attrs:{type:"datetime",placeholder:"选择日期时间"},model:{value:t.searchForm.end_add_time,callback:function(e){t.$set(t.searchForm,"end_add_time",e)},expression:"searchForm.end_add_time"}})],1),a("div",{staticStyle:{"padding-left":"80px"}},[a("el-button",{attrs:{icon:"el-icon-search",size:"mini",type:"primary"},on:{click:function(e){return t.getProductList(1)}}},[t._v("搜索\n                        ")]),a("a",{attrs:{href:"javascript:void(0);"},on:{click:function(e){t.searchForm.title="",t.searchForm.category_id=-100,t.searchForm.bg_add_time="",t.searchForm.end_add_time="",t.searchForm.is_online=-100,t.getProductList(0)}}},[t._v("取消搜索")]),a("router-link",{staticStyle:{color:"#ffffff"},attrs:{to:"/product/create"}},[a("el-button",{attrs:{size:"mini",type:"danger"}},[t._v("新增产品")])],1)],1)],1),a("el-table",{ref:"multipleTable",staticStyle:{width:"100%"},attrs:{data:t.datas.list,size:"mini","row-key":"product_id"},on:{"selection-change":t.handleSelectionChange}},[a("el-table-column",{attrs:{type:"selection","reserve-selection":!0,prop:"product_id",width:"55"}}),a("el-table-column",{attrs:{prop:"product_id",label:"产品ID",width:"80"}}),a("el-table-column",{attrs:{prop:"title",label:"产品名称",width:"250"}}),a("el-table-column",{attrs:{label:"产品图片"},scopedSlots:t._u([{key:"default",fn:function(t){return[a("img",{attrs:{src:t.row.photo,width:"80"}})]}}])}),a("el-table-column",{attrs:{label:"分类名称",prop:"category_name"}}),a("el-table-column",{attrs:{label:"价格"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("p",[a("i",[t._v("现价：")]),a("i",[t._v(t._s(e.row.price))])]),a("p",[a("i",[t._v("原价：")]),a("i",[t._v(t._s(e.row.original_price))])])]}}])}),a("el-table-column",{attrs:{label:"其它"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("p",[t._v("联系电话："+t._s(e.row.mobile))]),a("p",[t._v("是否上架："+t._s(e.row.is_online?"上架中":"已下架"))])]}}])}),a("el-table-column",{attrs:{label:"创建信息"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("p",[t._v("创建时间："+t._s(e.row.add_time))]),a("p",[t._v("创建IP："+t._s(e.row.add_ip))])]}}])})],1),a("div",{staticClass:"page"},[a("div",{staticClass:"page-tool"},[a("el-button",{attrs:{size:"small",plain:""},on:{click:t.select}},[t._v("确认选择")])],1),a("div",{staticClass:"page-mian"},[a("el-pagination",{attrs:{"page-size":t.datas.limit,layout:"total, prev, pager, next",total:t.datas.count},on:{"current-change":t.getProductList}})],1)])],1)])])],1)},l=[],s=a("d722"),n={name:"SelectProduct",props:[],data:function(){return{dialogTableVisible:!1,searchForm:{title:"",news_type:-100,end_add_time:"",bg_add_time:""},cats:[],loading:!1,datas:[],selectList:[]}},created:function(){this.getCatList(),this.getProductList()},methods:{add:function(){this.dialogTableVisible=!0,this.$refs.multipleTable&&this.$refs.multipleTable.clearSelection()},handleSelectionChange:function(t){this.selectList=t},select:function(){this.dialogTableVisible=!1,this.$emit("rows",this.selectList)},getCatList:function(){var t=this;this.loading=!0,s["a"]("/website/admin.product/getCat",{appToken:this.$store.getters.appToken}).then(function(e){t.cats=e.list,t.loading=!1}).catch(function(e){t.loading=!1})},getProductList:function(){var t=this,e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:1;this.loading=!0,s["a"]("/website/admin.product/index",{appToken:this.$store.getters.appToken,page:e,title:this.searchForm.title,news_type:this.searchForm.news_type,end_add_time:this.searchForm.end_add_time,bg_add_time:this.searchForm.bg_add_time}).then(function(e){t.datas=e,t.loading=!1}).catch(function(e){t.loading=!1})}}},o=n,d=a("2877"),r=Object(d["a"])(o,i,l,!1,null,"04848cb4",null);e["a"]=r.exports}}]);
//# sourceMappingURL=chunk-66f07d91.7faf9dbd.js.map