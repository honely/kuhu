(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-7a11d340"],{8581:function(e,t,o){"use strict";o.r(t);var s=function(){var e=this,t=e.$createElement,o=e._self._c||t;return o("div",[o("TopNav",{attrs:{title:"添加产品"}}),o("div",{staticClass:"wyu-main"},[o("div",{directives:[{name:"loading",rawName:"v-loading",value:e.loading,expression:"loading"}],staticClass:"wyu-block"},[o("el-steps",{attrs:{active:e.active,simple:""}},[o("el-step",{attrs:{title:"基本信息"}}),o("el-step",{attrs:{title:"商品物流"}})],1),1==e.active?o("el-form",{ref:"goodsInfo",attrs:{rules:e.rules,model:e.goodsDetail,size:"mini","label-width":"100px"}},[o("div",{staticClass:"wyu-title"},[o("h2",[e._v("基本信息")])]),o("el-form-item",{attrs:{label:"商品名称",prop:"goods_name"}},[o("el-input",{staticStyle:{width:"500px"},model:{value:e.goodsDetail.goods_name,callback:function(t){e.$set(e.goodsDetail,"goods_name",t)},expression:"goodsDetail.goods_name"}})],1),o("el-form-item",{attrs:{label:"商品编号",prop:"goods_sn"}},[o("el-input",{staticStyle:{width:"500px"},model:{value:e.goodsDetail.goods_sn,callback:function(t){e.$set(e.goodsDetail,"goods_sn",t)},expression:"goodsDetail.goods_sn"}}),o("p",{staticClass:"wyu-form-tips"},[e._v("不填写自动生成")])],1),o("el-form-item",{attrs:{label:"商品分类",prop:"cat_id"}},[o("product-category",{attrs:{"cat-id":e.goodsDetail.cat_id},on:{selCat:e.getCatId}})],1),o("el-form-item",{attrs:{label:"商品缩略图",prop:"photo"}},[o("img-uploads",{attrs:{img:e.goodsDetail.photo,w:100,h:"100"},model:{value:e.goodsDetail.photo,callback:function(t){e.$set(e.goodsDetail,"photo",t)},expression:"goodsDetail.photo"}}),o("p",{staticClass:"wyu-form-tips"},[e._v("建议尺寸 120 X 120")])],1),o("el-form-item",{attrs:{label:"市场价",prop:"market_price"}},[o("el-input",{staticStyle:{width:"500px"},model:{value:e.goodsDetail.market_price,callback:function(t){e.$set(e.goodsDetail,"market_price",t)},expression:"goodsDetail.market_price"}})],1),o("el-form-item",{attrs:{label:"兑换价",prop:"shop_price"}},[o("el-input",{staticStyle:{width:"500px"},model:{value:e.goodsDetail.shop_price,callback:function(t){e.$set(e.goodsDetail,"shop_price",t)},expression:"goodsDetail.shop_price"}})],1),o("el-form-item",{attrs:{label:"积分",prop:"integral"}},[o("el-input",{staticStyle:{width:"500px"},model:{value:e.goodsDetail.integral,callback:function(t){e.$set(e.goodsDetail,"integral",t)},expression:"goodsDetail.integral"}})],1),o("el-form-item",{attrs:{label:"商品关键词"}},[o("el-input",{staticStyle:{width:"500px"},model:{value:e.goodsDetail.keywords,callback:function(t){e.$set(e.goodsDetail,"keywords",t)},expression:"goodsDetail.keywords"}}),o("p",{staticClass:"wyu-form-tips"},[e._v("搜索的重要 组成部分 最好以 “,” 隔开")])],1),o("div",{staticClass:"wyu-title"},[o("h2",[e._v("扩展信息")])]),o("el-form-item",{attrs:{label:"上/下架"}},[o("el-switch",{attrs:{"active-value":1,"inactive-value":0},model:{value:e.goodsDetail.is_online,callback:function(t){e.$set(e.goodsDetail,"is_online",t)},expression:"goodsDetail.is_online"}})],1),o("el-form-item",{attrs:{label:"商品已售"}},[o("el-input",{staticStyle:{width:"500px"},model:{value:e.goodsDetail.sales_sum,callback:function(t){e.$set(e.goodsDetail,"sales_sum",t)},expression:"goodsDetail.sales_sum"}}),o("p",{staticClass:"wyu-form-tips"},[e._v("用于 已售展示数量")])],1),o("el-form-item",{attrs:{label:"商品数量"}},[o("el-input",{staticStyle:{width:"500px"},model:{value:e.goodsDetail.goods_num,callback:function(t){e.$set(e.goodsDetail,"goods_num",t)},expression:"goodsDetail.goods_num"}}),o("p",{staticClass:"wyu-form-tips"},[e._v("商品数量")])],1),o("el-form-item",{attrs:{label:"商品排序"}},[o("el-input",{staticStyle:{width:"500px"},model:{value:e.goodsDetail.orderby,callback:function(t){e.$set(e.goodsDetail,"orderby",t)},expression:"goodsDetail.orderby"}}),o("p",{staticClass:"wyu-form-tips"},[e._v("数字越大越靠前")])],1),o("el-form-item",{attrs:{label:"商品推荐"}},[o("el-checkbox-button",{attrs:{label:"是否推荐","true-label":1,"false-label":0},model:{value:e.goodsDetail.is_recommend,callback:function(t){e.$set(e.goodsDetail,"is_recommend",t)},expression:"goodsDetail.is_recommend"}})],1),o("div",{staticClass:"wyu-title"},[o("h2",[e._v("SEO设置")])]),o("el-form-item",{attrs:{label:"百度SEO标题","label-width":"120px"}},[o("el-input",{staticStyle:{width:"500px"},attrs:{autocomplete:"off"},model:{value:e.goodsDetail.seo.title,callback:function(t){e.$set(e.goodsDetail.seo,"title",t)},expression:"goodsDetail.seo.title"}})],1),o("el-form-item",{attrs:{label:"百度SEO描述","label-width":"120px"}},[o("el-input",{staticStyle:{width:"500px"},attrs:{type:"textarea",autosize:{minRows:2,maxRows:5},autocomplete:"off",placeholder:"请输入内容"},model:{value:e.goodsDetail.seo.keywords,callback:function(t){e.$set(e.goodsDetail.seo,"keywords",t)},expression:"goodsDetail.seo.keywords"}})],1),o("el-form-item",{attrs:{label:"百度SEO关键词","label-width":"120px"}},[o("el-input",{staticStyle:{width:"500px"},attrs:{type:"textarea",autosize:{minRows:5,maxRows:10},autocomplete:"off",placeholder:"请输入内容"},model:{value:e.goodsDetail.seo.description,callback:function(t){e.$set(e.goodsDetail.seo,"description",t)},expression:"goodsDetail.seo.description"}})],1),o("el-form-item",{attrs:{label:"百度SEO原始发布时间","label-width":"120px"}},[o("el-date-picker",{attrs:{type:"date",placeholder:"选择日期"},model:{value:e.goodsDetail.seo.releaseDate,callback:function(t){e.$set(e.goodsDetail.seo,"releaseDate",t)},expression:"goodsDetail.seo.releaseDate"}})],1),o("el-form-item",{attrs:{label:"百度封面图片","label-width":"120px"}},[o("img-uploads",{attrs:{multi:!0,img:e.goodsDetail.seo.image},model:{value:e.goodsDetail.seo.image,callback:function(t){e.$set(e.goodsDetail.seo,"image",t)},expression:"goodsDetail.seo.image"}}),o("p",{staticClass:"tit"},[e._v(" 用于信息流投放后的封面显示，最多3张，单图片最大2M；封面图建议尺寸：高>=210px 宽>=375px;最小尺寸: 高>=146px 宽>=218px")])],1),o("div",{staticClass:"wyu-title"},[o("h2",[e._v("商品详情")])]),o("el-form-item",{attrs:{label:"商品相册",prop:"photos"}},[o("img-uploads",{attrs:{multi:!0,img:e.goodsDetail.photos,w:100,h:100},model:{value:e.goodsDetail.photos,callback:function(t){e.$set(e.goodsDetail,"photos",t)},expression:"goodsDetail.photos"}}),o("p",{staticClass:"wyu-form-tips"},[e._v("建议尺寸 375 X 375")])],1),o("el-form-item",{attrs:{label:"商品详情",prop:"goods_content"}},[o("html-editor",{attrs:{html:e.goodsDetail.goods_content,title:"商品详情"},model:{value:e.goodsDetail.goods_content,callback:function(t){e.$set(e.goodsDetail,"goods_content",t)},expression:"goodsDetail.goods_content"}})],1)],1):e._e(),2==e.active?o("el-form",{ref:"goodsArea",attrs:{rules:e.rules,"label-width":"80px"}},[o("div",{staticClass:"wyu-title"},[o("h2",[e._v("商品物流")])]),o("el-form-item",{attrs:{label:"是否包邮"}},[o("el-radio-group",{attrs:{size:"mini"},model:{value:e.goodsDetail.is_free_shipping,callback:function(t){e.$set(e.goodsDetail,"is_free_shipping",t)},expression:"goodsDetail.is_free_shipping"}},[o("el-radio",{attrs:{label:1}},[e._v("包邮")]),o("el-radio",{attrs:{label:0}},[e._v("不包邮")])],1)],1),0==e.goodsDetail.is_free_shipping?o("el-form-item",{attrs:{label:"运费模板",prop:"freight_template_id"}},[o("select-freight",{attrs:{"template-id":e.goodsDetail.freight_template_id},model:{value:e.goodsDetail.freight_template_id,callback:function(t){e.$set(e.goodsDetail,"freight_template_id",t)},expression:"goodsDetail.freight_template_id"}})],1):e._e(),0==e.goodsDetail.is_free_shipping?o("el-form-item",{attrs:{label:"重量",prop:"weight"}},[o("el-input",{staticStyle:{width:"500px"},model:{value:e.goodsDetail.weight,callback:function(t){e.$set(e.goodsDetail,"weight",t)},expression:"goodsDetail.weight"}}),o("p",{staticClass:"wyu-form-tips"},[e._v("商品重量：单位 克")])],1):e._e()],1):e._e()],1)]),o("div",{staticClass:"wyu-btn-div"},[e.active<2?o("el-button",{attrs:{size:"small",type:"primary"},on:{click:function(t){return e.stepActive()}}},[e._v("下一步")]):e._e(),2==e.active?o("el-button",{attrs:{size:"small",type:"primary"},on:{click:function(t){return e.createGoods()}}},[e._v("创建商品")]):e._e(),e.active>1?o("el-button",{attrs:{size:"small",type:"primary"},on:{click:function(t){e.active=e.active-1}}},[e._v("上一步")]):e._e(),o("router-link",{staticStyle:{"margin-left":"10px"},attrs:{to:"/product/product/index"}},[o("el-button",{attrs:{size:"small"}},[e._v("取消")])],1)],1)],1)},i=[],a=o("f499"),l=o.n(a),r=o("5200"),n=o("d722"),d=o("5fed"),c=o("9556"),g=function(){var e=this,t=e.$createElement,o=e._self._c||t;return o("div",{directives:[{name:"loading",rawName:"v-loading",value:e.loading,expression:"loading"}]},[o("el-form",{attrs:{"label-width":"100px",size:"mini"}},[o("el-form-item",{attrs:{label:"所有快递："}},[o("el-checkbox",{attrs:{value:e.getIsAll()},on:{change:e.setAll}},[e._v("全选")])],1),e._l(e.area,function(t,s){return o("el-form-item",{attrs:{label:t.shipping_name+"："}},[o("el-checkbox",{attrs:{value:e.getIsSelectAll(s)},on:{change:function(t){return e.setItemAll(s)}}},[e._v("全选")]),o("el-checkbox-group",{model:{value:e.areaIds,callback:function(t){e.areaIds=t},expression:"areaIds"}},e._l(t.area,function(t,s){return o("el-checkbox",{key:t.shipping_area_id,attrs:{label:t.shipping_area_id},on:{change:e.setCallBack}},[e._v(e._s(t.shipping_area_name)+"\n                ")])}),1)],1)})],2)],1)},p=[],m=(o("ac6a"),{name:"SelectShipping",props:["shippingAreaIds"],data:function(){return{area:[],areaIds:[],loading:!1}},created:function(){this.getShippongArea()},methods:{setCallBack:function(){this.$emit("input",this.areaIds)},setItemAll:function(e){var t=this,o=this.area[e].area,s=this.getIsSelectAll(e);s?o.forEach(function(e){t.areaIds.indexOf(e.shipping_area_id)<=-1&&t.areaIds.splice(e.shipping_area_id,1)}):o.forEach(function(e){t.areaIds.indexOf(e.shipping_area_id)<=-1&&t.areaIds.push(e.shipping_area_id)}),this.setCallBack()},setAll:function(e){var t=[];1==e&&this.area.forEach(function(e,o){e.area.forEach(function(e){t.push(e.shipping_area_id)})}),this.areaIds=t,this.setCallBack()},getIsSelectAll:function(e){var t=this,o=this.area[e].area,s=!0;return o.forEach(function(e){t.areaIds.indexOf(e.shipping_area_id)<=-1&&(s=!1)}),s},getShippongArea:function(){var e=this;this.loading=!0,n["a"]("/shop/admin.shipping/getDetail",{appToken:this.$store.getters.appToken}).then(function(t){e.loading=!1,e.area=t.list,e.areaIds=e.shippingAreaIds?e.shippingAreaIds:[]}).catch(function(t){e.loading=!1})},getIsAll:function(){var e=this,t=!0;return this.area.forEach(function(o,s){o.area.forEach(function(o){e.areaIds.indexOf(o.shipping_area_id)<=-1&&(t=!1)})}),t}}}),u=m,h=o("2877"),_=Object(h["a"])(u,g,p,!1,null,"eee3225e",null),f=_.exports,D=o("b7dd"),v=o("12d9"),b={name:"GoodsCreate",components:{SelectFreight:v["a"],ProductCategory:D["a"],SelectShipping:f,HtmlEditor:c["a"],ImgUploads:d["a"],TopNav:r["a"]},data:function(){return{loading:!1,active:1,typeId:0,formNameKey:["goodsInfo","goodsArea"],goodsDetail:{cat_id:0,goods_sn:"",goods_name:"",store_count:0,comment_count:0,weight:0,market_price:0,shop_price:0,keywords:"",goods_content:[],photo:"",photos:[],is_online:1,is_free_shipping:1,orderby:0,is_recommend:0,sales_sum:0,goods_num:0,freight_template_id:0,is_commission:0,seo:{title:"",keywords:"",description:"",releaseDate:"",image:[]}},rules:{goods_name:[{required:!0,message:"请输入商品名称",trigger:"blur"},{min:1,max:64,message:"长度在 1 到 64 个字符",trigger:"blur"}],cat_id:[{required:!0,message:"请输入选择商品分类",trigger:"blur"}],photo:[{required:!0,message:"请上传缩略图",trigger:"blur"}],photos:[{type:"array",required:!0,message:"至少上传一张相册",trigger:"blur"}],goods_content:[{type:"array",required:!0,message:"请编辑详情",trigger:"blur"}]}}},created:function(){if(sessionStorage.getItem("goodsDetail")){var e=JSON.parse(sessionStorage.getItem("goodsDetail"));this.goodsDetail=e,this.goodsDetail.goods_content=e.goods_content}},methods:{setGoodsCash:function(){var e=arguments.length>0&&void 0!==arguments[0]&&arguments[0];e?sessionStorage.setItem("goodsDetail",l()(this.goodsDetail)):sessionStorage.removeItem("goodsDetail")},getCatId:function(e){this.goodsDetail.cat_id=+e.cat_id},stepActive:function(){var e=this;this.setGoodsCash(!0),this.$refs[this.formNameKey[this.active-1]].validate(function(t){if(!t)return!1;e.active,e.active=e.active+1})},createGoods:function(){var e=this;this.loading=!0,n["a"]("/shop/admin.integral.goods/create",{appToken:this.$store.getters.appToken,cat_id:this.goodsDetail.cat_id,goods_sn:this.goodsDetail.goods_sn,goods_name:this.goodsDetail.goods_name,store_count:this.goodsDetail.store_count,comment_count:this.goodsDetail.comment_count,market_price:this.goodsDetail.market_price,shop_price:this.goodsDetail.shop_price,integral:this.goodsDetail.integral,keywords:this.goodsDetail.keywords,goods_content:l()(this.goodsDetail.goods_content),photo:this.goodsDetail.photo,photos:l()(this.goodsDetail.photos),is_online:this.goodsDetail.is_online,is_free_shipping:this.goodsDetail.is_free_shipping,orderby:this.goodsDetail.orderby,is_recommend:this.goodsDetail.is_recommend,sales_sum:this.goodsDetail.sales_sum,goods_num:this.goodsDetail.goods_num,freight_template_id:this.goodsDetail.freight_template_id,weight:this.goodsDetail.weight,seo:l()(this.goodsDetail.seo)}).then(function(t){e.loading=!1,e.setGoodsCash(!1),e.$message({message:"提交成功",type:"success"}),setTimeout(function(){e.$router.push("/marketing/integral/index")},1e3)}).catch(function(t){e.loading=!1})}}},y=b,x=Object(h["a"])(y,s,i,!1,null,null,null);t["default"]=x.exports},ac6a:function(e,t,o){for(var s=o("cadf"),i=o("0d58"),a=o("2aba"),l=o("7726"),r=o("32e9"),n=o("84f2"),d=o("2b4c"),c=d("iterator"),g=d("toStringTag"),p=n.Array,m={CSSRuleList:!0,CSSStyleDeclaration:!1,CSSValueList:!1,ClientRectList:!1,DOMRectList:!1,DOMStringList:!1,DOMTokenList:!0,DataTransferItemList:!1,FileList:!1,HTMLAllCollection:!1,HTMLCollection:!1,HTMLFormElement:!1,HTMLSelectElement:!1,MediaList:!0,MimeTypeArray:!1,NamedNodeMap:!1,NodeList:!0,PaintRequestList:!1,Plugin:!1,PluginArray:!1,SVGLengthList:!1,SVGNumberList:!1,SVGPathSegList:!1,SVGPointList:!1,SVGStringList:!1,SVGTransformList:!1,SourceBufferList:!1,StyleSheetList:!0,TextTrackCueList:!1,TextTrackList:!1,TouchList:!1},u=i(m),h=0;h<u.length;h++){var _,f=u[h],D=m[f],v=l[f],b=v&&v.prototype;if(b&&(b[c]||r(b,c,p),b[g]||r(b,g,f),n[f]=p,D))for(_ in s)b[_]||a(b,_,s[_],!0)}}}]);
//# sourceMappingURL=chunk-7a11d340.2031d828.js.map