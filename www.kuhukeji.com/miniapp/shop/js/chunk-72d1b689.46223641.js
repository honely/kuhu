(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-72d1b689"],{5200:function(e,t,a){"use strict";var s=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"wyu-top"},[s("div",{staticClass:"wyu-header"},[e.title?e._e():s("div",{staticClass:"wyu-tab"},[s("ul",e._l(e.showMenu,function(t,a){return s("li",{key:a,class:a==e.select?"on":""},[s("router-link",{attrs:{to:t.link}},[e._v(e._s(t.title))])],1)}),0)]),e.title?s("div",{staticClass:"wyu-tab"},[s("ul",[s("li",[e._v(e._s(e.title))])])]):e._e(),s("div",{staticClass:"wyu-header-status"},[s("div",{staticClass:"login-info"},[s("img",{attrs:{src:a("741c")}}),s("el-dropdown",{staticStyle:{cursor:"pointer"}},[s("span",{staticClass:"el-dropdown-link"},[e._v("\n                          "+e._s(e.$store.getters.appInfo.app_name)+"  "),s("i",{staticClass:"el-icon-arrow-down el-icon--right"})]),s("el-dropdown-menu",{attrs:{slot:"dropdown"},slot:"dropdown"},[s("el-dropdown-item",[s("span",{on:{click:e.LogOut}},[e._v("退出登录")])])],1)],1)],1)])])])},o=[],i=(a("a481"),{props:["mdl","select","title"],name:"TopNav",data:function(){return{showMenu:[],menu:{sms:[{title:"发送短信",link:"/marketing/sms/send"},{title:"短信记录",link:"/marketing/sms/census"}],paymentSetting:[{title:"微信小程序支付设置",link:"/setting/payment/weixin"},{title:"支付宝小程序支付设置",link:"/setting/payment/ali"},{title:"百度小程序支付设置",link:"/setting/payment/baidu"}],employ:[{title:"员工管理",link:"/setting/employ"},{title:"角色管理",link:"/setting/employ/role"}],agent:[{title:"分销代理设置",link:"/agent/setting/index"},{title:"顾问申请设置",link:"/agent/setting/apply"}],coupon:[{title:"优惠券管理",link:"/marketing/coupon/index"},{title:"优惠券设置",link:"/marketing/coupon/setting"},{title:"赠送优惠券",link:"/marketing/coupon/send"}],sucai:[{title:"素材管理",link:"/resource/index"},{title:"素材分类 ",link:"/resource/category"}],wuliu:[{title:"运费模板",link:"/shipping/area/index/"},{title:"快递公司 ",link:"/shipping/index"}]}}},created:function(){this.menu[this.mdl]?this.showMenu=this.menu[this.mdl]:this.showMenu=[]},methods:{LogOut:function(){var e=this;this.$store.dispatch("LogOut").then(function(){e.$router.replace("/")})}}}),n=i,r=a("2877"),l=Object(r["a"])(n,s,o,!1,null,"5665e029",null);t["a"]=l.exports},"741c":function(e,t){e.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAAAXNSR0IArs4c6QAAA9VJREFUWAnNmctKJDEUQFNt2T5oH/gAH+BOFy3MR8xC8D9mM5tZzIfMTtz4H4ILP2LABnUn+ABBFBvftnNPpm9NOlaqOo12z4WQVHJv7umbR6XSifHk+Ph4/e3t7ZukDUkr0lzzVD76sZkkyYmkPUk7q6urB66DRB8Epnp0dPRLnr9LuaL1/cwFsCX+ttfW1n5K+QnfFrANtyv5134ChXwJ3L5AbgJpI0Xk/hc4oGFpj6ZJmHOtVuu3VA5kWAui2KpUKl9SAWNB9AxXrVbN1NSUGR8fN8PDw9bf8/Ozubu7Mzc3N+bpyU6lEEewHibYksPDwwMp1IOaBQ3z8/MWrkDFQl5eXhapBNtkDjaIIFtJtCwtLZmxsTHmS6Ht5OSkjezZ2VmhXl4jbAxt9D43OztrRkZGjMzdrhK62PQgtei5xzybmJiwkSN63SZsdI7GgEYD1mo1C0X0FE7Lbq7RRUfrsY2VNNZAhxY7nKtoWfO8emxjJRpQ9iYbEdeRrLYOWP8ZXeqwjZVoQD9COPTr/GfVyasvA44GZBPuZbIDgm2sRAM+Pj6aoaGhWD9WH9tYiQbkFcYG3YtgGyvRgK+vr/Y9Ozo6GuXr4eHBYBsr0YA4aDabdkV2OxeZe9j0IqWAoZXHSYUTTFkkiVzR0LL9FEkuYAjK7wjHALABE03d53hzEDUWBeUicX3lwXYAuspFnbptANzf39vk1vdSVv8uaAaojWUdd6sX6sd1HtLBh+pZwDKnofZQve9YnVHv2rj1vg16tHNg9duyZ7+t7DkzLCkomPanz74Z7dkQ5zVqnXbEmY7ERp2mabYoVC+UM09fXl7sPL29vTUkRMHoX8t+H7mACqQ528nCwsK7d3DZCnWd8YP0B7LCLy4usu0HuBDkO0CF0nx6etrwcYTEALlwfpl3+fLysuFj6vr6OoPLg+wAVChyEr+Yb4mPAvNB6Zuhd4fch8wAXTg6Yp7Nzc19GpzC4gNINnyF0xydDFANyFGYmZmxuYK77R9dxtfp6WnuQrGACkFO4tXFPPmsofV/IL7wqedFd9EAyDGjppAYs2r7BYc/BJ8KCEt722myUZ9Iu736oIHEfQt5P8X1qXsibKmcQPYkWtndDCcSUr8jqH7dwMCWyvjvCMwPaeA2yZ7v+g2nI8U85GSESBRbsFXad8LbqsSOD+AgEr4d2YYtuwJuNBq7AvWVJU+4ByEE5erqCv/79Xr93xWwhJNbxk0J6RahHUT08Nke1i1Y2kx/L9HdaJ2fn6/L1xe3rhuitCJ5/I2P22FJWXw0xYf9G4I5t7i42PE3xB9oWTpXj6b+tQAAAABJRU5ErkJggg=="},b957:function(e,t,a){"use strict";a.r(t);var s=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[a("top-nav",{attrs:{title:"库存日志列表"}}),e._m(0),a("div",{directives:[{name:"loading",rawName:"v-loading",value:e.loading,expression:"loading"}],staticClass:"wyu-main"},[a("div",{staticClass:"wyu-block"},[a("el-form",{staticClass:"search-form",attrs:{"label-width":"80px",size:"mini",inline:!0},model:{value:e.searchForm,callback:function(t){e.searchForm=t},expression:"searchForm"}},[a("el-form-item",{attrs:{label:"商品ID","label-width":"100"}},[a("el-input",{model:{value:e.searchForm.goods_id,callback:function(t){e.$set(e.searchForm,"goods_id",t)},expression:"searchForm.goods_id"}})],1),a("el-form-item",{attrs:{label:"订单ID","label-width":"100"}},[a("el-input",{model:{value:e.searchForm.order_id,callback:function(t){e.$set(e.searchForm,"order_id",t)},expression:"searchForm.order_id"}})],1),a("el-form-item",{attrs:{label:"商品名称","label-width":"100"}},[a("el-input",{model:{value:e.searchForm.goods_name,callback:function(t){e.$set(e.searchForm,"goods_name",t)},expression:"searchForm.goods_name"}})],1),a("el-form-item",{attrs:{label:"商品码","label-width":"100"}},[a("el-input",{model:{value:e.searchForm.goods_sn,callback:function(t){e.$set(e.searchForm,"goods_sn",t)},expression:"searchForm.goods_sn"}})],1),a("el-form-item",{attrs:{label:"规格码","label-width":"100"}},[a("el-input",{model:{value:e.searchForm.bar_code,callback:function(t){e.$set(e.searchForm,"bar_code",t)},expression:"searchForm.bar_code"}})],1),a("el-form-item",{attrs:{label:"规格","label-width":"100"}},[a("el-input",{model:{value:e.searchForm.key_name,callback:function(t){e.$set(e.searchForm,"key_name",t)},expression:"searchForm.key_name"}})],1),a("el-form-item",{attrs:{label:"类型"}},[a("el-select",{attrs:{placeholder:"请选择"},model:{value:e.searchForm.change_type,callback:function(t){e.$set(e.searchForm,"change_type",t)},expression:"searchForm.change_type"}},[a("el-option",{key:-999,attrs:{label:"请选择",value:-999}}),e._l(e.manageType,function(e,t){return a("el-option",{key:t,attrs:{label:e,value:t}})})],2)],1),a("el-form-item",{attrs:{label:"操作时间"}},[a("el-date-picker",{attrs:{type:"datetime",placeholder:"选择日期时间"},model:{value:e.searchForm.bg_add_time,callback:function(t){e.$set(e.searchForm,"bg_add_time",t)},expression:"searchForm.bg_add_time"}}),e._v("\n                    至\n                    "),a("el-date-picker",{attrs:{type:"datetime",placeholder:"选择日期时间"},model:{value:e.searchForm.end_add_time,callback:function(t){e.$set(e.searchForm,"end_add_time",t)},expression:"searchForm.end_add_time"}})],1),a("div",{staticStyle:{"padding-left":"80px"}},[a("el-button",{attrs:{icon:"el-icon-search",size:"mini",type:"primary"},on:{click:function(t){return e.getLogList(1)}}},[e._v("搜索\n                    ")]),a("a",{attrs:{href:"javascript:void(0);"},on:{click:function(t){e.searchForm.goods_name="",e.searchForm.key="",e.searchForm.goods_id="",e.searchForm.order_id="",e.searchForm.change_type=-999,e.searchForm.bg_add_time="",e.searchForm.end_add_time="",e.searchForm.bar_code="",e.searchForm.goods_sn="",e.getLogList()}}},[e._v("取消搜索")])],1)],1),a("el-table",{staticStyle:{width:"100%"},attrs:{data:e.datas.list,size:"mini"}},[a("el-table-column",{attrs:{prop:"goods_id",label:"商品ID",width:"80"}}),a("el-table-column",{attrs:{prop:"order_id",label:"订单ID",width:"80"}}),a("el-table-column",{attrs:{label:"编码",width:"200"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("p",[e._v("商品码: "+e._s(t.row.goods_sn))]),a("p",[e._v("规格码: "+e._s(t.row.bar_code))])]}}])}),a("el-table-column",{attrs:{label:"商品名称"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("div",{staticClass:"ellipsis-03"},[e._v("\n                            "+e._s(t.row.goods_name)+"\n                        ")])]}}])}),a("el-table-column",{attrs:{label:"缩略图",width:"100"},scopedSlots:e._u([{key:"default",fn:function(e){return[a("img",{attrs:{src:e.row.photo,width:"50"}})]}}])}),a("el-table-column",{attrs:{label:"规格"},scopedSlots:e._u([{key:"default",fn:function(t){return[""==t.row.spec_key?a("p",[e._v("无规格")]):e._e(),e._l(t.row.key_name,function(s){return""!=t.row.spec_key?a("p",[e._v(e._s(s))]):e._e()})]}}])}),a("el-table-column",{attrs:{label:"操作数量",width:"100"},scopedSlots:e._u([{key:"default",fn:function(t){return[t.row.change_type<10?a("b",{staticStyle:{color:"#D94854"}},[e._v("- "+e._s(t.row.stock))]):e._e(),t.row.change_type>10&&t.row.change_type<=20?a("b",{staticStyle:{color:"#5daf34"}},[e._v("+\n                            "+e._s(t.row.stock))]):e._e()]}}])}),a("el-table-column",{attrs:{prop:"this_stock",label:"剩余数量",width:"100"}}),a("el-table-column",{attrs:{prop:"change_type_mean",label:"操作类型",width:"100"}}),a("el-table-column",{attrs:{label:"操作信息",width:"220"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("p",[e._v("操作时间："+e._s(t.row.add_time))]),a("p",[e._v("操作IP："+e._s(t.row.add_ip))])]}}])})],1),a("div",{staticClass:"page"},[a("div",{staticClass:"page-tool"}),a("div",{staticClass:"page-mian"},[a("el-pagination",{attrs:{"page-size":e.datas.limit,layout:"total, prev, pager, next",total:e.datas.count},on:{"current-change":e.getLogList}})],1)])],1)])],1)},o=[function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"wyu-tips wyu-tips-warning"},[a("p",[e._v("这里是库存日志列表")])])}],i=a("5200"),n=a("d722"),r={name:"commentIndex",components:{TopNav:i["a"]},data:function(){return{dialogTableVisible:!1,loading:!1,datas:[],searchForm:{title:"",is_show:-999,end_add_time:"",bg_add_time:"",bar_code:"",goods_sn:""},commentId:0,commentIds:[],cats:[],showP:!1,img:[],manageType:{}}},created:function(){this.getLogList()},methods:{getLogList:function(){var e=this,t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:1;this.loading=!0,n["a"]("/shop/admin.goods.stock/index",{appToken:this.$store.getters.appToken,page:t,goods_name:this.searchForm.goods_name,goods_spec:this.searchForm.goods_spec,goods_sn:this.searchForm.goods_sn,bar_code:this.searchForm.bar_code,order_id:this.searchForm.order_id,goods_id:this.searchForm.goods_id,muid:this.searchForm.muid,change_type:this.searchForm.change_type,end_add_time:this.searchForm.end_add_time,bg_add_time:this.searchForm.bg_add_time}).then(function(t){e.datas=t,e.manageType=t.manageType,e.loading=!1}).catch(function(){e.loading=!1})}}},l=r,c=a("2877"),d=Object(c["a"])(l,s,o,!1,null,null,null);t["default"]=d.exports}}]);
//# sourceMappingURL=chunk-72d1b689.46223641.js.map