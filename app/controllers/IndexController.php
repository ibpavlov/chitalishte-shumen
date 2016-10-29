<?php

use Phalcon\Mvc\Controller;

class IndexController extends Controller
{

    public function indexAction()
    {
        $this->view->objects = Objects::find();
        $this->view->article = Articles::getByIdent("home");
    }
}