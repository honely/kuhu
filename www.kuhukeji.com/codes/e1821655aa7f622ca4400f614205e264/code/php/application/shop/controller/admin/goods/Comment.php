<?php
namespace app\shop\controller\admin\goods;

use app\common\logic\shop\user\UserMoneyLogic;
use app\shop\controller\admin\Common;
use app\shop\model\shop\CommentModel;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\UserIntegralModel;
use app\shop\model\shop\UserModel;

class Comment extends Common
{
    /**
     *  评论列表
     */
    public function index() {
        $where['app_id'] = $this->appId;
        $title = (string)$this->request->param("title");
        if (!empty($title)) {
            $where["title"] = ["LIKE", "%{$title}%"];
        }
        $username = (string)$this->request->param("username");
        if (!empty($username)) {
            $where["username"] = ["LIKE", "%{$username}%"];
        }
        $goods_id = (int)$this->request->param("goods_id");
        if ($goods_id) {
            $where["goods_id"] = $goods_id;
        }
        $order_id = (int)$this->request->param("order_id");
        if ($order_id) {
            $where["order_id"] = $order_id;
        }
        $user_id = (int)$this->request->param("user_id");
        if ($user_id) {
            $where["user_id"] = $user_id;
        }
        $is_show = (int)$this->request->param("is_show",-999);
        if ($is_show >= 0) {
            $where["is_show"] = $is_show;
        }
        $where['is_comment'] = 1;

        $end_add_time = (int)$this->request->param("end_add_time", 0, "strtotime");
        $bg_add_time = (int)$this->request->param("bg_add_time", 0, "strtotime");
        if ($end_add_time > 0 && $bg_add_time > 0) {
            $where["add_time"] = ["between", [$bg_add_time, $end_add_time]];
        }
        $CommentModel = new CommentModel();
        $listTmp = $CommentModel->where($where)->order("orderby desc")->page($this->page, $this->limit)->select();
        $count = $CommentModel->where($where)->count();

        $list = [];
        foreach ($listTmp as $k=>$v) {
            $list[] = [
                'comment_id' => (int)$v->comment_id,
                'goods_id' => (int)$v->goods_id,
                'order_id' => (int)$v->order_id,
                'user_id' => (int)$v->user_id,
                'title' => (string)$v->title  ,
                'username' => (string)$v->username ,
                'content' => $v->content ? $v->content : '',
                'img' => (array)  json_decode($v->img,true) ,
                'goods_rank' => (int)$v->goods_rank,
                'is_show' => (int)$v->is_show,
                'rec_id' => (int)$v->rec_id,
                'orderby' => (int)$v->orderby,
                'reply' => (string)$v->reply,
                'add_time' => $v->add_time ? date("Y-m-d H:i",$v->add_time) : '--',
                'add_ip' => $v->add_ip,
            ];
        }

        $this->datas = [
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    public function showComment() {
        $comment_id = (int) $this->request->param('comment_id',0);
        $CommentModel = new CommentModel();
        $UserIntegralModel = new UserIntegralModel();
        if (!$comment = $CommentModel->find($comment_id)) {
            $this->warning('参数错误！');
        }
        if ($comment->app_id != $this->appId) {
            $this->warning('参数错误！');
        }
        if ($comment->is_show > 0) {
            $this->warning('评论已审核，请勿重复操作！');
        }
        $CommentModel->isUpdate(true)->save(['is_show'=>1,'integral'=>0],['comment_id'=>$comment_id]);
        if ($comment->integral > 0) {
            $UserIntegralModel->addGold($this->appId,$comment->user_id,$comment->integral,getMean('integral_log_type','key')['hpzs'],$beishu=1,$time=0);
        }

    }


    public function hideComment() {
        $comment_id = (int) $this->request->param('comment_id',0);
        $CommentModel = new CommentModel();
        if ($comment_id) {
            if (!$comment = $CommentModel->find($comment_id)) {
                $this->warning('参数错误！');
            }
            if ($comment->app_id != $this->appId) {
                $this->warning('参数错误！');
            }
            if ($comment->is_show > 0) {
                $this->warning('评论已审核，请勿重复操作！');
            }
            $CommentModel->save(['is_show'=>2],['comment_id'=>$comment_id]);
        }
    }

    public function delComment() {
        $comment_id = (int) $this->request->param('comment_id',0);
        $CommentModel = new CommentModel();
        if ($comment_id) {
            if (!$comment = $CommentModel->find($comment_id)) {
                $this->warning('参数错误！');
            }
            if ($comment->app_id != $this->appId) {
                $this->warning('参数错误！');
            }
            $CommentModel->where(['comment_id' => $comment_id])->delete();
        }
    }



    public function reply() {
        $comment_id = (int) $this->request->param('comment_id',0);
        $reply = (string) $this->request->param('reply','');

        $CommentModel = new CommentModel();
        if (!$detail = $CommentModel->find($comment_id)) {
            $this->warning('参数不正确！');
        }
        if ($detail->app_id != $this->appId) {
            $this->warning('参数不正确！');
        }
        $CommentModel->save(['reply'=>$reply],['comment_id'=>$comment_id]);
    }


}
