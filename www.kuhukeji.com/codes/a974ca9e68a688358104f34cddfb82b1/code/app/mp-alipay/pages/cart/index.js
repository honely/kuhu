(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["pages/cart/index"],{"02b3":function(t,a,s){},"0881":function(t,a,s){"use strict";var i=function(){var t=this,a=t.$createElement,s=t._self._c||a;return s("view",{staticClass:"main",attrs:{_hid:0}},[t._ri(!!(t.goods.length>0),1)?s("scroll-view",{attrs:{"scroll-y":"true",_hid:1}},[t._ri(!!(t.list&&t.page>1),2)?s("block",{staticStyle:{height:"100%",background:"#f8f8f8"},attrs:{_hid:2}},[s("view",{staticClass:"cart-list",attrs:{_hid:3}},[t._ri(!!t.list,4)?s("view",{staticClass:"list-box",attrs:{_hid:4}},t._l(t.list,function(a,i,e){var o=void 0!==e?e:i;return s("view",{key:i,staticClass:"item-ware",class:a.isTouchMove?"ware-move-active":"",attrs:{"data-index":i,_hid:5,_fid:o,_batrs:"data-index",_fk:"index"},on:{touchstart:t.touchstart,touchmove:t.touchmove}},[s("view",{staticClass:"ware-cont",attrs:{_hid:6,_fid:o}},[s("view",{staticClass:"w-sel",attrs:{"data-index":i,_hid:7,_fid:o,_batrs:"data-index"},on:{click:t.onSelectGoodsListener}},[s("text",{staticClass:"iconfont",class:1==a.selected?"icon-selector_enable":"icon-selector_disable",style:"font-size:20px; color:"+(1==a.selected?"#ED3005":"#888888"),attrs:{_hid:8,_fid:o}})]),s("image",{staticClass:"w-img",attrs:{src:a.photo,_hid:9,_fid:o,_batrs:"src"}}),s("view",{staticClass:"w-cont",attrs:{_hid:10,_fid:o}},[s("view",{staticClass:"g-name ellipsis-02",attrs:{_hid:11,_fid:o}},[t._v(t._s(a.goods_name),12,o)]),s("view",{staticClass:"g-sku",attrs:{_hid:13,_fid:o}},[t._v(t._s(a.spec_key_name),14,o)]),s("view",{staticClass:"g-desc",attrs:{_hid:15,_fid:o}},[s("view",{staticClass:"d-price",attrs:{_hid:16,_fid:o}},[s("text",{attrs:{_hid:17,_fid:o}},[]),s("text",{staticStyle:{"font-size":"22px","margin-right":"2px"},attrs:{_hid:19,_fid:o}},[t._v(t._s(a.price),20,o)])]),s("view",{staticClass:"d-num",attrs:{_hid:21,_fid:o}},[s("text",{staticClass:"iconfont icon-btn_minus_enabel",attrs:{"data-num":a.goods_num,"data-id":a.cart_id,_hid:22,_fid:o,_batrs:"data-num,data-id"},on:{click:t.minusGoodsNumListener}}),s("text",{staticClass:"num",attrs:{_hid:23,_fid:o}},[t._v(t._s(a.goods_num),24,o)]),s("text",{staticClass:"iconfont icon-btn_add",attrs:{"data-num":a.goods_num,"data-id":a.cart_id,_hid:25,_fid:o,_batrs:"data-num,data-id"},on:{click:t.addGoodsNumListener}})])])])]),s("view",{staticClass:"btn-delete",attrs:{"data-id":a.cart_id,_hid:26,_fid:o,_batrs:"data-id"},on:{click:t.deleteGoodsListener}},[])])},5,t._self)):t._e(),t._ri(!(0!=t.list.length),28)?s("view",{staticClass:"empty-cart",attrs:{_hid:28}},[s("image",{staticClass:"icon-empty",attrs:{src:t.imgBaseUrl+"/error/icon_none_shoppingcart@2x.png",_hid:29,_batrs:"src"}}),s("view",{staticClass:"empty-tit-01",attrs:{_hid:30}},[]),s("view",{staticClass:"empty-tit-02",attrs:{_hid:32}},[])]):t._e()]),s("view",{staticClass:"like-header",attrs:{_hid:34}},[s("text",{staticClass:"iconfont icon-icon_label_love",staticStyle:{"margin-top":"2px",color:"#f00"},attrs:{_hid:35}}),s("text",{attrs:{_hid:36}},[])]),t._ri(!!t.goods.length,38)?s("view",{staticClass:"goods-list",attrs:{_hid:38}},t._l(t.goods,function(a,i,e){var o=void 0!==e?e:i;return s("view",{key:i,staticClass:"item-goods",style:"padding-right:"+(i%2==1?0:2)+"px;padding-left:"+(i%2==0?0:2)+"px;",attrs:{_hid:39,_fid:o,_fk:"index"}},[s("navigator",{attrs:{url:"../index/goods/detail?goods_id="+a.goods_id,_hid:40,_fid:o,_batrs:"url"}},[s("view",{staticClass:"img-box",attrs:{_hid:41,_fid:o}},[s("image",{staticClass:"goods-img",attrs:{src:a.photo,_hid:42,_fid:o,_batrs:"src"}})]),s("view",{staticClass:"goods-name",attrs:{_hid:43,_fid:o}},[s("text",{staticClass:"ellipsis-02",attrs:{_hid:44,_fid:o}},[t._v(t._s(a.goods_name),45,o)])]),s("view",{staticClass:"goods-desc",attrs:{_hid:46,_fid:o}},[s("view",{staticClass:"price",attrs:{_hid:47,_fid:o}},[s("text",{staticStyle:{"font-size":"14px"},attrs:{_hid:48,_fid:o}},[]),s("text",{staticStyle:{"font-size":"18px","margin-left":"3px"},attrs:{_hid:50,_fid:o}},[t._v(t._s(a.shop_price),51,o)])]),s("view",{staticClass:"cost-price",attrs:{_hid:52,_fid:o}},[s("text",{attrs:{_hid:53,_fid:o}},[]),s("text",{staticClass:"cost",attrs:{_hid:55,_fid:o}},[t._v(t._s(a.market_price),56,o)])]),s("text",{staticClass:"iconfont icon-btn_cart icon-cart",attrs:{_hid:57,_fid:o}})])])],1)},39,t._self)):t._e(),t._ri(!!t.more,58)?s("view",{staticClass:"more",attrs:{_hid:58},on:{click:t.loadMore}},[]):t._e(),t._ri(!t.more,60)?s("view",{staticClass:"nodata",attrs:{_hid:60}},[]):t._e()]):t._e()],1):t._e(),t._ri(!!(t.goods.length>0),62)?s("view",{staticClass:"buy-info",attrs:{_hid:62}},[s("view",{staticClass:"buy-desc",attrs:{_hid:63}},[s("view",{attrs:{_hid:64},on:{click:t.selectAllGoodsListener}},[s("text",{staticClass:"iconfont btn-sel",class:1==t.all_select?"icon-selector_enable":"icon-selector_disable",style:"color:"+(1==t.all_select?"#ED3005":"#888888"),attrs:{_hid:65}}),s("text",{staticClass:"sel-all",attrs:{_hid:66}},[])]),s("view",{staticStyle:{display:"flex","align-items":"flex-end"},attrs:{_hid:68}},[s("text",{staticClass:"price",staticStyle:{padding:"0 2px 3px 0"},attrs:{_hid:69}},[]),s("text",{staticClass:"price",staticStyle:{"font-size":"24px"},attrs:{_hid:71}},[t._v(t._s(t.totalPrice),72)])])]),s("view",{staticClass:"btn-buy",attrs:{_hid:73},on:{click:t.settlement}},[t._v("结算("+t._s(t.goodsNum)+")",74)])]):t._e(),t._ri(!!(t.goods.length>0),75)?s("view",{staticStyle:{width:"100%",height:"110px",background:"#F2F4F5"},attrs:{_hid:75}}):t._e(),s("LoadingView",{attrs:{img:t.imgBaseUrl+"/loading.gif",_hid:76,_batrs:"img",_cid:0}}),s("ToastView",{attrs:{_hid:1078,_cid:1}}),s("page-footer",{attrs:{footer:t.footers,length:t.footers.length,tabIndex:t.tabIndex,color:t.selectColor,_hid:2080,_batrs:"footer,length,tabIndex,color",_cid:2}})],1)},e=[];s.d(a,"a",function(){return i}),s.d(a,"b",function(){return e})},1794:function(t,a,s){"use strict";var i=s("02b3"),e=s.n(i);e.a},4755:function(t,a,s){"use strict";s.r(a);var i=s("47d9"),e=s.n(i);for(var o in i)"default"!==o&&function(t){s.d(a,t,function(){return i[t]})}(o);a["default"]=e.a},"47d9":function(t,a,s){"use strict";(function(t){Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var s={data:function(){return{userid:0,startX:0,startY:0,tabIndex:2,selectColor:"#ED3005",footers:[],page:1,more:0,list:[],goods:[],goodsNum:0,totalPrice:0,all_select:0,imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl},onLoad:function(a){var s=this,i=t.getStorageSync("user_id");void 0!=i&&""!=i&&(s.$data.userid=i),void 0!=a.pid&&""!=a.pid&&t.setStorageSync("pid",a.pid),s.wxb.addPage(this),s.wxb.Init(a,function(t){console.log(a),s.$data.footers=s.wxb.skin.footer.list,s.$data.tabIndex=s.wxb.getCurrPageIndex("/pages/cart/index",s.$data.footers)-0,s.$data.selectColor=s.wxb.skin.footer.selectColor,console.log("tabIndex=>"+s.$data.tabIndex),void 0!=a.p_cat_id&&void 0!=a.cat_id&&(s.$data.p_cat_id=a.p_cat_id,s.$data.cat_id=a.cat_id),s.getCartList()})},onUnload:function(){this.wxb.removePage()},onShareAppMessage:function(){var t=this;return{title:t.$data.shareTitle?t.$data.shareTitle:"营销电商",path:"/pages/index/index?pid="+t.$data.userid}},methods:{settlement:function(a){this.$data.goodsNum<=0?this.$showToast({show:!0,content:"请勾选购买的产品"}):t.navigateTo({url:"/pages/cart/buy"})},onSelectGoodsListener:function(t){var a=this,s=t.currentTarget.dataset.index;a.wxb.Post("/shop/api.cart/selectCart",{cart_id:a.$data.list[s].cart_id},function(t){a.$data.list[s].selected=1==a.$data.list[s].selected?0:1,a.countGoodsTotalPrice()})},selectAllGoodsListener:function(t){var a=this.$data.all_select,s=this.$data.list;for(var i in this.$data.all_select=1==a?0:1,s)1==this.$data.all_select?s[i].selected=1:s[i].selected=0;this.$data.list=s,this.countGoodsTotalPrice();var e=this;e.wxb.Post("/shop/api.cart/selectCartAll",{is_select:1==a?0:1},function(t){})},countGoodsTotalPrice:function(t){var a=this.$data.list,s=0,i=0,e=1;for(var o in a)1==a[o].selected?(this.wxb.printLog("单价："+a[o].price),this.wxb.printLog("数量："+a[o].goods_num),this.wxb.printLog("计算价格=>"+(a[o].price-0)*(a[o].goods_num-0)),s+=(a[o].price-0)*(a[o].goods_num-0),i+=a[o].goods_num-0):0==a[o].selected&&(e=0);this.$data.all_select=e,this.$data.totalPrice=s,this.$data.goodsNum=i},minusGoodsNumListener:function(t){var a=t.currentTarget.dataset.num,s=t.currentTarget.dataset.id;a<=1?this.$showToast({show:!0,content:"至少购买一件商品"}):(a-=1,this.changeGoodsNumListener(s,a))},addGoodsNumListener:function(t){var a=t.currentTarget.dataset.num,s=t.currentTarget.dataset.id;a=a-0+1,this.changeGoodsNumListener(s,a)},changeGoodsNumListener:function(t,a){var s=this;s.wxb.Post("/shop/api.Cart/editCart",{cart_id:t,num:a},function(t){s.$data.page=1,s.getCartList()})},deleteGoodsListener:function(t){var a=this,s=t.currentTarget.dataset.id,i=t.currentTarget.dataset.index,e=a.$data.list;a.wxb.Post("/shop/api.Cart/delCart",{cart_id:s},function(t){e.splice(i,1),a.$showToast({show:!0,content:"该商品已成功删除"})}),a.$data.list=e},touchstart:function(t){console.log(t),console.log("我要开始划动拉"),console.log(this.wxb.device);var a=this.$data.list;for(var s in a)a[s].isTouchMove&&(a[s].isTouchMove=!1);"h5"==this.wxb.device?(this.$data.startX=t.changedTouches[0].clientX,this.$data.startY=t.changedTouches[0].clientY):(this.$data.startX=t.cclientX,this.$data.startY=t.clientY),this.$data.list=a},touchmove:function(t){var a=this,s=t.currentTarget.dataset.index,i=a.$data.startX,e=a.$data.startY;if("h5"==this.wxb.device)var o=t.changedTouches[0].clientX,d=t.changedTouches[0].clientY;else o=t.cclientX,d=t.clientY;var r=a.$data.list,n=a.angle({X:i,Y:e},{X:o,Y:d});for(var c in r){if(r[c].isTouchMove=!1,Math.abs(n)>30)return;c==s&&(r[c].isTouchMove=!(o>i))}a.$data.list=r},angle:function(t,a){var s=a.X-t.X,i=a.Y-t.Y;return 360*Math.atan(i/s)/(2*Math.PI)},loadMore:function(t){this.wxb.printLog("分页加载更多"),this.getCartList()},getCartList:function(){var t=this,a=t.$data.page,s=t.$data.goods;1==a&&(s=[]),t.wxb.Post("/shop/api.Cart/index",{page:t.$data.page},function(i){if(1==a){var e=i.list;for(var o in e)e[o].isTouchMove=!1;t.$data.list=e}var d=i.tuijian;for(var o in d)s.push(d[o]),t.countGoodsTotalPrice();t.$data.goods=s,t.$data.more=i.isMore,t.$data.page+=1})}}};a.default=s}).call(this,s("c11b")["default"])},d600:function(t,a,s){"use strict";s("2346");var i=o(s("ee5e")),e=o(s("3a53"));function o(t){return t&&t.__esModule?t:{default:t}}i.default.mpType="page";var d=new e.default(i.default);d.$mount()},ee5e:function(t,a,s){"use strict";s.r(a);var i=s("0881"),e=s("4755");for(var o in e)"default"!==o&&function(t){s.d(a,t,function(){return e[t]})}(o);s("1794");var d=s("2877"),r=Object(d["a"])(e["default"],i["a"],i["b"],!1,null,null,null);a["default"]=r.exports}},[["d600","common/runtime","common/vendor"]]]);