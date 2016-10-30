<?php
 
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;


class CommentsController extends AdminController
{
    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for comments
     */
    public function searchAction()
    {
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, 'Comments', $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = [];
        }
        $parameters["order"] = "id";

        $comments = Comments::find($parameters);
        if (count($comments) == 0) {
            $this->flash->notice("The search did not find any comments");

            $this->dispatcher->forward([
                "controller" => "comments",
                "action" => "index"
            ]);

            return;
        }

        $paginator = new Paginator([
            'data' => $comments,
            'limit'=> 10,
            'page' => $numberPage
        ]);

        $this->view->page = $paginator->getPaginate();
    }

    /**
     * Displays the creation form
     */
    public function newAction()
    {

    }

    /**
     * Edits a comment
     *
     * @param string $id
     */
    public function editAction($id)
    {
        if (!$this->request->isPost()) {

            $comment = Comments::findFirstByid($id);
            if (!$comment) {
                $this->flash->error("comment was not found");

                $this->dispatcher->forward([
                    'controller' => "comments",
                    'action' => 'index'
                ]);

                return;
            }

            $this->view->id = $comment->id;

            $this->tag->setDefault("id", $comment->id);
            $this->tag->setDefault("article_id", $comment->article_id);
            $this->tag->setDefault("creator_id", $comment->creator_id);
            $this->tag->setDefault("date_added", $comment->date_added);
            $this->tag->setDefault("body", $comment->body);
            
        }
    }

    /**
     * Creates a new comment
     */
    public function createAction()
    {
        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "comments",
                'action' => 'index'
            ]);

            return;
        }

        $comment = new Comments();
        $comment->article_id = $this->request->getPost("article_id");
        $comment->creator_id = $this->request->getPost("creator_id");
        $comment->date_added = $this->request->getPost("date_added");
        $comment->body = $this->request->getPost("body");
        

        if (!$comment->save()) {
            foreach ($comment->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "comments",
                'action' => 'new'
            ]);

            return;
        }

        $this->flash->success("comment was created successfully");

        $this->dispatcher->forward([
            'controller' => "comments",
            'action' => 'index'
        ]);
    }

    /**
     * Saves a comment edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "comments",
                'action' => 'index'
            ]);

            return;
        }

        $id = $this->request->getPost("id");
        $comment = Comments::findFirstByid($id);

        if (!$comment) {
            $this->flash->error("comment does not exist " . $id);

            $this->dispatcher->forward([
                'controller' => "comments",
                'action' => 'index'
            ]);

            return;
        }

        $comment->article_id = $this->request->getPost("article_id");
        $comment->creator_id = $this->request->getPost("creator_id");
        $comment->date_added = $this->request->getPost("date_added");
        $comment->body = $this->request->getPost("body");
        

        if (!$comment->save()) {

            foreach ($comment->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "comments",
                'action' => 'edit',
                'params' => [$comment->id]
            ]);

            return;
        }

        $this->flash->success("comment was updated successfully");

        $this->dispatcher->forward([
            'controller' => "comments",
            'action' => 'index'
        ]);
    }

    /**
     * Deletes a comment
     *
     * @param string $id
     */
    public function deleteAction($id)
    {
        $comment = Comments::findFirstByid($id);
        if (!$comment) {
            $this->flash->error("comment was not found");

            $this->dispatcher->forward([
                'controller' => "comments",
                'action' => 'index'
            ]);

            return;
        }

        if (!$comment->delete()) {

            foreach ($comment->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "comments",
                'action' => 'search'
            ]);

            return;
        }

        $this->flash->success("comment was deleted successfully");

        $this->dispatcher->forward([
            'controller' => "comments",
            'action' => "index"
        ]);
    }

}
