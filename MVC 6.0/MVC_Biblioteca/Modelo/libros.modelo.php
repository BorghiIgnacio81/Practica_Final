<?php
class MostrarLibros{
    static public function mdlMostrarDatos($item, $valor)
    {
        if ($item != null) 
        {
            try 
            {
                $stmt = Conexion::conectar()->prepare("SELECT * FROM libros WHERE $item = :$item");
                //enlace de parametros
                $stmt->bindParam(":" . $item, $valor, PDO::PARAM_STR);
                $stmt->execute();
                return $stmt->fetch(PDO::FETCH_ASSOC);
            } 
            catch (Exception $e) 
            {
                return "Error: " . $e->getMessage();
            }
        } 
        else {
                try {
                $stmt = Conexion::conectar()->prepare("SELECT * FROM libros");
                $stmt->execute();
                $stmt->fetchAll(PDO::FETCH_ASSOC);
                echo $stmt;
                return $stmt;
                
                } 
                catch (Exception $e) 
                {
                "Error: " . $e->getMessage();
                }
            }
    }
}
 ?>