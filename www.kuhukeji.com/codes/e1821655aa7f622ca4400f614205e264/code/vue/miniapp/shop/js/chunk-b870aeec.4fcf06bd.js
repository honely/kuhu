(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-b870aeec"],{"1b83":function(e,t,s){"use strict";s.r(t);var a=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",[s("top-nav",{attrs:{title:"商品列表"}}),s("div",{staticClass:"wyu-main"},[s("div",{directives:[{name:"loading",rawName:"v-loading",value:e.loading,expression:"loading"}],staticClass:"wyu-block"},[s("el-form",{staticClass:"search-form",attrs:{size:"mini",inline:!0},model:{value:e.searchForm,callback:function(t){e.searchForm=t},expression:"searchForm"}},[s("el-form-item",{attrs:{label:"商品名称","label-width":"100"}},[s("el-input",{model:{value:e.searchForm.goods_name,callback:function(t){e.$set(e.searchForm,"goods_name",t)},expression:"searchForm.goods_name"}})],1),s("el-form-item",{attrs:{label:"商品编号","label-width":"100"}},[s("el-input",{model:{value:e.searchForm.goods_sn,callback:function(t){e.$set(e.searchForm,"goods_sn",t)},expression:"searchForm.goods_sn"}})],1),s("el-form-item",{attrs:{label:"商品分类","label-width":"100"}},[s("product-category",{attrs:{"no-add":!0,"p-cat-id":e.searchForm.p_cat_id,"cat-id":e.searchForm.cat_id},on:{selCat:e.selCat}})],1),s("el-form-item",{attrs:{label:"商品模型","label-width":"100"}},[s("select-type",{attrs:{"type-id":e.searchForm.type_id},model:{value:e.searchForm.type_id,callback:function(t){e.$set(e.searchForm,"type_id",t)},expression:"searchForm.type_id"}})],1),s("el-form-item",{attrs:{label:"上/下架","label-width":"100"}},[s("el-select",{attrs:{placeholder:"请选择"},model:{value:e.searchForm.is_online,callback:function(t){e.$set(e.searchForm,"is_online",t)},expression:"searchForm.is_online"}},[s("el-option",{attrs:{label:"全部",value:0}}),s("el-option",{attrs:{label:"上架",value:2}}),s("el-option",{attrs:{label:"下架",value:1}})],1)],1),s("el-form-item",{attrs:{label:"扩展参数"}},[s("el-checkbox",{attrs:{"true-label":1,"false-label":0},model:{value:e.searchForm.is_free_shipping,callback:function(t){e.$set(e.searchForm,"is_free_shipping",t)},expression:"searchForm.is_free_shipping"}},[e._v("包邮")]),s("el-checkbox",{attrs:{"true-label":1,"false-label":0},model:{value:e.searchForm.is_plus_vip,callback:function(t){e.$set(e.searchForm,"is_plus_vip",t)},expression:"searchForm.is_plus_vip"}},[e._v("会员")]),s("el-checkbox",{attrs:{"true-label":1,"false-label":0},model:{value:e.searchForm.is_commission,callback:function(t){e.$set(e.searchForm,"is_commission",t)},expression:"searchForm.is_commission"}},[e._v("分佣")]),s("el-checkbox",{attrs:{"true-label":1,"false-label":0},model:{value:e.searchForm.is_hot,callback:function(t){e.$set(e.searchForm,"is_hot",t)},expression:"searchForm.is_hot"}},[e._v("热销")]),s("el-checkbox",{attrs:{"true-label":1,"false-label":0},model:{value:e.searchForm.is_new,callback:function(t){e.$set(e.searchForm,"is_new",t)},expression:"searchForm.is_new"}},[e._v("新品")]),s("el-checkbox",{attrs:{"true-label":1,"false-label":0},model:{value:e.searchForm.is_recommend,callback:function(t){e.$set(e.searchForm,"is_recommend",t)},expression:"searchForm.is_recommend"}},[e._v("推荐 | ")])],1),s("el-form-item",{attrs:{label:"添加日期"}},[s("date-between",{model:{value:e.searchForm.date,callback:function(t){e.$set(e.searchForm,"date",t)},expression:"searchForm.date"}})],1),s("div",{staticStyle:{"padding-left":"80px"}},[s("el-button",{attrs:{icon:"el-icon-search",size:"mini",type:"primary"},on:{click:function(t){return e.getList(1)}}},[e._v("搜索")]),s("router-link",{attrs:{to:"/product/product/create"}},[s("el-button",{attrs:{size:"mini",type:"danger"}},[e._v("新增商品")])],1)],1)],1),s("el-table",{staticStyle:{width:"100%"},attrs:{data:e.datas.list,size:"small"}},[s("el-table-column",{attrs:{prop:"goods_id",label:"编码/ID",width:"180"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("p",[e._v("系统ID："),s("span",[e._v(e._s(t.row.goods_id))])]),s("p",[e._v("商品编码："),s("span",[e._v(e._s(t.row.goods_sn))])])]}}])}),s("el-table-column",{attrs:{label:"商品名称",width:"240"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("div",{staticClass:"ellipsis-02"},[s("b",[e._v(" "+e._s(t.row.goods_name))])])]}}])}),s("el-table-column",{attrs:{label:"缩略图",width:"80",height:"80"},scopedSlots:e._u([{key:"default",fn:function(e){return[s("img",{attrs:{width:"60",src:e.row.photo}})]}}])}),s("el-table-column",{attrs:{label:"商品价格",width:"140"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("p",[e._v("市场价："),s("span",{staticStyle:{color:"red"}},[e._v("￥"+e._s(t.row.market_price))])]),s("p",[e._v("本店价："),s("span",{staticStyle:{color:"red"}},[e._v("￥"+e._s(t.row.shop_price))])])]}}])}),s("el-table-column",{attrs:{label:"模型/分类",width:"200"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("p",[e._v("模型："),s("span",[e._v(e._s(t.row.type_id))])]),s("p",[e._v("分类："),s("span",{staticClass:"ellipsis-01"},[e._v(e._s(t.row.p_cat_id)+"--\x3e"+e._s(t.row.cat_id))])])]}}])}),s("el-table-column",{attrs:{label:"扩展信息",width:"150"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("el-row",[s("el-col",{attrs:{span:8}},[1==t.row.is_free_shipping?s("el-tag",{attrs:{size:"mini"}},[e._v("包邮")]):e._e(),0==t.row.is_free_shipping?s("el-tag",{attrs:{type:"info",size:"mini"}},[e._v("包邮")]):e._e()],1),s("el-col",{attrs:{span:8}},[1==t.row.is_plus_vip?s("el-tag",{attrs:{size:"mini"}},[e._v("会员")]):e._e(),0==t.row.is_plus_vip?s("el-tag",{attrs:{type:"info",size:"mini"}},[e._v("会员")]):e._e()],1),s("el-col",{attrs:{span:8}},[1==t.row.is_commission?s("el-tag",{attrs:{size:"mini"}},[e._v("分佣")]):e._e(),0==t.row.is_commission?s("el-tag",{attrs:{type:"info",size:"mini"}},[e._v("分佣")]):e._e()],1)],1),s("el-row",[s("el-col",{attrs:{span:8}},[1==t.row.is_hot?s("el-tag",{attrs:{size:"mini"}},[e._v("热销")]):e._e(),0==t.row.is_hot?s("el-tag",{attrs:{type:"info",size:"mini"}},[e._v("热销")]):e._e()],1),s("el-col",{attrs:{span:8}},[1==t.row.is_new?s("el-tag",{attrs:{size:"mini"}},[e._v("新品")]):e._e(),0==t.row.is_new?s("el-tag",{attrs:{type:"info",size:"mini"}},[e._v("新品")]):e._e()],1),s("el-col",{attrs:{span:8}},[1==t.row.is_recommend?s("el-tag",{attrs:{size:"mini"}},[e._v("推荐")]):e._e(),0==t.row.is_recommend?s("el-tag",{attrs:{type:"info",size:"mini"}},[e._v("推荐")]):e._e()],1)],1)]}}])}),s("el-table-column",{attrs:{prop:"goods_sn",label:"浏/评/销/排"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("el-row",[s("el-col",{attrs:{span:12}},[s("p",[e._v("浏览："),s("span",[e._v(e._s(t.row.views))])])]),s("el-col",{attrs:{span:12}},[s("p",[e._v("排序："),s("span",[e._v(e._s(t.row.orderby))])])])],1),s("el-row",[s("el-col",{attrs:{span:12}},[s("p",[e._v("评论："),s("span",[e._v(e._s(t.row.comment_count))])])]),s("el-col",{attrs:{span:12}},[s("p",[e._v("销量："),s("span",[e._v(e._s(t.row.sales_sum))])])])],1)]}}])}),s("el-table-column",{attrs:{label:"操作日期"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("p",[e._v("添加："+e._s(t.row.add_time))]),s("p",[e._v("修改："+e._s(t.row.last_update))])]}}])}),s("el-table-column",{attrs:{prop:"goods_sn",label:"上/下架",width:"80"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("el-switch",{attrs:{value:t.row.is_online,"inactive-value":0,"active-value":1},on:{change:function(s){return e.setOnline(t.row)}}})]}}])}),s("el-table-column",{attrs:{width:"200",label:"操作"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("el-row",[s("el-col",{attrs:{span:8}},[s("router-link",{attrs:{to:"/product/product/edit/"+t.row.goods_id}},[s("el-button",{attrs:{size:"mini",type:"text"}},[e._v("编辑")])],1)],1),s("el-col",{attrs:{span:8}},[s("router-link",{attrs:{to:"/product/product/specprice/"+t.row.goods_id}},[s("el-button",{attrs:{size:"mini",type:"text"}},[e._v("库存价格")])],1)],1),s("el-col",{staticStyle:{"text-align":"center"},attrs:{span:8}},[s("el-popover",{attrs:{placement:"top"},model:{value:t.row.is_delete,callback:function(s){e.$set(t.row,"is_delete",s)},expression:"scope.row.is_delete"}},[s("p",{staticStyle:{"margin-bottom":"4px"}},[e._v("确定删除吗？")]),s("div",{staticStyle:{"text-align":"right",margin:"0"}},[s("el-button",{attrs:{loading:e.loading,size:"mini",type:"text"},on:{click:function(e){t.row.is_delete=!1}}},[e._v("取消\n                                        ")]),s("el-button",{attrs:{loading:e.loading,type:"primary",size:"mini"},on:{click:function(s){return e.del(t)}}},[e._v("确定\n                                        ")])],1),s("el-button",{attrs:{slot:"reference",type:"text",size:"mini"},slot:"reference"},[e._v("删除")])],1)],1)],1)]}}])})],1),s("div",{staticClass:"page"},[s("div",{staticClass:"page-tool"}),s("div",{staticClass:"page-mian"},[s("el-pagination",{attrs:{"page-size":e.datas.limit,layout:"total, prev, pager, next",total:e.datas.count},on:{"current-change":e.getList}})],1)])],1)])],1)},i=[],o=s("5200"),n=s("d722"),r=s("1b85"),l=s("0c7a"),c=s("981d"),d={name:"goodsAttrIndex",components:{SelectType:c["a"],ProductCategory:l["a"],DateBetween:r["a"],TopNav:o["a"]},data:function(){return{loading:!1,datas:[],searchForm:this.initSearch(),goods_ids:[],goods_id:0}},created:function(){this.getList()},methods:{initSearch:function(){return{date:[],is_plus_vip:0,is_commission:0,is_free_shipping:0,is_recommend:0,is_new:0,is_hot:0,cat_id:0,p_cat_id:0,type_id:0,is_online:0,goods_name:"",goods_sn:""}},getList:function(){var e=this,t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:1;this.loading=!0,n["a"]("/shop/admin.goods.goods/index",{appToken:this.$store.getters.appToken,page:t,is_plus_vip:this.searchForm.is_plus_vip,is_commission:this.searchForm.is_commission,is_free_shipping:this.searchForm.is_free_shipping,is_recommend:this.searchForm.is_recommend,is_new:this.searchForm.is_new,is_hot:this.searchForm.is_hot,cat_id:this.searchForm.cat_id,p_cat_id:this.searchForm.p_cat_id,type_id:this.searchForm.type_id,is_online:this.searchForm.is_online,end_add_time:this.searchForm.date[1]?this.searchForm.date[1]:0,bg_add_time:this.searchForm.date[0]?this.searchForm.date[0]:0,goods_name:this.searchForm.goods_name,goods_sn:this.searchForm.goods_sn}).then(function(t){e.datas=t,e.loading=!1}).catch(function(t){e.loading=!1})},selCat:function(e){this.searchForm.cat_id=e.cat_id,this.searchForm.p_cat_id=e.p_cat_id},setOnline:function(e){var t=this;this.loading=!0,n["a"]("/shop/admin.goods.goods/online",{appToken:this.$store.getters.appToken,goods_id:e.goods_id}).then(function(e){t.loading=!1,t.getList()}).catch(function(e){t.loading=!1})},del:function(){var e=this,t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:"";if(""!=t&&t.row.goods_id>0)this.goods_id=t.row.goods_id;else if(0==this.goods_ids.length)return!1;this.loading=!0,n["a"]("/shop/admin.goods.goods/del",{appToken:this.$store.getters.appToken,goods_id:this.goods_id}).then(function(t){e.getList()}).catch(function(t){e.loading=!1})}}},p=d,_=s("2877"),m=Object(_["a"])(p,a,i,!1,null,null,null);t["default"]=m.exports},"1b85":function(e,t,s){"use strict";var a=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",[s("el-date-picker",{attrs:{type:"daterange","picker-options":e.pickerOptions2,"range-separator":"至","start-placeholder":"开始日期","end-placeholder":"结束日期",align:"right"},on:{change:e.selectDate},model:{value:e.value,callback:function(t){e.value=t},expression:"value"}})],1)},i=[],o={name:"DateBetween",props:["date"],data:function(){return{pickerOptions2:{shortcuts:[{text:"最近七天",onClick:function(e){var t=new Date,s=new Date;s.setTime(s.getTime()-6048e5),e.$emit("pick",[s,t])}},{text:"最近半个月",onClick:function(e){var t=new Date,s=new Date;s.setTime(s.getTime()-1296e6),e.$emit("pick",[s,t])}},{text:"最近一个月",onClick:function(e){var t=new Date,s=new Date;s.setTime(s.getTime()-2592e6),e.$emit("pick",[s,t])}}]},value:""}},methods:{selectDate:function(e){var t=0,s=0;e&&(t=e[0].getFullYear()+"-"+(e[0].getMonth()+1)+"-"+e[0].getDate(),s=e[1].getFullYear()+"-"+(e[1].getMonth()+1)+"-"+e[1].getDate()),this.$emit("input",[t,s])}}},n=o,r=s("2877"),l=Object(r["a"])(n,a,i,!1,null,"082e0500",null);t["a"]=l.exports},"981d":function(e,t,s){"use strict";var a=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",[s("el-select",{directives:[{name:"loading",rawName:"v-loading",value:e.typeLoading,expression:"typeLoading"}],staticStyle:{width:"100%"},attrs:{disabled:!0===e.disabled,size:e.size,value:e.typeId,placeholder:"请选择"},on:{input:e.setTypeId}},e._l(e.types,function(e){return s("el-option",{key:e.type_id,attrs:{label:e.name,value:e.type_id}})}),1)],1)},i=[],o=s("d722"),n={name:"SelectType",props:["size","typeId","disabled"],data:function(){return{typeLoading:!0,types:[]}},created:function(){this.getTypeList()},methods:{setTypeId:function(e){this.$emit("input",e)},getTypeList:function(){var e=this;this.typeLoading=!0,o["a"]("/shop/admin.goodstype/index",{appToken:this.$store.getters.appToken}).then(function(t){e.typeLoading=!1,e.types=t.list,e.types.unshift({type_id:0,name:"全部模型"})}).catch(function(t){e.typeLoading=!1})}}},r=n,l=s("2877"),c=Object(l["a"])(r,a,i,!1,null,"bfc729f4",null);t["a"]=c.exports}}]);
//# sourceMappingURL=chunk-b870aeec.4fcf06bd.js.map