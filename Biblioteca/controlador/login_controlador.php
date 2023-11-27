<?php

include_once("modelo/login_modelo.php");

class LoginControlador{


    static public function login_controlador($datos){

        $username = $datos["nombre_usuario"];
        $encriptar = md5($datos["password"]);

        LoginModelo::login_modelo($username, $encriptar);

    }

    static public function registro_controlador($datos){

        $username = $datos["nombre_usuario"];
        $encriptar = md5($datos["password"]);
        $email = $datos["email"];

        LoginModelo::registro_modelo($username, $encriptar, $email);
    }

    static public function registro2_controlador($datos){
        LoginModelo::registro2_modelo(
            $datos["nombre"],
            $datos["apellido"],
            $datos["dni"],
            $datos["fechaNac"],
            $datos["direccion"],
            $datos["telefono"],
            $datos["re-email"]
        );


    }

}
?>
