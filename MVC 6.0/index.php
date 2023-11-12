<!DOCTYPE html>
<html lang="es">
<head>
    
    <?php
    include_once("controlador/index.php");
    include_once("controlador/libros_controlador.php");
    include_once("controlador/usuarios_controlador.php");
    include_once("modelo/Libros_modelo.php");
    include_once("modelo/Usuarios_modelo.php");
    $plantilla = new ControladorIndex();
    $plantilla->ctrMostrarPlantilla();
    ?>
    <!-- Scripts -->
    <script src="vistas/js/classes/Libro.js"></script>
    <script src="vistas/js/classes/Usuario.js"></script>
    <script src="vistas/js/calendario.js"></script>
    <script src="vistas/js/reservas.js"></script>
    <script src="vistas/js/dashboard-menu.js"></script>
    <script src="vistas/js/user.js"></script>
    <script src="vistas/js/libro.js"></script>
    <script src="vistas/js/prestamo.js"></script>
    <script src="vistas/js/solicitar-libro.js"></script>

    

    
    
</head>
<body>
   
</body>
</html>




