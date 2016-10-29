<?php

use Phalcon\Mvc\Model;

class Images extends Model
{
    public $id;

    public function initialize()
    {
        $this->belongsTo('article_id', 'Articles', 'id');
    }

    public function beforeCreate()
    {
        $this->date_added = date('Y-m-d H:i:s');
    }

}