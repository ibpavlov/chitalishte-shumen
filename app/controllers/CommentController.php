<?php

use Phalcon\Mvc\Controller;

class CommentController extends Controller
{

    public function indexAction()
    {
        $this->view->objects = Objects::find();
        $this->view->article = Articles::getByIdent("home");
    }

    public function postAction()
    {
        $email = $this->request->get("email");
        $body = $this->request->get("comment");
        $articleId = $this->request->get("article_id");

        $user = Users::findOrCreate($email);

        $comment = new Comments();
        $comment->body = $body;
        $comment->article_id = $articleId;
        $comment->creator_id = $user->id;
        $comment->save();

        $this->response->redirect($this->request->getHTTPReferer());
    }
}