(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-2d0aad0a"],{"132d":function(t,e,o){"use strict";o.r(e);var s=function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("div",[o("top-nav",{attrs:{title:"编辑业务"}}),o("div",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticClass:"wyu-main"},[o("div",{staticClass:"wyu-block"},[t._m(0),t._m(1),o("el-form",{ref:"form",staticStyle:{padding:"0"},attrs:{model:t.form,size:"small","label-width":"80px"}},[o("el-form-item",{attrs:{label:"业务标题","label-width":"120px"}},[o("el-input",{staticStyle:{width:"500px"},attrs:{autocomplete:"off"},model:{value:t.form.title,callback:function(e){t.$set(t.form,"title",e)},expression:"form.title"}})],1),o("el-form-item",{attrs:{label:"副标题","label-width":"120px"}},[o("el-input",{staticStyle:{width:"500px"},attrs:{autocomplete:"off"},model:{value:t.form.sub_title,callback:function(e){t.$set(t.form,"sub_title",e)},expression:"form.sub_title"}})],1),o("el-form-item",{attrs:{label:"列表图片","label-width":"120px"}},[o("wyu-upload",{attrs:{img:t.form.photo},model:{value:t.form.photo,callback:function(e){t.$set(t.form,"photo",e)},expression:"form.photo"}}),o("p",{staticClass:"tit"},[t._v(" 建议尺寸690px*460px或等比缩放")])],1),o("el-form-item",{attrs:{label:"详情页图片","label-width":"120px"}},[o("wyu-upload",{attrs:{multi:!0,img:t.form.photos},model:{value:t.form.photos,callback:function(e){t.$set(t.form,"photos",e)},expression:"form.photos"}}),o("p",{staticClass:"tit"},[t._v(" 建议尺寸690px*460px或等比缩放")])],1),o("el-form-item",{attrs:{label:"关联产品","label-width":"120px"}},[o("select-product",{on:{rows:t.getList}}),[o("el-table",{staticStyle:{width:"600px"},attrs:{size:"mini",data:t.products,height:"250",border:""}},[o("el-table-column",{attrs:{prop:"product_id",label:"产品ID"}}),o("el-table-column",{attrs:{prop:"title",label:"产品名称"}}),o("el-table-column",{attrs:{prop:"orderby",label:"排序"}}),o("el-table-column",{attrs:{label:"操作",width:"50"},scopedSlots:t._u([{key:"default",fn:function(e){return[o("el-button",{attrs:{type:"text",size:"small"},on:{click:function(o){return t.removeProduct(e.$index)}}},[t._v("删除\n                                    ")])]}}])})],1)]],2),o("el-form-item",{attrs:{label:"百度SEO标题","label-width":"120px"}},[o("el-input",{staticStyle:{width:"500px"},attrs:{autocomplete:"off"},model:{value:t.form.seo.title,callback:function(e){t.$set(t.form.seo,"title",e)},expression:"form.seo.title"}})],1),o("el-form-item",{attrs:{label:"百度SEO描述","label-width":"120px"}},[o("el-input",{staticStyle:{width:"500px"},attrs:{type:"textarea",autosize:{minRows:2,maxRows:5},autocomplete:"off",placeholder:"请输入内容"},model:{value:t.form.seo.keywords,callback:function(e){t.$set(t.form.seo,"keywords",e)},expression:"form.seo.keywords"}})],1),o("el-form-item",{attrs:{label:"百度SEO关键词","label-width":"120px"}},[o("el-input",{staticStyle:{width:"500px"},attrs:{type:"textarea",autosize:{minRows:5,maxRows:10},autocomplete:"off",placeholder:"请输入内容"},model:{value:t.form.seo.description,callback:function(e){t.$set(t.form.seo,"description",e)},expression:"form.seo.description"}})],1),o("el-form-item",{attrs:{label:"百度SEO原始发布时间","label-width":"120px"}},[o("el-date-picker",{attrs:{type:"date",placeholder:"选择日期"},model:{value:t.form.seo.releaseDate,callback:function(e){t.$set(t.form.seo,"releaseDate",e)},expression:"form.seo.releaseDate"}})],1),o("el-form-item",{attrs:{label:"百度封面图片","label-width":"120px"}},[o("wyu-upload",{attrs:{multi:!0,img:t.form.seo.image},model:{value:t.form.seo.image,callback:function(e){t.$set(t.form.seo,"image",e)},expression:"form.seo.image"}}),o("p",{staticClass:"tit"},[t._v(" 用于信息流投放后的封面显示，最多3张，单图片最大2M；封面图建议尺寸：高>=210px 宽>=375px;最小尺寸: 高>=146px 宽>=218px")])],1),o("el-form-item",{attrs:{label:"内容","label-width":"120px"}},[o("html-editor",{attrs:{html:t.form.detail,title:"产品详情"},model:{value:t.form.detail,callback:function(e){t.$set(t.form,"detail",e)},expression:"form.detail"}})],1)],1)],1)]),o("br"),o("br"),o("div",{staticClass:"wyu-btn-div"},[o("el-button",{attrs:{size:"small",type:"primary"},on:{click:function(e){return t.onSubmit()}}},[t._v("立即创建")]),t._v(" \n        "),o("router-link",{staticStyle:{color:"#ffffff"},attrs:{to:"/biz/index"}},[o("el-button",{attrs:{size:"small"}},[t._v("取消")])],1)],1)],1)},i=[function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("div",{staticClass:"wyu-tips wyu-tips-info",staticStyle:{"margin-bottom":"10px"}},[o("p",{staticClass:"tit"},[t._v(" 这里是添加业务")]),o("p",{staticClass:"tit"},[t._v(" 业务可以关联产品,关联的产品将以列表的形式展示在业务详情页")])])},function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("div",{staticClass:"wyu-title"},[o("h2",[t._v("编辑业务")])])}],l=o("f499"),a=o.n(l),r=(o("ac6a"),o("5200")),n=o("9556"),d=o("d722"),u=o("5fed"),c=o("b571"),p={name:"businessEdit",components:{SelectProduct:c["a"],TopNav:r["a"],HtmlEditor:n["a"],WyuUpload:u["a"]},data:function(){return{loading:!1,sub:!0,form:{title:"",sub_title:"",detail:"",photos:[],photo:"",orderby:0,seo:{title:"",keywords:"",description:"",releaseDate:"",image:[]}},productIds:[],products:[]}},created:function(){this.getDetail()},methods:{getList:function(t){var e=this,o=this.productIds;t.forEach(function(t){-1==o.indexOf(t.product_id)&&(e.productIds.push(t.product_id),e.products.push(t))})},removeProduct:function(t){var e=this,o=this.products;this.products=[],this.productIds=[],o.forEach(function(o,s){s!=t&&(e.products.push(o),e.productIds.push(o.product_id))})},getDetail:function(){var t=this;this.loading=!0,this.businessId=this.$router.currentRoute.params.id,d["a"]("/website/admin.business/detail",{appToken:this.$store.getters.appToken,business_id:this.businessId}).then(function(e){t.form=e.detail,t.products=e.detail.products;var o=[];for(var s in e.detail.products)o.push(e.detail.products[s].product_id);t.productIds=o,t.loading=!1}).catch(function(){t.loading=!1})},onSubmit:function(){var t=this;!(arguments.length>0&&void 0!==arguments[0])||arguments[0];this.loading=!0;var e="/website/admin.business/edit";d["a"](e,{appToken:this.$store.getters.appToken,title:this.form.title,sub_title:this.form.sub_title,business_id:this.businessId,detail:a()(this.form.detail),photos:a()(this.form.photos),photo:this.form.photo,product_ids:a()(this.productIds),seo:a()(this.form.seo)}).then(function(){t.$message({message:"恭喜你，操作成功",type:"success"}),setTimeout(function(){t.$router.push("/biz/index")},1e3),t.loading=!1}).catch(function(){t.loading=!1})}}},m=p,f=o("2877"),h=Object(f["a"])(m,s,i,!1,null,null,null);e["default"]=h.exports}}]);
//# sourceMappingURL=chunk-2d0aad0a.64ce8776.js.map