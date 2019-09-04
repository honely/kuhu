<?php
namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class CommentModel extends CommonModel
{
    protected $pk = 'comment_id';
    protected $name = 'app_shop_comment';
    protected $insert = ['add_time', 'add_ip'];

    protected $rules = [
        ['goods_id', 'require|number', '商品id必须存在！|商品id必须是数字！'],
        ['app_id', 'require|number', '参数不正确|参数不正确！'],
        ['order_id', 'require|number', '订单id必须存在|订单id必须是数字！'],
        ['user_id', 'require|number', '用户id必须存在|用户id必须是数字！'],
        ['title', 'require|max:255', '商品标题不能为空|商品标题长度不合法！'],
        ['username', 'require|max:60', '用户名不能为空|用户名长度不合法！'],
        ['content', 'require', '评论内容不能为空'],
        ['deliver_rank', 'number|between:1,5', '物流评价必须是在1-5之间！'],
        ['goods_rank', 'number|between:1,5', '商品评价必须是在1-5之间！'],
        ['service_rank', 'number|between:1,5', '服务评价必须是在1-5之间！'],
        ['zan_num', 'number', '点赞数必须是数字！'],
        ['is_show', 'number', '是否展示必须是数字！'],
        ['zan_userid', 'string|max:255', '点赞用户长度不得超过255|点赞用户长度不得超过255！'],
        ['is_anonymous', 'number', '是否匿名必须选择！'],
        ['rec_id', 'number|min:1', '订单商品id必须是数字|订单商品id必须大于1！'],
        ['orderby', 'number', '排序必须是数字！'],
        ['image', 'require|max:255', '图片必须上传|图片上传不正确！'],
        ['is_hot', 'require|number', '是否热门必须选择！'],
    ];

    public function dataFilter($app_id = 0)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "goods_id" => (int)$request->param("goods_id", 0),
            "order_id" => (int)$request->param("order_id", 0),
            "user_id" => (int)$request->param("user_id", 0),
            "title" => (string)$request->param("title", ""),//用户名
            "username" => (string)$request->param("username", ""),//用户名
            "content" => (string)$request->param("content", ""),//评价内容
            "img" => (string)$request->param("img", ""),//图片
            "deliver_rank" => (int)$request->param("deliver_rank", 0),//物流评价
            "goods_rank" => (int)$request->param("goods_rank", 0),//商品评价
            "service_rank" => (int)$request->param("service_rank", 0),//服务评价
            "zan_num" => (int)$request->param("zan_num", 0),//点赞次数
            "is_show" => (int)$request->param("is_show", 0),//是否显示
            "zan_userid" => (string)$request->param("zan_userid", ""),//点赞用户id
            "reply" => (string)$request->param("reply", ""),//回复
            "is_anonymous" => (int)$request->param("is_anonymous", 0),//是否匿名
            "rec_id" => (int)$request->param("rec_id", 0),//订单表id
            "orderby" => (int)$request->param("orderby", 0),//排序
        ];
        return $param;
    }


}
