<?php

$conn = new mysqli("localhost", "root", "", "biblioteca");


// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);

}
else echo "Conexion correcta"
?>
