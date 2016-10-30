<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as Email;

class Users extends Model
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
    public $email;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $password;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $first_name;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $last_name;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=false)
     */
    public $active;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $type;

    /**
     * Validations and business logic
     *
     * @return boolean
     */
    public function validation()
    {
        $this->validate(
            new Email(
                [
                    'field'    => 'email',
                    'required' => true,
                ]
            )
        );

        if ($this->validationHasFailed() == true) {
            return false;
        }

        return true;
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'users';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Users[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Users
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    /**
     * @param $email
     * @return Users
     */
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

    /**
     * Event before object is saved
     */
    public function beforeCreate()
    {
        $this->date_added = date('Y-m-d H:i:s');
    }
}