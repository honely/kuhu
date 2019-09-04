(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-0110b6d8"],{"5c8b":function(t,e,i){"use strict";i.r(e);var a=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",[i("top-nav",{attrs:{title:"积分订单发货"}}),i("div",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticClass:"wyu-main"},[i("div",{staticStyle:{"min-width":"1600px"}},[i("div",{staticClass:"wyu-block"},[i("vue-easy-print",{ref:"easyPrint",attrs:{tableShow:""}},[[i("el-row",{staticStyle:{padding:"10px",width:"90%",margin:"0 auto",border:"1px solid #f2f2f2"},attrs:{gutter:10}},[i("el-col",{attrs:{span:24}},[i("div",{staticClass:"wyu-title",staticStyle:{position:"revert"}},[i("h2",[t._v("基本信息")]),i("div",{staticStyle:{position:"absolute",right:"10px",top:"16px"}},[i("el-button",{attrs:{size:"mini",icon:"el-icon-printer"},on:{click:t.printDemo}},[t._v("打印订单\n                                        ")])],1)]),i("el-form",{staticClass:"demo-table-expand",staticStyle:{padding:"0"},attrs:{"label-position":"left",inline:""}},[i("el-form-item",{attrs:{label:"订单 ID："}},[i("span",[t._v(t._s(t.detail.order_id))])]),i("el-form-item",{attrs:{label:"订单号："}},[i("span",[t._v(t._s(t.detail.order_sn))])]),i("el-form-item",{attrs:{label:"会员："}},[i("span",[t._v(t._s(t.detail.user.nickname)+"(ID:"+t._s(t.detail.user.user_id)+")")])]),i("el-form-item",{attrs:{label:"电话："}},[i("span",[t._v(t._s(t.detail.user.mobile))])]),i("el-form-item",{attrs:{label:"下单时间："}},[i("span",[t._v(t._s(t.detail.add_time))])]),i("el-form-item",{attrs:{label:"支付时间："}},[i("span",[t._v(t._s(t.detail.pay_time))])]),i("el-form-item",{attrs:{label:"物流公司："}},[i("el-select",{attrs:{size:"mini",placeholder:"请选择"},model:{value:t.form.shipping_id,callback:function(e){t.$set(t.form,"shipping_id",e)},expression:"form.shipping_id"}},[i("el-option",{key:0,attrs:{label:"请选择",value:0}}),t._l(t.shipping,function(t){return i("el-option",{key:t.shipping_id,attrs:{label:t.shipping_name,value:t.shipping_id}})})],2)],1),i("el-form-item",{attrs:{label:"配送单号："}},[i("span",[i("el-input",{attrs:{size:"mini"},model:{value:t.form.shipping_num,callback:function(e){t.$set(t.form,"shipping_num",e)},expression:"form.shipping_num"}})],1)])],1)],1),i("el-col",{attrs:{span:24}},[i("div",{staticClass:"wyu-title"},[i("h2",[t._v("收货信息")])]),i("el-form",{staticClass:"demo-table-expand",staticStyle:{padding:"0"},attrs:{"label-position":"left",inline:""}},[i("el-form-item",{staticStyle:{width:"10%"},attrs:{label:"收货人："}},[i("span",[t._v(t._s(t.detail.name))])]),i("el-form-item",{staticStyle:{width:"15%"},attrs:{label:"联系方式："}},[i("span",[t._v(t._s(t.detail.mobile))])]),i("el-form-item",{staticStyle:{width:"50%"},attrs:{label:"收货地址："}},[i("span",[t._v(t._s(t.detail.address))])]),i("el-form-item",{staticStyle:{width:"100%"},attrs:{label:"留言："}},[i("span",{staticStyle:{"font-size":"12px"}},[t._v("\n                                            "+t._s(""==t.detail.user_note?"无":t.detail.user_note)+"\n                                        ")])])],1)],1),i("el-col",{attrs:{span:24}},[i("div",{staticClass:"wyu-title"},[i("h2",[t._v("商品信息")])]),i("el-table",{staticStyle:{width:"100%"},attrs:{size:"mini",data:t.goods,border:""}},[i("el-table-column",{attrs:{prop:"goods_sn",label:"商品编号",width:"120"}}),i("el-table-column",{attrs:{label:"缩略图",width:"70"},scopedSlots:t._u([{key:"default",fn:function(t){return[i("img",{attrs:{width:"50",height:"50",src:t.row.goods_photo}})]}}])}),i("el-table-column",{attrs:{label:"商品"},scopedSlots:t._u([{key:"default",fn:function(e){return[i("div",{staticClass:"ellipsis-02"},[t._v("\n                                                "+t._s(e.row.goods_name)+"\n                                            ")])]}}])}),i("el-table-column",{attrs:{label:"数量",width:"50"},scopedSlots:t._u([{key:"default",fn:function(e){return[t._v("\n                                            X 1\n                                        ")]}}])})],1)],1),i("el-col",{attrs:{span:24}},[i("div",{staticClass:"wyu-title"},[i("h2",[t._v("操作信息")])]),i("el-form",{staticClass:"demo-table-expand",staticStyle:{padding:"0"},attrs:{"label-position":"left",inline:""}},[i("el-form-item",{staticStyle:{width:"100%"},attrs:{label:"管理员备注"}},[i("span",[t._v(t._s(t.detail.admin_note))]),i("el-button",{staticStyle:{"margin-left":"10px"},attrs:{type:"text"},on:{click:function(e){t.noteDialog=!0}}},[t._v("\n                                            修改\n                                        ")])],1),i("el-form-item",{staticStyle:{width:"100%"},attrs:{label:"操作"}},[i("el-button",{staticStyle:{"margin-left":"10px"},attrs:{size:"mini"},on:{click:t.delivery}},[t._v("\n                                            确认发货\n                                        ")])],1)],1)],1)],1)]],2)],1)])]),i("el-dialog",{attrs:{title:"管理员备注",visible:t.noteDialog,width:"500px",center:"","modal-append-to-body":!1},on:{"update:visible":function(e){t.noteDialog=e}}},[i("el-form",{directives:[{name:"loading",rawName:"v-loading",value:t.noteLoading,expression:"noteLoading"}],staticStyle:{padding:"0"},attrs:{size:"mini"}},[i("el-form-item",[i("el-input",{attrs:{type:"textarea",rows:5},model:{value:t.detail.admin_note,callback:function(e){t.$set(t.detail,"admin_note",e)},expression:"detail.admin_note"}})],1),i("el-form-item",{staticStyle:{"text-align":"right"}},[i("el-button",{attrs:{size:"mini"},on:{click:function(e){t.noteDialog=!1}}},[t._v("取 消")]),i("el-button",{attrs:{size:"mini",type:"primary"},on:{click:t.setNote}},[t._v("确 定")])],1)],1)],1)],1)},n=[],l=i("d722"),s=i("225d"),o=i("5200"),r={name:"FahuoDan",components:{TopNav:o["a"],vueEasyPrint:s["a"]},data:function(){return{loading:!1,noteLoading:!1,noteDialog:!1,detail:{user:{}},shipping:[],goods:[],form:{shipping_id:0,shipping_num:""}}},created:function(){this.getOrderDetail()},methods:{setNote:function(){var t=this;this.noteLoading=!0,l["a"]("/shop/admin.order.integralorder/adminNote",{appToken:this.$store.getters.appToken,note:this.detail.admin_note,order_id:this.$route.params.id}).then(function(){t.noteLoading=!1,t.noteDialog=!1}).catch(function(){t.noteLoading=!1})},delivery:function(){var t=this;this.$confirm("请仔细检查发货信息","温馨提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){l["a"]("/shop/admin.order.integraldelivery/delivery",{appToken:t.$store.getters.appToken,order_id:t.$route.params.id,shipping_id:t.form.shipping_id,shipping_num:t.form.shipping_num}).then(function(){t.$router.push("/delivery/integralorder/index")}).catch(function(){})}).catch(function(){})},printDemo:function(){this.$refs.easyPrint.print()},getOrderDetail:function(){var t=this;this.loading=!0,l["a"]("/shop/admin.order.integraldelivery/detail",{appToken:this.$store.getters.appToken,order_id:this.$route.params.id}).then(function(e){t.detail=e.detail,t.goods=e.goods,t.shipping=e.shipping,t.form.shipping_id=e.shipping_id,t.loading=!1}).catch(function(){t.loading=!1})}}},d=r,p=(i("9241"),i("2877")),c=Object(p["a"])(d,a,n,!1,null,"0c6f417b",null);e["default"]=c.exports},9241:function(t,e,i){"use strict";var a=i("95bc"),n=i.n(a);n.a},"95bc":function(t,e,i){}}]);
//# sourceMappingURL=chunk-0110b6d8.d31f89a1.js.map