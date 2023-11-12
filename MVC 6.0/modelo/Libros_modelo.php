<?php
include_once 'Conectar.php';
class Libros_modelo {
    static public function get_libros_modelo($pTitulo) {             
        try {
            $consulta = Conectar::conexion()->prepare("CALL `librosXtitulo`(:pTitulo)");

            $consulta->bindParam(":pTitulo", $pTitulo, PDO::PARAM_STR);
            
            $consulta->execute();
            
            $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
            return $resultados;
         
        } catch (PDOException $e) {
            return array();
        }
    }
    static public function get_libro_activo_modelo($pActivo) {             
        try {
            $consulta = Conectar::conexion()->prepare("CALL `librosXactivo`(:pActivo)");

            $consulta->bindParam(":pActivo", $pActivo, PDO::PARAM_STR);
            
            $consulta->execute();
            
            $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
            return $resultados;
         
        } catch (PDOException $e) {
            return array();
        }
    }  

    static public function nuevo_libro_modelo($libro){
        try {
            $consulta = Conectar::conexion()->prepare("CALL `nuevoLibro`(
                :titulo,
                :idAutor,
                :idEditorial, 
                :ubicacionBiblioteca, 
                :lugarEdicion, 
                :anio, 
                :serie, 
                :observaciones, 
                :idMateria)");

            // UN ENLACE POR CADA DATO, TENER EN CUENTA EL TIPO DE DATO STR O INT
            
            $consulta->bindParam(":titulo", $libro["titulo"], PDO::PARAM_STR);
            $consulta->bindParam(":idAutor", $libro["idAutor"], PDO::PARAM_INT);
            $consulta->bindParam(":idEditorial", $libro["idEditorial"], PDO::PARAM_INT);
            $consulta->bindParam(":ubicacionBiblioteca", $libro["ubicacionBiblioteca"], PDO::PARAM_STR);
            $consulta->bindParam(":lugarEdicion", $libro["lugarEdicion"], PDO::PARAM_STR);
            $consulta->bindParam(":anio", $libro["anio"], PDO::PARAM_INT);
            $consulta->bindParam(":serie", $libro["serie"], PDO::PARAM_INT);
            $consulta->bindParam(":observaciones", $libro["observaciones"], PDO::PARAM_STR);
            $consulta->bindParam(":idMateria", $libro["idMateria"], PDO::PARAM_INT);

            $consulta->execute();
            
            return true;
        
        } catch (Exception $e) {
            print_r($e);
            return false;
        }
    }

    // static public function editar_libro_modelo($libro)
    // {
    //     try 
    //     {
    //         $stmt = Conectar::conexion()->prepare("UPDATE $tabla SET dato1 = :dato1, …. WHERE 
    //         id_dato = :id_dato");
    
    //         $stmt->bindParam(":dato1", $libro[“dato1”], PDO::PARAM_STR);
    //         $stmt->bindParam(":id_dato", $libro[“id_dato”], PDO::PARAM_INT);
    //         if ($stmt->execute()) {
    //             return "ok";
    //         } else {
    //         return print_r(Conectar::conexion()->errorInfo());
    //         }
    //     } 
    //     catch (Exception $e) {
    //         return "Error: " . $e->getMessage();
    //     }
    // } 
}
?>
