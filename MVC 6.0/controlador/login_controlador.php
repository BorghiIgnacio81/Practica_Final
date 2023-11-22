<?php
include_once __DIR__ . '/../modelo/login_modelo.php';

set_include_path(get_include_path() . PATH_SEPARATOR . __DIR__ . '../modelo/');
include_once '../modelo/login_modelo.php';
class LoginControlador
{
    public static function login_controlador($datos)
    {
        
        if (isset($datos["nombre_usuario"])) {
            $encriptar = crypt($datos["password"], '2a$07$usesomesillyhrdrreererherhe$');
            $datos = array(
                "nombre_usuario" => $datos["nombre_usuario"],
                "password" => $encriptar
            );

            $respuesta = LoginModelo::login_modelo($datos["nombre_usuario"], $datos["password"]);
            
            if ($respuesta['success']){
                header("Location: ../vistas/control-panel.php");
                exit();
            } else {
                echo "Login fallido: " . $respuesta['message'];
            }
        }
    }
}
?>
