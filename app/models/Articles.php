<?php

use Phalcon\Mvc\Model;

class Articles extends Model
{
    public $id;

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
    }

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
}