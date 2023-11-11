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
            echo "Error PDO!!!: " . $e->getMessage();
        }
    } 
    static public function nuevo_libro_modelo($libro)
        {
        try { //CALL nuevoLibro('AlgoAAAAAAAAAAAAAAAAAA',1,1,'A1','a',1,1,'a',1);
        $consulta = Conectar::conexion()->prepare("CALL `nuevoLibro`(:titulo, :idAutor, :idEditorial, :ubicacionBiblioteca, :lugarEdicion, :anio, :serie, :observaciones, :idMateria)");
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
        return "Error: " . $e->getMessage();
        }
    }   
}
?>
