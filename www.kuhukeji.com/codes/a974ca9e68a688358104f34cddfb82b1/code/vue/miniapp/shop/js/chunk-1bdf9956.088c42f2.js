(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-1bdf9956"],{5200:function(t,e,o){"use strict";var s=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"wyu-top"},[s("div",{staticClass:"wyu-header"},[t.title?t._e():s("div",{staticClass:"wyu-tab"},[s("ul",t._l(t.showMenu,function(e,o){return s("li",{key:o,class:o==t.select?"on":""},[s("router-link",{attrs:{to:e.link}},[t._v(t._s(e.title))])],1)}),0)]),t.title?s("div",{staticClass:"wyu-tab"},[s("ul",[s("li",[t._v(t._s(t.title))])])]):t._e(),s("div",{staticClass:"wyu-header-status"},[s("div",{staticClass:"login-info"},[s("img",{attrs:{src:o("741c")}}),s("el-dropdown",{staticStyle:{cursor:"pointer"}},[s("span",{staticClass:"el-dropdown-link"},[t._v("\n                          "+t._s(t.$store.getters.appInfo.app_name)+"  "),s("i",{staticClass:"el-icon-arrow-down el-icon--right"})]),s("el-dropdown-menu",{attrs:{slot:"dropdown"},slot:"dropdown"},[s("el-dropdown-item",[s("span",{on:{click:t.LogOut}},[t._v("退出登录")])])],1)],1)],1)])])])},a=[],i=(o("a481"),{props:["mdl","select","title"],name:"TopNav",data:function(){return{showMenu:[],menu:{sms:[{title:"发送短信",link:"/marketing/sms/send"},{title:"短信记录",link:"/marketing/sms/census"}],paymentSetting:[{title:"微信小程序支付设置",link:"/setting/payment/weixin"},{title:"支付宝小程序支付设置",link:"/setting/payment/ali"},{title:"百度小程序支付设置",link:"/setting/payment/baidu"}],employ:[{title:"员工管理",link:"/setting/employ"},{title:"角色管理",link:"/setting/employ/role"}],agent:[{title:"分销代理设置",link:"/agent/setting/index"},{title:"顾问申请设置",link:"/agent/setting/apply"}],coupon:[{title:"优惠券管理",link:"/marketing/coupon/index"},{title:"优惠券设置",link:"/marketing/coupon/setting"},{title:"赠送优惠券",link:"/marketing/coupon/send"}],sucai:[{title:"素材管理",link:"/resource/index"},{title:"素材分类 ",link:"/resource/category"}],wuliu:[{title:"运费模板",link:"/shipping/area/index/"},{title:"快递公司 ",link:"/shipping/index"}]}}},created:function(){this.menu[this.mdl]?this.showMenu=this.menu[this.mdl]:this.showMenu=[]},methods:{LogOut:function(){var t=this;this.$store.dispatch("LogOut").then(function(){t.$router.replace("/")})}}}),n=i,l=o("2877"),r=Object(l["a"])(n,s,a,!1,null,"5665e029",null);e["a"]=r.exports},"741c":function(t,e){t.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAAAXNSR0IArs4c6QAAA9VJREFUWAnNmctKJDEUQFNt2T5oH/gAH+BOFy3MR8xC8D9mM5tZzIfMTtz4H4ILP2LABnUn+ABBFBvftnNPpm9NOlaqOo12z4WQVHJv7umbR6XSifHk+Ph4/e3t7ZukDUkr0lzzVD76sZkkyYmkPUk7q6urB66DRB8Epnp0dPRLnr9LuaL1/cwFsCX+ttfW1n5K+QnfFrANtyv5134ChXwJ3L5AbgJpI0Xk/hc4oGFpj6ZJmHOtVuu3VA5kWAui2KpUKl9SAWNB9AxXrVbN1NSUGR8fN8PDw9bf8/Ozubu7Mzc3N+bpyU6lEEewHibYksPDwwMp1IOaBQ3z8/MWrkDFQl5eXhapBNtkDjaIIFtJtCwtLZmxsTHmS6Ht5OSkjezZ2VmhXl4jbAxt9D43OztrRkZGjMzdrhK62PQgtei5xzybmJiwkSN63SZsdI7GgEYD1mo1C0X0FE7Lbq7RRUfrsY2VNNZAhxY7nKtoWfO8emxjJRpQ9iYbEdeRrLYOWP8ZXeqwjZVoQD9COPTr/GfVyasvA44GZBPuZbIDgm2sRAM+Pj6aoaGhWD9WH9tYiQbkFcYG3YtgGyvRgK+vr/Y9Ozo6GuXr4eHBYBsr0YA4aDabdkV2OxeZe9j0IqWAoZXHSYUTTFkkiVzR0LL9FEkuYAjK7wjHALABE03d53hzEDUWBeUicX3lwXYAuspFnbptANzf39vk1vdSVv8uaAaojWUdd6sX6sd1HtLBh+pZwDKnofZQve9YnVHv2rj1vg16tHNg9duyZ7+t7DkzLCkomPanz74Z7dkQ5zVqnXbEmY7ERp2mabYoVC+UM09fXl7sPL29vTUkRMHoX8t+H7mACqQ528nCwsK7d3DZCnWd8YP0B7LCLy4usu0HuBDkO0CF0nx6etrwcYTEALlwfpl3+fLysuFj6vr6OoPLg+wAVChyEr+Yb4mPAvNB6Zuhd4fch8wAXTg6Yp7Nzc19GpzC4gNINnyF0xydDFANyFGYmZmxuYK77R9dxtfp6WnuQrGACkFO4tXFPPmsofV/IL7wqedFd9EAyDGjppAYs2r7BYc/BJ8KCEt722myUZ9Iu736oIHEfQt5P8X1qXsibKmcQPYkWtndDCcSUr8jqH7dwMCWyvjvCMwPaeA2yZ7v+g2nI8U85GSESBRbsFXad8LbqsSOD+AgEr4d2YYtuwJuNBq7AvWVJU+4ByEE5erqCv/79Xr93xWwhJNbxk0J6RahHUT08Nke1i1Y2kx/L9HdaJ2fn6/L1xe3rhuitCJ5/I2P22FJWXw0xYf9G4I5t7i42PE3xB9oWTpXj6b+tQAAAABJRU5ErkJggg=="},f179:function(t,e,o){"use strict";o.r(e);var s=function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("div",[o("top-nav",{attrs:{title:"库存管理"}}),t._m(0),o("div",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticClass:"wyu-main"},[o("div",{staticClass:"wyu-block"},[o("el-form",{staticClass:"search-form",attrs:{"label-width":"80px",size:"mini",inline:!0},model:{value:t.searchForm,callback:function(e){t.searchForm=e},expression:"searchForm"}},[o("el-form-item",{attrs:{label:"商品ID","label-width":"100"}},[o("el-input",{model:{value:t.searchForm.goods_id,callback:function(e){t.$set(t.searchForm,"goods_id",e)},expression:"searchForm.goods_id"}})],1),o("el-form-item",{attrs:{label:"商品名称","label-width":"100"}},[o("el-input",{model:{value:t.searchForm.goods_name,callback:function(e){t.$set(t.searchForm,"goods_name",e)},expression:"searchForm.goods_name"}})],1),o("el-form-item",{attrs:{label:"商品码","label-width":"100"}},[o("el-input",{model:{value:t.searchForm.goods_sn,callback:function(e){t.$set(t.searchForm,"goods_sn",e)},expression:"searchForm.goods_sn"}})],1),o("el-form-item",{attrs:{label:"规格码","label-width":"100"}},[o("el-input",{model:{value:t.searchForm.bar_code,callback:function(e){t.$set(t.searchForm,"bar_code",e)},expression:"searchForm.bar_code"}})],1),o("el-form-item",{attrs:{label:"库存状态","label-width":"100"}},[o("el-select",{attrs:{placeholder:"请选择"},model:{value:t.searchForm.stock_status,callback:function(e){t.$set(t.searchForm,"stock_status",e)},expression:"searchForm.stock_status"}},[o("el-option",{key:-999,attrs:{value:-999,label:"请选择"}}),t._l(t.datas.stock_status_mean,function(t,e){return o("el-option",{key:e,attrs:{value:e,label:t}})})],2)],1),o("div",{staticStyle:{"padding-left":"80px"}},[o("el-button",{attrs:{icon:"el-icon-search",size:"mini",type:"primary"},on:{click:function(e){return t.getGoodsStock(1)}}},[t._v("搜索")]),o("a",{attrs:{href:"javascript:void(0);"},on:{click:function(e){t.searchForm.goods_name="",t.searchForm.goods_id="",t.searchForm.KEY="",t.searchForm.bar_code="",t.searchForm.stock_status=-999,t.getGoodsStock()}}},[t._v("取消搜索")])],1)],1),o("el-table",{staticStyle:{width:"100%"},attrs:{data:t.datas.list,size:"mini"},on:{"selection-change":t.handleSelectionChange}},[o("el-table-column",{attrs:{type:"selection",width:"55"}}),o("el-table-column",{attrs:{prop:"goods_id",label:"商品ID",width:"70"}}),o("el-table-column",{attrs:{label:"编码",width:"200"},scopedSlots:t._u([{key:"default",fn:function(e){return[o("p",[t._v("商品码: "+t._s(e.row.goods_sn))]),o("p",[t._v("规格码: "+t._s(e.row.bar_code))])]}}])}),o("el-table-column",{attrs:{label:"商品名称",width:"350"},scopedSlots:t._u([{key:"default",fn:function(e){return[o("div",{staticClass:"ellipsis-02"},[t._v("\n              "+t._s(e.row.goods_name)+"\n            ")])]}}])}),o("el-table-column",{attrs:{label:"缩略图",width:"80"},scopedSlots:t._u([{key:"default",fn:function(t){return[o("img",{attrs:{src:t.row.photo,width:"50"}})]}}])}),o("el-table-column",{attrs:{label:"规格"},scopedSlots:t._u([{key:"default",fn:function(e){return[e.row.key_name.length<0?o("p",[t._v("无规格")]):t._e(),t._l(e.row.key_name,function(s){return e.row.key_name.length>0?o("p",[t._v(t._s(s))]):t._e()})]}}])}),o("el-table-column",{attrs:{label:"库存数量",width:"100",prop:"goods_num"},scopedSlots:t._u([{key:"default",fn:function(e){return[e.row.goods_num<=t.stockLimit.sold_out?o("h1",{staticStyle:{color:"#909399"}},[t._v(t._s(e.row.goods_num))]):t._e(),e.row.goods_num>t.stockLimit.sold_out&&e.row.goods_num<=t.stockLimit.critical?o("h1",{staticStyle:{color:"#f56c6c"}},[t._v(t._s(e.row.goods_num))]):t._e(),e.row.goods_num>t.stockLimit.critical&&e.row.goods_num<=t.stockLimit.danger?o("h1",{staticStyle:{color:"#e6a23c"}},[t._v(t._s(e.row.goods_num))]):t._e(),e.row.goods_num>t.stockLimit.danger&&e.row.goods_num<=t.stockLimit.safe?o("h1",{staticStyle:{color:"#409EFF"}},[t._v(t._s(e.row.goods_num))]):t._e(),e.row.goods_num>t.stockLimit.safe?o("h1",{staticStyle:{color:"#67c23a"}},[t._v(t._s(e.row.goods_num))]):t._e()]}}])}),o("el-table-column",{attrs:{label:"库存预警",prop:"goods_num",width:"100"},scopedSlots:t._u([{key:"default",fn:function(e){return[e.row.goods_num<=t.stockLimit.sold_out?o("el-tag",{attrs:{type:"info"}},[t._v("无货")]):t._e(),e.row.goods_num>t.stockLimit.sold_out&&e.row.goods_num<=t.stockLimit.critical?o("el-tag",{attrs:{type:"danger"}},[t._v("即将售罄")]):t._e(),e.row.goods_num>t.stockLimit.critical&&e.row.goods_num<=t.stockLimit.danger?o("el-tag",{attrs:{type:"warning"}},[t._v("库存紧张")]):t._e(),e.row.goods_num>t.stockLimit.danger&&e.row.goods_num<=t.stockLimit.safe?o("el-tag",[t._v("需要关注")]):t._e(),e.row.goods_num>t.stockLimit.safe?o("el-tag",{attrs:{type:"success"}},[t._v("库存充足")]):t._e()]}}])}),o("el-table-column",{attrs:{label:"操作信息",width:"200"},scopedSlots:t._u([{key:"default",fn:function(e){return[o("el-button",{attrs:{type:"text",size:"mini"},on:{click:function(o){t.inOut(e),t.dialog=!0}}},[t._v("库存操作")])]}}])})],1),o("div",{staticClass:"page"},[o("div",{staticClass:"page-tool"},[o("el-button",{attrs:{size:"mini",type:"success"},on:{click:function(e){t.dialog=!0}}},[t._v("批量操作库存")])],1),o("div",{staticClass:"page-mian"},[o("el-pagination",{attrs:{"page-size":t.datas.limit,layout:"total, prev, pager, next",total:t.datas.count},on:{"current-change":t.getGoodsStock}})],1)])],1)]),o("el-dialog",{directives:[{name:"loading",rawName:"v-loading",value:t.subLoading,expression:"subLoading"}],attrs:{title:"库存操作",visible:t.dialog,width:"25%","modal-append-to-body":!1},on:{"update:visible":function(e){t.dialog=e}}},[o("el-form",{staticStyle:{padding:"0"},attrs:{model:t.form,size:"small"}},[o("el-form-item",{attrs:{label:"操作类型","label-width":"80px"}},[o("el-select",{attrs:{placeholder:"请选择"},model:{value:t.form.type,callback:function(e){t.$set(t.form,"type",e)},expression:"form.type"}},[o("el-option",{key:-999,attrs:{label:"请选择",value:-999}}),t._l(t.manageType,function(t,e){return o("el-option",{key:e,attrs:{label:t,value:e}})})],2)],1),o("el-form-item",{attrs:{label:"操作数量","label-width":"80px"}},[o("el-input",{attrs:{autocomplete:"off"},model:{value:t.form.number,callback:function(e){t.$set(t.form,"number",e)},expression:"form.number"}})],1)],1),o("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[o("el-button",{attrs:{size:"small"},on:{click:function(e){t.dialog=!1}}},[t._v("取 消")]),o("el-button",{attrs:{size:"small",type:"primary"},on:{click:function(e){return t.changeNum(!0)}}},[t._v("确 定")])],1)],1)],1)},a=[function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("div",{staticClass:"wyu-tips wyu-tips-warning"},[o("p",[t._v("1) 这里是库存管理")]),o("p",[t._v("2) 库存仅供参考，设置时请留有余量。")])])}],i=o("f499"),n=o.n(i),l=o("5200"),r=o("d722"),c={name:"commentIndex",components:{TopNav:l["a"]},data:function(){return{subLoading:!1,dialog:!1,loading:!1,datas:[],searchForm:{goods_id:"",goods_name:"",sku:"",bar_code:"",stock_status:-999},img:[],repertoryIds:[],repertory_id:0,stockLimit:{sold_out:0,critical:10,danger:50,safe:100},manageType:{},form:{type:-999,number:0}}},created:function(){this.getGoodsStock()},methods:{a:function(t){console.log(t)},handleSelectionChange:function(t){var e=[];for(var o in t)e.push(t[o].repertory_id);this.repertoryIds=e},getGoodsStock:function(){var t=this,e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:1;this.loading=!0,r["a"]("/shop/admin.goods.stock/stockList",{appToken:this.$store.getters.appToken,page:e,goods_name:this.searchForm.goods_name,goods_id:this.searchForm.goods_id,sku:this.searchForm.sku,bar_code:this.searchForm.bar_code,goods_sn:this.searchForm.goods_sn,stock_status:this.searchForm.stock_status,limit:20}).then(function(e){t.datas=e,t.stockLimit=e.status_limit,t.manageType=e.manage_type,t.loading=!1}).catch(function(e){t.loading=!1})},inOut:function(t){this.repertory_id=t.row.repertory_id},changeNum:function(){var t=this;this.loading=!0,r["a"]("/shop/admin.goods.stock/changeStock",{appToken:this.$store.getters.appToken,repertory_id:this.repertory_id,type:this.form.type,number:this.form.number,repertoryIds:n()(this.repertoryIds)}).then(function(e){t.$message({message:"操作成功！",type:"success"}),t.dialog=!1,t.loading=!1}).catch(function(e){t.loading=!1})}}},d=c,u=o("2877"),m=Object(u["a"])(d,s,a,!1,null,null,null);e["default"]=m.exports}}]);
//# sourceMappingURL=chunk-1bdf9956.088c42f2.js.map