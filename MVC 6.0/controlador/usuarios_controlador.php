<?php
    include_once __DIR__ . '/../modelo/Usuarios_modelo.php';
    set_include_path(get_include_path() . PATH_SEPARATOR . __DIR__ . '/../modelo/');
    include_once 'Usuarios_modelo.php';

   class Usuarios_Controlador {
  
      static public function get_usuarios_controlador($data) { 
         switch ($data["funcion"]) {
             case "search":
                 if (isset($data["data"])) {
                     $pUsuario = $data["data"];
                     $respuesta = Usuarios_modelo::get_usuarios_modelo($pUsuario);
                     
                     echo json_encode($respuesta);
                 }
                 break;
         
             case "add":
                 if (isset($data["data"])) {
                     $aux = $data["data"];

                     $usuario = array(
                         "nombre" => $aux["nombre"],
                         "apellido" => $aux["apellido"],
                         "dni" => $aux["dni"],
                         "direccion" => $aux["direccion"],
                         "telefono" => $aux["telefono"],
                         "email" => $aux["email"],
                         "fechaNac" => $aux["fechaNac"]
                        );
                     
                     
                     $respuesta = Usuarios_modelo::nuevo_usuario_modelo($usuario);
                     if ($respuesta) {
                         echo json_encode(array("status"=>"ok"));
                     }else {
                         echo json_encode(array("status"=>"no"));
                     }
                     break;
                 }
             case "del":
                 if (isset($data["data"])) {
                     $aux = $data["data"];
                     
                     $idUsuario= $aux["idUsuario"];
                     
                     $respuesta = Usuarios_modelo::eliminar_usuario_modelo($idUsuario);
                     if ($respuesta) {
                         echo json_encode(array("status"=>"ok"));
                     }else {
                         echo json_encode(array("status"=>"no"));
                     }
                     break;
                 }
         
             case "edit":
                 if (isset($data["data"])) {
                     $aux = $data["data"];
                     //print_r($aux);
                     
                     $libro = array(
                         "idLibro" => $aux["idLibro"],
                         "titulo" => $aux["titulo"],
                         "idAutor" => $aux["autor"],
                         "ubicacionFisica" => $aux["ubicacionFisica"],
                         "idEditorial" => $aux["editorial"],
                         "lugarEdicion" => $aux["lugarEdicion"],
                         "anio" => $aux["anio"],
                         "serie" => $aux["serie"],
                         "observaciones" => $aux["observaciones"],
                         "idMateria" => $aux["materia"]
                     );
                     
                     //print_r($libro);
                     
                     $respuesta = Libros_modelo::editar_libro_modelo($libro);
                     if ($respuesta) {
                         echo json_encode(array("status"=>"ok"));
                     }else {
                         echo json_encode(array("status"=>"no"));
                     }
                     break;
                 }
             default:
                 // Manejo de error si la función no está definida
                 echo json_encode(["error" => "Función no válida"]);
                 break;
         }
    
     }
    
      static public function get_pre_Usuarios_Controlador() {
        $respuesta = Usuarios_modelo::get_pre_usuarios_modelo();
        echo  json_encode($respuesta);
        }
     
   }
   


?>