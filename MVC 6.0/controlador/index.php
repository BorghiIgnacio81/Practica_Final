<?php
// UsuariosController::index();
class ControladorIndex
{
    
    public function ctrMostrarPlantilla()
    {

        include_once 'vistas/control-panel.php';

    }

    static public function url()
    {
        return "http://localhost/MVC 6.0/";
    }

    

}
?>