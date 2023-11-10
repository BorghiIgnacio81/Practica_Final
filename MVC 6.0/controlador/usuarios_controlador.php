<?php


   class UsuariosController {
  
   
       static public function get_Usuarios_Controlador($paraBus) {
           $respuesta = Usuarios_modelo::get_usuarios_modelo($paraBus);
           return $respuesta;
        }
       static public function get_pre_Usuarios_Controlador() {
        $respuesta = Usuarios_modelo::get_pre_usuarios_modelo();
        return $respuesta;
        }
     
   }
   


?>