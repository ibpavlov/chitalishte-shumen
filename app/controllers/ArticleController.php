<?php

use Phalcon\Mvc\Controller;

class ArticleController extends Controller
{
    public function renderAction($ident)
    {
        $this->view->objects = Objects::find();
        $article = Articles::getByIdent($ident);
        if($article->parent_id == 0) {
            $this->dispatcher->forward([
                "controller" => "object",
                "action" => "index",
                "params" => [
                    $article->object_id
                ]
            ]);
            return;
        }

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

    public function createAction($parentIdent)
    {
        $this->view->objects = Objects::find();
        $article = Articles::getByIdent($parentIdent);
        $this->view->article = $article;
        if ($article->object_id > 0) {
            // имаме обект към тази статия
            $this->view->object = $article->Objects;
        }
    }

    public function createsaveAction()
    {
        if(!isset($_POST['ident']) || !isset($_POST['parent_ident'])) {
            $this->flash->error("Пътя не е намерен");
            $this->dispatcher->forward([
                "controller" => "Index",
                "action" => "index"
            ]);
            return;
        }
        $article = Articles::findFirstByIdent($_POST['ident']);
        if($article) {
            $this->flash->error("URL пътя вече съшествува - въведете друг");
            $this->dispatcher->forward([
                "controller" => "article",
                "action" => "craete",
                "params" => [
                    isset($_POST['parent_ident']) ? $_POST['parent_ident'] : ""
                ]
            ]);
        } else {
            $this->dispatcher->forward([
                "controller" => "article",
                "action" => "save",
                "params" => [
                    $_POST['ident']
                ]
            ]);
        }
    }

    public function saveAction($ident)
    {
        $this->view->objects = Objects::find();
        $article = Articles::getByIdent($ident);
        if($article) {
            $this->view->article = $article;
            if ($article->object_id > 0) {
                // имаме обект към тази статия
                $this->view->object = $article->Objects;
            }
        }

        if (
            isset($_POST['title']) && !empty($_POST['title']) &&
            isset($_POST['body']) && !empty($_POST['body']) &&
            isset($_POST['email']) && !empty($_POST['email'])
        ) {
            // търсим дали имаме такъв потребител вече
            $user = Users::findOrCreate(filter_var($_POST['email'], FILTER_SANITIZE_EMAIL));
            // проверяваме дали имаме вече такава статия
            $base = Articles::findFirst("ident = '".$ident."' AND version = 0");
            if ($base) {
                // има такава статия
                // вземаме последната налична версия
                $last_version = Articles::findFirst(array(
                    "conditions" => "ident = '".$ident."' AND version > 0",
                    "order" => "version DESC"
                ));
                if (isset($last_version->version) && $last_version->version > 0) {
                    // имаме предишна версия над базовата
                    $version = $last_version->version+1;
                } else {
                    // имаме само базове версия, това е първата след нея
                    $version = 1;
                }
                $article = new Articles();
                $article->ident = $ident;
                $article->date_last_edit = date("Y-m-d H:i:s");
                $article->creator_id = $user->id;
                $article->title = filter_var($_POST['title'], FILTER_SANITIZE_STRING);
                $article->subtitle = filter_var($_POST['subtitle'], FILTER_SANITIZE_STRING);
                $article->body = filter_var($_POST['body'], FILTER_SANITIZE_STRING);
                $article->version = $version;
                $article->save();
            } else {
                // нямаме предишни версии, това е новата базова
                $article = new Articles();
                $article->ident = $ident;
                // тук може би трябва да има начин да се получат и обект и събитие, за да се закачат правилно
                $article->object_id = isset($_POST['object_id']) && !empty($_POST['object_id']) ? $_POST['object_id'] : 0;
                $article->parent_id = isset($_POST['parent_id']) && !empty($_POST['parent_id']) ? $_POST['parent_id'] : 0;
                $article->type = isset($_POST['type']) && !empty($_POST['type']) ? $_POST['type'] : 'page';
                $article->status = 'active';

                $article->date_added = date("Y-m-d H:i:s");
                $article->creator_id = $user->id;
                $article->title = filter_var($_POST['title'], FILTER_SANITIZE_STRING);
                $article->subtitle = filter_var($_POST['subtitle'], FILTER_SANITIZE_STRING);
                $article->body = filter_var($_POST['body'], FILTER_SANITIZE_STRING);
                $article->version = 0;
                $article->save();
                $article->editor = $article->Users;
                $this->view->article = $article;
                if ($article->object_id > 0) {
                    // имаме обект към тази статия
                    $this->view->object = $article->Objects;
                }
            }
            $this->view->message = "Данните са записани успешно!";
        } else {
            $this->view->message = "Моя попълнете заглавие, съдържание и вашият email адрес!";
        }
    }
}