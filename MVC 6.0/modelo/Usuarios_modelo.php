<?php
require_once 'Conectar.php';
class Usuarios_modelo {
        
    

    static public function get_pre_usuarios_modelo(){
        try
        { 
            $consulta = Conectar::conexion()->prepare("Call preUsuarios");
            $consulta->execute();
            $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
            return $resultados;
        }
        catch(Exception $e)
        {
            return array();
        }
    }
    
    static public function get_usuarios_modelo($usuario) {
        try {
            $consulta = Conectar::conexion()->prepare("CALL `usuarioXparam`(:usuario)");
            $consulta->bindParam(":usuario", $usuario, PDO::PARAM_STR);
            $consulta->execute();
            $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
            return $resultados;
        } catch (PDOException $e) {
            return array();
        }
    }


   
   
}