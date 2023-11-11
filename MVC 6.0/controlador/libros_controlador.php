<?php
    //include_once("../modelo/Libros_modelo.php");
    include_once __DIR__ . '/../modelo/Libros_modelo.php';
    set_include_path(get_include_path() . PATH_SEPARATOR . __DIR__ . '/../modelo/');
    include_once 'Libros_modelo.php';


    //$response =  Libros_Controlador::get_Libros_Controlador(json_decode(file_get_contents('php://input'),true));
    $response = json_decode(file_get_contents('php://input'),true);
        //print_r($response);
        if($response){
            Libros_Controlador::get_Libros_Controlador($response);
        }
    class Libros_Controlador {
      
        static public function get_Libros_Controlador($data) { 
            switch ($data["funcion"]) {
                case "search":
                    if (isset($data["data"])) {
                        $pTitulo = $data["data"];
                        $respuesta = Libros_modelo::get_libros_modelo($pTitulo);
                        
                       //echo json_encode(["respuesta" => $respuesta]);
                        //var_dump($respuesta);
                        echo json_encode($respuesta);
                    } else {
                        // Manejo de error si no se proporciona el dato de búsqueda
                        echo json_encode(["error" => "No se proporcionó el dato de búsqueda"]);
                    }
                    break;
            
                case "add":
                    
                    if (isset($data["data"])) {
                        $aux = $data["data"];
                        $libro = array(
                        "titulo" => $aux["titulo"],
                        "idAutor" => $aux["autor"],
                        "ubicacionBiblioteca" => $aux["ubicacionFisica"],
                        "editorial" => $aux["editorial"],
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
                    // Lógica para eliminar
                    break;
            
                case "mod":
                    // Lógica para modificar
                    break;
            
                default:
                    // Manejo de error si la función no está definida
                    echo json_encode(["error" => "Función no válida"]);
                    break;
            }
       
        }
         
    }      
?>