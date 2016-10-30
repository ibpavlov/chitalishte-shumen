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
    }

}