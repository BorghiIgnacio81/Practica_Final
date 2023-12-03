<?php

require_once 'Conectar.php';

class LoginModelo{
    static public function login_modelo($nombre_usuario, $password){
        $consulta = Conectar::conexion()->prepare("SELECT * FROM usuarios WHERE username = :nombre_usuario AND contrasenia = :contrasenia");
        $consulta->bindParam(":nombre_usuario", $nombre_usuario, PDO::PARAM_STR);
        $consulta->bindParam(':contrasenia', $password, PDO::PARAM_STR);
        $consulta->execute();
        $result = $consulta->fetch(PDO::FETCH_ASSOC);
        
        if($result){
            $_SESSION = $result;
            if($_SESSION['tipoUsuario'] < 3){
                session_start();
                $_SESSION = $result;
            }
        }else{
            $_SESSION = array('tipoUsuario'=> -1);
        }
    }

    static public function registro_modelo($nombre_usuario, $password, $email){
        $consulta = Conectar::conexion()->prepare("SELECT * FROM usuarios WHERE username = :nombre_usuario OR email = :email");
        $consulta->bindParam(":nombre_usuario", $nombre_usuario, PDO::PARAM_STR);
        $consulta->bindParam(":email", $email, PDO::PARAM_STR);
        $consulta->execute();
        $result = $consulta->fetch(PDO::FETCH_ASSOC);
        if(!$result){
            $consulta = Conectar::conexion()->prepare("INSERT INTO usuarios (username, contrasenia, email, tipoUsuario) VALUES (:nombre_usuario, :contrasenia, :email, 4)");
            $consulta->bindParam(":nombre_usuario", $nombre_usuario, PDO::PARAM_STR);
            $consulta->bindParam(':contrasenia', $password, PDO::PARAM_STR);
            $consulta->bindParam(":email", $email, PDO::PARAM_STR);
            try{
                $consulta->execute();    
                $result = $consulta->fetch(PDO::FETCH_ASSOC);
                $_GET = array("email" => $email, "funcion" => "reg1", "status" => "ok");
            }catch(Exception $e){
                $_GET = array("funcion" => "reg1", "status" => "no");
            }
        }else{
            if(isset($result["nombre"]) &&  isset($result["apellido"]) && isset($result["dni"])){
                $_GET = array("funcion" => "reg1", "status" => "error");
            }else{
                $consulta = Conectar::conexion()->prepare("UPDATE usuarios SET contrasenia = :contrasenia WHERE usuarios.idUsuarios = (SELECT idUsuarios FROM usuarios WHERE email = :email)");
                $consulta->bindParam(":contrasenia", $password, PDO::PARAM_STR);
                $consulta->bindParam(":email", $email, PDO::PARAM_STR);
                try{
                    $consulta->execute();
                    
                    $_GET = array("email" => $email, "funcion"=> "reg1", "status" => "ok");
                }catch(Exception $e){
                    $_GET = array("funcion" => "reg1", "status" => "error");
                }
            }
        }
    }

    static public function registro2_modelo($nombre, $apellido, $dni, $fechaNac, $direccion, $telefono, $email){
        $consulta = Conectar::conexion()->prepare("UPDATE usuarios SET nombre = :nombre, apellido = :apellido, dni = :dni, fechaNac = :fechaNac, direccion = :direccion, telefono = :telefono, tipoUsuario = 3  
        WHERE usuarios.idUsuarios = (SELECT idUsuarios FROM usuarios WHERE email = :email)");
        
        $consulta->bindParam(":nombre", $nombre, PDO::PARAM_STR);
        $consulta->bindParam(":apellido", $apellido, PDO::PARAM_STR);
        $consulta->bindParam(":dni", $dni, PDO::PARAM_INT);
        $consulta->bindParam(":fechaNac", $fechaNac, PDO::PARAM_STR);
        $consulta->bindParam(":direccion", $direccion, PDO::PARAM_STR);
        $consulta->bindParam(":telefono", $telefono, PDO::PARAM_INT);
        $consulta->bindParam(":email", $email, PDO::PARAM_STR);

        try{
            if($consulta->execute())
                $_GET = array("funcion" => "reg2", "status" => "ok");

        }catch(Exception $e){
            $_GET = array("funcion" => "reg2", "status" => "error");
        }
    }


}
?>
