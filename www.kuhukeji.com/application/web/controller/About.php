<?php

namespace app\web\controller;

class About extends Common
{
    protected $selectIndex = 4;
    public function index()
    {
        return  $this->fetch();
    }


}
