<?php

use Phalcon\Mvc\Model;

class Users extends Model
{
    public $id;

    public static function findOrCreate($email)
    {
        $user = self::findFirstByEmail($email);
        if(!$user) {
            $user = new Users();
            $user->email = $email;
            $user->save();
        }
        return $user;
    }
}