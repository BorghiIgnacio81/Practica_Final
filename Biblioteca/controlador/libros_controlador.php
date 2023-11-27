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
                        if($respuesta)
                            echo json_encode($respuesta);
                        else
                            array("status"=>"no");
                    }
                    break;
            
                case "add":
                    if (isset($data["data"])) {
                        $aux = $data["data"];

                        $libro = array(
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
                    case "searchAvanzada":
                    $titulo = isset($data["titulo"]) ? $data["titulo"] : null;
                
                    // Verifica si ya hay resultados de búsqueda por título
                    $resultadosTitulo = Libros_modelo::get_resultados_titulo();
                
                    if ($titulo && $resultadosTitulo) {
                        // Combina los resultados de la búsqueda por título con los parámetros de búsqueda avanzada
                        $resultadosAvanzada = array_filter($resultadosTitulo, function ($libro) use ($data) {
                            // Verifica si la materia del libro coincide con la materia de la búsqueda avanzada
                            $materiaValida = empty($data["idMateria"]) || $libro["idMateria"] == $data["idMateria"];
                    
                            // Verifica si el autor del libro coincide con el autor de la búsqueda avanzada
                            $autorValido = empty($data["idAutor"]) || $libro["idAutor"] == $data["idAutor"];
                    
                            // Verifica si la editorial del libro coincide con la editorial de la búsqueda avanzada
                            $editorialValida = empty($data["idEditorial"]) || $libro["idEditorial"] == $data["idEditorial"];
                    
                            // Devuelve true si todas las condiciones se cumplen
                            return $materiaValida && $autorValido && $editorialValida;
                        });
                    
                        // Puedes devolver los resultados combinados o realizar cualquier otra lógica necesaria
                        echo json_encode($resultadosAvanzada);
                    } else {
                        // Realiza la búsqueda avanzada normal si no hay resultados de búsqueda por título
                        if (isset($data["idMateria"]) && isset($data["idAutor"]) && isset($data["idEditorial"])) {
                            $idMateria = $data["idMateria"];
                            $idAutor = $data["idAutor"];
                            $idEditorial = $data["idEditorial"];
                    
                            $respuesta = Libros_modelo::buscar_libros_avanzada_modelo($idMateria, $idAutor, $idEditorial);
                    
                            if ($respuesta) {
                                echo json_encode($respuesta);
                            } else {
                                echo json_encode(array("status" => "no"));
                            }
                        }
                    }
                    break;
                
                
                default:
                    // Manejo de error si la función no está definida
                    echo json_encode(["error" => "Función no válida"]);
                    break;
            }
       
        }
        static public function get_materias_Controlador() {
            $respuesta = Libros_modelo::get_materias_modelo();
            return $respuesta;
        }
        static public function get_autores_Controlador() {
            $respuesta = Libros_modelo::get_autores_modelo();
            return $respuesta;
        }
        static public function get_editoriales_Controlador() {
            $respuesta = Libros_modelo::get_editoriales_modelo();
            return $respuesta;
        }
         
    }      
?>