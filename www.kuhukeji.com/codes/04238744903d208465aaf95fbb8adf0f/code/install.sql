SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `wyu_app_website_about`;
CREATE TABLE `wyu_app_website_about` (
  `app_id` int(10) unsigned NOT NULL,
  `about` text NOT NULL COMMENT '关于我们',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_website_booking_data`;
CREATE TABLE `wyu_app_website_booking_data` (
  `booking_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `app_id` int(10) unsigned NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `add_time` int(10) unsigned DEFAULT '0',
  `add_ip` varchar(15) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_website_booking_form`;
CREATE TABLE `wyu_app_website_booking_form` (
  `form_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '表单标题',
  `details` text NOT NULL COMMENT '表单配置',
  `booking_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '提交数',
  `add_time` int(10) unsigned DEFAULT '0',
  `add_ip` varchar(15) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_website_business`;
CREATE TABLE `wyu_app_website_business` (
  `business_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '副标题',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `photos` text,
  `detail` text NOT NULL COMMENT '描述',
  `product_ids` text NOT NULL COMMENT '产品IDs',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `add_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '创建IP',
  `orderby` int(11) NOT NULL DEFAULT '0',
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_website_develop`;
CREATE TABLE `wyu_app_website_develop` (
  `develop_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `app_id` int(11) NOT NULL DEFAULT '0',
  `detail` text COMMENT '详情',
  `add_time` int(10) unsigned DEFAULT '0',
  `add_ip` varchar(15) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `date` date DEFAULT NULL COMMENT '日期',
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`develop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_website_example`;
CREATE TABLE `wyu_app_website_example` (
  `example_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'appid',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `photos` text NOT NULL COMMENT '相册',
  `info` text NOT NULL COMMENT '案例信息',
  `detail` text NOT NULL COMMENT '案例详情',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `add_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '创建IP',
  `orderby` int(11) NOT NULL DEFAULT '0',
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`example_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_website_example_category`;
CREATE TABLE `wyu_app_website_example_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_website_message`;
CREATE TABLE `wyu_app_website_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `message` text NOT NULL,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_website_news`;
CREATE TABLE `wyu_app_website_news` (
  `news_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '新闻标题',
  `photo` varchar(255) DEFAULT NULL COMMENT '封面图片',
  `detail` text NOT NULL COMMENT '新闻详情',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要(列表显示)',
  `category_id` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1.公司新闻 2.行业资讯',
  `add_time` int(10) unsigned DEFAULT '0',
  `add_ip` varchar(15) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `orderby` int(11) NOT NULL DEFAULT '0',
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_website_news_category`;
CREATE TABLE `wyu_app_website_news_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_website_product`;
CREATE TABLE `wyu_app_website_product` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '副标题',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photos` text NOT NULL COMMENT '相册',
  `photo` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `original_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '原价',
  `notice` text NOT NULL COMMENT '购买须知',
  `detail` text NOT NULL COMMENT '商品详情JSON格式',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '上下架',
  `mobile` varchar(12) NOT NULL DEFAULT '' COMMENT '产品联系电话',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `add_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '创建IP',
  `orderby` int(11) DEFAULT '0',
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_website_product_category`;
CREATE TABLE `wyu_app_website_product_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_website_recruit`;
CREATE TABLE `wyu_app_website_recruit` (
  `recruit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '职位标题',
  `working_place` varchar(30) NOT NULL DEFAULT '' COMMENT '工作地点',
  `experience` varchar(30) NOT NULL DEFAULT '' COMMENT '工作年限(经验)',
  `education` varchar(30) NOT NULL DEFAULT '' COMMENT '学历',
  `salary` varchar(30) NOT NULL DEFAULT '' COMMENT '薪资',
  `detail` text NOT NULL COMMENT '职位描述详情',
  `qualify` text NOT NULL COMMENT '任职资格',
  `welfare` text NOT NULL COMMENT '福利待遇',
  `add_time` int(10) unsigned DEFAULT '0',
  `add_ip` varchar(15) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`recruit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_website_setting`;
CREATE TABLE `wyu_app_website_setting` (
  `app_id` int(10) unsigned NOT NULL,
  `company_name` varchar(64) NOT NULL DEFAULT '' COMMENT '公司名',
  `banner` text NOT NULL COMMENT 'banner',
  `introduce` text NOT NULL COMMENT '介绍',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `lat` varchar(15) NOT NULL DEFAULT '',
  `lng` varchar(15) NOT NULL DEFAULT '',
  `tel` varchar(12) NOT NULL DEFAULT '' COMMENT '电话',
  `mobile` varchar(12) NOT NULL DEFAULT '' COMMENT '手机号',
  `fax` varchar(64) NOT NULL DEFAULT '' COMMENT '传真',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_website_test_install`;
CREATE TABLE `wyu_app_website_test_install` (
  `test_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` text,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_website_tongji`;
CREATE TABLE `wyu_app_website_tongji` (
  `tongji_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL COMMENT '项目名称(省得多查一遍表)',
  `device` varchar(20) DEFAULT NULL,
  `resource_id` int(3) NOT NULL DEFAULT '0',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '1.新闻 2.产品 3.业务 4.案例',
  `is_init` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `add_ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`tongji_id`),
  KEY `app_id` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `wyu_app_website_user_open_id`;
CREATE TABLE `wyu_app_website_user_open_id` (
  `user_open_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'appid',
  `session_key` varchar(64) NOT NULL DEFAULT '' COMMENT 'sessionKey',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `open_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`user_open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `wyu_app_website_setting` add `title` varchar (255) not null default '' comment 'SEO标题';
ALTER TABLE `wyu_app_website_setting` add `keywords` text not null default '' comment 'SEO关键词';
ALTER TABLE `wyu_app_website_setting` add `description` text not null default '' comment 'SEO描述';
ALTER TABLE `wyu_app_website_product` add `seo` text comment 'SEO信息';
ALTER TABLE `wyu_app_website_news` add `seo` text comment 'SEO信息';
ALTER TABLE `wyu_app_website_example` add `seo` text comment 'SEO信息';
ALTER TABLE `wyu_app_website_business` add `seo` text comment 'SEO信息';
