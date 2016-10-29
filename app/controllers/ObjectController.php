<?php

use Phalcon\Mvc\Controller;

class ObjectController extends Controller
{

    public function indexAction($id)
    {
        $this->view->objects = Objects::find();
        $this->view->object = Objects::findFirst($id);
    }



}