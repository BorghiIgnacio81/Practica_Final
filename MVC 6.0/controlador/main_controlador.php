<?php

class ControladorIndex{
    
    public function ctrMostrarPlantilla($pagina){
        switch($pagina){
            case 1:
                include_once 'vistas/control-panel.php';
                break;
            default: 
                include_once 'vistas/index-preview.php';
        }
    }

    static public function url()
    {
        return "http://localhost/MVC 6.0/";
    }

}
?>