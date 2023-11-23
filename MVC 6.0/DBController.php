<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
<?php
$titulo_libro = $_GET["titulo_libro"];
$autor_libro = $_GET["autor"];
// $sql1 = "CALL `Materias`()";
// $materias = $conn->prepare($sql1);
// // $resultado->execute(array(":t_libro" => $titulo_libro));
// // $titulos = array();
// while ($registros = $materias->fetch(PDO::FETCH_ASSOC)) {
//         $materias[] = $registros['Materias'];
//     }
//     session_start();
//     $_SESSION['Materias'] = $materias;

//     header('Location: busco.php');
//     $resultado->closeCursor();
 
    if (!empty($autor_libro)) {
        $sql = "CALL `LibrosBusquedaAvanzada`(:t_libro, :autor)";
        $resultado = $conn->prepare($sql);
        $resultado->execute(array(":t_libro" => $titulo_libro, ":autor" => $autor_libro));
    } else {
    $sql = "CALL `LibrosXTitulo`(:t_libro)";
    $resultado = $conn->prepare($sql);
    $resultado->execute(array(":t_libro" => $titulo_libro));
    }

    $titulos = array();

    while ($registro = $resultado->fetch(PDO::FETCH_ASSOC)) {
        $titulos[] = $registro['Titulo'];
    }

    session_start();
    $_SESSION['titulos'] = $titulos;

    header('Location: busco.php');
    $resultado->closeCursor();
    ?>
</body>
</html>    
