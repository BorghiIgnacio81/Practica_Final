<?php
// Simulando una conexión a la base de datos y una consulta
// Aquí deberías realizar la conexión y consulta reales
$username = json_decode(file_get_contents('php://input'), true)['username'];
$password = json_decode(file_get_contents('php://input'), true)['password'];

// Validación simple (esto es solo un ejemplo, en la práctica debes usar consultas preparadas)
if ($username == 'usuario' && $password == 'contrasena') {
    // Si la validación es exitosa, devuelve información del usuario en formato JSON
    $userInfo = array(
        'name' => 'John',
        'lastname' => 'Doe',
        'age' => 30
    );

    echo json_encode($userInfo);
} else {
    // Si la validación falla, devuelve un mensaje de error en formato JSON
    $error = array('error' => 'Credenciales incorrectas');
    echo json_encode($error);
}
?>
