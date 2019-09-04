// 配置常量,常用常量配置在main.js里
// import store from '../../store.js'

const shopUrl = "https://open.woyaou.com";
const imgBaseUrl = shopUrl +"/static/uimage/mall";
const DEBUG = true;

const app_id = "5_woyaou";
const device = "h5";
const skin = '';
//支付平台
const payDevice = '';

const open_code = '';
const open_id = '';
const pid = '1';
const screenWidth = 0;

// 当前页面上下文对象
const pageManager = [];

function Post(api, params, callback) {
	let that = this;
	var toast = {};
	var token = uni.getStorageSync("token");
	if (token != undefined) {
		params.token = token;
		params.user_token = uni.getStorageSync("user_token");
		// that.showLoading();
		uni.request({
			url: this.shopUrl + api,
			method: "POST",
			data: params,
			success: (res) => {
				uni.hideLoading();
				// that.hideLoading();
				if (res.data.code == 200) {
					callback(res.data.data);
				} else if (res.data.code == 400) {
					//异常
					toast.show = true;
					toast.content = res.data.msg;
					that.showToast(toast);
					// that.printLog(toast)
				} else if (res.data.code == 100) {
					//重新登录
					toast.show = true;
					toast.content = res.data.msg;
					that.userLogin();
					that.showToast(toast);
					that.printLog(toast)
				} else if (res.data.code == 404) {
					//异常 404错误

				}
			},

			fail: (res) => {
				uni.hideLoading();
				// 访问接口失败
				// that.hideLoading();
				that.printLog(res);
			},
		});
	} else {
		that.Init(function(data) {
			that.Post(api, params, callback);
		});
	}
};

// 初始化
function Init(e, callback, type = 1) {
	console.log('App Launch')
	let that = this;
	if (e.app_id != undefined) {
		that.app_id = e.app_id;
	}
	if (that.device == 'h5') {
		if(e.app_id != undefined){
			uni.setStorageSync('app_id',e.app_id);
		}
		that.Post("/shop/api.initialization/Init", {
			app_id: that.app_id,
			device: that.device,
		}, function(data) {
			uni.setStorageSync("token", data.token);
			uni.setStorageSync("open_id", data.open_id);
			that.skin = data.skin;
			callback(data);
			if (type == 1) {
				uni.setNavigationBarColor({
					frontColor: data.skin.theme.navigationBarFrontColor,
					backgroundColor: data.skin.theme.navigationBarBackgroundColor,
				})
			}
		});
	} else if (that.device == 'weixin' || that.device == 'baidu' || that.device == 'toutiao') {
		that.checkSession(function() {
			that.Post("/shop/api.initialization/Init", {
				app_id: that.app_id,
				device: that.device,
				code: that.open_id == '' ? uni.getStorageSync('code') : '', 
				open_id: that.open_id,
			}, function(data) {
				uni.setStorageSync("token", data.token);
				uni.setStorageSync("open_id", data.open_id);
				that.open_id = data.open_id;
				that.skin = data.skin;
				callback(data);
				if (type == 1) {
					uni.setNavigationBarColor({
						frontColor: data.skin.theme.navigationBarFrontColor,
						backgroundColor: data.skin.theme.navigationBarBackgroundColor,
					})
				}
			});
		});
	} else if (that.device == 'ali') {
		if (that.open_code == '') {
			uni.login({
				provider: that.device,
				// scopes: 'auth_user',
				success: function(loginRes) {
					console.log("code=>" + loginRes.code);
					uni.setStorageSync("code", loginRes.code);
					that._Init(callback, type);
				},
				fail(e) {
					console.log("uni 登录失败")
					console.log(e);
				}
			});
		} else {
			that._Init(callback, type);
		}
	}
};

function _Init(callback, type = 1) {
	var that = this;
	that.Post("/shop/api.initialization/Init", {
		app_id: that.app_id,
		device: that.device,
		code: uni.getStorageSync("code"),
	}, function(data) {
		console.log("aaaaaaaaaaaaaaaaaaaaaa");
		console.log(data);
		uni.setStorageSync("token", data.token);
		uni.setStorageSync("open_id", data.open_id);
		that.skin = data.skin;
		callback(data);
		if (type == 1) {
			uni.setNavigationBarColor({
				frontColor: data.skin.theme.navigationBarFrontColor,
				backgroundColor: data.skin.theme.navigationBarBackgroundColor,
			})
		}
	});
}

// 检测session是否过期  注意：支付宝不支持
function checkSession(callback) {
	var that = this;
	that.open_id = uni.getStorageSync("open_id");
	that.open_code = uni.getStorageSync('code');
	if(!that.open_id || !that.open_code){
		uni.login({
			provider: that.device,
			success: function(loginRes) {
				console.log("code=>" + loginRes.code);
				uni.setStorageSync("code", loginRes.code);
				that.open_code = loginRes.code;
				that.open_id = "";
				callback();
			},
			fail(e) {
				console.log("uni 登录失败")
				console.log(e);
			}
		});
	}else{
		uni.checkSession({
			success(res) {
				callback();
			},
			fail() {
				console.log("检测session是否过期 fail; 设备登录=>" + that.device);
				// session_key 已经失效，需要重新执行登录流程
				uni.login({
					provider: that.device,
					success: function(loginRes) {
						console.log("code=>" + loginRes.code);
						uni.setStorageSync("code", loginRes.code);
						that.open_code = loginRes.code;
						that.open_id = "";
						callback();
					},
		
					fail(e) {
						console.log("uni 登录失败")
						console.log(e);
					}
				});
			},
			complete() {
				console.log("检测session是否过期 complete; 设备登录=>" + that.device);
		
			}
		});
		
	}
	
}

