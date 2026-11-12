<?php
/**
 * El objetivo de este archivo es obtener la URL solicitada por el usuario.
 */

class Request
{
    public $url;
    public $controller;
    public $action;
    public $params;

    public function __construct()
    {
        $this->url = $_SERVER["REQUEST_URI"];
        $this->controller = null;
        $this->action = null;
        $this->params = [];
    }
}
