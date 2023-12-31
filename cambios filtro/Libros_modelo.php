<?php
include_once 'Conectar.php';

class Libros_modelo {
    private static $resultadosTitulo = null;
    static public function get_libros_modelo($pTitulo, $filtros) {             
        try {
            $and = "";
            if (isset($filtros) && $filtros != "") {
                
                $filtrosArray = explode(" ", $filtros);

                
                $palabraClave = strtolower($filtrosArray[0]);

                
                switch ($palabraClave) {
                    case "materia":
                        $and = "AND L.idMateria = " . intval($filtrosArray[1]);
                        break;
                    case "autor":
                        $and = "AND L.idAutor = " . intval($filtrosArray[1]);
                        break;
                    case "editorial":
                        $and = "AND L.idEditorial = " . intval($filtrosArray[1]);
                        break;
                   
                }
            }
            $consulta = Conectar::conexion()->prepare("select idLibro, titulo, autor, ubicacionFisica, editorial, materia, lugarEdicion, anio, serie, observaciones 
            from libros L 
            JOIN autores as A ON L.idAutor = A.idAutor 
            JOIN editoriales E ON E.idEditorial = L.idEditorial 
            JOIN materias M on M.idMateria = L.idMateria 
            where Titulo like '%$pTitulo%' $and");
            $consulta->execute();
            $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);

            if (count($resultados) > 0){
                self::$resultadosTitulo = $resultados;
                return $resultados;
            }else{
                self::$resultadosTitulo = null;
                return null; 
            }
         
        } catch (PDOException $e) {
            return null;
        }
    }
    static public function get_libros_modeloAB($pTitulo, $filtros) {
        try {
            $order = "";
            if(isset($filtros) && $filtros != "")
                $order = "ORDER BY ".$filtros;
            
            $consulta = Conectar::conexion()->prepare("SELECT L.idLibro, L.titulo, A.autor,
            L.ubicacionFisica, E.editorial, M.materia, L.lugarEdicion, L.anio, L.serie, L.observaciones 
            FROM libros AS L JOIN autores AS A ON L.idAutor = A.idAutor 
            JOIN editoriales AS E ON E.idEditorial = L.idEditorial 
            JOIN materias AS M on M.idMateria = L.idMateria 
            where L.titulo like '%$pTitulo%' $order");
            
            
            $consulta->execute();
            
            $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
            
            //Esta lógica de retornar Null por array() en caso de que no encuentre resultados <<<<<

            if (count($resultados) > 0){
                self::$resultadosTitulo = $resultados;
                return $resultados;
            }else{
                self::$resultadosTitulo = null;
                return null; // <<<<<<<<<<<< antes era array()
            }
         
        } catch (PDOException $e) {
            return null;
        }
    }
    

    static public function get_libro_activo_modelo($pActivo) {             
        try {
            $consulta = Conectar::conexion()->prepare("CALL `librosXactivo`(:pActivo)");

            $consulta->bindParam(":pActivo", $pActivo, PDO::PARAM_STR);
            
            $consulta->execute();
            
            $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
            if (count($resultados) > 0)
                return $resultados;
            else
                return null;
         
        } catch (PDOException $e) {
            return null;
        }
    } 
    
    static public function get_resultados_titulo(){
        return self::$resultadosTitulo;
    }

    static public function nuevo_libro_modelo($libro){
        try {
            $consulta = Conectar::conexion()->prepare("CALL `insertarLibro`(
                :titulo,
                :idAutor,
                :idEditorial, 
                :ubicacionFisica, 
                :lugarEdicion, 
                :anio, 
                :serie, 
                :observaciones, 
                :idMateria)");

            // UN ENLACE POR CADA DATO, TENER EN CUENTA EL TIPO DE DATO STR O INT
            
            $consulta->bindParam(":titulo", $libro["titulo"], PDO::PARAM_STR);
            $consulta->bindParam(":idAutor", $libro["idAutor"], PDO::PARAM_STR);
            $consulta->bindParam(":idEditorial", $libro["idEditorial"], PDO::PARAM_STR);
            $consulta->bindParam(":ubicacionFisica", $libro["ubicacionFisica"], PDO::PARAM_STR);
            $consulta->bindParam(":lugarEdicion", $libro["lugarEdicion"], PDO::PARAM_STR);
            $consulta->bindParam(":anio", $libro["anio"], PDO::PARAM_INT);
            $consulta->bindParam(":serie", $libro["serie"], PDO::PARAM_INT);
            $consulta->bindParam(":observaciones", $libro["observaciones"], PDO::PARAM_STR);
            $consulta->bindParam(":idMateria", $libro["idMateria"], PDO::PARAM_STR);

            $consulta->execute();
            
            return true;
        
        } catch (Exception $e) {
            return false;
        }
    }

    static public function editar_libro_modelo($libro){
        try{
            $consulta = Conectar::conexion()->prepare(" CALL `editarLibro`(
                :idLibro,
                :titulo,
                :idAutor,
                :idEditorial, 
                :ubicacionFisica, 
                :lugarEdicion, 
                :anio, 
                :serie, 
                :observaciones, 
                :idMateria)");



            $consulta->bindParam(":idLibro", $libro["idLibro"], PDO::PARAM_STR); //
            $consulta->bindParam(":titulo", $libro["titulo"], PDO::PARAM_STR);
            $consulta->bindParam(":idAutor", $libro["idAutor"], PDO::PARAM_STR);
            $consulta->bindParam(":idEditorial", $libro["idEditorial"], PDO::PARAM_STR);
            $consulta->bindParam(":ubicacionFisica", $libro["ubicacionFisica"], PDO::PARAM_STR);
            $consulta->bindParam(":lugarEdicion", $libro["lugarEdicion"], PDO::PARAM_STR);
            $consulta->bindParam(":anio", $libro["anio"], PDO::PARAM_INT);
            $consulta->bindParam(":serie", $libro["serie"], PDO::PARAM_INT);
            $consulta->bindParam(":observaciones", $libro["observaciones"], PDO::PARAM_STR);
            $consulta->bindParam(":idMateria", $libro["idMateria"], PDO::PARAM_STR);

            $consulta->execute();
            
            return true;
            
        } catch (Exception $e) {
            return false;
        }
    }

    static public function eliminar_libro_modelo($idLibro){
        try {
            $consulta = Conectar::conexion()->prepare(" CALL eliminarLibro(:idLibro)");
            $consulta->bindParam(":idLibro", $idLibro, PDO::PARAM_INT);
            $consulta->execute();
            return true;
        
        }catch (Exception $e) {
            return false;
        }
    }

    static public function get_materias_modelo(){
        try
        { 
            $consulta = Conectar::conexion()->prepare("Call libroMaterias");
            $consulta->execute();
            $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
            return $resultados;
        }
        catch(Exception $e)
        {
            return null;
        }
    }
    static public function get_autores_modelo(){
        try
        { 
            $consulta = Conectar::conexion()->prepare("Call libroAutores");
            $consulta->execute();
            $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
            return $resultados;
        }
        catch(Exception $e)
        {
            return null;
        }
    }
    static public function get_editoriales_modelo(){
        try
        { 
            $consulta = Conectar::conexion()->prepare("Call libroEditoriales");
            $consulta->execute();
            $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
            return $resultados;
        }
        catch(Exception $e)
        {
            return null;
        }
    }
    

}

?>
