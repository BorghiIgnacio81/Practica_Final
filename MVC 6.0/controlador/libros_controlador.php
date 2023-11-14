<?php
    //include_once("../modelo/Libros_modelo.php");
    include_once __DIR__ . '/../modelo/Libros_modelo.php';
    set_include_path(get_include_path() . PATH_SEPARATOR . __DIR__ . '/../modelo/');
    include_once 'Libros_modelo.php';
    
    $response = json_decode(file_get_contents('php://input'),true);
        
    if($response){
        Libros_Controlador::get_Libros_Controlador($response);
    }

    class Libros_Controlador { 
        static public function get_libro_activo_Controlador($data) { 
            if ($data["funcion"] == "pedidos") {
                if (isset($data["data"])) {
                        $pActivo = $data["data"];
                        $respuesta = Libros_modelo::get_libro_activo_modelo($pActivo);
                        
                        echo json_encode($respuesta);
                    }
                }
        }
        static public function get_Libros_Controlador($data) { 
            switch ($data["funcion"]) {
                case "search":
                    if (isset($data["data"])) {
                        $pTitulo = $data["data"];
                        $respuesta = Libros_modelo::get_libros_modelo($pTitulo);
                        
                        echo json_encode($respuesta);
                    }
                    break;
            
                case "add":
                    if (isset($data["data"])) {
                        $aux = $data["data"];

                        $libro = array(
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
                        
                        
                        $respuesta = Libros_modelo::nuevo_libro_modelo($libro);
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
                        
                        $idLibro = $aux["idLibro"];
                        
                        $respuesta = Libros_modelo::eliminar_libro_modelo($idLibro);
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
                            "idEditorial" => $aux["editorial"],
                            "ubicacionFisica" => $aux["ubicacionFisica"],
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
         
    }      
?>