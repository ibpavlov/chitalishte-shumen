<?php

use Phalcon\Mvc\Model;

class Articles extends Model
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
    public $ident;

    /**
     *
     * @var string
     * @Column(type="string", length=20, nullable=false)
     */
    public $parent_id;

    /**
     *
     * @var string
     * @Column(type="string", length=20, nullable=false)
     */
    public $object_id;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $title;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $subtitle;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $body;

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
    public $date_last_edit;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $date_deleted;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $status;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $type;

    /**
     *
     * @var string
     * @Column(type="string", length=20, nullable=false)
     */
    public $creator_id;

    /**
     *
     * @var string
     * @Column(type="string", length=20, nullable=false)
     */
    public $version;

    /**
     *
     * @var string
     * @Column(type="string", length=20, nullable=false)
     */
    public $version_parent_id;

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'articles';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Articles[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Articles
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function initialize()
    {
        $this->hasOne('creator_id', 'Users', 'id');
        $this->belongsTo('object_id', 'Objects', 'id');
        $this->hasMany('id', 'Comments', 'article_id', [
            "params"=> [
                'order'=>'date_added DESC'
            ]
        ]);
        $this->hasOne('ident', 'Articles', 'ident', [
            "alias" => "latest",
            "params" => [
                "order" => "version DESC"
            ]
        ]);
        $this->hasMany('id', 'Comments', 'article_id', [
            "params"=> [
                'order'=>'date_added DESC'
            ]
        ]);
    }

    /**
     * @param $ident
     * @param string $check_for_status
     * @return Articles|bool
     */
    public static function getByIdent($ident, $check_for_status = 'all')
    {
        $conditions = "ident = '".$ident."'";
        if ($check_for_status != "all") {
            $conditions.=" AND status = 'active'";
        }

        $original = Articles::findFirst($conditions." AND version = 0");

        if ($original) {
            $data = Articles::findFirst(
                array(
                    "conditions" => $conditions,
                    "order" => "version DESC",
                )
            );
            if ($data) {
                $original->title = $data->title;
                $original->subtitle = $data->subtitle;
                $original->body = $data->body;
                $original->date_last_edit = $data->date_last_edit;
                $original->editor = $data->Users;
                return $original;
            }
        }

        return false;
    }

    /**
     * Event before object is saved
     */
    public function beforeCreate()
    {
        $this->date_added = date('Y-m-d H:i:s');
        $this->date_last_edit = date('Y-m-d H:i:s');
    }

    /**
     * Event before object is saved
     */
    public function beforeUpdate()
    {
        $this->date_last_edit = date('Y-m-d H:i:s');
    }
}