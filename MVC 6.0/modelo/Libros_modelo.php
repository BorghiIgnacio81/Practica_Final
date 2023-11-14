<?php
include_once 'Conectar.php';
class Libros_modelo {
    static public function get_libros_modelo($pTitulo) {             
        try {
            $consulta = Conectar::conexion()->prepare("CALL librosXtitulo(:pTitulo)");

            $consulta->bindParam(":pTitulo", $pTitulo, PDO::PARAM_STR);
            
            $consulta->execute();
            
            $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
            
            //Esta lógica de retornar Null por array() en caso de que no encuentre resultados <<<<<

            if (count($resultados) > 0)
                return $resultados;
            else
                return null; // <<<<<<<<<<<< antes era array()
         
        } catch (PDOException $e) {
            return null;
        }
    }
    static public function get_libro_activo_modelo($pActivo) {             
        try {
            $consulta = Conectar::conexion()->prepare("CALL librosXactivo(:pActivo)");

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

    static public function nuevo_libro_modelo($libro){
        try {
            $consulta = Conectar::conexion()->prepare("CALL insertarLibro(
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
            $consulta = Conectar::conexion()->prepare(" CALL editarLibro(
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



            $consulta->bindParam(":idLibro", $libro["idLibro"], PDO::PARAM_INT); 
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
            
        } 
        catch (Exception $e) 
            {
            return false;
        }
        
    }
    static public function eliminar_libro_modelo($idLibro)
        {
            try {
            $consulta = Conectar::conexion()->prepare(" CALL `eliminarLibro`(:idLibro)");
            $consulta->bindParam(":idLibro", $idLibro, PDO::PARAM_INT);
            $consulta->execute();
            return true;
               
            
            } 
            catch (Exception $e) {
                return false;
            }
        }
}
?>