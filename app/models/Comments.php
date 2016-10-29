<?php

use Phalcon\Mvc\Model;

class Comments extends Model
{
    public $id;

    public function initialize()
    {
        $this->hasOne('creator_id', 'Users', 'id');
    }
}