<?php

use Phalcon\Mvc\Model;

class Objects extends Model
{
    /**
     *
     * @var string
     * @Primary
     * @Identity
     * @Column(type="string", length=20, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $name;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $description;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $image;

    /**
     *
     * @var double
     * @Column(type="double", length=8, nullable=false)
     */
    public $lang;

    /**
     *
     * @var double
     * @Column(type="double", length=8, nullable=false)
     */
    public $long;

    /**
     *
     * @var string
     * @Column(type="string", length=20, nullable=true)
     */
    public $user_id;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $date_added;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSource("Objects");
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

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'Objects';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Objects[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Objects
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    /**
     * Event before object is saved
     */
    public function beforeCreate()
    {
        $this->date_added = date('Y-m-d H:i:s');
    }
}