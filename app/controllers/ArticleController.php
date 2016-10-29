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
        $article = Articles::getByIdent($ident);
        $this->view->article = $article;
        if ($article->object_id > 0) {
            // имаме обект към тази статия
            $this->view->object = $article->Objects;
        }

        if (
            isset($_POST['title']) && !empty($_POST['title']) &&
            isset($_POST['body']) && !empty($_POST['body']) &&
            isset($_POST['email']) && !empty($_POST['email'])
        ) {
            // търсим дали имаме такъв потребител вече
            $user = Users::findFirst("email = '".filter_var($_POST['email'], FILTER_SANITIZE_EMAIL)."'");
            if ($user) {
                // имаме потребител
            } else {
                // нямаме потребител, трябва да създадем такъв
                $user = new Users();
                $user->email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
                $user->active = 1;
                $user->type = 'user';
                $user->save();
            }
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
                $article->object_id = 0;
                $article->parent_id = 0;

                $article->date_added = date("Y-m-d H:i:s");
                $article->creator_id = $user->id;
                $article->title = filter_var($_POST['title'], FILTER_SANITIZE_STRING);
                $article->subtitle = filter_var($_POST['subtitle'], FILTER_SANITIZE_STRING);
                $article->body = filter_var($_POST['body'], FILTER_SANITIZE_STRING);
                $article->version = 0;
                $article->save();
            }
            $this->view->message = "Данните са записани успешно!";
        } else {
            $this->view->message = "Моя попълнете заглавие, съдържание и вашият email адрес!";
        }
    }
}