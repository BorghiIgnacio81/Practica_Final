<?php

class LoginControlador{


    static public function login_controlador($datos){

        $username = $datos["nombre_usuario"];
        $encriptar = md5($datos["password"]);

        $respuesta = LoginModelo::login_modelo($username, $encriptar);

            if ($respuesta){
                return 1;
            } else {
                return 0;
            }
        
    }

    static public function registro_controlador($datos){

        $username = $datos["nombre_usuario"];
        $encriptar = md5($datos["password"]);
        $email = $datos["email"];

        $respuesta = LoginModelo::registro_modelo($username, $encriptar, $email);
        
        return 0;
    }

}
?>
