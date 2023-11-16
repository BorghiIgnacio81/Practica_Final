<?php
include_once 'Conectar.php';
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
            return null;
        }
    }
    
    static public function get_usuarios_modelo($pUsuario) {
        try {
            $consulta = Conectar::conexion()->prepare("CALL `usuarioXparam`(:pUsuario)");
            $consulta->bindParam(":pUsuario", $pUsuario, PDO::PARAM_STR);
            $consulta->execute();

            $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);
            
            if(count($resultados) > 0)
                return $resultados;
            else
                return null;

        } catch (PDOException $e) {
            return null;
        }
    }

    static public function nuevo_usuario_modelo($usuario){
        try {
            $consulta = Conectar::conexion()->prepare("CALL `insertarUsuario`(
                :nombre, 
                :apellido, 
                :dni, 
                :fechaNac, 
                :telefono, 
                :email,
                :direccion)");

            $consulta->bindParam(":nombre", $usuario["nombre"], PDO::PARAM_STR);
            $consulta->bindParam(":apellido", $usuario["apellido"], PDO::PARAM_STR);
            $consulta->bindParam(":dni", $usuario["dni"], PDO::PARAM_INT);
            $consulta->bindParam(":fechaNac", $usuario["fechaNac"], PDO::PARAM_STR);
            $consulta->bindParam(":telefono", $usuario["telefono"], PDO::PARAM_INT);
            $consulta->bindParam(":email", $usuario["email"], PDO::PARAM_STR);
            $consulta->bindParam(":direccion", $usuario["direccion"], PDO::PARAM_STR);
            $consulta->execute();
            
            return true;
        
        } catch (Exception $e) {
            print_r($e);
            return false;
        }
    }

    static public function editar_usuario_modelo($usuario){
        try {
            $consulta = Conectar::conexion()->prepare("CALL `editarUsuario`(
                :idUsuario,
                :nombre, 
                :apellido, 
                :dni, 
                :fechaNac, 
                :telefono, 
                :tipoUsuario,
                :email,
                :direccion)");
            $consulta->bindParam(":idUsuario", $usuario["idUsuario"], PDO::PARAM_INT);
            $consulta->bindParam(":nombre", $usuario["nombre"], PDO::PARAM_STR);
            $consulta->bindParam(":apellido", $usuario["apellido"], PDO::PARAM_STR);
            $consulta->bindParam(":dni", $usuario["dni"], PDO::PARAM_INT);
            $consulta->bindParam(":fechaNac", $usuario["fechaNac"], PDO::PARAM_STR);
            $consulta->bindParam(":telefono", $usuario["telefono"], PDO::PARAM_INT);
            $consulta->bindParam(":tipoUsuario", $usuario["tipoUsuario"], PDO::PARAM_INT);
            $consulta->bindParam(":email", $usuario["email"], PDO::PARAM_STR);
            $consulta->bindParam(":direccion", $usuario["direccion"], PDO::PARAM_STR);
            $consulta->execute();
            
            return true;
        
        } catch (Exception $e) {
            print_r($e);
            return false;
        }
    }
    static public function eliminar_usuario_modelo($idUsuario)
    {
        try {
        $consulta = Conectar::conexion()->prepare(" CALL `eliminarUsuario`(:idUsuario)");
        $consulta->bindParam(":idUsuario", $idUsuario, PDO::PARAM_INT);
        $consulta->execute();
        return true;
            
        
        } 
        catch (Exception $e) {
            return false;
        }
    }
   
}