<?php
 
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;


class ImagesController extends AdminController
{
    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for images
     */
    public function searchAction()
    {
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, 'Images', $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = [];
        }
        $parameters["order"] = "id";

        $images = Images::find($parameters);
        if (count($images) == 0) {
            $this->flash->notice("The search did not find any images");

            $this->dispatcher->forward([
                "controller" => "images",
                "action" => "index"
            ]);

            return;
        }

        $paginator = new Paginator([
            'data' => $images,
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
     * Edits a image
     *
     * @param string $id
     */
    public function editAction($id)
    {
        if (!$this->request->isPost()) {

            $image = Images::findFirstByid($id);
            if (!$image) {
                $this->flash->error("image was not found");

                $this->dispatcher->forward([
                    'controller' => "images",
                    'action' => 'index'
                ]);

                return;
            }

            $this->view->id = $image->id;

            $this->tag->setDefault("id", $image->id);
            $this->tag->setDefault("article_id", $image->article_id);
            $this->tag->setDefault("path", $image->path);
            $this->tag->setDefault("title", $image->title);
            $this->tag->setDefault("date_added", $image->date_added);
            $this->tag->setDefault("creator_id", $image->creator_id);
            
        }
    }

    /**
     * Creates a new image
     */
    public function createAction()
    {
        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "images",
                'action' => 'index'
            ]);

            return;
        }

        $image = new Images();
        $image->article_id = $this->request->getPost("article_id");
        $image->path = $this->request->getPost("path");
        $image->title = $this->request->getPost("title");
        $image->date_added = $this->request->getPost("date_added");
        $image->creator_id = $this->request->getPost("creator_id");
        

        if (!$image->save()) {
            foreach ($image->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "images",
                'action' => 'new'
            ]);

            return;
        }

        $this->flash->success("image was created successfully");

        $this->dispatcher->forward([
            'controller' => "images",
            'action' => 'index'
        ]);
    }

    /**
     * Saves a image edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "images",
                'action' => 'index'
            ]);

            return;
        }

        $id = $this->request->getPost("id");
        $image = Images::findFirstByid($id);

        if (!$image) {
            $this->flash->error("image does not exist " . $id);

            $this->dispatcher->forward([
                'controller' => "images",
                'action' => 'index'
            ]);

            return;
        }

        $image->article_id = $this->request->getPost("article_id");
        $image->path = $this->request->getPost("path");
        $image->title = $this->request->getPost("title");
        $image->date_added = $this->request->getPost("date_added");
        $image->creator_id = $this->request->getPost("creator_id");
        

        if (!$image->save()) {

            foreach ($image->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "images",
                'action' => 'edit',
                'params' => [$image->id]
            ]);

            return;
        }

        $this->flash->success("image was updated successfully");

        $this->dispatcher->forward([
            'controller' => "images",
            'action' => 'index'
        ]);
    }

    /**
     * Deletes a image
     *
     * @param string $id
     */
    public function deleteAction($id)
    {
        $image = Images::findFirstByid($id);
        if (!$image) {
            $this->flash->error("image was not found");

            $this->dispatcher->forward([
                'controller' => "images",
                'action' => 'index'
            ]);

            return;
        }

        if (!$image->delete()) {

            foreach ($image->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "images",
                'action' => 'search'
            ]);

            return;
        }

        $this->flash->success("image was deleted successfully");

        $this->dispatcher->forward([
            'controller' => "images",
            'action' => "index"
        ]);
    }

}
