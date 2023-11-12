<?php


   class Usuarios_Controlador {
  
   
       static public function get_Usuarios_Controlador($data) {
         
            if($data["funcion"] == "" && isset($data["data"])){
            $usuario = $data["data"];
            $respuesta = Usuarios_modelo::get_usuarios_modelo($usuario);
            echo json_encode($respuesta);
            }
        }
      static public function get_pre_Usuarios_Controlador() {
        $respuesta = Usuarios_modelo::get_pre_usuarios_modelo();
        echo  json_encode($respuesta);
        }
     
   }
   


?>