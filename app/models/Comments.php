<?php

use Phalcon\Mvc\Model;

class Comments extends Model
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
     * @Column(type="string", length=20, nullable=false)
     */
    public $article_id;

    /**
     *
     * @var string
     * @Column(type="string", length=20, nullable=false)
     */
    public $creator_id;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $date_added;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $body;

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return CommentsCopy[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return CommentsCopy
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    /**
     *
     */
    public function initialize()
    {
        $this->hasOne('creator_id', 'Users', 'id');
    }

    /**
     * Event before object is saved
     */
    public function beforeCreate()
    {
        $this->date_added = date('Y-m-d H:i:s');
    }
}