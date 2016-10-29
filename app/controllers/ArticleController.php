<?php

use Phalcon\Mvc\Controller;

class ArticleController extends Controller
{
    public function renderAction($ident)
    {
        $this->view->objects = Objects::find();
        $article = Articles::getByIdent($ident);
        $this->view->article = $article;
        if ($article->object_id > 0) {
            // имаме обект към тази статия
            $this->view->object = $article->Objects;
        }
    }

    public function editAction($ident)
    {
        $this->view->objects = Objects::find();
        $article = Articles::getByIdent($ident);
        $this->view->article = $article;
        if ($article->object_id > 0) {
            // имаме обект към тази статия
            $this->view->object = $article->Objects;
        }
    }

    public function saveAction($ident)
    {
        $this->view->objects = Objects::find();
        $this->view->article = Articles::getByIdent($ident);
    }

}