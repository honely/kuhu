<?php
namespace app\common\model;
use app\common\model\CommonModel;

class Model extends CommonModel
{
    protected $pk = '';
    protected $name = '';
    

    protected $rules = [
       
     ['','',''],

    ];


    public function dataFilter(){
        $request = request();
        $param = [
            
            "" => (string) $request->param("",""),//

        ];
        return $param;
    }


}
