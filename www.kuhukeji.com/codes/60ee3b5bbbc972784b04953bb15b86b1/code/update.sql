ALTER TABLE `wyu_app_website_setting` add `title` varchar (255) not null default '' comment 'SEO标题';
ALTER TABLE `wyu_app_website_setting` add `keywords` text not null default '' comment 'SEO关键词';
ALTER TABLE `wyu_app_website_setting` add `description` text not null default '' comment 'SEO描述';

ALTER TABLE `wyu_app_website_product` add `seo` text comment 'SEO信息';
ALTER TABLE `wyu_app_website_news` add `seo` text comment 'SEO信息';
ALTER TABLE `wyu_app_website_example` add `seo` text comment 'SEO信息';
ALTER TABLE `wyu_app_website_business` add `seo` text comment 'SEO信息';
