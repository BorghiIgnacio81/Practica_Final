<!DOCTYPE html>
<html lang="es">
<head>
    
    <?php
    include_once("controlador/index.php");
    include_once("controlador/login_controlador.php");
    include_once("controlador/libros_controlador.php");
    include_once("controlador/usuarios_controlador.php");
    include_once("modelo/login_modelo.php");
    include_once("modelo/Libros_modelo.php");
    include_once("modelo/Usuarios_modelo.php");
    $plantilla = new ControladorIndex();
    $plantilla->ctrMostrarPlantilla();
    ?>

</head>
<body>
   
</body>
</html>




