<?php

use Phalcon\Mvc\Model;

class Images extends Model
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
     * @Column(type="string", length=20, nullable=true)
     */
    public $article_id;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $path;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $title;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $date_added;

    /**
     *
     * @var string
     * @Column(type="string", length=20, nullable=true)
     */
    public $creator_id;

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'images';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Images[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Images
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function initialize()
    {
        $this->belongsTo('article_id', 'Articles', 'id');
    }

    /**
     * Event before object is saved
     */
    public function beforeCreate()
    {
        $this->date_added = date('Y-m-d H:i:s');
    }

}