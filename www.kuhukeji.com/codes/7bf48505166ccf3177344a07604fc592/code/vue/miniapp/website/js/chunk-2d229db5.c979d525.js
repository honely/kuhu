(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-2d229db5"],{dedb:function(t,e,o){"use strict";o.r(e);var a=function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("div",[o("top-nav",{attrs:{title:"编辑案例"}}),o("div",{staticClass:"wyu-main"},[o("div",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticClass:"wyu-block"},[t._m(0),t._m(1),o("el-form",{ref:"form",staticStyle:{padding:"0"},attrs:{model:t.form,size:"small","label-width":"80px"}},[o("el-form-item",{attrs:{label:"案例标题","label-width":"120px"}},[o("el-input",{staticStyle:{width:"500px"},attrs:{autocomplete:"off"},model:{value:t.form.title,callback:function(e){t.$set(t.form,"title",e)},expression:"form.title"}})],1),o("el-form-item",{attrs:{label:"类型","label-width":"120px"}},[o("Cat",{attrs:{cat:t.form.category_id},on:{selectCatId:t.setCat}})],1),o("el-form-item",{attrs:{label:"封面图片","label-width":"120px"}},[o("wyu-upload",{attrs:{img:t.form.photo},model:{value:t.form.photo,callback:function(e){t.$set(t.form,"photo",e)},expression:"form.photo"}}),o("p",{staticClass:"tit"},[t._v(" 建议尺寸750px*500px或等比缩放")])],1),o("el-form-item",{attrs:{label:"案例相册","label-width":"120px"}},[o("wyu-upload",{attrs:{multi:!0,img:t.form.photos},model:{value:t.form.photos,callback:function(e){t.$set(t.form,"photos",e)},expression:"form.photos"}}),o("p",{staticClass:"tit"},[t._v(" 建议尺寸750px*500px或等比缩放")])],1),o("el-form-item",{attrs:{label:"项目信息","label-width":"120px"}},[o("el-table",{attrs:{element:"el-table",data:t.form.info}},[o("el-table-column",{attrs:{label:"类型",width:"100"},scopedSlots:t._u([{key:"default",fn:function(e){return[o("el-input",{attrs:{size:"small"},model:{value:e.row.key,callback:function(o){t.$set(e.row,"key",o)},expression:"scope.row.key"}})]}}])}),o("el-table-column",{attrs:{label:"内容",width:"300"},scopedSlots:t._u([{key:"default",fn:function(e){return[o("el-input",{attrs:{size:"small"},model:{value:e.row.val,callback:function(o){t.$set(e.row,"val",o)},expression:"scope.row.val"}})]}}])}),o("el-table-column",{attrs:{label:"操作",width:"300"},scopedSlots:t._u([{key:"default",fn:function(e){return[o("el-button",{attrs:{size:"small",icon:"el-icon-remove"},on:{click:function(o){return t.removeInfo(e)}}},[t._v("减少")])]}}])})],1)],1),o("el-form-item",{attrs:{"label-width":"120px"}},[o("el-button",{attrs:{size:"small",icon:"el-icon-circle-plus"},on:{click:t.addInfo}},[t._v("添加")])],1),o("el-form-item",{attrs:{label:"百度SEO标题","label-width":"120px"}},[o("el-input",{staticStyle:{width:"500px"},attrs:{autocomplete:"off"},model:{value:t.form.seo.title,callback:function(e){t.$set(t.form.seo,"title",e)},expression:"form.seo.title"}})],1),o("el-form-item",{attrs:{label:"百度SEO描述","label-width":"120px"}},[o("el-input",{staticStyle:{width:"500px"},attrs:{type:"textarea",autosize:{minRows:2,maxRows:5},autocomplete:"off",placeholder:"请输入内容"},model:{value:t.form.seo.keywords,callback:function(e){t.$set(t.form.seo,"keywords",e)},expression:"form.seo.keywords"}})],1),o("el-form-item",{attrs:{label:"百度SEO关键词","label-width":"120px"}},[o("el-input",{staticStyle:{width:"500px"},attrs:{type:"textarea",autosize:{minRows:5,maxRows:10},autocomplete:"off",placeholder:"请输入内容"},model:{value:t.form.seo.description,callback:function(e){t.$set(t.form.seo,"description",e)},expression:"form.seo.description"}})],1),o("el-form-item",{attrs:{label:"百度SEO原始发布时间","label-width":"120px"}},[o("el-date-picker",{attrs:{type:"date",placeholder:"选择日期"},model:{value:t.form.seo.releaseDate,callback:function(e){t.$set(t.form.seo,"releaseDate",e)},expression:"form.seo.releaseDate"}})],1),o("el-form-item",{attrs:{label:"百度封面图片","label-width":"120px"}},[o("wyu-upload",{attrs:{multi:!0,img:t.form.seo.image},model:{value:t.form.seo.image,callback:function(e){t.$set(t.form.seo,"image",e)},expression:"form.seo.image"}}),o("p",{staticClass:"tit"},[t._v(" 用于信息流投放后的封面显示，最多3张，单图片最大2M；封面图建议尺寸：高>=210px 宽>=375px;最小尺寸: 高>=146px 宽>=218px")])],1),o("el-form-item",{attrs:{label:"内容","label-width":"120px"}},[o("html-editor",{attrs:{title:"正文详情",html:t.form.detail},model:{value:t.form.detail,callback:function(e){t.$set(t.form,"detail",e)},expression:"form.detail"}})],1)],1)],1)]),o("br"),o("br"),o("div",{staticClass:"wyu-btn-div"},[o("el-button",{attrs:{size:"small",type:"primary"},on:{click:function(e){return t.onSubmit()}}},[t._v("立即创建")]),t._v(" \n        "),o("router-link",{staticStyle:{color:"#ffffff"},attrs:{to:"/example/index"}},[o("el-button",{attrs:{size:"small"}},[t._v("取消")])],1)],1)],1)},l=[function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("div",{staticClass:"wyu-tips wyu-tips-info",staticStyle:{"margin-bottom":"10px"}},[o("p",{staticClass:"tit"},[t._v(" 这里是编辑案例")])])},function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("div",{staticClass:"wyu-title"},[o("h2",[t._v("编辑案例")])])}],i=o("f499"),s=o.n(i),r=(o("ac6a"),o("5200")),n=o("9556"),m=o("d722"),f=o("5fed"),c=o("9f94"),d={name:"newsCreateIndex",components:{Cat:c["a"],TopNav:r["a"],HtmlEditor:n["a"],WyuUpload:f["a"]},data:function(){return{loading:!1,sub:!0,form:{title:"",detail:"",info:[],photos:"",category_id:-100,seo:{title:"",keywords:"",description:"",releaseDate:"",image:[]}},exampleId:0}},created:function(){this.getDetail()},methods:{setCat:function(t){this.form.category_id=t},addInfo:function(){this.form.info?this.form.info.push({key:"",val:""}):this.form.info=[{key:"",val:""}]},removeInfo:function(t){var e=this.form.info,o=[];e.forEach(function(e,a){t.$index!=a&&o.push(e)}),this.form.info=o},getDetail:function(){var t=this;this.loading=!0,this.exampleId=this.$router.currentRoute.params.id,m["a"]("/website/admin.example/exampleDetail",{appToken:this.$store.getters.appToken,example_id:this.exampleId}).then(function(e){t.form=e.detail,t.form.category_id=e.detail.category_id?e.detail.category_id+0:-100,t.loading=!1}).catch(function(e){t.loading=!1})},onSubmit:function(){var t=this;!(arguments.length>0&&void 0!==arguments[0])||arguments[0];this.loading=!0;var e="/website/admin.example/exampleEdit";m["a"](e,{appToken:this.$store.getters.appToken,title:this.form.title,category_id:this.form.category_id,detail:s()(this.form.detail),info:s()(this.form.info),photos:s()(this.form.photos),photo:this.form.photo,example_id:this.exampleId,seo:s()(this.form.seo)}).then(function(e){t.form.title="",t.form.category_id=-100,t.form.detail="",t.form.info=[],t.form.photos="",t.form.photo="",t.form.seo={title:"",keywords:"",description:"",releaseDate:"",image:[]},t.$message({message:"恭喜你，操作成功",type:"success"}),t.loading=!1,t.getDetail()}).catch(function(e){t.loading=!1})}}},p=d,u=o("2877"),h=Object(u["a"])(p,a,l,!1,null,null,null);e["default"]=h.exports}}]);
//# sourceMappingURL=chunk-2d229db5.c979d525.js.map