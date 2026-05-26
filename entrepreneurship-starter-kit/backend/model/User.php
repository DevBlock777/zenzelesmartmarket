<?php

class User {
    private $id;
    private $name;
    private $email;
    private $password;
    private $address;
    private $pin;
    private $pkey;

    public function __construct($id, $name, $email, $password, $address, $pin, $pkey) {
        $this->id = $id;
        $this->name = $name;
        $this->email = $email;
        $this->password = $password;
        $this->address = $address;
        $this->pin = $pin;
        $this->pkey = $pkey;
    }

    public function getId() {
        return $this->id;
    }

    public function getName() {
        return $this->name;
    }

    public function getEmail() {
        return $this->email;
    }

    public function getPassword() {
        return $this->password;
    }

    public function getAddress() {
        return $this->address;
    }

    public function getPin() {
        return $this->pin;
    }

    public function getPkey() {
        return $this->pkey;
    }
}
