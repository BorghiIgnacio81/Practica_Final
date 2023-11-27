<?php
    $_GET = null;
    $_GET = array("funcion" => "reg2");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="vistas/css/normalize.css">
    <link rel="stylesheet" href="vistas/css/registro.css">
</head>
<body>
    <div class="registro-formulario">
        <form action="index.php" method="POST">
            <h2>INFORMACIÓN DEL USUARIO</h2>
            <div class="reg-form-campo">
                <input type="text" name="r2-nombre" id="" required>
                <label for="">Nombre</label>
            </div>
            <div class="reg-form-campo">
                <input type="text" name="r2-apellido" id="" required>
                <label for="">Apellido</label>
            </div>
            <div class="reg-form-campo">
                <input type="text" name="r2-dni" id="" required>
                <label for="">DNI</label>
            </div>
            <div class="reg-form-campo">
                <input type="date" name="r2-fechaNac" id="" value="" required>
                <label for="">Fecha de Nacimiento</label>
            </div>
            <div class="reg-form-campo">
                <input type="text" name="r2-domicilio" id="" required>
                <label for="">Domicilio</label>
            </div>
            <div class="reg-form-campo">
                <input type="email" name="r2-email" id="" required>
                <label for="">Re E-mail</label>
            </div>
            <div class="reg-form-campo">
                <input type="text" name="r2-telefono" id="" required>
                <label for="">Teléfono</label>
            </div>

            <button type="submit" class="btn">Enviar</button>
        </form>
        
    </div>

    <div class="registro-info">
        <div class="reg-info-titulo">
            ¡Solo unos pasos más!
        </div>
        <div class="reg-info-texto">
            Completa el registro para disfrutar los beneficios de la biblioteca virtual.
        </div>
    </div>

</body>
</html>