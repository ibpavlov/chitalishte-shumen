<?php
 
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;


class ArticlesController extends AdminController
{
    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for articles
     */
    public function searchAction()
    {
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, 'Articles', $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = [];
        }
        $parameters["order"] = "id";

        $articles = Articles::find($parameters);
        if (count($articles) == 0) {
            $this->flash->notice("The search did not find any articles");

            $this->dispatcher->forward([
                "controller" => "articles",
                "action" => "index"
            ]);

            return;
        }

        $paginator = new Paginator([
            'data' => $articles,
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
     * Edits a article
     *
     * @param string $id
     */
    public function editAction($id)
    {
        if (!$this->request->isPost()) {

            $article = Articles::findFirstByid($id);
            if (!$article) {
                $this->flash->error("article was not found");

                $this->dispatcher->forward([
                    'controller' => "articles",
                    'action' => 'index'
                ]);

                return;
            }

            $this->view->id = $article->id;

            $this->tag->setDefault("id", $article->id);
            $this->tag->setDefault("ident", $article->ident);
            $this->tag->setDefault("parent_id", $article->parent_id);
            $this->tag->setDefault("object_id", $article->object_id);
            $this->tag->setDefault("title", $article->title);
            $this->tag->setDefault("subtitle", $article->subtitle);
            $this->tag->setDefault("body", $article->body);
            $this->tag->setDefault("date_added", $article->date_added);
            $this->tag->setDefault("date_last_edit", $article->date_last_edit);
            $this->tag->setDefault("date_deleted", $article->date_deleted);
            $this->tag->setDefault("status", $article->status);
            $this->tag->setDefault("type", $article->type);
            $this->tag->setDefault("creator_id", $article->creator_id);
            $this->tag->setDefault("version", $article->version);
            $this->tag->setDefault("version_parent_id", $article->version_parent_id);
            
        }
    }

    /**
     * Creates a new article
     */
    public function createAction()
    {
        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "articles",
                'action' => 'index'
            ]);

            return;
        }

        $article = new Articles();
        $article->ident = $this->request->getPost("ident");
        $article->parent_id = $this->request->getPost("parent_id");
        $article->object_id = $this->request->getPost("object_id");
        $article->title = $this->request->getPost("title");
        $article->subtitle = $this->request->getPost("subtitle");
        $article->body = $this->request->getPost("body");
        $article->date_added = $this->request->getPost("date_added");
        $article->date_last_edit = $this->request->getPost("date_last_edit");
        $article->date_deleted = $this->request->getPost("date_deleted");
        $article->status = $this->request->getPost("status");
        $article->type = $this->request->getPost("type");
        $article->creator_id = $this->request->getPost("creator_id");
        $article->version = $this->request->getPost("version");
        $article->version_parent_id = $this->request->getPost("version_parent_id");
        

        if (!$article->save()) {
            foreach ($article->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "articles",
                'action' => 'new'
            ]);

            return;
        }

        $this->flash->success("article was created successfully");

        $this->dispatcher->forward([
            'controller' => "articles",
            'action' => 'index'
        ]);
    }

    /**
     * Saves a article edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "articles",
                'action' => 'index'
            ]);

            return;
        }

        $id = $this->request->getPost("id");
        $article = Articles::findFirstByid($id);

        if (!$article) {
            $this->flash->error("article does not exist " . $id);

            $this->dispatcher->forward([
                'controller' => "articles",
                'action' => 'index'
            ]);

            return;
        }

        $article->ident = $this->request->getPost("ident");
        $article->parent_id = $this->request->getPost("parent_id");
        $article->object_id = $this->request->getPost("object_id");
        $article->title = $this->request->getPost("title");
        $article->subtitle = $this->request->getPost("subtitle");
        $article->body = $this->request->getPost("body");
        $article->date_added = $this->request->getPost("date_added");
        $article->date_last_edit = $this->request->getPost("date_last_edit");
        $article->date_deleted = $this->request->getPost("date_deleted");
        $article->status = $this->request->getPost("status");
        $article->type = $this->request->getPost("type");
        $article->creator_id = $this->request->getPost("creator_id");
        $article->version = $this->request->getPost("version");
        $article->version_parent_id = $this->request->getPost("version_parent_id");
        

        if (!$article->save()) {

            foreach ($article->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "articles",
                'action' => 'edit',
                'params' => [$article->id]
            ]);

            return;
        }

        $this->flash->success("article was updated successfully");

        $this->dispatcher->forward([
            'controller' => "articles",
            'action' => 'index'
        ]);
    }

    /**
     * Deletes a article
     *
     * @param string $id
     */
    public function deleteAction($id)
    {
        $article = Articles::findFirstByid($id);
        if (!$article) {
            $this->flash->error("article was not found");

            $this->dispatcher->forward([
                'controller' => "articles",
                'action' => 'index'
            ]);

            return;
        }

        if (!$article->delete()) {

            foreach ($article->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "articles",
                'action' => 'search'
            ]);

            return;
        }

        $this->flash->success("article was deleted successfully");

        $this->dispatcher->forward([
            'controller' => "articles",
            'action' => "index"
        ]);
    }

}
