<?php
include 'Modelo/conexionDB.php';
class ControladorLibros{
    static public function ctrMostrarDatos($item, $valor)
    {
    $respuesta = MostrarLibros::mdlMostrarDatos($item, $valor);
    return $respuesta;
    }
}
?>
