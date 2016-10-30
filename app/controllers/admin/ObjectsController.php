<?php
 
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;


class ObjectsController extends AdminController
{
    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for objects
     */
    public function searchAction()
    {
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, 'Objects', $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = [];
        }
        $parameters["order"] = "id";

        $objects = Objects::find($parameters);
        if (count($objects) == 0) {
            $this->flash->notice("The search did not find any objects");

            $this->dispatcher->forward([
                "controller" => "objects",
                "action" => "index"
            ]);

            return;
        }

        $paginator = new Paginator([
            'data' => $objects,
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
     * Edits a object
     *
     * @param string $id
     */
    public function editAction($id)
    {
        if (!$this->request->isPost()) {

            $object = Objects::findFirstByid($id);
            if (!$object) {
                $this->flash->error("object was not found");

                $this->dispatcher->forward([
                    'controller' => "objects",
                    'action' => 'index'
                ]);

                return;
            }

            $this->view->id = $object->id;

            $this->tag->setDefault("id", $object->id);
            $this->tag->setDefault("name", $object->name);
            $this->tag->setDefault("description", $object->description);
            $this->tag->setDefault("image", $object->image);
            $this->tag->setDefault("lang", $object->lang);
            $this->tag->setDefault("long", $object->long);
            $this->tag->setDefault("user_id", $object->user_id);
            
        }
    }

    /**
     * Creates a new object
     */
    public function createAction()
    {
        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "objects",
                'action' => 'index'
            ]);

            return;
        }

        $object = new Objects();
        $object->name = $this->request->getPost("name");
        $object->description = $this->request->getPost("description");
        $object->image = $this->request->getPost("image");
        $object->lang = $this->request->getPost("lang");
        $object->long = $this->request->getPost("long");
        $object->user_id = $this->request->getPost("user_id");
        

        if (!$object->save()) {
            foreach ($object->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "objects",
                'action' => 'new'
            ]);

            return;
        }

        $this->flash->success("object was created successfully");

        $this->dispatcher->forward([
            'controller' => "objects",
            'action' => 'index'
        ]);
    }

    /**
     * Saves a object edited
     *
     */
    public function saveAction()
    {
        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "objects",
                'action' => 'index'
            ]);

            return;
        }

        $id = $this->request->getPost("id");
        $object = Objects::findFirstByid($id);

        if (!$object) {
            $this->flash->error("object does not exist " . $id);

            $this->dispatcher->forward([
                'controller' => "objects",
                'action' => 'index'
            ]);

            return;
        }

        $object->name = $this->request->getPost("name");
        $object->description = $this->request->getPost("description");
        $object->image = $this->request->getPost("image");
        $object->lang = $this->request->getPost("lang");
        $object->long = $this->request->getPost("long");
        $object->user_id = $this->request->getPost("user_id");
        

        if (!$object->save()) {

            foreach ($object->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "objects",
                'action' => 'edit',
                'params' => [$object->id]
            ]);

            return;
        }

        $this->flash->success("object was updated successfully");

        $this->dispatcher->forward([
            'controller' => "objects",
            'action' => 'index'
        ]);
    }

    /**
     * Deletes a object
     *
     * @param string $id
     */
    public function deleteAction($id)
    {
        $object = Objects::findFirstByid($id);
        if (!$object) {
            $this->flash->error("object was not found");

            $this->dispatcher->forward([
                'controller' => "objects",
                'action' => 'index'
            ]);

            return;
        }

        if (!$object->delete()) {

            foreach ($object->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "objects",
                'action' => 'search'
            ]);

            return;
        }

        $this->flash->success("object was deleted successfully");

        $this->dispatcher->forward([
            'controller' => "objects",
            'action' => "index"
        ]);
    }

}
