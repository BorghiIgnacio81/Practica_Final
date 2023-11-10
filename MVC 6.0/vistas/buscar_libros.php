<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscar Libros</title>
</head>
<body>

    <form action="controlador/libros_controlador.php" method="post">
        <label for="titulo">Título del libro:</label>
        <input type="text" id="titulo" name="data" required>
        <button type="submit">Buscar</button>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Procesar el formulario
        $titulo = $_POST["data"];

        // Mostrar el título (para verificar que el formulario está enviando correctamente)
        echo "<p>Título enviado: $titulo</p>";

        // Realizar la búsqueda (simplemente mostrar un mensaje por ahora)
        echo "<p>Realizando búsqueda...</p>";
    }
    ?>

</body>
</html>

