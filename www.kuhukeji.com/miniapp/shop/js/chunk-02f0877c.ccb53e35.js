(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-02f0877c"],{"0017":function(t,i,e){"use strict";e.r(i);var n=function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("div",[e("top-nav",{attrs:{mdl:"wuliu",select:1}}),t._m(0),e("div",{staticClass:"wyu-main"},[e("div",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticClass:"wyu-block"},[e("el-form",{staticClass:"search-form",attrs:{"label-width":"80px",size:"mini",inline:!0},model:{value:t.searchForm,callback:function(i){t.searchForm=i},expression:"searchForm"}},[e("el-form-item",{attrs:{label:"公司名称","label-width":"100"}},[e("el-input",{model:{value:t.searchForm.title,callback:function(i){t.$set(t.searchForm,"title",i)},expression:"searchForm.title"}})],1),e("div",{staticStyle:{"padding-left":"80px"}},[e("el-button",{attrs:{icon:"el-icon-search",size:"mini",type:"primary"},on:{click:function(i){return t.getShippingList(1)}}},[t._v("搜索")]),e("a",{attrs:{href:"javascript:void(0);"},on:{click:function(i){t.searchForm.title="",t.getShippingList(1)}}},[t._v("取消搜索")]),e("el-button",{attrs:{size:"mini",type:"danger"},on:{click:t.creatShippingEvent}},[t._v("新增物流公司")])],1)],1),e("el-table",{staticStyle:{width:"100%"},attrs:{data:t.datas.list}},[e("el-table-column",{attrs:{prop:"shipping_id",label:"ID",width:"80"}}),e("el-table-column",{attrs:{prop:"shipping_code",label:"物流编码"}}),e("el-table-column",{attrs:{prop:"shipping_name",label:"物流名称"}}),e("el-table-column",{attrs:{prop:"shipping_desc",label:"简单描述"}}),e("el-table-column",{attrs:{label:"操作",width:"200"},scopedSlots:t._u([{key:"default",fn:function(i){return[e("el-button",{attrs:{size:"mini",type:"text"},on:{click:function(e){return t.editShippingEvent(i.row)}}},[t._v("编辑")]),e("el-popover",{staticStyle:{margin:"0 10px"},attrs:{placement:"top",width:"160"},model:{value:i.row.is_delete,callback:function(e){t.$set(i.row,"is_delete",e)},expression:"scope.row.is_delete"}},[e("p",{staticStyle:{"margin-bottom":"4px"}},[t._v("确定删除吗？")]),e("div",{staticStyle:{"text-align":"right",margin:"0"}},[e("el-button",{attrs:{loading:t.loading,size:"mini",type:"text"},on:{click:function(t){i.row.is_delete=!1}}},[t._v("取消\n                                ")]),e("el-button",{attrs:{loading:t.loading,type:"primary",size:"mini"},on:{click:function(e){return t.del(i.row)}}},[t._v("确定\n                                ")])],1),e("el-button",{attrs:{slot:"reference",type:"text"},slot:"reference"},[t._v("删除")])],1)]}}])})],1),e("div",{staticClass:"page"},[e("div",{staticClass:"page-mian"},[e("el-pagination",{attrs:{"page-size":t.datas.limit,layout:"total, prev, pager, next",total:t.datas.count},on:{"current-change":t.getShippingList}})],1)])],1)]),e("el-dialog",{directives:[{name:"loading",rawName:"v-loading",value:t.subLoading,expression:"subLoading"}],attrs:{title:"物流公司",visible:t.dialog,width:"500px","modal-append-to-body":!1,center:""},on:{"update:visible":function(i){t.dialog=i}}},[e("el-form",{staticStyle:{padding:"0"},attrs:{model:t.form,size:"small","label-width":"80px"}},[e("el-form-item",{attrs:{label:"物流编码"}},[e("el-input",{attrs:{autocomplete:"off"},model:{value:t.form.shipping_code,callback:function(i){t.$set(t.form,"shipping_code",i)},expression:"form.shipping_code"}}),e("p",{staticClass:"wyu-tips"},[t._v("一般为物流公司首拼。"),e("a",{staticStyle:{color:"#1593ff"},attrs:{href:"http://www.kdniao.com/file/2019%E5%BF%AB%E9%80%92%E9%B8%9F%E6%8E%A5%E5%8F%A3%E6%94%AF%E6%8C%81%E5%BF%AB%E9%80%92%E5%85%AC%E5%8F%B8%E7%BC%96%E7%A0%81.xlsx",target:"_blank"}},[t._v("参考查询编码")])])],1),e("el-form-item",{attrs:{label:"公司名称"}},[e("el-input",{attrs:{autocomplete:"off"},model:{value:t.form.shipping_name,callback:function(i){t.$set(t.form,"shipping_name",i)},expression:"form.shipping_name"}})],1),e("el-form-item",{attrs:{label:"简短描述"}},[e("el-input",{attrs:{autocomplete:"off"},model:{value:t.form.shipping_desc,callback:function(i){t.$set(t.form,"shipping_desc",i)},expression:"form.shipping_desc"}})],1)],1),e("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[e("el-button",{attrs:{size:"small"},on:{click:function(i){t.dialog=!1}}},[t._v("取 消")]),e("el-button",{attrs:{size:"small",type:"primary"},on:{click:function(i){return t.creatShipping(!0)}}},[t._v("确 定")])],1)],1)],1)},s=[function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("div",{staticClass:"wyu-tips wyu-tips-warning"},[e("p",[t._v("运费模板 这里创建物流公司 ")])])}],a=e("5200"),o=e("d722"),l={name:"ShippingIndex",components:{TopNav:a["a"]},data:function(){return{subLoading:!1,loading:!1,datas:[],form:this.initForm(),dialog:!1,isUpdate:!1,searchForm:{title:""}}},created:function(){this.getShippingList()},methods:{initForm:function(){return{shipping_code:"",shipping_name:"",shipping_desc:"",enabled:0,is_default:0}},creatShippingEvent:function(){this.isUpdate=!1,this.form=this.initForm(),this.dialog=!0},editShippingEvent:function(t){this.isUpdate=!0,this.form=t,this.dialog=!0},creatShipping:function(){var t=this;this.subLoading=!0;var i=this.isUpdate?"edit":"create";o["a"]("/shop/admin.shipping/"+i,{appToken:this.$store.getters.appToken,shipping_code:this.form.shipping_code,shipping_name:this.form.shipping_name,shipping_desc:this.form.shipping_desc,enabled:this.form.enabled,is_default:this.form.is_default,shipping_id:this.form.shipping_id}).then(function(i){t.subLoading=!1,t.form=t.initForm(),t.$message({message:"恭喜你，操作成功",type:"success"}),t.dialog=!1,t.getShippingList()}).catch(function(i){t.subLoading=!1})},getShippingList:function(){var t=this,i=arguments.length>0&&void 0!==arguments[0]?arguments[0]:1;this.loading=!0,o["a"]("/shop/admin.shipping/index",{appToken:this.$store.getters.appToken,page:i,shipping_name:this.searchForm.title}).then(function(i){t.loading=!1,t.datas=i}).catch(function(i){t.loading=!1})},del:function(t){var i=this;this.loading=!0,o["a"]("/shop/admin.shipping/del",{appToken:this.$store.getters.appToken,shipping_id:t.shipping_id}).then(function(t){i.loading=!1,i.$message({message:"恭喜你，操作成功",type:"success"}),i.getShippingList()}).catch(function(t){i.loading=!1})}}},r=l,p=e("2877"),c=Object(p["a"])(r,n,s,!1,null,null,null);i["default"]=c.exports},5200:function(t,i,e){"use strict";var n=function(){var t=this,i=t.$createElement,n=t._self._c||i;return n("div",{staticClass:"wyu-top"},[n("div",{staticClass:"wyu-header"},[t.title?t._e():n("div",{staticClass:"wyu-tab"},[n("ul",t._l(t.showMenu,function(i,e){return n("li",{key:e,class:e==t.select?"on":""},[n("router-link",{attrs:{to:i.link}},[t._v(t._s(i.title))])],1)}),0)]),t.title?n("div",{staticClass:"wyu-tab"},[n("ul",[n("li",[t._v(t._s(t.title))])])]):t._e(),n("div",{staticClass:"wyu-header-status"},[n("div",{staticClass:"login-info"},[n("img",{attrs:{src:e("741c")}}),n("el-dropdown",{staticStyle:{cursor:"pointer"}},[n("span",{staticClass:"el-dropdown-link"},[t._v("\n                          "+t._s(t.$store.getters.appInfo.app_name)+"  "),n("i",{staticClass:"el-icon-arrow-down el-icon--right"})]),n("el-dropdown-menu",{attrs:{slot:"dropdown"},slot:"dropdown"},[n("el-dropdown-item",[n("span",{on:{click:t.LogOut}},[t._v("退出登录")])])],1)],1)],1)])])])},s=[],a=(e("a481"),{props:["mdl","select","title"],name:"TopNav",data:function(){return{showMenu:[],menu:{sms:[{title:"发送短信",link:"/marketing/sms/send"},{title:"短信记录",link:"/marketing/sms/census"}],paymentSetting:[{title:"微信小程序支付设置",link:"/setting/payment/weixin"},{title:"支付宝小程序支付设置",link:"/setting/payment/ali"},{title:"百度小程序支付设置",link:"/setting/payment/baidu"}],employ:[{title:"员工管理",link:"/setting/employ"},{title:"角色管理",link:"/setting/employ/role"}],agent:[{title:"分销代理设置",link:"/agent/setting/index"},{title:"顾问申请设置",link:"/agent/setting/apply"}],coupon:[{title:"优惠券管理",link:"/marketing/coupon/index"},{title:"优惠券设置",link:"/marketing/coupon/setting"},{title:"赠送优惠券",link:"/marketing/coupon/send"}],sucai:[{title:"素材管理",link:"/resource/index"},{title:"素材分类 ",link:"/resource/category"}],wuliu:[{title:"运费模板",link:"/shipping/area/index/"},{title:"快递公司 ",link:"/shipping/index"}]}}},created:function(){this.menu[this.mdl]?this.showMenu=this.menu[this.mdl]:this.showMenu=[]},methods:{LogOut:function(){var t=this;this.$store.dispatch("LogOut").then(function(){t.$router.replace("/")})}}}),o=a,l=e("2877"),r=Object(l["a"])(o,n,s,!1,null,"5665e029",null);i["a"]=r.exports},"741c":function(t,i){t.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAAAXNSR0IArs4c6QAAA9VJREFUWAnNmctKJDEUQFNt2T5oH/gAH+BOFy3MR8xC8D9mM5tZzIfMTtz4H4ILP2LABnUn+ABBFBvftnNPpm9NOlaqOo12z4WQVHJv7umbR6XSifHk+Ph4/e3t7ZukDUkr0lzzVD76sZkkyYmkPUk7q6urB66DRB8Epnp0dPRLnr9LuaL1/cwFsCX+ttfW1n5K+QnfFrANtyv5134ChXwJ3L5AbgJpI0Xk/hc4oGFpj6ZJmHOtVuu3VA5kWAui2KpUKl9SAWNB9AxXrVbN1NSUGR8fN8PDw9bf8/Ozubu7Mzc3N+bpyU6lEEewHibYksPDwwMp1IOaBQ3z8/MWrkDFQl5eXhapBNtkDjaIIFtJtCwtLZmxsTHmS6Ht5OSkjezZ2VmhXl4jbAxt9D43OztrRkZGjMzdrhK62PQgtei5xzybmJiwkSN63SZsdI7GgEYD1mo1C0X0FE7Lbq7RRUfrsY2VNNZAhxY7nKtoWfO8emxjJRpQ9iYbEdeRrLYOWP8ZXeqwjZVoQD9COPTr/GfVyasvA44GZBPuZbIDgm2sRAM+Pj6aoaGhWD9WH9tYiQbkFcYG3YtgGyvRgK+vr/Y9Ozo6GuXr4eHBYBsr0YA4aDabdkV2OxeZe9j0IqWAoZXHSYUTTFkkiVzR0LL9FEkuYAjK7wjHALABE03d53hzEDUWBeUicX3lwXYAuspFnbptANzf39vk1vdSVv8uaAaojWUdd6sX6sd1HtLBh+pZwDKnofZQve9YnVHv2rj1vg16tHNg9duyZ7+t7DkzLCkomPanz74Z7dkQ5zVqnXbEmY7ERp2mabYoVC+UM09fXl7sPL29vTUkRMHoX8t+H7mACqQ528nCwsK7d3DZCnWd8YP0B7LCLy4usu0HuBDkO0CF0nx6etrwcYTEALlwfpl3+fLysuFj6vr6OoPLg+wAVChyEr+Yb4mPAvNB6Zuhd4fch8wAXTg6Yp7Nzc19GpzC4gNINnyF0xydDFANyFGYmZmxuYK77R9dxtfp6WnuQrGACkFO4tXFPPmsofV/IL7wqedFd9EAyDGjppAYs2r7BYc/BJ8KCEt722myUZ9Iu736oIHEfQt5P8X1qXsibKmcQPYkWtndDCcSUr8jqH7dwMCWyvjvCMwPaeA2yZ7v+g2nI8U85GSESBRbsFXad8LbqsSOD+AgEr4d2YYtuwJuNBq7AvWVJU+4ByEE5erqCv/79Xr93xWwhJNbxk0J6RahHUT08Nke1i1Y2kx/L9HdaJ2fn6/L1xe3rhuitCJ5/I2P22FJWXw0xYf9G4I5t7i42PE3xB9oWTpXj6b+tQAAAABJRU5ErkJggg=="}}]);
//# sourceMappingURL=chunk-02f0877c.ccb53e35.js.map