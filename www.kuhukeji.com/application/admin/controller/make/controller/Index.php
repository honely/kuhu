<?php
namespace app\make\controller;

use app\common\library\make\MakeMain;
use think\console\Input;
use think\console\Output;

class Index extends Common {




   public function getFieldByTable()
   {
       $table_name = (string) $this->request->param('table_name');
       if(!$table_name){
           $this->warning('请输入表名！');
       }
       $MakeMain = new MakeMain();
       $config = $MakeMain->getConfig($table_name);
       $this->datas['config'] = $config;
   }


   public function generateByChoose()
   {
       $data = (string) $this->request->param('data','','SecurityEditorHtml');
       if(!$data = json_decode($data,true)){
           $this->warning('参数错误无法生成！');
       }
       //检查是否生成
       $controllerFile = APP_PATH . "admin/controller/{$data['dir']}/" . ucwords($data['file_name']). ".php";
       if(file_exists($controllerFile)){
           $this->warning('提示：控制器已存在不给予覆盖,请删除源文件！');
       }
       $modelFile = APP_PATH . "common/model/{$data['dir']}/". ucwords($data['file_name']). "Model.php";
       if(file_exists($modelFile)){
           $this->warning('提示：模型已存在不给予覆盖,请删除源文件！');
       }
       $MakeMain = new MakeMain();
       $MakeMain->run($data);

   }
}
