(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-61f0af39"],{"2a69":function(t,e,i){},"3e5b":function(t,e,i){"use strict";var o=i("2a69"),r=i.n(o);r.a},5200:function(t,e,i){"use strict";var o=function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("div",{staticClass:"wyu-top"},[o("div",{staticClass:"wyu-header"},[t.title?t._e():o("div",{staticClass:"wyu-tab"},[o("ul",t._l(t.showMenu,function(e,i){return o("li",{key:i,class:i==t.select?"on":""},[o("router-link",{attrs:{to:e.link}},[t._v(t._s(e.title))])],1)}),0)]),t.title?o("div",{staticClass:"wyu-tab"},[o("ul",[o("li",[t._v(t._s(t.title))])])]):t._e(),o("div",{staticClass:"wyu-header-status"},[o("div",{staticClass:"message"},[o("a",{attrs:{target:"_blank",href:t.url}},[o("i",{staticClass:"iconfont icon-gongdan"}),t._v("  售后工单")])]),o("div",{staticClass:"login-info"},[o("img",{attrs:{src:i("741c")}}),o("el-dropdown",{staticStyle:{cursor:"pointer"}},[o("span",{staticClass:"el-dropdown-link"},[t._v("\n                        欢迎您   "+t._s(t.$store.getters.adminInfo.info.username)+"  "),o("i",{staticClass:"el-icon-arrow-down el-icon--right"})]),o("el-dropdown-menu",{attrs:{slot:"dropdown"},slot:"dropdown"},[o("el-dropdown-item",[o("a",{attrs:{href:"javascript:void(0);"},on:{click:t.logout}},[t._v("退出登录")])])],1)],1)],1)])])])},r=[],s=(i("a481"),{props:["mdl","select","title"],name:"TopNav",data:function(){return{url:"",showMenu:[],menu:{sms:[{title:"短信设置",link:"/setting/sms/index"},{title:"模版管理",link:"/setting/sms/template"}]}}},methods:{logout:function(){var t=this;this.$store.dispatch("LogOut").then(function(){t.$router.replace("/")})}},created:function(){var t="https://www.woyaou.com/home/passport/worklogin.html?account_id="+this.$store.getters.adminInfo.account.account_id+"&account_t="+this.$store.getters.adminInfo.account.account_t+"&sign="+this.$store.getters.adminInfo.account.account_sign;this.url=t,this.menu[this.mdl]?this.showMenu=this.menu[this.mdl]:this.showMenu=[]}}),n=s,a=i("2877"),l=Object(a["a"])(n,o,r,!1,null,"70844250",null);e["a"]=l.exports},"5d58":function(t,e,i){t.exports=i("d8d6")},"5fed":function(t,e,i){"use strict";var o=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"wyu-img-uploads"},[t.multi?t._e():i("div",{staticClass:"wyu-img-one"},[i("div",{staticClass:"wyu-upload-div"},[""==t.showImg?i("div",{staticClass:"image-box",on:{click:t.uploadFile}},[i("i",{staticClass:"el-icon-plus"})]):t._e(),""!=t.showImg?i("div",{staticClass:"image-box",style:"background-image: url("+t.showImg+");",on:{click:t.uploadFile}}):t._e(),""!=t.showImg?i("i",{staticClass:"el-icon-error",on:{click:t.deleteImg}}):t._e()])]),t.multi?i("div",{staticClass:"wyu-img-list"},[t._l(t.showImgs,function(e,o){return i("div",{key:o,staticClass:"wyu-upload-div"},[i("div",{staticClass:"image-box",style:"background-image: url("+e+");"}),i("i",{staticClass:"el-icon-error",on:{click:function(e){return t.deleteImg(o)}}})])}),i("div",{staticClass:"wyu-upload-div",on:{click:t.uploadFile}},[i("i",{staticClass:"el-icon-plus"})])],2):t._e(),i("el-dialog",{attrs:{title:"图片相册",visible:t.dialogVisible,"modal-append-to-body":!1,width:"800px"},on:{"update:visible":function(e){t.dialogVisible=e}}},[0==t.showTab?i("div",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticClass:"photo-upload-tab"},[i("div",{staticClass:"photo-upload-btn"},[i("el-button",{attrs:{type:"primary",size:"small"},on:{click:function(e){t.showTab=1}}},[t._v("上传图片")])],1),i("div",{staticClass:"photo-main"},[i("div",{staticClass:"photo-group"},[i("ul",t._l(t.groups,function(e,o){return i("li",{key:o,class:e.id==t.cid?"on":"",on:{click:function(i){return t.clickCategory(e.id)}}},[t._v(t._s(e.name))])}),0)]),t.multi?i("div",{staticClass:"photo-list"},t._l(t.photos,function(e,o){return i("div",{key:o,class:!1!==t.isInArray(e.photo)?"item on":"item",on:{click:function(i){return t.setSelectImgs(e.photo)}}},[i("div",{staticClass:"image-box",style:"background-image: url("+e.photo+");"}),i("label",[i("i",{staticClass:"el-icon-upload-success el-icon-check"})])])}),0):t._e(),t.multi?t._e():i("div",{staticClass:"photo-list"},t._l(t.photos,function(e,o){return i("div",{key:o,class:t.selectImg==e.photo?"item on":"item",on:{click:function(i){t.selectImg=e.photo}}},[i("div",{staticClass:"image-box",style:"background-image: url("+e.photo+");"}),t.selectImg==e.photo?i("label",[i("i",{staticClass:"el-icon-upload-success el-icon-check"})]):t._e()])}),0)]),i("div",{staticStyle:{height:"40px"}},[i("div",{staticClass:"pagegroup"},[i("el-pagination",{attrs:{"page-size":t.limit,layout:"total, prev, pager, next",total:t.total},on:{"current-change":t.handleCurrentChange}})],1)]),i("div",{staticStyle:{"text-align":"center","margin-top":"10px"}},[i("el-button",{attrs:{size:"small",type:"primary"},on:{click:function(e){return t.selectPhoto()}}},[t._v("确定选取")]),i("el-button",{attrs:{size:"small",type:"danger"},on:{click:function(e){return t.clearSelect()}}},[t._v("取消选择")])],1)]):t._e(),1==t.showTab?i("div",{staticClass:"photo-upload-tab"},[i("el-form",{ref:"form",attrs:{"label-width":"80px"}},[i("el-form-item",{attrs:{label:"选择分组"}},[i("el-select",{staticStyle:{float:"left"},attrs:{size:"small",placeholder:"请选择分组"},model:{value:t.groupId,callback:function(e){t.groupId=e},expression:"groupId"}},t._l(t.groups,function(t,e){return i("el-option",{key:e,attrs:{label:t.name,value:t.id}})}),1),t.groups.length<16?i("create-resource-category",{on:{addYes:t.getCategoryByAdd}}):t._e()],1),i("el-form-item",{attrs:{label:"上传图片"}},[i("el-upload",{staticClass:"avatar-uploader",attrs:{action:t.uploadImgUrl,"show-file-list":!1,"on-success":t.handleAvatarSuccess,"before-upload":t.beforeAvatarUpload}},[t.imageUrl?i("img",{staticClass:"avatar",attrs:{src:t.imageUrl}}):i("i",{staticClass:"el-icon-plus avatar-uploader-icon"})]),i("p",[t._v("只能上传JPG或者PNG的图片")])],1)],1),i("div",{staticStyle:{"text-align":"center","margin-top":"10px"}},[i("el-button",{attrs:{size:"small",disabled:!t.imageUrl},on:{click:function(e){return t.selectPhotoByAdd()}}},[t._v("确定选取")]),i("el-button",{attrs:{size:"small"},on:{click:function(e){t.showTab=0}}},[t._v("返回列表")])],1)],1):t._e()])],1)},r=[],s=i("5d58"),n=i.n(s),a=i("67bb"),l=i.n(a);function u(t){return u="function"===typeof l.a&&"symbol"===typeof n.a?function(t){return typeof t}:function(t){return t&&"function"===typeof l.a&&t.constructor===l.a&&t!==l.a.prototype?"symbol":typeof t},u(t)}function h(t){return h="function"===typeof l.a&&"symbol"===u(n.a)?function(t){return u(t)}:function(t){return t&&"function"===typeof l.a&&t.constructor===l.a&&t!==l.a.prototype?"symbol":u(t)},h(t)}var c=i("f499"),g=i.n(c),d=(i("863e"),function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticClass:"addCategory",attrs:{"element-loading-spinner":"el-icon-loading","element-loading-background":"rgba(0, 0, 0, 0.2)"}},[0==t.status?i("el-button",{attrs:{type:"text"},on:{click:function(e){t.status=1}}},[t._v("添加分组")]):t._e(),1==t.status?i("el-input",{staticStyle:{float:"left",width:"100px"},attrs:{size:"small",placeholder:"输入分组名称"},model:{value:t.groupname,callback:function(e){t.groupname=e},expression:"groupname"}}):t._e(),1==t.status?i("a",{staticStyle:{float:"left","margin-left":"10px"},attrs:{href:"javascript:void(0);"},on:{click:t.saveCategory}},[t._v("确定")]):t._e(),1==t.status?i("a",{staticStyle:{float:"left","margin-left":"10px"},attrs:{href:"javascript:void(0);"},on:{click:function(e){t.status=0}}},[t._v("取消")]):t._e()],1)}),f=[],m=i("d722"),p={name:"createResourceCategory",data:function(){return{status:0,groupname:"",loading:!1}},methods:{saveCategory:function(){var t=this;""!=this.groupname&&0==this.loading&&(this.loading=!0,m["a"]("admin/resource.category/create",{token:this.$store.getters.adminToken,title:this.groupname}).then(function(e){t.$emit("addYes",e.id),t.loading=!1,t.status=0}).catch(function(e){t.loading=flase}))}}},v=p,C=(i("bc1f"),i("2877")),w=Object(C["a"])(v,d,f,!1,null,"9b36d91e",null),y=w.exports,A={name:"imgUploads",props:["multi","img"],components:{createResourceCategory:y},data:function(){return{uploadImgUrl:"",showImg:"",showImgs:[],imageUrl:"",dialogVisible:!1,selectImg:"",selectImgs:[],showTab:0,groupId:0,cid:0,groups:[],page:1,loading:!1,total:0,limit:12,photos:[]}},watch:{img:function(t){1==this.multi?this.showImgs=JSON.parse(g()(this.img)):this.showImg=this.img},showImg:function(t){t!=this.img&&(this.$emit("change",t),this.$emit("input",t))},showImgs:function(t){t!=this.img&&(this.$emit("change",t),this.$emit("input",t))},groupId:function(t){var e="";e="/",this.uploadImgUrl=e+"admin/upload/imageUpload?token="+encodeURI(this.$store.getters.adminToken)+"&groupId="+t}},created:function(){var t="";t="/",this.uploadImgUrl=t+"admin/upload/imageUpload?token="+encodeURI(this.$store.getters.adminToken),1==this.multi?"object"==h(this.img)?this.showImgs=JSON.parse(g()(this.img)):this.showImgs=[]:this.showImg=this.img?this.img:""},methods:{setSelectImgs:function(t){var e=this.isInArray(t);!1!==e?this.selectImgs.splice(e,1):this.selectImgs.push(t)},isInArray:function(t){for(var e=0;e<this.selectImgs.length;e++)if(t==this.selectImgs[e])return e;return!1},selectPhotoByAdd:function(){1==this.multi?this.showImgs.push(this.imageUrl):this.showImg=this.imageUrl,this.imageUrl="",this.dialogVisible=!1},selectPhoto:function(){if(1==this.multi){var t=JSON.parse(g()(this.showImgs));for(var e in this.selectImgs)t.push(this.selectImgs[e]);this.showImgs=t,this.selectImgs=[]}else this.showImg=this.selectImg,this.selectImg="";this.dialogVisible=!1},clearSelect:function(){this.selectImg="",this.selectImgs=[]},clickCategory:function(t){this.cid=t,this.page=1,this.count=0,this.getPhotos()},handleCurrentChange:function(t){this.page=t,this.getPhotos()},getPhotos:function(){var t=this;this.loading=!0,m["a"]("admin/resource.resource/index",{token:this.$store.getters.adminToken,category_id:this.cid,limit:this.limit,page:this.page}).then(function(e){t.photos=e.list,t.total=e.count,t.loading=!1}).catch(function(e){t.loading=!1})},getCategoryByAdd:function(t){this.apiGetCategory(t)},getCategory:function(){var t=[{name:"全部图片",id:0}],e=this.$store.getters.resourceCategory;if(console.log(e),""==e)this.apiGetCategory();else{for(var i in e)t.push({name:e[i].title,id:e[i].category_id});this.groups=t}},apiGetCategory:function(t){var e=this,i=[{name:"全部图片",id:0}];m["a"]("admin/resource.category/index",{token:this.$store.getters.adminToken}).then(function(o){for(var r in e.$store.dispatch("setResourceCategory",o.list),o.list)i.push({name:o.list[r].title,id:o.list[r].category_id});e.groups=i,t&&(e.groupId=t)}).catch(function(t){})},uploadFile:function(){this.getCategory(),this.getPhotos(),this.dialogVisible=!0},deleteImg:function(t){1==this.multi?this.showImgs.splice(t,1):this.showImg=""},handleAvatarSuccess:function(t,e){this.imageUrl=t.data.img_url,this.page=1,this.cid=0,this.getPhotos()},beforeAvatarUpload:function(t){var e=t.size/1024/1024<2;return e||this.$message.error("上传头像图片大小不能超过 2MB!"),e}}},k=A,b=(i("3e5b"),Object(C["a"])(k,o,r,!1,null,null,null));e["a"]=b.exports},"67bb":function(t,e,i){t.exports=i("f921")},"741c":function(t,e){t.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAAAXNSR0IArs4c6QAAA9VJREFUWAnNmctKJDEUQFNt2T5oH/gAH+BOFy3MR8xC8D9mM5tZzIfMTtz4H4ILP2LABnUn+ABBFBvftnNPpm9NOlaqOo12z4WQVHJv7umbR6XSifHk+Ph4/e3t7ZukDUkr0lzzVD76sZkkyYmkPUk7q6urB66DRB8Epnp0dPRLnr9LuaL1/cwFsCX+ttfW1n5K+QnfFrANtyv5134ChXwJ3L5AbgJpI0Xk/hc4oGFpj6ZJmHOtVuu3VA5kWAui2KpUKl9SAWNB9AxXrVbN1NSUGR8fN8PDw9bf8/Ozubu7Mzc3N+bpyU6lEEewHibYksPDwwMp1IOaBQ3z8/MWrkDFQl5eXhapBNtkDjaIIFtJtCwtLZmxsTHmS6Ht5OSkjezZ2VmhXl4jbAxt9D43OztrRkZGjMzdrhK62PQgtei5xzybmJiwkSN63SZsdI7GgEYD1mo1C0X0FE7Lbq7RRUfrsY2VNNZAhxY7nKtoWfO8emxjJRpQ9iYbEdeRrLYOWP8ZXeqwjZVoQD9COPTr/GfVyasvA44GZBPuZbIDgm2sRAM+Pj6aoaGhWD9WH9tYiQbkFcYG3YtgGyvRgK+vr/Y9Ozo6GuXr4eHBYBsr0YA4aDabdkV2OxeZe9j0IqWAoZXHSYUTTFkkiVzR0LL9FEkuYAjK7wjHALABE03d53hzEDUWBeUicX3lwXYAuspFnbptANzf39vk1vdSVv8uaAaojWUdd6sX6sd1HtLBh+pZwDKnofZQve9YnVHv2rj1vg16tHNg9duyZ7+t7DkzLCkomPanz74Z7dkQ5zVqnXbEmY7ERp2mabYoVC+UM09fXl7sPL29vTUkRMHoX8t+H7mACqQ528nCwsK7d3DZCnWd8YP0B7LCLy4usu0HuBDkO0CF0nx6etrwcYTEALlwfpl3+fLysuFj6vr6OoPLg+wAVChyEr+Yb4mPAvNB6Zuhd4fch8wAXTg6Yp7Nzc19GpzC4gNINnyF0xydDFANyFGYmZmxuYK77R9dxtfp6WnuQrGACkFO4tXFPPmsofV/IL7wqedFd9EAyDGjppAYs2r7BYc/BJ8KCEt722myUZ9Iu736oIHEfQt5P8X1qXsibKmcQPYkWtndDCcSUr8jqH7dwMCWyvjvCMwPaeA2yZ7v+g2nI8U85GSESBRbsFXad8LbqsSOD+AgEr4d2YYtuwJuNBq7AvWVJU+4ByEE5erqCv/79Xr93xWwhJNbxk0J6RahHUT08Nke1i1Y2kx/L9HdaJ2fn6/L1xe3rhuitCJ5/I2P22FJWXw0xYf9G4I5t7i42PE3xB9oWTpXj6b+tQAAAABJRU5ErkJggg=="},b77a:function(t,e,i){},bc1f:function(t,e,i){"use strict";var o=i("b77a"),r=i.n(o);r.a},d7b0:function(t,e,i){"use strict";
/*!
 * qrcode.vue v1.6.1
 * A Vue component for QRCode.
 * © 2017-2018 @scopewu
 * MIT License.
 */var o={MODE_NUMBER:1,MODE_ALPHA_NUM:2,MODE_8BIT_BYTE:4,MODE_KANJI:8};function r(t){this.mode=o.MODE_8BIT_BYTE,this.data=t}r.prototype={getLength:function(t){return this.data.length},write:function(t){for(var e=0;e<this.data.length;e++)t.put(this.data.charCodeAt(e),8)}};var s=r,n={L:1,M:0,Q:3,H:2};function a(t,e){this.totalCount=t,this.dataCount=e}a.RS_BLOCK_TABLE=[[1,26,19],[1,26,16],[1,26,13],[1,26,9],[1,44,34],[1,44,28],[1,44,22],[1,44,16],[1,70,55],[1,70,44],[2,35,17],[2,35,13],[1,100,80],[2,50,32],[2,50,24],[4,25,9],[1,134,108],[2,67,43],[2,33,15,2,34,16],[2,33,11,2,34,12],[2,86,68],[4,43,27],[4,43,19],[4,43,15],[2,98,78],[4,49,31],[2,32,14,4,33,15],[4,39,13,1,40,14],[2,121,97],[2,60,38,2,61,39],[4,40,18,2,41,19],[4,40,14,2,41,15],[2,146,116],[3,58,36,2,59,37],[4,36,16,4,37,17],[4,36,12,4,37,13],[2,86,68,2,87,69],[4,69,43,1,70,44],[6,43,19,2,44,20],[6,43,15,2,44,16],[4,101,81],[1,80,50,4,81,51],[4,50,22,4,51,23],[3,36,12,8,37,13],[2,116,92,2,117,93],[6,58,36,2,59,37],[4,46,20,6,47,21],[7,42,14,4,43,15],[4,133,107],[8,59,37,1,60,38],[8,44,20,4,45,21],[12,33,11,4,34,12],[3,145,115,1,146,116],[4,64,40,5,65,41],[11,36,16,5,37,17],[11,36,12,5,37,13],[5,109,87,1,110,88],[5,65,41,5,66,42],[5,54,24,7,55,25],[11,36,12],[5,122,98,1,123,99],[7,73,45,3,74,46],[15,43,19,2,44,20],[3,45,15,13,46,16],[1,135,107,5,136,108],[10,74,46,1,75,47],[1,50,22,15,51,23],[2,42,14,17,43,15],[5,150,120,1,151,121],[9,69,43,4,70,44],[17,50,22,1,51,23],[2,42,14,19,43,15],[3,141,113,4,142,114],[3,70,44,11,71,45],[17,47,21,4,48,22],[9,39,13,16,40,14],[3,135,107,5,136,108],[3,67,41,13,68,42],[15,54,24,5,55,25],[15,43,15,10,44,16],[4,144,116,4,145,117],[17,68,42],[17,50,22,6,51,23],[19,46,16,6,47,17],[2,139,111,7,140,112],[17,74,46],[7,54,24,16,55,25],[34,37,13],[4,151,121,5,152,122],[4,75,47,14,76,48],[11,54,24,14,55,25],[16,45,15,14,46,16],[6,147,117,4,148,118],[6,73,45,14,74,46],[11,54,24,16,55,25],[30,46,16,2,47,17],[8,132,106,4,133,107],[8,75,47,13,76,48],[7,54,24,22,55,25],[22,45,15,13,46,16],[10,142,114,2,143,115],[19,74,46,4,75,47],[28,50,22,6,51,23],[33,46,16,4,47,17],[8,152,122,4,153,123],[22,73,45,3,74,46],[8,53,23,26,54,24],[12,45,15,28,46,16],[3,147,117,10,148,118],[3,73,45,23,74,46],[4,54,24,31,55,25],[11,45,15,31,46,16],[7,146,116,7,147,117],[21,73,45,7,74,46],[1,53,23,37,54,24],[19,45,15,26,46,16],[5,145,115,10,146,116],[19,75,47,10,76,48],[15,54,24,25,55,25],[23,45,15,25,46,16],[13,145,115,3,146,116],[2,74,46,29,75,47],[42,54,24,1,55,25],[23,45,15,28,46,16],[17,145,115],[10,74,46,23,75,47],[10,54,24,35,55,25],[19,45,15,35,46,16],[17,145,115,1,146,116],[14,74,46,21,75,47],[29,54,24,19,55,25],[11,45,15,46,46,16],[13,145,115,6,146,116],[14,74,46,23,75,47],[44,54,24,7,55,25],[59,46,16,1,47,17],[12,151,121,7,152,122],[12,75,47,26,76,48],[39,54,24,14,55,25],[22,45,15,41,46,16],[6,151,121,14,152,122],[6,75,47,34,76,48],[46,54,24,10,55,25],[2,45,15,64,46,16],[17,152,122,4,153,123],[29,74,46,14,75,47],[49,54,24,10,55,25],[24,45,15,46,46,16],[4,152,122,18,153,123],[13,74,46,32,75,47],[48,54,24,14,55,25],[42,45,15,32,46,16],[20,147,117,4,148,118],[40,75,47,7,76,48],[43,54,24,22,55,25],[10,45,15,67,46,16],[19,148,118,6,149,119],[18,75,47,31,76,48],[34,54,24,34,55,25],[20,45,15,61,46,16]],a.getRSBlocks=function(t,e){var i=a.getRsBlockTable(t,e);if(void 0==i)throw new Error("bad rs block @ typeNumber:"+t+"/errorCorrectLevel:"+e);for(var o=i.length/3,r=new Array,s=0;s<o;s++)for(var n=i[3*s+0],l=i[3*s+1],u=i[3*s+2],h=0;h<n;h++)r.push(new a(l,u));return r},a.getRsBlockTable=function(t,e){switch(e){case n.L:return a.RS_BLOCK_TABLE[4*(t-1)+0];case n.M:return a.RS_BLOCK_TABLE[4*(t-1)+1];case n.Q:return a.RS_BLOCK_TABLE[4*(t-1)+2];case n.H:return a.RS_BLOCK_TABLE[4*(t-1)+3];default:return}};var l=a;function u(){this.buffer=new Array,this.length=0}u.prototype={get:function(t){var e=Math.floor(t/8);return 1==(this.buffer[e]>>>7-t%8&1)},put:function(t,e){for(var i=0;i<e;i++)this.putBit(1==(t>>>e-i-1&1))},getLengthInBits:function(){return this.length},putBit:function(t){var e=Math.floor(this.length/8);this.buffer.length<=e&&this.buffer.push(0),t&&(this.buffer[e]|=128>>>this.length%8),this.length++}};for(var h=u,c={glog:function(t){if(t<1)throw new Error("glog("+t+")");return c.LOG_TABLE[t]},gexp:function(t){while(t<0)t+=255;while(t>=256)t-=255;return c.EXP_TABLE[t]},EXP_TABLE:new Array(256),LOG_TABLE:new Array(256)},g=0;g<8;g++)c.EXP_TABLE[g]=1<<g;for(g=8;g<256;g++)c.EXP_TABLE[g]=c.EXP_TABLE[g-4]^c.EXP_TABLE[g-5]^c.EXP_TABLE[g-6]^c.EXP_TABLE[g-8];for(g=0;g<255;g++)c.LOG_TABLE[c.EXP_TABLE[g]]=g;var d=c;function f(t,e){if(void 0==t.length)throw new Error(t.length+"/"+e);var i=0;while(i<t.length&&0==t[i])i++;this.num=new Array(t.length-i+e);for(var o=0;o<t.length-i;o++)this.num[o]=t[o+i]}f.prototype={get:function(t){return this.num[t]},getLength:function(){return this.num.length},multiply:function(t){for(var e=new Array(this.getLength()+t.getLength()-1),i=0;i<this.getLength();i++)for(var o=0;o<t.getLength();o++)e[i+o]^=d.gexp(d.glog(this.get(i))+d.glog(t.get(o)));return new f(e,0)},mod:function(t){if(this.getLength()-t.getLength()<0)return this;for(var e=d.glog(this.get(0))-d.glog(t.get(0)),i=new Array(this.getLength()),o=0;o<this.getLength();o++)i[o]=this.get(o);for(o=0;o<t.getLength();o++)i[o]^=d.gexp(d.glog(t.get(o))+e);return new f(i,0).mod(t)}};var m=f,p={PATTERN000:0,PATTERN001:1,PATTERN010:2,PATTERN011:3,PATTERN100:4,PATTERN101:5,PATTERN110:6,PATTERN111:7},v={PATTERN_POSITION_TABLE:[[],[6,18],[6,22],[6,26],[6,30],[6,34],[6,22,38],[6,24,42],[6,26,46],[6,28,50],[6,30,54],[6,32,58],[6,34,62],[6,26,46,66],[6,26,48,70],[6,26,50,74],[6,30,54,78],[6,30,56,82],[6,30,58,86],[6,34,62,90],[6,28,50,72,94],[6,26,50,74,98],[6,30,54,78,102],[6,28,54,80,106],[6,32,58,84,110],[6,30,58,86,114],[6,34,62,90,118],[6,26,50,74,98,122],[6,30,54,78,102,126],[6,26,52,78,104,130],[6,30,56,82,108,134],[6,34,60,86,112,138],[6,30,58,86,114,142],[6,34,62,90,118,146],[6,30,54,78,102,126,150],[6,24,50,76,102,128,154],[6,28,54,80,106,132,158],[6,32,58,84,110,136,162],[6,26,54,82,110,138,166],[6,30,58,86,114,142,170]],G15:1335,G18:7973,G15_MASK:21522,getBCHTypeInfo:function(t){var e=t<<10;while(v.getBCHDigit(e)-v.getBCHDigit(v.G15)>=0)e^=v.G15<<v.getBCHDigit(e)-v.getBCHDigit(v.G15);return(t<<10|e)^v.G15_MASK},getBCHTypeNumber:function(t){var e=t<<12;while(v.getBCHDigit(e)-v.getBCHDigit(v.G18)>=0)e^=v.G18<<v.getBCHDigit(e)-v.getBCHDigit(v.G18);return t<<12|e},getBCHDigit:function(t){var e=0;while(0!=t)e++,t>>>=1;return e},getPatternPosition:function(t){return v.PATTERN_POSITION_TABLE[t-1]},getMask:function(t,e,i){switch(t){case p.PATTERN000:return(e+i)%2==0;case p.PATTERN001:return e%2==0;case p.PATTERN010:return i%3==0;case p.PATTERN011:return(e+i)%3==0;case p.PATTERN100:return(Math.floor(e/2)+Math.floor(i/3))%2==0;case p.PATTERN101:return e*i%2+e*i%3==0;case p.PATTERN110:return(e*i%2+e*i%3)%2==0;case p.PATTERN111:return(e*i%3+(e+i)%2)%2==0;default:throw new Error("bad maskPattern:"+t)}},getErrorCorrectPolynomial:function(t){for(var e=new m([1],0),i=0;i<t;i++)e=e.multiply(new m([1,d.gexp(i)],0));return e},getLengthInBits:function(t,e){if(1<=e&&e<10)switch(t){case o.MODE_NUMBER:return 10;case o.MODE_ALPHA_NUM:return 9;case o.MODE_8BIT_BYTE:return 8;case o.MODE_KANJI:return 8;default:throw new Error("mode:"+t)}else if(e<27)switch(t){case o.MODE_NUMBER:return 12;case o.MODE_ALPHA_NUM:return 11;case o.MODE_8BIT_BYTE:return 16;case o.MODE_KANJI:return 10;default:throw new Error("mode:"+t)}else{if(!(e<41))throw new Error("type:"+e);switch(t){case o.MODE_NUMBER:return 14;case o.MODE_ALPHA_NUM:return 13;case o.MODE_8BIT_BYTE:return 16;case o.MODE_KANJI:return 12;default:throw new Error("mode:"+t)}}},getLostPoint:function(t){for(var e=t.getModuleCount(),i=0,o=0;o<e;o++)for(var r=0;r<e;r++){for(var s=0,n=t.isDark(o,r),a=-1;a<=1;a++)if(!(o+a<0||e<=o+a))for(var l=-1;l<=1;l++)r+l<0||e<=r+l||0==a&&0==l||n==t.isDark(o+a,r+l)&&s++;s>5&&(i+=3+s-5)}for(o=0;o<e-1;o++)for(r=0;r<e-1;r++){var u=0;t.isDark(o,r)&&u++,t.isDark(o+1,r)&&u++,t.isDark(o,r+1)&&u++,t.isDark(o+1,r+1)&&u++,0!=u&&4!=u||(i+=3)}for(o=0;o<e;o++)for(r=0;r<e-6;r++)t.isDark(o,r)&&!t.isDark(o,r+1)&&t.isDark(o,r+2)&&t.isDark(o,r+3)&&t.isDark(o,r+4)&&!t.isDark(o,r+5)&&t.isDark(o,r+6)&&(i+=40);for(r=0;r<e;r++)for(o=0;o<e-6;o++)t.isDark(o,r)&&!t.isDark(o+1,r)&&t.isDark(o+2,r)&&t.isDark(o+3,r)&&t.isDark(o+4,r)&&!t.isDark(o+5,r)&&t.isDark(o+6,r)&&(i+=40);var h=0;for(r=0;r<e;r++)for(o=0;o<e;o++)t.isDark(o,r)&&h++;var c=Math.abs(100*h/e/e-50)/5;return i+=10*c,i}},C=v;function w(t,e){this.typeNumber=t,this.errorCorrectLevel=e,this.modules=null,this.moduleCount=0,this.dataCache=null,this.dataList=[]}var y=w.prototype;y.addData=function(t){var e=new s(t);this.dataList.push(e),this.dataCache=null},y.isDark=function(t,e){if(t<0||this.moduleCount<=t||e<0||this.moduleCount<=e)throw new Error(t+","+e);return this.modules[t][e]},y.getModuleCount=function(){return this.moduleCount},y.make=function(){if(this.typeNumber<1){var t=1;for(t=1;t<40;t++){for(var e=l.getRSBlocks(t,this.errorCorrectLevel),i=new h,o=0,r=0;r<e.length;r++)o+=e[r].dataCount;for(r=0;r<this.dataList.length;r++){var s=this.dataList[r];i.put(s.mode,4),i.put(s.getLength(),C.getLengthInBits(s.mode,t)),s.write(i)}if(i.getLengthInBits()<=8*o)break}this.typeNumber=t}this.makeImpl(!1,this.getBestMaskPattern())},y.makeImpl=function(t,e){this.moduleCount=4*this.typeNumber+17,this.modules=new Array(this.moduleCount);for(var i=0;i<this.moduleCount;i++){this.modules[i]=new Array(this.moduleCount);for(var o=0;o<this.moduleCount;o++)this.modules[i][o]=null}this.setupPositionProbePattern(0,0),this.setupPositionProbePattern(this.moduleCount-7,0),this.setupPositionProbePattern(0,this.moduleCount-7),this.setupPositionAdjustPattern(),this.setupTimingPattern(),this.setupTypeInfo(t,e),this.typeNumber>=7&&this.setupTypeNumber(t),null==this.dataCache&&(this.dataCache=w.createData(this.typeNumber,this.errorCorrectLevel,this.dataList)),this.mapData(this.dataCache,e)},y.setupPositionProbePattern=function(t,e){for(var i=-1;i<=7;i++)if(!(t+i<=-1||this.moduleCount<=t+i))for(var o=-1;o<=7;o++)e+o<=-1||this.moduleCount<=e+o||(this.modules[t+i][e+o]=0<=i&&i<=6&&(0==o||6==o)||0<=o&&o<=6&&(0==i||6==i)||2<=i&&i<=4&&2<=o&&o<=4)},y.getBestMaskPattern=function(){for(var t=0,e=0,i=0;i<8;i++){this.makeImpl(!0,i);var o=C.getLostPoint(this);(0==i||t>o)&&(t=o,e=i)}return e},y.createMovieClip=function(t,e,i){var o=t.createEmptyMovieClip(e,i),r=1;this.make();for(var s=0;s<this.modules.length;s++)for(var n=s*r,a=0;a<this.modules[s].length;a++){var l=a*r,u=this.modules[s][a];u&&(o.beginFill(0,100),o.moveTo(l,n),o.lineTo(l+r,n),o.lineTo(l+r,n+r),o.lineTo(l,n+r),o.endFill())}return o},y.setupTimingPattern=function(){for(var t=8;t<this.moduleCount-8;t++)null==this.modules[t][6]&&(this.modules[t][6]=t%2==0);for(var e=8;e<this.moduleCount-8;e++)null==this.modules[6][e]&&(this.modules[6][e]=e%2==0)},y.setupPositionAdjustPattern=function(){for(var t=C.getPatternPosition(this.typeNumber),e=0;e<t.length;e++)for(var i=0;i<t.length;i++){var o=t[e],r=t[i];if(null==this.modules[o][r])for(var s=-2;s<=2;s++)for(var n=-2;n<=2;n++)this.modules[o+s][r+n]=-2==s||2==s||-2==n||2==n||0==s&&0==n}},y.setupTypeNumber=function(t){for(var e=C.getBCHTypeNumber(this.typeNumber),i=0;i<18;i++){var o=!t&&1==(e>>i&1);this.modules[Math.floor(i/3)][i%3+this.moduleCount-8-3]=o}for(i=0;i<18;i++){o=!t&&1==(e>>i&1);this.modules[i%3+this.moduleCount-8-3][Math.floor(i/3)]=o}},y.setupTypeInfo=function(t,e){for(var i=this.errorCorrectLevel<<3|e,o=C.getBCHTypeInfo(i),r=0;r<15;r++){var s=!t&&1==(o>>r&1);r<6?this.modules[r][8]=s:r<8?this.modules[r+1][8]=s:this.modules[this.moduleCount-15+r][8]=s}for(r=0;r<15;r++){s=!t&&1==(o>>r&1);r<8?this.modules[8][this.moduleCount-r-1]=s:r<9?this.modules[8][15-r-1+1]=s:this.modules[8][15-r-1]=s}this.modules[this.moduleCount-8][8]=!t},y.mapData=function(t,e){for(var i=-1,o=this.moduleCount-1,r=7,s=0,n=this.moduleCount-1;n>0;n-=2){6==n&&n--;while(1){for(var a=0;a<2;a++)if(null==this.modules[o][n-a]){var l=!1;s<t.length&&(l=1==(t[s]>>>r&1));var u=C.getMask(e,o,n-a);u&&(l=!l),this.modules[o][n-a]=l,r--,-1==r&&(s++,r=7)}if(o+=i,o<0||this.moduleCount<=o){o-=i,i=-i;break}}}},w.PAD0=236,w.PAD1=17,w.createData=function(t,e,i){for(var o=l.getRSBlocks(t,e),r=new h,s=0;s<i.length;s++){var n=i[s];r.put(n.mode,4),r.put(n.getLength(),C.getLengthInBits(n.mode,t)),n.write(r)}var a=0;for(s=0;s<o.length;s++)a+=o[s].dataCount;if(r.getLengthInBits()>8*a)throw new Error("code length overflow. ("+r.getLengthInBits()+">"+8*a+")");r.getLengthInBits()+4<=8*a&&r.put(0,4);while(r.getLengthInBits()%8!=0)r.putBit(!1);while(1){if(r.getLengthInBits()>=8*a)break;if(r.put(w.PAD0,8),r.getLengthInBits()>=8*a)break;r.put(w.PAD1,8)}return w.createBytes(r,o)},w.createBytes=function(t,e){for(var i=0,o=0,r=0,s=new Array(e.length),n=new Array(e.length),a=0;a<e.length;a++){var l=e[a].dataCount,u=e[a].totalCount-l;o=Math.max(o,l),r=Math.max(r,u),s[a]=new Array(l);for(var h=0;h<s[a].length;h++)s[a][h]=255&t.buffer[h+i];i+=l;var c=C.getErrorCorrectPolynomial(u),g=new m(s[a],c.getLength()-1),d=g.mod(c);n[a]=new Array(c.getLength()-1);for(h=0;h<n[a].length;h++){var f=h+d.getLength()-n[a].length;n[a][h]=f>=0?d.get(f):0}}var p=0;for(h=0;h<e.length;h++)p+=e[h].totalCount;var v=new Array(p),w=0;for(h=0;h<o;h++)for(a=0;a<e.length;a++)h<s[a].length&&(v[w++]=s[a][h]);for(h=0;h<r;h++)for(a=0;a<e.length;a++)h<n[a].length&&(v[w++]=n[a][h]);return v};var A=w;function k(t){return t.webkitBackingStorePixelRatio||t.mozBackingStorePixelRatio||t.msBackingStorePixelRatio||t.oBackingStorePixelRatio||t.backingStorePixelRatio||1}function b(t){for(var e="",i=0;i<t.length;i++){var o=t.charCodeAt(i);o<128?e+=String.fromCharCode(o):o<2048?(e+=String.fromCharCode(192|o>>6),e+=String.fromCharCode(128|63&o)):o<55296||o>=57344?(e+=String.fromCharCode(224|o>>12),e+=String.fromCharCode(128|o>>6&63),e+=String.fromCharCode(128|63&o)):(i++,o=65536+((1023&o)<<10|1023&t.charCodeAt(i)),e+=String.fromCharCode(240|o>>18),e+=String.fromCharCode(128|o>>12&63),e+=String.fromCharCode(128|o>>6&63),e+=String.fromCharCode(128|63&o))}return e}var E={render:function(t){var e=this.className,i=this.value,o=this.level,r=this.background,s=this.foreground,n=this.size;return t("div",{class:e,attrs:{value:i,level:o,background:r,foreground:s}},[t("canvas",{attrs:{height:n,width:n},style:{width:n+"px",height:n+"px"},ref:"qrcode-vue"},[])])},props:{value:{type:String,required:!0,default:""},className:{type:String,default:""},size:{type:[Number,String],default:100,validator:function(t){return!0!==isNaN(Number(t))}},level:{type:String,default:"L",validator:function(t){return["L","Q","M","H"].indexOf(t)>-1}},background:{type:String,default:"#fff"},foreground:{type:String,default:"#000"}},methods:{render:function(){var t=this.value,e=this.size,i=this.level,o=this.background,r=this.foreground,s=e>>>0,a=new A(-1,n[i]);a.addData(b(t)),a.make();var l=this.$refs["qrcode-vue"],u=l.getContext("2d"),h=a.modules,c=s/h.length,g=s/h.length,d=(window.devicePixelRatio||1)/k(u);l.height=l.width=s*d,u.scale(d,d),h.forEach(function(t,e){t.forEach(function(t,i){u.fillStyle=t?r:o;var s=Math.ceil((i+1)*c)-Math.floor(i*c),n=Math.ceil((e+1)*g)-Math.floor(e*g);u.fillRect(Math.round(i*c),Math.round(e*g),s,n)})})}},updated:function(){this.render()},mounted:function(){this.render()}};e["a"]=E}}]);
//# sourceMappingURL=chunk-61f0af39.c462cedb.js.map