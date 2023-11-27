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
    
    static public function get_usuarios_modelo($pUsuario, $filtros) {
        try {
            $order = "";
            if(isset($filtros) && $filtros != ""){
                $filtros = explode(" ", $filtros);
                $order = "ORDER BY ".$filtros[0]." ".$filtros[1];
            }
            $consulta = Conectar::conexion()->prepare("SELECT idUsuarios as idUsuario, nombre, apellido, dni, direccion, telefono, email, fechaNac, tipoUsuario, penalidad
            FROM usuarios 
            WHERE Nombre LIKE concat('%', :pUsuario, '%') OR Apellido LIKE concat('%', :pUsuario, '%') OR DNI like concat ('%',:pUsuario, '%') ".$order);
            //$consulta = Conectar::conexion()->prepare("CALL `usuarioXparam`(:pUsuario)");
            $consulta->bindParam(":pUsuario", $pUsuario, PDO::PARAM_STR);
            $consulta->execute();

            $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);

            $fechaActual = new DateTime();

            foreach ($resultados as &$usuario) {
                $fechaNacimiento = new DateTime($usuario["penalidad"]);
                $diferencia = $fechaActual->diff($fechaNacimiento);
                $usuario["penalidad"] = $diferencia->days;
            }

            
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
            return false;
        }
    }

    static public function eliminar_usuario_modelo($idUsuario){
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
   
    static public function penalidad_modelo($idUsuario, $penalidad){
        $consulta = Conectar::conexion()->prepare("UPDATE usuarios SET penalidad = :penalidad WHERE usuarios.idUsuarios = :idUsuario");
        $consulta->bindParam(":idUsuario", $idUsuario, PDO::PARAM_INT);
        $consulta->bindParam(":penalidad", $penalidad, PDO::PARAM_STR);

        try{
            $consulta->execute();

            return true;
        }catch(Exception $e){
            return false;
        }

    }
}