<aside>
    <div class="avatar">
        <img src="vistas/img/129868.PNG">
        <span class="icon-cross logout"></span>
    </div>

    <script>
        document.querySelector(".logout").addEventListener("click", ()=>{
            document.querySelector(".formulario-logout").submit();
        });
    </script>

    <form action="index.php" method="POST" class="formulario-logout" style="display: none;">
        <input type="submit" name="deslogear" value="1">
    </form>

    <div class="menu-dash">
    <?php
        switch($_SESSION['tipoUsuario']){
            case 0: ?>
                <div class="menu-item show-reservas">
                    <span class="icon-drawer"></span>
                    <p>Reservas</p>
                </div>
                <div class="menu-item show-prestamos">
                    <span class="icon-upload"></span>
                    <p>Prestamos</p>
                </div>
                <div class="menu-item show-usuarios">
                    <span class="icon-users"></span>
                    <p>Gestión de Usuarios</p>
                </div>
                <div class="menu-item show-libros">
                    <span class="icon-books"></span>
                    <p>Gestión de Libros</p>
                </div>
            <?php
                    break;
            case 1:?>

                <div class="menu-item show-solicitar-libro">
                    <span class="icon-clipboard"></span>
                    <p>Solicitar Libro</p>
                </div>
                <div class="menu-item show-reservas">
                    <span class="icon-drawer"></span>
                    <p>Reservas</p>
                </div>
            <?php
                    break;
            case 2:?>
                <div class="menu-item show-reservas">
                    <span class="icon-drawer"></span>
                    <p>Reservas</p>
                </div>
            <?php
                    break;
        }
    ?>
    </div>
</aside>