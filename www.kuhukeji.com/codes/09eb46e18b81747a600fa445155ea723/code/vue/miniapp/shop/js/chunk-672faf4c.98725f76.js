(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-672faf4c"],{"386d":function(t,e,a){"use strict";var s=a("cb7c"),n=a("83a1"),i=a("5f1b");a("214f")("search",1,function(t,e,a,l){return[function(a){var s=t(this),n=void 0==a?void 0:a[e];return void 0!==n?n.call(a,s):new RegExp(a)[e](String(s))},function(t){var e=l(a,t,this);if(e.done)return e.value;var r=s(t),o=String(this),c=r.lastIndex;n(c,0)||(r.lastIndex=0);var u=i(r,o);return n(r.lastIndex,c)||(r.lastIndex=c),null===u?-1:u.index}]})},5200:function(t,e,a){"use strict";var s=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"wyu-top"},[s("div",{staticClass:"wyu-header"},[t.title?t._e():s("div",{staticClass:"wyu-tab"},[s("ul",t._l(t.showMenu,function(e,a){return s("li",{key:a,class:a==t.select?"on":""},[s("router-link",{attrs:{to:e.link}},[t._v(t._s(e.title))])],1)}),0)]),t.title?s("div",{staticClass:"wyu-tab"},[s("ul",[s("li",[t._v(t._s(t.title))])])]):t._e(),s("div",{staticClass:"wyu-header-status"},[s("div",{staticClass:"login-info"},[s("img",{attrs:{src:a("741c")}}),s("el-dropdown",{staticStyle:{cursor:"pointer"}},[s("span",{staticClass:"el-dropdown-link"},[t._v("\n                          "+t._s(t.$store.getters.appInfo.app_name)+"  "),s("i",{staticClass:"el-icon-arrow-down el-icon--right"})]),s("el-dropdown-menu",{attrs:{slot:"dropdown"},slot:"dropdown"},[s("el-dropdown-item",[s("span",{on:{click:t.LogOut}},[t._v("退出登录")])])],1)],1)],1)])])])},n=[],i=(a("a481"),{props:["mdl","select","title"],name:"TopNav",data:function(){return{showMenu:[],menu:{sms:[{title:"发送短信",link:"/marketing/sms/send"},{title:"短信记录",link:"/marketing/sms/census"}],paymentSetting:[{title:"微信小程序支付设置",link:"/setting/payment/weixin"},{title:"支付宝小程序支付设置",link:"/setting/payment/ali"},{title:"百度小程序支付设置",link:"/setting/payment/baidu"}],employ:[{title:"员工管理",link:"/setting/employ"},{title:"角色管理",link:"/setting/employ/role"}],agent:[{title:"分销代理设置",link:"/agent/setting/index"},{title:"顾问申请设置",link:"/agent/setting/apply"}],coupon:[{title:"优惠券管理",link:"/marketing/coupon/index"},{title:"优惠券设置",link:"/marketing/coupon/setting"},{title:"赠送优惠券",link:"/marketing/coupon/send"}],sucai:[{title:"素材管理",link:"/resource/index"},{title:"素材分类 ",link:"/resource/category"}],wuliu:[{title:"运费模板",link:"/shipping/area/index/"},{title:"快递公司 ",link:"/shipping/index"}]}}},created:function(){this.menu[this.mdl]?this.showMenu=this.menu[this.mdl]:this.showMenu=[]},methods:{LogOut:function(){var t=this;this.$store.dispatch("LogOut").then(function(){t.$router.replace("/")})}}}),l=i,r=a("2877"),o=Object(r["a"])(l,s,n,!1,null,"5665e029",null);e["a"]=o.exports},"741c":function(t,e){t.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAAAXNSR0IArs4c6QAAA9VJREFUWAnNmctKJDEUQFNt2T5oH/gAH+BOFy3MR8xC8D9mM5tZzIfMTtz4H4ILP2LABnUn+ABBFBvftnNPpm9NOlaqOo12z4WQVHJv7umbR6XSifHk+Ph4/e3t7ZukDUkr0lzzVD76sZkkyYmkPUk7q6urB66DRB8Epnp0dPRLnr9LuaL1/cwFsCX+ttfW1n5K+QnfFrANtyv5134ChXwJ3L5AbgJpI0Xk/hc4oGFpj6ZJmHOtVuu3VA5kWAui2KpUKl9SAWNB9AxXrVbN1NSUGR8fN8PDw9bf8/Ozubu7Mzc3N+bpyU6lEEewHibYksPDwwMp1IOaBQ3z8/MWrkDFQl5eXhapBNtkDjaIIFtJtCwtLZmxsTHmS6Ht5OSkjezZ2VmhXl4jbAxt9D43OztrRkZGjMzdrhK62PQgtei5xzybmJiwkSN63SZsdI7GgEYD1mo1C0X0FE7Lbq7RRUfrsY2VNNZAhxY7nKtoWfO8emxjJRpQ9iYbEdeRrLYOWP8ZXeqwjZVoQD9COPTr/GfVyasvA44GZBPuZbIDgm2sRAM+Pj6aoaGhWD9WH9tYiQbkFcYG3YtgGyvRgK+vr/Y9Ozo6GuXr4eHBYBsr0YA4aDabdkV2OxeZe9j0IqWAoZXHSYUTTFkkiVzR0LL9FEkuYAjK7wjHALABE03d53hzEDUWBeUicX3lwXYAuspFnbptANzf39vk1vdSVv8uaAaojWUdd6sX6sd1HtLBh+pZwDKnofZQve9YnVHv2rj1vg16tHNg9duyZ7+t7DkzLCkomPanz74Z7dkQ5zVqnXbEmY7ERp2mabYoVC+UM09fXl7sPL29vTUkRMHoX8t+H7mACqQ528nCwsK7d3DZCnWd8YP0B7LCLy4usu0HuBDkO0CF0nx6etrwcYTEALlwfpl3+fLysuFj6vr6OoPLg+wAVChyEr+Yb4mPAvNB6Zuhd4fch8wAXTg6Yp7Nzc19GpzC4gNINnyF0xydDFANyFGYmZmxuYK77R9dxtfp6WnuQrGACkFO4tXFPPmsofV/IL7wqedFd9EAyDGjppAYs2r7BYc/BJ8KCEt722myUZ9Iu736oIHEfQt5P8X1qXsibKmcQPYkWtndDCcSUr8jqH7dwMCWyvjvCMwPaeA2yZ7v+g2nI8U85GSESBRbsFXad8LbqsSOD+AgEr4d2YYtuwJuNBq7AvWVJU+4ByEE5erqCv/79Xr93xWwhJNbxk0J6RahHUT08Nke1i1Y2kx/L9HdaJ2fn6/L1xe3rhuitCJ5/I2P22FJWXw0xYf9G4I5t7i42PE3xB9oWTpXj6b+tQAAAABJRU5ErkJggg=="},"83a1":function(t,e){t.exports=Object.is||function(t,e){return t===e?0!==t||1/t===1/e:t!=t&&e!=e}},cbb1:function(t,e,a){"use strict";a.r(e);var s=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",[a("top-nav",{attrs:{title:"顾问列表"}}),t._m(0),a("div",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticClass:"wyu-main"},[a("div",{staticClass:"wyu-block"},[t._m(1),a("el-form",{staticClass:"search-form",attrs:{inline:!0,size:"mini",model:t.search}},[a("el-form-item",{attrs:{label:"关键字"}},[a("el-input",{attrs:{size:"mini",placeholder:"手机或者昵称"},model:{value:t.search.name,callback:function(e){t.$set(t.search,"name",e)},expression:"search.name"}})],1),a("el-form-item",{attrs:{label:"顾问组"}},[a("el-select",{attrs:{size:"mini",placeholder:"选择顾问组"},model:{value:t.search.agentGroup,callback:function(e){t.$set(t.search,"agentGroup",e)},expression:"search.agentGroup"}},[a("el-option",{attrs:{label:"全部顾问",value:-999}}),a("el-option",{attrs:{label:"普通顾问",value:1}}),a("el-option",{attrs:{label:"资深顾问",value:2}}),a("el-option",{attrs:{label:"专家顾问",value:3}})],1)],1),a("el-form-item",{attrs:{label:"开始时间"}},[a("el-date-picker",{attrs:{size:"mini",type:"datetime",placeholder:"选择日期时间"},model:{value:t.search.bgTime,callback:function(e){t.$set(t.search,"bgTime",e)},expression:"search.bgTime"}})],1),a("el-form-item",{attrs:{label:"结束时间"}},[a("el-date-picker",{attrs:{size:"mini",type:"datetime",placeholder:"选择日期时间"},model:{value:t.search.endTime,callback:function(e){t.$set(t.search,"endTime",e)},expression:"search.endTime"}})],1),a("el-form-item",{attrs:{label:"顾问状态"}},[a("el-select",{attrs:{size:"mini",placeholder:"选择状态"},model:{value:t.search.status,callback:function(e){t.$set(t.search,"status",e)},expression:"search.status"}},[a("el-option",{attrs:{label:"全部状态",value:-999}}),a("el-option",{attrs:{label:"锁定",value:0}}),a("el-option",{attrs:{label:"正常",value:1}})],1)],1),a("el-form-item",{attrs:{label:"排序"}},[a("el-select",{attrs:{size:"mini",placeholder:"选择排序"},model:{value:t.search.order,callback:function(e){t.$set(t.search,"order",e)},expression:"search.order"}},[a("el-option",{attrs:{label:"默认排序",value:-999}}),a("el-option",{attrs:{label:"子顾问数",value:1}}),a("el-option",{attrs:{label:"推广订单数",value:2}}),a("el-option",{attrs:{label:"推广VIP数",value:3}}),a("el-option",{attrs:{label:"推广注册数",value:4}})],1)],1),a("el-form-item",[a("el-button",{attrs:{size:"mini",type:"primary"},on:{click:t.seachDatas}},[t._v("搜索")]),t._v(" \n                    "),a("el-button",{attrs:{type:"text"},on:{click:function(e){t.search.name="",t.search.agentGroup=-999,t.search.bgTime="",t.search.endTime="",t.search.status=-999,t.search.order=-999,t.seachDatas()}}},[t._v("取消搜索")]),t._v(" \n                ")],1)],1),a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.userList}},[a("el-table-column",{attrs:{prop:"user_id",width:"80",label:"用户ID"}}),a("el-table-column",{attrs:{label:"头像",width:"100"},scopedSlots:t._u([{key:"default",fn:function(t){return[a("img",{attrs:{width:"60",src:t.row.face}})]}}])}),a("el-table-column",{attrs:{prop:"nickname",label:"用户昵称"}}),a("el-table-column",{attrs:{prop:"mobile",label:"手机号"}}),a("el-table-column",{attrs:{prop:"agent_group_mean",label:"推广员组"}}),a("el-table-column",{attrs:{label:"推广贡献",width:"300"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("p",[a("span",{staticStyle:{width:"50%",display:"inline-block"}},[t._v("注册："),a("span",{staticStyle:{color:"red",padding:"0 5px"}},[t._v(t._s(e.row.agent_register))]),t._v(" 人")]),a("span",{staticStyle:{width:"50%",display:"inline-block"}},[t._v("订单："),a("span",{staticStyle:{color:"red",padding:"0 5px"}},[t._v(t._s(e.row.agent_order))]),t._v(" 单")])]),a("p",[a("span",{staticStyle:{width:"50%",display:"inline-block"}},[t._v("开通VIP："),a("span",{staticStyle:{color:"red",padding:"0 5px"}},[t._v(t._s(e.row.agent_vip))]),t._v(" 人")]),a("span",{staticStyle:{width:"50%",display:"inline-block"}},[t._v("子顾问："),a("span",{staticStyle:{color:"red",padding:"0 5px"}},[t._v(t._s(e.row.agent_num))]),t._v(" 人")])])]}}])}),a("el-table-column",{attrs:{label:"注册/最后登录",width:"320"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("p",[t._v(t._s(e.row.reg_time))]),a("p",[t._v(t._s(e.row.last_time))])]}}])}),a("el-table-column",{attrs:{label:"状态"},scopedSlots:t._u([{key:"default",fn:function(e){return[1==e.row.is_lock?a("p",{staticStyle:{color:"red"}},[t._v("冻结中")]):t._e(),0==e.row.is_lock?a("p",[t._v("正常")]):t._e()]}}])}),a("el-table-column",{attrs:{label:"操作"},scopedSlots:t._u([{key:"default",fn:function(e){return[a("div",{staticClass:"list-table-action"},[a("router-link",{attrs:{target:"_blank",to:"/agent/manage/view/"+e.row.user_id}},[a("el-button",{attrs:{type:"text"}},[t._v("业绩查看")])],1)],1)]}}])})],1),a("br"),a("div",{staticClass:"page"},[a("div",{staticClass:"page-tool"}),a("div",{staticClass:"page-mian"},[a("el-pagination",{attrs:{"page-size":t.datas.limit,layout:"total, prev, pager, next",total:t.datas.count},on:{"current-change":t.getAgentList}})],1)])],1)])],1)},n=[function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"wyu-tips wyu-tips-warning"},[a("p",[t._v("1).这里是分销代理(顾问)列表")])])},function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"wyu-title"},[a("h2",[t._v("顾问管理")])])}],i=(a("386d"),a("5200")),l=a("d722"),r={name:"agentList",components:{TopNav:i["a"]},data:function(){return{loading:!1,search:{keyword:"",status:-999,bgTime:"",endTime:"",agentGroup:-999,order:-999},page:1,limit:10,count:0,datas:[],userList:[]}},created:function(){this.getAgentList()},methods:{setPage:function(t){},seachDatas:function(){this.page=0,this.getAgentList()},getAgentList:function(){var t=this;t.loading=!0,l["a"]("/shop/admin.agent.agent/getAgentList",{appToken:t.$store.getters.appToken,keyword:t.search.keyword,status:t.search.status,bgTime:t.search.bgTime,endTime:t.search.endTime,agentGroup:t.search.agentGroup}).then(function(e){t.userList=e.list,t.count=e.count,t.limit=e.limit,t.loading=!1}).catch(function(e){t.loading=!1})}}},o=r,c=a("2877"),u=Object(c["a"])(o,s,n,!1,null,null,null);e["default"]=u.exports}}]);
//# sourceMappingURL=chunk-672faf4c.98725f76.js.map