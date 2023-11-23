<?php
class Conexion
{
    const HOST = "localhost";
    const DBNAME = "biblioteca";
    const USER = "root";
    const PASSWORD = "";
    static public function conectar()
    {
        try {
            $conn = new PDO("mysql:host=" . self::HOST . ";dbname=" . self::DBNAME, self::USER, 
            self::PASSWORD);
            $conn->exec("set names utf8");
            return $conn;
        } catch (PDOException $e) {
            die("Error en la conexión a la base de datos: " . $e->getMessage());
        }finally {
        $conn = null;
        }
    }
}


?>