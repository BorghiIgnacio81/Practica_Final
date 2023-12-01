<?php
    include_once("controlador/main_controlador.php");
    include_once("controlador/login_controlador.php");
    include_once("modelo/Libros_modelo.php");
    include_once("controlador/libros_controlador.php");

    if(isset($_POST["logout"])){
        session_destroy();
        $_SESSION = null;
        $_GET = null;
        $_POST = null;
        llamarPagina(0);
    }

    //Login data
    if(isset($_POST["nombre_usuario"]) && isset($_POST["contrasenia"])){
        LoginControlador::login_controlador(array("nombre_usuario" => $_POST["nombre_usuario"], "password"=>$_POST["contrasenia"]));
    }
    
    if(isset($_SESSION['tipoUsuario'])){
        switch($_SESSION['tipoUsuario']){
            case 0:
            case 1:
            case 2:
                include_once("controlador/libros_controlador.php");
                include_once("controlador/usuarios_controlador.php");
                include_once("modelo/Libros_modelo.php");
                include_once("modelo/Usuarios_modelo.php");
                llamarPagina(1);
                break;
            default:
                llamarPagina(0);
        }
    }

    //Registro1 data
    if(isset($_POST["r-username"]) && isset($_POST["r-password"]) && isset($_POST["r-email"])){
        LoginControlador::registro_controlador(array("nombre_usuario" => $_POST["r-username"], "password"=>$_POST["r-password"], "email"=>$_POST["r-email"]));
        if($_GET["status"] == "ok")
            llamarPagina(2);
        else
            llamarPagina(0);
    }

    //Registro2 data
    if(isset($_POST["r2-nombre"]) && isset($_POST["r2-apellido"]) && isset($_POST["r2-dni"]) && isset($_POST["r2-fechaNac"]) && isset($_POST["r2-domicilio"]) && isset($_POST["r2-telefono"]) && isset($_POST["r2-email"])){
        $_GET = null;
        LoginControlador::registro2_controlador(array(
            "nombre" => $_POST["r2-nombre"],
            "apellido" => $_POST["r2-apellido"] ,
            "dni" => $_POST["r2-dni"] ,
            "fechaNac" => $_POST["r2-fechaNac"] ,
            "direccion" => $_POST["r2-domicilio"] ,
            "telefono" => $_POST["r2-telefono"],
            "re-email" => $_POST["r2-email"]
        ));
        llamarPagina(0);
    }
    
    function llamarPagina($pagina){
        $plantilla = new ControladorIndex();
        $plantilla->ctrMostrarPlantilla($pagina);
        die();
    }

    llamarPagina(0);
?>