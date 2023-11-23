<?php
require_once 'Controlador/controladorVistaPrincipal.php';
require_once 'Controlador/libros.controlador.php';
// require_once 'Controladores/usuarios.controlador.php';
$Busqueda =  new ControladorVistaPrincipal();
$Busqueda->ctrMostrarBusqueda();