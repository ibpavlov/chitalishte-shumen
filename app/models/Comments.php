<?php

use Phalcon\Mvc\Model;

class Comments extends Model
{
    public $id;

    public function initialize()
    {
        $this->hasOne('creator_id', 'Users', 'id');
    }

    public function beforeCreate()
    {
        $this->date_added = date('Y-m-d H:i:s');
    }
}