<?php

require_once 'Conectar.php';

class LoginModelo{
    static public function login_modelo($nombre_usuario, $password){
        $consulta = Conectar::conexion()->prepare("SELECT COUNT(*) AS user FROM usuarios WHERE username = :nombre_usuario AND contraseña = :contrasenia");
        $consulta->bindParam(":nombre_usuario", $nombre_usuario, PDO::PARAM_STR);
        $consulta->bindParam(':contrasenia', $password, PDO::PARAM_STR);
        $consulta->execute();
        $result = $consulta->fetch(PDO::FETCH_ASSOC);
        
        if($result['user'] == 1)
            return true;
        else
            return false;
        
    }

    static public function registro_modelo($nombre_usuario, $password, $email){
        
        $consulta = Conectar::conexion()->prepare("INSERT INTO usuarios (username, contraseña, email, tipoUsuario) VALUES (:nombre_usuario, :contrasenia, :email, 4)");
        $consulta->bindParam(":nombre_usuario", $nombre_usuario, PDO::PARAM_STR);
        $consulta->bindParam(':contrasenia', $password, PDO::PARAM_STR);
        $consulta->bindParam(":email", $email, PDO::PARAM_STR);
        try{
            $consulta->execute();    
            $result = $consulta->fetch(PDO::FETCH_ASSOC);
            return true;
        }catch(Exception $e){
            return false;
        }
    }


}
?>
