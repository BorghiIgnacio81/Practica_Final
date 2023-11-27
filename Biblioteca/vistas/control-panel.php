<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Control</title>
    <link rel="stylesheet" href="vistas/css/normalize-cp.css">
    <link rel="stylesheet" href="vistas/css/dashboard-menu.css">
    
    <link rel="stylesheet" href="vistas/css/cp-user.css">
    <link rel="stylesheet" href="vistas/css/cp-reserva.css">
    <link rel="stylesheet" href="vistas/css/cp-libro.css">
    <link rel="stylesheet" href="vistas/css/cp-prestamo.css">
    <link rel="stylesheet" href="vistas/css/cp-solicitar.css">

    <link rel="stylesheet" href="vistas/css/modal-reserva.css">
    <link rel="stylesheet" href="vistas/css/modal-prestamo.css">
    <link rel="stylesheet" href="vistas/css/modal-user-add.css">
    <link rel="stylesheet" href="vistas/css/modal-user-penal.css">
    <link rel="stylesheet" href="vistas/css/modal-user-del.css">
    
    <link rel="stylesheet" href="vistas/css/calendario.css">
    <link rel="stylesheet" href="vistas/css/icomoon.css">

</head>
<body>
    
    <?php 
        include_once ('cp-menu.php');
    ?>


<!-- Frame Libro + Modals -->
    <?php 
        if($_SESSION['tipoUsuario'] == 0)
            include_once ('cp-gestion-libros.php');
    ?>

<!-- Frame Usuario + Modals -->
    <?php
        if($_SESSION['tipoUsuario'] == 0)
            include_once ('cp-gestion-usuarios.php');
    ?>

<!-- Frame Reservas + Modals -->
    <?php 
        include_once ('cp-gestion-reservas.php');
    ?>

<!-- Frame Prestamos + Modals -->
    <?php 
        if($_SESSION['tipoUsuario'] == 0)
            include_once ('cp-gestion-prestamos.php');
    ?>

<!-- Frame Solicitud libros + Modals -->
    <?php 
        if($_SESSION['tipoUsuario'] == 1)
            include_once ('cp-solicitar-libros.php');
    ?>


<!-- Scripts -->

    <script>
        const showRes = document.querySelector(".menu-item.show-reservas");
        const frameRes = document.querySelector(".frame-reservas");
        
        showRes.addEventListener("click",()=>{
            <?php if($_SESSION['tipoUsuario'] == 1){ ?>
                frameSolicitar.classList.remove('active');
            <?php } ?>
            <?php if($_SESSION['tipoUsuario'] == 0){ ?>
                frameUser.classList.remove('active');
                frameLibro.classList.remove('active');
                framePrest.classList.remove('active');
            <?php } ?>
            setTimeout(()=>{
                frameRes.classList.add('active');
            },250);
        });

        <?php if($_SESSION['tipoUsuario'] == 1){ ?>

            const showSolicitar = document.querySelector(".menu-item.show-solicitar-libro");
            const frameSolicitar = document.querySelector(".frame-solicitar-libro");
            
            showSolicitar.addEventListener("click",()=>{
                frameRes.classList.remove('active');
                setTimeout(()=>{
                    frameSolicitar.classList.add('active');
                },250);
            });

        <?php } ?>

        <?php if($_SESSION['tipoUsuario'] == 0){ ?>

            const showUser = document.querySelector(".menu-item.show-usuarios");
            const showLibro = document.querySelector(".menu-item.show-libros");
            const showPrest = document.querySelector(".menu-item.show-prestamos");

            const frameUser = document.querySelector(".frame-usuarios");
            const frameLibro = document.querySelector(".frame-libros");
            const framePrest = document.querySelector(".frame-prestamos");

            showUser.addEventListener("click",()=>{
                frameRes.classList.remove('active');
                frameLibro.classList.remove('active');
                framePrest.classList.remove('active');
                setTimeout(()=>{
                    frameUser.classList.add('active');
                },250);
            });

            showLibro.addEventListener("click",()=>{
                frameUser.classList.remove('active');
                frameRes.classList.remove('active');
                framePrest.classList.remove('active');
                setTimeout(()=>{
                    frameLibro.classList.add('active');
                },250);
            });

            showPrest.addEventListener("click",()=>{
                frameUser.classList.remove('active');
                frameLibro.classList.remove('active');
                frameRes.classList.remove('active');
                setTimeout(()=>{
                    framePrest.classList.add('active');
                },250);
            });

        <?php } ?>

    </script>

    <script src="vistas/js/reservas.js"></script>
    <script src="vistas/js/classes/Libro.js"></script>
    <script src="vistas/js/classes/Usuario.js"></script>
    
    <?php if($_SESSION['tipoUsuario'] == 0){ ?>
        <script src="vistas/js/classes/LibroController.js"></script>
        <script src="vistas/js/classes/UsuarioController.js"></script>
        <script src="vistas/js/calendario.js"></script>
        <script src="vistas/js/prestamo.js"></script>
    <?php } ?>

    <?php if($_SESSION['tipoUsuario'] == 1){ ?>
        <script src="vistas/js/solicitar-libro.js"></script>
    <?php } ?>

</body>
</html>