// 页面管理
function addPage(page) {
	this.printLog("==========addPage==========");
	this.printLog(page)

	var pageManager = this.pageManager;
	if (pageManager == undefined) {
		pageManager = [];
	}
	pageManager.push(page);
	this.pageManager = pageManager;
}

function removePage() {
	var pageManager = this.pageManager;
	if (pageManager && pageManager.length > 0) {
		this.printLog("==========removePage==========");
		this.printLog(pageManager[pageManager.length - 1]);

		pageManager.splice(pageManager.length - 1, 1);
	}
}

function getCurrPage() {
	var pageManager = this.pageManager;
	if (pageManager && pageManager.length > 0) {
		this.printLog("==========getCurrPage==========");
		this.printLog(pageManager[pageManager.length - 1]);
		return pageManager[pageManager.length - 1];
	}
}

// toast管理
function showToast(toast) {
	var page = this.getCurrPage();
	if (undefined != page) {
		page.$showToast(toast);
	}
}

// Loading管理
function showLoading() {
	// this.printLog("显示loading....." + store.state.loading);
	var page = this.getCurrPage();
	if (undefined != page) {
		page.$showLoading();
	}
}

// Loading管理
function hideLoading() {
	// this.printLog("隐藏loading....." + store.state.loading);
	var page = this.getCurrPage();
	if (undefined != page) {
		page.$showLoading(false);
	}
}

// 打印Log
function printLog(msg) {
	if (this.DEBUG) console.log(msg);
}

// 用户重新登录
function userLogin() {
	var page = this.getCurrPage();
	if (undefined != page) {
		if (page.wxb.device == 'weixin') {
			page.$redirectTo("/pages/user/login");
		} else {

			page.$redirectTo("/pages/user/phoneLogin");
		}
	}
}

// 获取当前页面索引
function getCurrPageIndex(url, footers) {
	console.log(footers)
	for (var i in footers) {
		var urlParam = this.getParam(footers[i].link);
		console.log("获取当前页面索引")
		console.log(urlParam)
		if (urlParam.url == url) {
			return i;
		}
	}
};


// 链接跳转
function onLinkListener(url) {
	let  that = this;
	var urlParam = this.getParam(url);
	// Laucher清单
	var ToReLaunch = ['/pages/index/index', '/pages/classify/index', '/pages/cart/index', '/pages/mine/index'];

	if (urlParam == false) {
		return false;
	}

	if (urlParam.url == 'wyu_tel') {
		uni.makePhoneCall({
			phoneNumber: urlParam.param.tel
		});
		return true;
	}

	if (ToReLaunch.indexOf(urlParam.url) >= 0) {
		uni.reLaunch({
			url: url
		})
	} else {
		var linkUrl = url.indexOf("?") != -1 ? url + '&app_id=' + that.app_id : url + '?app_id=' + that.app_id;
		uni.navigateTo({
			url: linkUrl
		})
	}
};

function getParam(url) {
	var theRequest = new Object();
	var urlParam = url.split("?");
	var this_url = urlParam[0];
	if (url.indexOf("?") != -1) {
		var strs = urlParam[1].split("&");
		for (var i = 0; i < strs.length; i++) {
			theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
		}
	}
	return {
		param: theRequest,
		url: this_url,
	};
};

/**
 * 支付订单
 */
function paymentOrder(data, callback) {
	console.log(callback);
	var that = this;
	if (that.payDevice == 'alipay') {
		uni.requestPayment({ //data.order_info
			provider: that.payDevice, //
			tradeNO: data.order_info,
			success: function(res) {
				console.log('success:' + JSON.stringify(res));
				callback(res);
			},
			fail: function(err) {
				console.log('fail:' + JSON.stringify(err));
				callback();
			}
		})
	} else if (that.payDevice == 'wxpay') {
		uni.requestPayment({
			provider: that.payDevice, //
			orderInfo: JSON.parse(JSON.stringify(data.order_info)), //
			timeStamp: data.order_info.timeStamp,
			nonceStr: data.order_info.nonceStr,
			package: data.order_info.package,
			signType: data.order_info.signType,
			paySign: data.order_info.paySign,
			success: function(res) {
				console.log('success:' + JSON.stringify(res));
				callback(res);
			},
			fail: function(err) {
				callback();
			}
		})
	} else if (that.payDevice == 'baidu') {
		uni.requestPayment({
			provider: that.payDevice,
			orderInfo: JSON.parse(JSON.stringify(data.order_info)),//data.order_info, //
			success: function(res) {
				console.log('success:' + JSON.stringify(res));
				callback(res);
			},
			fail: function(err) {
				console.log('fail:' + JSON.stringify(err));
				callback();
			}
		})
	} else if(that.payDevice=='toutiao'){
		uni.requestPayment({
			provider: that.payDevice,
			data: JSON.parse(JSON.stringify(data.order_info)),
			success: function(res) {
				console.log('success:' + JSON.stringify(res));
				callback(res);
			},
			fail: function(err) {
				console.log('fail:' + JSON.stringify(err));
				callback();
			}
		})
	}
};

export default {
	screenWidth,
	shopUrl,
	imgBaseUrl,
	app_id,
	device,
	payDevice,

	open_code,
	open_id,
	pid,

	DEBUG,

	skin,
	Post,
	Init,
	checkSession,

	addPage,
	removePage,
	getCurrPage,
	getCurrPageIndex,
	getParam,
	onLinkListener,

	showToast,
	showLoading,
	hideLoading,

	printLog,
	userLogin,

	_Init,

	paymentOrder,
}
