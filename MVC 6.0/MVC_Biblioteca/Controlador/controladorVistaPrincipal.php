<?php
class ControladorVistaPrincipal{

    public function ctrMostrarBusqueda(){
        include 'vistas/busco.php';
    }
    static public function url(){
        return "Http://localhost/UTN-PRACTICAFINAL/MVC_Biblioteca/";
    }
}