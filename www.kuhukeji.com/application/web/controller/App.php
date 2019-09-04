<?php

namespace app\web\controller;

use app\web\controller\Common;
class App extends Common
{
    protected $selectIndex = 2;

    public function index()
    {
      
      
        return  $this->fetch();
    }


}

