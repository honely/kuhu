(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-089ae8eb"],{"1b85":function(e,t,s){"use strict";var a=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",[s("el-date-picker",{attrs:{type:"daterange","picker-options":e.pickerOptions2,"range-separator":"至","start-placeholder":"开始日期","end-placeholder":"结束日期",align:"right"},on:{change:e.selectDate},model:{value:e.value,callback:function(t){e.value=t},expression:"value"}})],1)},r=[],o={name:"DateBetween",props:["date"],data:function(){return{pickerOptions2:{shortcuts:[{text:"最近七天",onClick:function(e){var t=new Date,s=new Date;s.setTime(s.getTime()-6048e5),e.$emit("pick",[s,t])}},{text:"最近半个月",onClick:function(e){var t=new Date,s=new Date;s.setTime(s.getTime()-1296e6),e.$emit("pick",[s,t])}},{text:"最近一个月",onClick:function(e){var t=new Date,s=new Date;s.setTime(s.getTime()-2592e6),e.$emit("pick",[s,t])}}]},value:""}},methods:{selectDate:function(e){var t=0,s=0;e&&(t=e[0].getFullYear()+"-"+(e[0].getMonth()+1)+"-"+e[0].getDate(),s=e[1].getFullYear()+"-"+(e[1].getMonth()+1)+"-"+e[1].getDate()),this.$emit("input",[t,s])}}},i=o,n=s("2877"),l=Object(n["a"])(i,a,r,!1,null,"082e0500",null);t["a"]=l.exports},"34b5":function(e,t,s){"use strict";s.r(t);var a=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",[s("top-nav",{attrs:{title:"退款订单"}}),e._m(0),s("div",{staticClass:"wyu-main"},[s("div",{directives:[{name:"loading",rawName:"v-loading",value:e.loading,expression:"loading"}],staticClass:"wyu-block"},[s("el-form",{staticClass:"search-form",attrs:{inline:!0,model:e.search,size:"mini"}},[s("el-form-item",{attrs:{label:"关键字"}},[s("el-input",{staticClass:"input-with-select",attrs:{placeholder:"请输入内容"},model:{value:e.search.keywords,callback:function(t){e.$set(e.search,"keywords",t)},expression:"search.keywords"}},[s("el-select",{staticStyle:{width:"90px"},attrs:{slot:"prepend",placeholder:"请选择"},slot:"prepend",model:{value:e.search.keywords_type,callback:function(t){e.$set(e.search,"keywords_type",t)},expression:"search.keywords_type"}},[s("el-option",{attrs:{label:"订单号",value:1}}),s("el-option",{attrs:{label:"收货人",value:2}})],1)],1)],1),s("el-form-item",{attrs:{label:"是否收到货"}},[s("el-select",{attrs:{placeholder:"是否收到货"},model:{value:e.search.goods_status_mean,callback:function(t){e.$set(e.search,"goods_status_mean",t)},expression:"search.goods_status_mean"}},[s("el-option",{attrs:{label:"请选择",value:-999}}),e._l(e.datas.goods_status_mean,function(e){return s("el-option",{key:e.key,attrs:{label:e.value,value:e.key}})})],2)],1),s("el-form-item",{attrs:{label:"退货原因"}},[s("el-select",{attrs:{placeholder:"退货原因"},model:{value:e.search.order_status,callback:function(t){e.$set(e.search,"order_status",t)},expression:"search.order_status"}},[s("el-option",{attrs:{label:"请选择",value:-999}}),e._l(e.datas.goods_reject_reason,function(e){return s("el-option",{key:e.key,attrs:{label:e.value,value:e.key}})})],2)],1),s("el-form-item",{attrs:{label:"审核状态"}},[s("el-select",{attrs:{placeholder:"审核状态"},model:{value:e.search.reject_status,callback:function(t){e.$set(e.search,"reject_status",t)},expression:"search.reject_status"}},[s("el-option",{attrs:{label:"请选择",value:-999}}),e._l(e.datas.order_reject_status,function(e){return s("el-option",{key:e.key,attrs:{label:e.value,value:e.key}})})],2)],1),s("el-form-item",{attrs:{label:"申请日期"}},[s("date-between",{model:{value:e.search.date,callback:function(t){e.$set(e.search,"date",t)},expression:"search.date"}})],1),s("el-form-item",[s("el-button",{attrs:{size:"mini",type:"primary",icon:"el-icon-search"},on:{click:function(t){return e.getOrderList(1)}}},[e._v("搜索")]),s("el-button",{attrs:{size:"mini",type:"danger"},on:{click:function(t){e.search.keywords="",e.search.goods_status_mean=-999,e.search.reject_status=-999,e.search.reject_status=-999,e.search.date=[],e.getOrderList(1)}}},[e._v("取消搜索")])],1)],1),s("el-table",{staticStyle:{width:"100%"},attrs:{data:e.datas.list}},[s("el-table-column",{attrs:{width:"220",label:"订单信息"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("p",[e._v("订单ID: "+e._s(t.row.order_id)+"  \n                            "),s("router-link",{attrs:{to:"/order/product/view/"+t.row.order_id}},[s("a",{staticStyle:{color:"#409EFF"},attrs:{href:"javascript:void(0);"}},[e._v("跟踪")])])],1),s("p",[e._v("订单编号: "+e._s(t.row.order_sn))])]}}])}),s("el-table-column",{attrs:{label:"用户信息",width:"300"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("p",[e._v("昵称："+e._s(t.row.nickname)+" "),s("span",[e._v("  ID: "+e._s(t.row.user_id)+"\n                            "),s("router-link",{attrs:{to:"/customer/view/"+t.row.user_id}},[s("a",{staticStyle:{color:"#409EFF"},attrs:{href:"javascript:void(0);"}},[e._v("跟踪")])])],1)]),s("p",[e._v("收货人: "+e._s(t.row.name))]),s("p",{staticClass:"ellipsis-02"},[e._v("收货地址: "+e._s(t.row.address))])]}}])}),s("el-table-column",{attrs:{label:"退款信息",width:"220"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("p",[e._v("订单金额: ￥ "+e._s(t.row.order_price))]),s("p",[e._v("收货状态: "+e._s(t.row.reject_goods_status_mean))]),s("p",[e._v("退货原因: "+e._s(t.row.reject_reason_mean))]),s("p",[e._v("提交时间: "+e._s(t.row.add_time))])]}}])}),s("el-table-column",{attrs:{label:"图片说明",width:"300"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._l(t.row.reject_photos,function(t,a){return s("div",{staticClass:"block",staticStyle:{display:"inline-block",float:"left"}},[a<=2?s("img",{attrs:{src:t,width:"50"}}):e._e(),e._v("  \n                        ")])}),t.row.reject_photos.length>3?s("div",[e._v("...")]):e._e(),t.row.reject_photos.length>0?s("el-button",{attrs:{type:"text",href:"javascript:void(0);"},on:{click:function(s){e.photos=t.row.reject_photos,e.showP=!0}}},[e._v("查看")]):e._e()]}}])}),s("el-table-column",{attrs:{label:"退款说明",width:"300"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("div",{staticClass:"ellipsis-05"},[e._v(e._s(t.row.reject_content))])]}}])}),s("el-table-column",{attrs:{label:"审核状态",prop:"reject_status_mean",width:"100"}}),s("el-table-column",{attrs:{label:"操作 / 状态 / 拒绝原因"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("div",{staticClass:"list-table-action"},[0==t.row.reject_status?s("el-button",{attrs:{type:"text"},on:{click:function(s){e.agree=!0,e.form=t.row}}},[e._v("同意退款")]):e._e(),0==t.row.reject_status?s("el-button",{attrs:{type:"text"},on:{click:function(s){e.refuse=!0,e.form=t.row}}},[e._v("拒绝退款")]):e._e(),1==t.row.reject_status?s("p",[e._v("已退款")]):e._e(),2==t.row.reject_status&&t.row.refuse_reason?s("p",{staticClass:"ellipsis-03"},[e._v(e._s(t.row.refuse_reason))]):e._e()],1)]}}])})],1),s("div",{staticClass:"block",staticStyle:{"text-align":"right"}},[s("el-pagination",{attrs:{"page-size":e.datas.limit,layout:"total, prev, pager, next",total:e.datas.count},on:{"current-change":e.getOrderList}})],1)],1)]),s("el-dialog",{attrs:{visible:e.showP,width:"500px","modal-append-to-body":!1},on:{"update:visible":function(t){e.showP=t}}},[s("el-carousel",{attrs:{interval:5e3,arrow:"always"}},e._l(e.photos,function(e){return s("el-carousel-item",[s("img",{attrs:{src:e,width:"500"}})])}),1)],1),s("el-dialog",{directives:[{name:"loading",rawName:"v-loading",value:e.subLoading,expression:"subLoading"}],attrs:{title:"同意退款",visible:e.agree,width:"50%","modal-append-to-body":!1},on:{"update:visible":function(t){e.agree=t}}},[s("el-form",{staticStyle:{padding:"0"},attrs:{model:e.form,size:"small","label-width":"150px"}},[s("el-row",{attrs:{span:24}},[s("el-col",{attrs:{span:6}},[e._v("商品总价 : ￥"+e._s(e.form.goods_price))]),s("el-col",{attrs:{span:6}},[e._v("运费 : ￥"+e._s(e.form.shipping_price))]),s("el-col",{attrs:{span:6}},[e._v("优惠券抵扣 : ￥"+e._s(e.form.coupon_price))]),s("el-col",{attrs:{span:6}},[e._v("其他优惠 : ￥"+e._s(e.form.youhui_price))]),s("el-col",{attrs:{span:6}},[e._v("订单总价 : ￥"+e._s(e.form.order_price))]),s("el-col",{attrs:{span:6}},[e._v("余额支付 : ￥"+e._s(e.form.user_money))]),s("el-col",{attrs:{span:6}},[e._v("在线支付 : ￥"+e._s(e.form.payment_price))])],1),s("br"),s("br"),s("el-form-item",{attrs:{label:"是否回退优惠券"}},[s("el-switch",{attrs:{"active-value":"1","inactive-value":"0"},model:{value:e.form.is_coupon,callback:function(t){e.$set(e.form,"is_coupon",t)},expression:"form.is_coupon"}})],1),s("el-form-item",{attrs:{label:"是否回退用户余额"}},[s("el-switch",{attrs:{"active-value":"1","inactive-value":"0"},model:{value:e.form.is_usermoney,callback:function(t){e.$set(e.form,"is_usermoney",t)},expression:"form.is_usermoney"}})],1),1==e.form.is_usermoney?s("el-form-item",{attrs:{label:"回退用户余额金额"}},[s("el-input",{attrs:{placeholder:"回退用户余额,不得大于支付时使用的用户余额"},model:{value:e.form.usermoney,callback:function(t){e.$set(e.form,"usermoney",t)},expression:"form.usermoney"}})],1):e._e(),s("el-form-item",{attrs:{label:"是否回退在线支付"}},[s("el-switch",{attrs:{"active-value":"1","inactive-value":"0"},model:{value:e.form.is_payment_price,callback:function(t){e.$set(e.form,"is_payment_price",t)},expression:"form.is_payment_price"}})],1),1==e.form.is_payment_price?s("el-form-item",{attrs:{label:"回退在线支付金额"}},[s("el-input",{attrs:{placeholder:"回退用户余额,不得大于支付时使用的用户余额"},model:{value:e.form.payment_price,callback:function(t){e.$set(e.form,"payment_price",t)},expression:"form.payment_price"}})],1):e._e()],1),s("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[s("el-button",{attrs:{size:"small"},on:{click:function(t){e.agree=!1}}},[e._v("取 消")]),s("el-button",{attrs:{size:"small",type:"primary"},on:{click:function(t){return e.agreeRefund(!0)}}},[e._v("确 定")])],1)],1),s("el-dialog",{directives:[{name:"loading",rawName:"v-loading",value:e.subLoading,expression:"subLoading"}],attrs:{title:"拒绝退款",visible:e.refuse,width:"50%","modal-append-to-body":!1},on:{"update:visible":function(t){e.refuse=t}}},[s("el-form",{staticStyle:{padding:"0"},attrs:{model:e.form,size:"small"}},[s("el-form-item",{attrs:{label:"拒绝原因","label-width":"80px"}},[s("el-input",{attrs:{type:"textarea",rows:3,placeholder:"请输入拒绝原因"},model:{value:e.form.refuse_reason,callback:function(t){e.$set(e.form,"refuse_reason",t)},expression:"form.refuse_reason"}})],1)],1),s("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[s("el-button",{attrs:{size:"small"},on:{click:function(t){e.refuse=!1}}},[e._v("取 消")]),s("el-button",{attrs:{size:"small",type:"primary"},on:{click:function(t){return e.refuseRefund()}}},[e._v("确 定")])],1)],1)],1)},r=[function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"wyu-tips wyu-tips-warning"},[s("p",[e._v("1).这里是所有的待退款及已退款订单")])])}],o=(s("386d"),s("d722")),i=s("5200"),n=s("1b85"),l={name:"customerIndex",components:{DateBetween:n["a"],TopNav:i["a"]},data:function(){return{select:1,loading:!1,subLoading:!1,showP:!1,agree:!1,refuse:!1,search:{date:[],keywords:"",keywords_type:1,pay_status:0,pay_type:0,reject_goods_status:-999,order_status:-999,reject_reason:-999,prom_type:0,device:0},form:{refuse_reason:"",is_coupon:0,is_usermoney:0,usermoney:0,is_payment_price:0,payment_price:0},datas:{list:[],goods_reject_reason:{},order_reject_status:{},goods_status_mean:{}},photos:[],status:{},userList:[]}},created:function(){this.getOrderList()},methods:{getOrderList:function(){var e=this,t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:1;this.loading=!0,o["a"]("/shop/admin.order.goodsorder/refundOrder",{appToken:this.$store.getters.appToken,page:t,end_add_time:this.search.date[1]?this.search.date[1]:0,bg_add_time:this.search.date[0]?this.search.date[0]:0,keywords:this.search.keywords,keywords_type:this.search.keywords_type,pay_status:this.search.pay_status,pay_type:this.search.pay_status,shipping_status:this.search.shipping_status,order_status:this.search.order_status,prom_type:this.search.prom_type,device:this.search.device}).then(function(s){e.loading=!1,e.datas=s,t<=1&&(e.status=s.status)}).catch(function(){e.loading=!1})},agreeRefund:function(){var e=this;this.subLoading=!0,o["a"]("/shop/admin.order.goodsorder/agreeRefund",{appToken:this.$store.getters.appToken,reject_id:this.form.reject_id,is_coupon:this.form.is_coupon,is_usermoney:this.form.is_usermoney,usermoney:this.form.usermoney,is_payment_price:this.form.is_payment_price,payment_price:this.form.payment_price}).then(function(t){e.datas=t,e.$message({message:"操作成功",type:"success"}),e.subLoading=!1,e.agree=!1,e.getOrderList()}).catch(function(){e.subLoading=!1})},refuseRefund:function(){var e=this;this.subLoading=!0,o["a"]("/shop/admin.order.goodsorder/refuseRefund",{appToken:this.$store.getters.appToken,refuse_reason:this.form.refuse_reason,reject_id:this.form.reject_id}).then(function(){e.$message({message:"操作成功",type:"success"}),e.subLoading=!1,e.refuse=!1,e.getOrderList()}).catch(function(){e.subLoading=!1,e.refuse=!1})}}},c=l,u=s("2877"),d=Object(u["a"])(c,a,r,!1,null,null,null);t["default"]=d.exports},"386d":function(e,t,s){"use strict";var a=s("cb7c"),r=s("83a1"),o=s("5f1b");s("214f")("search",1,function(e,t,s,i){return[function(s){var a=e(this),r=void 0==s?void 0:s[t];return void 0!==r?r.call(s,a):new RegExp(s)[t](String(a))},function(e){var t=i(s,e,this);if(t.done)return t.value;var n=a(e),l=String(this),c=n.lastIndex;r(c,0)||(n.lastIndex=0);var u=o(n,l);return r(n.lastIndex,c)||(n.lastIndex=c),null===u?-1:u.index}]})},5200:function(e,t,s){"use strict";var a=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"wyu-top"},[a("div",{staticClass:"wyu-header"},[e.title?e._e():a("div",{staticClass:"wyu-tab"},[a("ul",e._l(e.showMenu,function(t,s){return a("li",{key:s,class:s==e.select?"on":""},[a("router-link",{attrs:{to:t.link}},[e._v(e._s(t.title))])],1)}),0)]),e.title?a("div",{staticClass:"wyu-tab"},[a("ul",[a("li",[e._v(e._s(e.title))])])]):e._e(),a("div",{staticClass:"wyu-header-status"},[a("div",{staticClass:"login-info"},[a("img",{attrs:{src:s("741c")}}),a("el-dropdown",{staticStyle:{cursor:"pointer"}},[a("span",{staticClass:"el-dropdown-link"},[e._v("\n                          "+e._s(e.$store.getters.appInfo.app_name)+"  "),a("i",{staticClass:"el-icon-arrow-down el-icon--right"})]),a("el-dropdown-menu",{attrs:{slot:"dropdown"},slot:"dropdown"},[a("el-dropdown-item",[a("span",{on:{click:e.LogOut}},[e._v("退出登录")])])],1)],1)],1)])])])},r=[],o=(s("a481"),{props:["mdl","select","title"],name:"TopNav",data:function(){return{showMenu:[],menu:{sms:[{title:"发送短信",link:"/marketing/sms/send"},{title:"短信记录",link:"/marketing/sms/census"}],paymentSetting:[{title:"微信小程序支付设置",link:"/setting/payment/weixin"},{title:"支付宝小程序支付设置",link:"/setting/payment/ali"},{title:"百度小程序支付设置",link:"/setting/payment/baidu"}],employ:[{title:"员工管理",link:"/setting/employ"},{title:"角色管理",link:"/setting/employ/role"}],agent:[{title:"分销代理设置",link:"/agent/setting/index"},{title:"顾问申请设置",link:"/agent/setting/apply"}],coupon:[{title:"优惠券管理",link:"/marketing/coupon/index"},{title:"优惠券设置",link:"/marketing/coupon/setting"},{title:"赠送优惠券",link:"/marketing/coupon/send"}],sucai:[{title:"素材管理",link:"/resource/index"},{title:"素材分类 ",link:"/resource/category"}],wuliu:[{title:"运费模板",link:"/shipping/area/index/"},{title:"快递公司 ",link:"/shipping/index"}]}}},created:function(){this.menu[this.mdl]?this.showMenu=this.menu[this.mdl]:this.showMenu=[]},methods:{LogOut:function(){var e=this;this.$store.dispatch("LogOut").then(function(){e.$router.replace("/")})}}}),i=o,n=s("2877"),l=Object(n["a"])(i,a,r,!1,null,"5665e029",null);t["a"]=l.exports},"741c":function(e,t){e.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAAAXNSR0IArs4c6QAAA9VJREFUWAnNmctKJDEUQFNt2T5oH/gAH+BOFy3MR8xC8D9mM5tZzIfMTtz4H4ILP2LABnUn+ABBFBvftnNPpm9NOlaqOo12z4WQVHJv7umbR6XSifHk+Ph4/e3t7ZukDUkr0lzzVD76sZkkyYmkPUk7q6urB66DRB8Epnp0dPRLnr9LuaL1/cwFsCX+ttfW1n5K+QnfFrANtyv5134ChXwJ3L5AbgJpI0Xk/hc4oGFpj6ZJmHOtVuu3VA5kWAui2KpUKl9SAWNB9AxXrVbN1NSUGR8fN8PDw9bf8/Ozubu7Mzc3N+bpyU6lEEewHibYksPDwwMp1IOaBQ3z8/MWrkDFQl5eXhapBNtkDjaIIFtJtCwtLZmxsTHmS6Ht5OSkjezZ2VmhXl4jbAxt9D43OztrRkZGjMzdrhK62PQgtei5xzybmJiwkSN63SZsdI7GgEYD1mo1C0X0FE7Lbq7RRUfrsY2VNNZAhxY7nKtoWfO8emxjJRpQ9iYbEdeRrLYOWP8ZXeqwjZVoQD9COPTr/GfVyasvA44GZBPuZbIDgm2sRAM+Pj6aoaGhWD9WH9tYiQbkFcYG3YtgGyvRgK+vr/Y9Ozo6GuXr4eHBYBsr0YA4aDabdkV2OxeZe9j0IqWAoZXHSYUTTFkkiVzR0LL9FEkuYAjK7wjHALABE03d53hzEDUWBeUicX3lwXYAuspFnbptANzf39vk1vdSVv8uaAaojWUdd6sX6sd1HtLBh+pZwDKnofZQve9YnVHv2rj1vg16tHNg9duyZ7+t7DkzLCkomPanz74Z7dkQ5zVqnXbEmY7ERp2mabYoVC+UM09fXl7sPL29vTUkRMHoX8t+H7mACqQ528nCwsK7d3DZCnWd8YP0B7LCLy4usu0HuBDkO0CF0nx6etrwcYTEALlwfpl3+fLysuFj6vr6OoPLg+wAVChyEr+Yb4mPAvNB6Zuhd4fch8wAXTg6Yp7Nzc19GpzC4gNINnyF0xydDFANyFGYmZmxuYK77R9dxtfp6WnuQrGACkFO4tXFPPmsofV/IL7wqedFd9EAyDGjppAYs2r7BYc/BJ8KCEt722myUZ9Iu736oIHEfQt5P8X1qXsibKmcQPYkWtndDCcSUr8jqH7dwMCWyvjvCMwPaeA2yZ7v+g2nI8U85GSESBRbsFXad8LbqsSOD+AgEr4d2YYtuwJuNBq7AvWVJU+4ByEE5erqCv/79Xr93xWwhJNbxk0J6RahHUT08Nke1i1Y2kx/L9HdaJ2fn6/L1xe3rhuitCJ5/I2P22FJWXw0xYf9G4I5t7i42PE3xB9oWTpXj6b+tQAAAABJRU5ErkJggg=="},"83a1":function(e,t){e.exports=Object.is||function(e,t){return e===t?0!==e||1/e===1/t:e!=e&&t!=t}}}]);
//# sourceMappingURL=chunk-089ae8eb.79383bf3.js.map