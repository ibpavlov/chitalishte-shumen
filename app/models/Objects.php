<?php

use Phalcon\Mvc\Model;

class Objects extends Model
{
    public $id;

    public function initialize()
    {
        $this->hasOne('creator_id', 'Users', 'id');
        $this->hasMany('id', 'Articles', 'object_id');
        $this->hasMany('id', 'Articles', 'object_id',[
            "alias" => "news",
            "params"=> [
                "conditions" => "type='news'"
            ]
        ]);
        $this->hasMany('id', 'Articles', 'object_id',[
            "alias" => "events",
            "params"=> [
                "conditions" => "type='event'"
            ]
        ]);
        $this->hasManyToMany('id', 'Articles', 'object_id','id',"Images","article_id",[
            "alias" => "images",
            "params"=> [
                "order" => "Images.date_added DESC"
            ]
        ]);
        $this->hasMany('id', 'Articles', 'object_id',[
            "alias" => "gallery",
            "params"=> [
                "conditions" => "type='gallery'"
            ]
        ]);
        $this->hasOne('id', 'Articles', 'object_id',
            ['alias' => 'home',
            'params' => [
                'conditions' => "parent_id=0 AND status = 'active' AND version=0 "
            ]]);
    }
}