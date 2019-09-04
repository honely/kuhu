

DROP TABLE IF EXISTS `wyu_admin`;
CREATE TABLE `wyu_admin` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '我是备注啦哈哈',
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `real_name` varchar(64) DEFAULT NULL,
  `mobile` char(12) DEFAULT NULL COMMENT '我是备注',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `last_time` int(11) DEFAULT '0',
  `last_ip` varchar(15) DEFAULT NULL,
  `is_lock` tinyint(3) DEFAULT '0',
  `face` varchar(255) DEFAULT '',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_admin_power`;
CREATE TABLE `wyu_admin_power` (
  `power_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '功能名称',
  `key` varchar(64) DEFAULT NULL COMMENT '功能kay 不可更改',
  `orderby` int(11) DEFAULT '0',
  PRIMARY KEY (`power_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';


DROP TABLE IF EXISTS `wyu_admin_role_map`;
CREATE TABLE `wyu_admin_role_map` (
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `power_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app`;
CREATE TABLE `wyu_app` (
  `app_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '应用类型',
  `app_name` varchar(64) NOT NULL DEFAULT '' COMMENT '应用名称',
  `appkey` varchar(255) DEFAULT NULL,
  `member_id` int(11) DEFAULT '0',
  `sms_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '短信数',
  `expire_time` int(11) NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `add_ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_footer_icon`;
CREATE TABLE `wyu_app_footer_icon` (
  `icon_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `unchecked` varchar(255) NOT NULL DEFAULT '' COMMENT '未选中',
  `checked` varchar(255) NOT NULL DEFAULT '' COMMENT '已选中',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_ip` varchar(15) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`icon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_manage`;
CREATE TABLE `wyu_app_manage` (
  `manage_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT '0',
  `manage_name` varchar(20) NOT NULL DEFAULT '0' COMMENT '账号',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `app_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '创建IP',
  `last_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  `last_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  PRIMARY KEY (`manage_id`),
  UNIQUE KEY `app_id` (`app_id`),
  UNIQUE KEY `manage_name` (`manage_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_open_setting`;
CREATE TABLE `wyu_app_open_setting` (
  `app_id` int(10) unsigned NOT NULL,
  `weixin` text NOT NULL COMMENT '微信配置',
  `ali` text,
  `baidu` text NOT NULL COMMENT '百度小程序',
  `toutiao` text NOT NULL COMMENT '头条小程序',
  `h5` text NOT NULL COMMENT 'h5公众号',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_pages`;
CREATE TABLE `wyu_app_pages` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT '0',
  `app_type` int(11) NOT NULL DEFAULT '0' COMMENT '冗余一下小程序ID的APP_TYPE',
  `title` varchar(64) NOT NULL DEFAULT '',
  `photo` varchar(512) NOT NULL DEFAULT '',
  `is_theme` tinyint(1) DEFAULT '0' COMMENT '1 代表自定义主题颜色 0 代表使用默认主题',
  `theme` text,
  `plugins` mediumtext NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是首页',
  `footer_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '代表不使用底部菜单   1 代表使用平台  2代表自定义',
  `footer` text,
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_time` int(11) unsigned NOT NULL DEFAULT '0',
  `add_ip` varchar(20) NOT NULL DEFAULT '',
  `page_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_resource`;
CREATE TABLE `wyu_app_resource` (
  `resource_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(3) NOT NULL DEFAULT '1' COMMENT '资源类型：1.BANNER 2.NAV 3.ADVERT 4.ICON 5.PHOTO',
  `app_id` int(3) NOT NULL DEFAULT '1' COMMENT '程序ID',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `size` int(10) NOT NULL DEFAULT '0' COMMENT '图片大小',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `w` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '图片宽度',
  `h` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '图片高度',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '软删除 （用来查询非法文件）',
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_resource_category`;
CREATE TABLE `wyu_app_resource_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `app_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_template_cat`;
CREATE TABLE `wyu_app_template_cat` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_type` int(11) DEFAULT NULL,
  `cat_name` varchar(64) DEFAULT NULL,
  `orderby` int(11) DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='模版分类';


DROP TABLE IF EXISTS `wyu_app_templates`;
CREATE TABLE `wyu_app_templates` (
  `template_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `app_type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'APP的类型',
  `cat_id` int(11) DEFAULT '0',
  `app_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '来源哪个APPID',
  `photo` varchar(512) NOT NULL DEFAULT '',
  `title` varchar(64) NOT NULL DEFAULT '',
  `is_theme` tinyint(1) DEFAULT '0' COMMENT '1 代表自定义主题颜色 0 代表使用默认主题',
  `theme` text,
  `plugins` mediumtext NOT NULL,
  `footer_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '代表不使用底部菜单   1 代表使用平台  2代表自定义',
  `footer` text,
  `audit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 限免  2免费  3收费 （后期开发） 默认给1 暂时不用管',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `add_ip` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`template_id`),
  KEY `app_type` (`app_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_theme`;
CREATE TABLE `wyu_app_theme` (
  `app_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `footer` text,
  `theme` text,
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_demo`;
CREATE TABLE `wyu_demo` (
  `demo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `string` varchar(255) NOT NULL DEFAULT '' COMMENT '我是字符串',
  `int` int(11) NOT NULL DEFAULT '0' COMMENT '我是整形',
  `float` varchar(15) NOT NULL DEFAULT '' COMMENT '我是浮点型',
  `text` text NOT NULL COMMENT '文本',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日期时间戳',
  `date` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `money` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金钱',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `h` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`demo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_footer_icon`;
CREATE TABLE `wyu_footer_icon` (
  `icon_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `unchecked` varchar(255) NOT NULL DEFAULT '' COMMENT '未选中',
  `checked` varchar(255) NOT NULL DEFAULT '' COMMENT '已选中',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_ip` varchar(15) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`icon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_member`;
CREATE TABLE `wyu_member` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号',
  `password` char(32) DEFAULT NULL COMMENT '密码',
  `has_app_num` int(11) DEFAULT '0' COMMENT '已经创建的APP_NUM',
  `max_app_num` int(11) DEFAULT '3' COMMENT '最大的APP数量',
  `last_time` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) DEFAULT NULL,
  `add_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `add_ip` varchar(15) DEFAULT NULL COMMENT '创建IP',
  `is_lock` tinyint(3) unsigned DEFAULT '0',
  `agency_id` int(11) NOT NULL DEFAULT '0' COMMENT '代理商ID',
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_member_mobile_code`;
CREATE TABLE `wyu_member_mobile_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` char(11) NOT NULL DEFAULT '0',
  `code` char(6) NOT NULL DEFAULT '0',
  `err_num` varchar(15) NOT NULL DEFAULT '' COMMENT '登录设备',
  `code_time` int(10) unsigned NOT NULL DEFAULT '0',
  `send_time` varchar(15) DEFAULT '0',
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_resource`;
CREATE TABLE `wyu_resource` (
  `resource_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(3) NOT NULL DEFAULT '1' COMMENT '资源类型：1.BANNER 2.NAV 3.ADVERT 4.ICON 5.PHOTO',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `size` int(10) NOT NULL DEFAULT '0' COMMENT '图片大小',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `w` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '图片宽度',
  `h` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '图片高度',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_resource_category`;
CREATE TABLE `wyu_resource_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_setting`;
CREATE TABLE `wyu_setting` (
  `k` varchar(64) NOT NULL,
  `v` text,
  PRIMARY KEY (`k`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_sms_send_log`;
CREATE TABLE `wyu_sms_send_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tels` text NOT NULL COMMENT '发送者',
  `text` varchar(255) NOT NULL DEFAULT '' COMMENT '发送内容',
  `each_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '每条短信消耗',
  `size` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '一共多少个字',
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '合计发了多少条',
  `cat` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '短信类型',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='短信发送记录';


DROP TABLE IF EXISTS `wyu_sms_tmp`;
CREATE TABLE `wyu_sms_tmp` (
  `k` varchar(20) NOT NULL,
  `use_type` varchar(64) DEFAULT NULL,
  `app_type` varchar(32) NOT NULL DEFAULT '0' COMMENT '模板ID',
  `tmp_id` varchar(64) NOT NULL DEFAULT '' COMMENT '腾讯那边的提交审核后的模版ID',
  `text` varchar(255) NOT NULL DEFAULT '' COMMENT '短信内容',
  `params` varchar(255) DEFAULT NULL COMMENT '参数',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1.通知类短信 2营销短信',
  PRIMARY KEY (`k`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
