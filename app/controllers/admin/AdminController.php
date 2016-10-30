<?php
 
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;


class AdminController extends BaseController
{

    /**
     * When object is initialized set base view dir to admin
     */
    public function initialize()
    {
        parent::initialize();
        if(strpos($this->view->getViewsDir(),"admin/") == false) {
            $this->view->setViewsDir($this->view->getViewsDir()."admin/");
        }
        if(isset($_GET['admin_pass']) && $_GET['admin_pass'] == "shumen") {
            $this->session->set("admin","shumen");
        }
        if(!($this->session->has("admin") && $this->session->get("admin") == "shumen")) {
            $this->flash->error("Нямате права");
            $this->response->redirect("/");
        }
    }

}
