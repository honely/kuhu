(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-promoters-promoCode"],{"0581":function(e,t,n){"use strict";n.r(t);var a=n("c6d9"),i=n("357c");for(var o in i)"default"!==o&&function(e){n.d(t,e,function(){return i[e]})}(o);n("b591");var s=n("2877"),c=Object(s["a"])(i["default"],a["a"],a["b"],!1,null,"7ec63dc7",null);t["default"]=c.exports},"31fb":function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var a={data:function(){return{posterWidth:0,agent:"",imgBaseUrl:""}},created:function(){this.$data.imgBaseUrl=this.wxb.imgBaseUrl,this.$data.posterWidth=.9*this.wxb.screenWidth},onShareAppMessage:function(){return{title:"积分商城",path:"/pages/promoters/promoCode"}},onLoad:function(e){console.log("onLoad");var t=this;t.wxb.addPage(this),t.wxb.Init(e,function(e){t.$data.company_name=e.info.company_name,t.getAgentQrcodeInfo()})},onUnload:function(){this.wxb.removePage()},onReady:function(e){console.log("onReady");var t=this,n=t.$data.agent;void 0!=n&&t.drawPosterInfo(n),console.log(n)},methods:{saveTempFilePath:function(){console.log("保存海报");var e=this,t=this.$data.posterWidth;console.log(t),uni.canvasToTempFilePath({width:t,height:440,fileType:"png",canvasId:"posterCanvas",success:function(t){"h5"==e.wxb.device?e.downloadFile("posterCanvas.png",t.tempFilePath):uni.saveImageToPhotosAlbum({filePath:t.tempFilePath,success:function(e){console.log(e)},fail:function(e){console.log(e)}})},fail:function(e){console.log(JSON.stringify(e))}})},downloadFile:function(e,t){var n=document.createElement("a"),a=this.base64ToBlob(t),i=document.createEvent("HTMLEvents");i.initEvent("click",!0,!0),n.download=e,n.href=URL.createObjectURL(a),n.click()},base64ToBlob:function(e){for(var t=e.split(";base64,"),n=t[0].split(":")[1],a=window.atob(t[1]),i=a.length,o=new Uint8Array(i),s=0;s<i;++s)o[s]=a.charCodeAt(s);return new Blob([o],{type:n})},getAgentQrcodeInfo:function(e){var t=this;t.wxb.Post("/shop/api.agent/getAgentQrcode",{},function(e){t.$data.agent=e,t.drawPosterInfo(e)})},previewImage:function(e){var t=this.$data.agent,n=[];n.push(t.qrcode),uni.previewImage({urls:n})},drawPosterInfo:function(e){var t=""!=e.face?e.face:imgBaseUrl+"/mine/img_my_head@3x.png",n=e.qrcode,a=uni.createCanvasContext("posterCanvas");a.clearRect(0,0,i,o);var i=this.$data.posterWidth,o=440;a.save(),a.fillStyle="#fff",a.setStrokeStyle("#FFFFFF"),a.fillRect(0,0,i,o),a.drawImage(this.$data.imgBaseUrl+"/mine/img_poster_invite@3x.png",0,0,i,o),a.beginPath(),a.save(),uni.getImageInfo({src:t+"",success:function(t){a.drawImage(t.path,(i-64)/2,32,64,64),a.beginPath(),a.save(),a.font="18px 宋体",a.fillStyle="#000",e&&""!=e.nick_name&&(console.log(a.measureText(e.nick_name).width),a.fillText(e.nick_name,(i-a.measureText(e.nick_name).width)/2,126)),a.font="22px 宋体",a.fillStyle="#FF8C00",a.fillText("邀您一起0元创业，推广赢奖励",23,172),a.font="16px 宋体",a.fillStyle="#000000",a.fillText("长按识别二维码 即可创业～",71,382),uni.getImageInfo({src:n+"",success:function(e){a.drawImage(e.path,(i-100)/2,250,100,100),a.beginPath(),a.save(),a.draw()}})}})}}};t.default=a},3256:function(e,t,n){var a=n("aff6");"string"===typeof a&&(a=[[e.i,a,""]]),a.locals&&(e.exports=a.locals);var i=n("4f06").default;i("aa15150e",a,!0,{sourceMap:!1,shadowMode:!1})},"357c":function(e,t,n){"use strict";n.r(t);var a=n("31fb"),i=n.n(a);for(var o in a)"default"!==o&&function(e){n.d(t,e,function(){return a[e]})}(o);t["default"]=i.a},aff6:function(e,t,n){t=e.exports=n("2350")(!1),t.push([e.i,".share-page[data-v-7ec63dc7]{position:absolute;top:0;bottom:0;left:0;right:0;background:-o-linear-gradient(135deg,#2b2e3d 0,#575968 100%);background:linear-gradient(315deg,#2b2e3d,#575968);overflow:scroll}.share-page .share-cont[data-v-7ec63dc7]{width:100%;display:block}.share-cont .poster-box[data-v-7ec63dc7]{width:90%;height:440px;margin:15px 5%;background:#fff}.btn[data-v-7ec63dc7]{width:90%;height:48px;margin:6px 5%;display:-webkit-inline-box;display:-webkit-inline-flex;display:-ms-inline-flexbox;display:inline-flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center}.btn-yellow[data-v-7ec63dc7]{-webkit-box-pack:center;-webkit-justify-content:center;-ms-flex-pack:center;justify-content:center;background:-webkit-gradient(linear,left top,right top,from(#ffae19),to(#ff8000));background:-o-linear-gradient(left,#ffae19 0,#ff8000 100%);background:linear-gradient(90deg,#ffae19,#ff8000);border-radius:8px;color:#fff;font-size:18px}.btn-white[data-v-7ec63dc7]{-webkit-box-pack:center;-webkit-justify-content:center;-ms-flex-pack:center;justify-content:center;background:#fff;border-radius:8px;color:#ff8000;font-size:18px}",""])},b591:function(e,t,n){"use strict";var a=n("3256"),i=n.n(a);i.a},c6d9:function(e,t,n){"use strict";var a=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("v-uni-view",{staticClass:"share-page"},[n("v-uni-view",{staticClass:"share-cont"},[n("v-uni-view",{staticClass:"poster-box",staticStyle:{background:"rgba(0,0,0,0)"}},[n("v-uni-canvas",{staticStyle:{width:"100%",height:"440px"},attrs:{"canvas-id":"posterCanvas"},on:{longpress:function(t){t=e.$handleEvent(t),e.previewImage(t)}}})],1),n("v-uni-view",{staticClass:"btn btn-yellow"},[n("v-uni-text",{staticClass:"iconfont icon-btn_share"}),n("v-uni-text",{staticStyle:{"margin-left":"10px"}},[e._v("邀好友加入")])],1),n("v-uni-view",{staticClass:"btn btn-white",on:{click:function(t){t=e.$handleEvent(t),e.saveTempFilePath(t)}}},[n("v-uni-text",{staticClass:"iconfont icon-btn_save"}),n("v-uni-text",{staticStyle:{"margin-left":"10px"}},[e._v("保存海报图")])],1)],1)],1)},i=[];n.d(t,"a",function(){return a}),n.d(t,"b",function(){return i})}}]);