<?php
include_once __DIR__ . '/../modelo/login_modelo.php';

set_include_path(get_include_path() . PATH_SEPARATOR . __DIR__ . '/../modelo/');
include_once 'login_modelo.php';
class LoginControlador
{
    public function login_controlador($datos)
    {
        if (isset($datos["nombre_usuario"])) {
            $encriptar = password_hash($datos["password"], PASSWORD_DEFAULT);
            $datos = array(
                "nombre_usuario"=> $datos["nombre_usuario"],
                "password"=> $encriptar
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
