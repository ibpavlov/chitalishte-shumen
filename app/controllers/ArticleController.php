<?php

use Phalcon\Mvc\Controller;

class ObjectController extends Controller
{

    public function editAction($ident)
    {
        $this->view->objects = Objects::find();
        $this->view->article = Articles::getByIdent($ident);
    }

    public function saveAction($ident)
    {
        $this->view->objects = Objects::find();
        $this->view->article = Articles::getByIdent($ident);
    }

}