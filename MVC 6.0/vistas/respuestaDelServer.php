<?php
// Simulando una conexión a la base de datos y una consulta
// Aquí deberías realizar la conexión y consulta reales
if(isset($_POST))
    $data = json_decode(file_get_contents('php://input'), true);
else
    $data = null;
// Validación simple (esto es solo un ejemplo, en la práctica debes usar consultas preparadas)

switch(key($data)){
    case "search":
        echo $data["search"];
        break;
    case "add":
        echo $data["add"];
        break;
}


?>
