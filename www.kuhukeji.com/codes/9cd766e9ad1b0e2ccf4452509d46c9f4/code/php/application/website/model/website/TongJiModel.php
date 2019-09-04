<?php
namespace app\website\model\website;

use app\website\model\CommonModel;

class TongJiModel extends CommonModel
{
    protected $pk = 'tongji_id';
    protected $name = 'app_website_tongji';
    protected $insert = ['add_time','add_ip'];

//    public $typeTrance = [
//        'news' => 1,
//        'product' => 2,
//        'business' => 3,
//        'example' => 4,
//    ];

    public function visit($app_id,$device) {
        if (!isset($device)) {
            return false;
        }
        $this->save(['app_id'=>$app_id,'device'=>$device,'is_init'=>1]);
        return true;
    }

    public function viewProduct($app_id,$device,$resource_id,$title) {
        $this->save(['app_id'=>$app_id,'device'=>$device,'type'=>1,'resource_id'=>$resource_id,'title'=>$title]);
        return true;
    }

    public function viewNews($app_id,$device,$resource_id,$title) {
        $this->save(['app_id'=>$app_id,'device'=>$device,'type'=>2,'resource_id'=>$resource_id,'title'=>$title]);
        return true;
    }

    public function viewBusiness($app_id,$device,$resource_id,$title) {
        $this->save(['app_id'=>$app_id,'device'=>$device,'type'=>3,'resource_id'=>$resource_id,'title'=>$title]);
        return true;
    }

    public function viewExample($app_id,$device,$resource_id,$title) {
        $this->save(['app_id'=>$app_id,'device'=>$device,'type'=>4,'resource_id'=>$resource_id,'title'=>$title]);
        return true;
    }
}
