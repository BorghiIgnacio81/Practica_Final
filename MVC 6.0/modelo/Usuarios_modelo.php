<?php
require_once 'Conectar.php';
class Usuarios_modelo {
        
    

    static public function get_pre_usuarios_modelo(){
        try
        { 
            $consulta = Conectar::conexion()->prepare("Call preUsuarios");
            $consulta->execute();
            return $consulta->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e)
        {
            return "Error: " . $e->getMessage();
        }
    }
    
    static public function get_usuarios_modelo($paraBus) {
        try {
            $consulta = Conectar::conexion()->prepare("CALL `usuarioXparam`(:param)");
            $consulta->bindParam(":param", $paraBus, PDO::PARAM_STR);
            $consulta->execute();
    
            return $consulta->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo "Error PDO!!!: " . $e->getMessage();
        }
    }


   
   
}