<?php
    include_once("../modelo/Libros_modelo.php");
    //$response =  Libros_Controlador::get_Libros_Controlador(json_decode(file_get_contents('php://input'),true));
    $response = json_decode(file_get_contents('php://input'),true);
        //print_r($response);
        if($response){
            Libros_Controlador::get_Libros_Controlador($response);
        }
    class Libros_Controlador {
      
        static public function get_Libros_Controlador($data) { //Puede venir informacion con un json para add, del, mod, o bien un string para search
            //de prueba para hacer una busqueda
            //$data= null;
            //$data = array();
            // $data = array(
            //     'idLibro' => '1234512',
            //     'Titulo' => 'Caperucita y el lobo',
            //     'autor' => 'Julio Cortazar',
            //     'UbicacionBiblioteca' => 'A33',
            //     'Editorial' => 'Santillana',
            //     'materia' => 'Lengua y literatura',
            //     'Lugar_Edicion' =>  'Buenos Aires',
            //     'anio' => '2000',
            //     'serie' => 'Ficcion',
            //     'observaciones' => 'Un libro muy interesante'
            // );
            switch ($data["funcion"]) {
                case "search":
                    if (isset($data["data"])) {
                        $pTitulo = $data["data"];
                        $respuesta = Libros_modelo::get_libros_modelo($pTitulo);
                        
                       //echo json_encode(["respuesta" => $respuesta]);
                        //var_dump($respuesta);
                        echo $respuesta;
                    } else {
                        // Manejo de error si no se proporciona el dato de búsqueda
                        echo json_encode(["error" => "No se proporcionó el dato de búsqueda"]);
                    }
                    break;
            
                case "add":
                    // Lógica para agregar
                    break;
            
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
            
            /*
            $respuesta = Libros_modelo::get_libros_modelo($pTitulo);
            return $respuesta;*/        
            
        }    
    }      
?>