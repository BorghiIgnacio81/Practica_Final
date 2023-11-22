<?php

require_once 'Conectar.php';

class LoginModelo
{
    static public function login_modelo($nombre_usuario, $password)
    {
        $consulta = Conectar::conexion()->prepare("CALL login(:nombre_usuario)");
        $consulta->bindParam(":nombre_usuario", $nombre_usuario, PDO::PARAM_STR);
        $consulta->execute();
        $result = $consulta->fetch(PDO::FETCH_ASSOC);
        
        if ($result && password_verify($password, $result['contraseña']))
        {
            return [
                'success'=> true,
                'nombre_usuario'=> $result['nombre_usuario'],
                'contraseña'=> $result['contraseña'],
            ];
        }
        else
        {
            return ['success'=> false, 'message' => 'Credenciales incorrectas'];
        }
    }
}
?>
