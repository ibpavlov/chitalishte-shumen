<?php

use Phalcon\Mvc\Model;

class Objects extends Model
{
    public $id;

    public function initialize()
    {
        $this->hasOne('creator_id', 'Users', 'id');
        $this->hasMany('id', 'Articles', 'object_id');
        $this->hasOne('id', 'Articles', 'object_id',
            ['alias' => 'home',
            'params' => [
                'conditions' => "parent_id=0 AND status = 'active' AND version=0 "
            ]]);
    }
}