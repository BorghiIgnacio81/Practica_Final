<?php
include_once("controlador/libros_controlador.php");
$materias = Libros_Controlador::get_materias_Controlador();
$autores = Libros_Controlador::get_autores_Controlador();
$editoriales = Libros_Controlador::get_editoriales_Controlador();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="vistas/css/normalize.css">
    <link rel="stylesheet" href="vistas/css/icomoon.css">
    <link rel="stylesheet" href="vistas/css/header.css">
    <link rel="stylesheet" href="vistas/css/front-main.css">
    <link rel="stylesheet" href="vistas/css/login2.css">
    <link rel="stylesheet" href="vistas/css/busqueda.css">
</head>
<body>
    <header>
        <span class="icon-search abrir-busqueda"></span>

        <nav>
            <div class="nav-item">
                <p>Inicio</p>
            </div>
            <div class="nav-item">
                <p>Acerca de</p>
            </div>
            <div class="nav-item">
                <p>Contacto</p>
            </div>
        </nav>

        <span class="icon-user abrir-login"></span>

    </header>

    <div class="busqueda">

        <span class="icon-cross cerrar-busqueda"></span>
        <div class="form-box">
            <h1 class="animation">Búsqueda de Libros</h1>
            <form action="#">
                <div class="buscar-normal">
                    <div class="input-box animation">
                        <input type="text" name="" id="" class="inputLibro" required placeholder="Buscar titulo de libro">
                    </div>
                    <button type="button" class="btn animation buscar-libro-boton">Buscar</button>
                </div>
                <div class="buscar-avanzada">
                    <div class="adv-modes">
                    <div class="adv-modes-items">
                            <h2>Materia</h2>
                            <div class="input-box">
                            <select class="filtro-materia">
                                <option value="">- - - - - - </option>
                                <?php
                                    foreach ($materias as $materia) {
                                        echo '<option value="'.$materia['idMateria'].'">' . $materia['materia'] . '</option>';
                                        // 23
                                    }
                                    ?>
                            </select>
                            </div>
                            </div>
                            <div class="adv-modes-items">
                                <h2>Autor</h2>
                                <div class="input-box">
                                <select class="filtro-autor">
                                    <option value="">- - - - - - </option>
                                    <?php
                                        foreach ($autores as $autor) {
                                        echo '<option value="' . $autor['idAutor'] . '">' . $autor['autor'] . '</option>';
                                        }
                                    ?>
                                    </select>
                                </div>
                            </div>
                        
                        <div class="adv-modes-items">
                            <h2>Editorial</h2>
                            <div class="input-box">
                            <select class="filtro-editorial">
                                    <option value="">- - - - - - </option>
                                    <?php
                                    foreach ($editoriales as $editorial) {
                                        echo '<option value="' . $editorial['idEditorial'] . '">' . $editorial['editorial'] . '</option>';
                                    }
                                    ?>
                                    </select>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </div>

        <div class="busqueda-result resultado-busqueda">
      
        </div>


    </div>

    <div class="login-frame <?php if(isset($_SESSION) || isset($GET)) echo "active"?>">
        <span class="icon-cross cerrar-login"></span>
        
        <?php
            if(isset($_SESSION['tipoUsuario'])){
                switch($_SESSION['tipoUsuario']){
                    case -1:
                        echo "<p class='mensaje-status'>El usuario o la contraseña no son correctas.<p>";
                        break;
                    case 3:
                        echo "<p class='mensaje-status'>¡Ten paciencia! Tu cuenta será dada de alta en cuanto la bibliotecaria corrobore los datos.<p>";
                        break;
                }
            }else{
                if(isset($_GET["funcion"])){
                    if( $_GET["funcion"] == "reg2" && $_GET["status"] == "ok")
                        echo "<p class='mensaje-status'>¡Ten paciencia! Tu cuenta será dada de alta en cuanto la bibliotecaria corrobore los datos.<p>";
                    else
                        echo "<p class='mensaje-status'>Corrobora los datos que ingresaste, puede que ya haya alguien usando esas credenciales.<p>";
                }
            }
        ?>
        <div class="wrapper">

            <span class="bg-animate">
            </span>
            <span class="bg-animate2">
            </span>

            <div class="form-box login">
                
                <h2 class="animation" style="--i:0; --j:21;">Login</h2>
                <form action="index.php" method="post">
                    <div class="input-box animation" style="--i:1; --j:22;">
                        <input type="text" name="nombre_usuario" id="nombre_usuario" required>
                        <label for="nombre_usuario">Usuario</label>
                        <i class="bx bxs-user"></i>
                    </div>
                    <div class="input-box animation" style="--i:2; --j:23;">
                        <input type="password" name="contrasenia" id="contrasenia" required>
                        <label for="contrasenia">Contraseña</label>
                        <i class="bx bxs-lock-alt"></i>
                    </div>
                    <button type="submit" class="btn animation" style="--i:3; --j:24;">Login</button>

                    <div class="logreg-link animation" style="--i:4; --j:25;">
                        <p>¿No tienes cuenta todavía?
                            <a href="#" class="register-link">Registrar</a>
                        </p>
                    </div>
                </form>
            </div>
            
            <div class="info-text login">
                <h2 class="animation" style="--i:0; --j:20;">¡Bienvenido!</h2>
                <p class="animation" style="--i:1; --j:21;">Accede a la gestión de biblioteca.</p>

            </div>

            <div class="form-box register">
                <h2 class="animation" style="--i:17; --j:0;">Registrarse</h2>
                <form action="index.php" method="post">
                    <div class="input-box animation" style="--i:18; --j:1;">
                        <input type="text" name="r-username" id="" required>
                        <label for="">Usuario</label>
                        <i class="bx bxs-user"></i>
                    </div>
                    <div class="input-box animation" style="--i:19; --j:2;">
                        <input type="text" name="r-email" id="" required>
                        <label for="">Email</label>
                        <i class="bx bxs-envelope"></i>
                    </div>
                    <div class="input-box animation" style="--i:20; --j:3;">
                        <input type="password" name="r-password" id="" required>
                        <label for="">Contraseña</label>
                        <i class="bx bxs-lock-alt"></i>
                    </div>
                    <button type="submit" class="btn animation" style="--i:21; --j:4;">Registrar</button>

                    <div class="logreg-link animation" style="--i:22; --j:5;">
                        <p>¿Ya tienes una cuenta?
                            <a href="#" class="login-link">Login</a>
                        </p>
                    </div>
                </form>
            </div>

            <div class="info-text register">
                <h2 class="animation" style="--i:17; --j:0;">¡Que esperas!</h2>
                <p class="animation" style="--i:18; --j:1;">Crea una cuenta de forma gratuita.</p>

            </div>

        </div>
    </div>

    <main>
        <section class="home" id="home">
            <div class="home-content">
                <h1>Biblioteca Pública</h1>
                <div class="text-animate">
                    <h3>Cultura e interés general</h3>
                    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat ex numquam reiciendis, tempora architecto voluptatem facere consequatur modi corporis voluptates quisquam explicabo tenetur placeat aliquid atque? Ex sit aperiam at.
                    </p>
                </div>

            </div>
        </section>

        <section class="about">
            <h2 class="heading">Acerca de la institución</h2>
            
            <div class="about-galery">
                <div class="about-img-left">
                    <img src="vistas/img/leyendo2.jpg" alt="">
                    <img src="vistas/img/leyendo3.jpg" alt="">
                </div>
                
                <div class="about-img">
                    <img src="vistas/img/leyendo1.jpg" alt="">
                    <span class="circle-spin"></span>
                </div>

                <div class="about-img-right">
                    <img src="vistas/img/leyendo4.jpg" alt="">
                    <img src="vistas/img/leyendo5.jpeg" alt="">
                </div>
                
            </div>

            <div class="about-content">
                <h3>Fomentamos la cultura de la lectura</h3>
                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Minus assumenda corporis quae eos fugit beatae. Repellat assumenda magnam magni suscipit provident quis nobis quaerat. Quam, quo et! Aspernatur, vero totam.</p>
            </div>

        </section>

        <section class="contact">
            <h2 class="heading">Contactanos</h2>
            <form action="#">
                <div class="input-box">
                    <div class="input-field">
                        <input type="text" name="" placeholder="Nombre" id="" required>
                        <span class="focus"></span>
                    </div>
                    <div class="input-field">
                        <input type="text" name="" placeholder="Apellido" id="" required>
                        <span class="focus"></span>
                    </div>

                </div>
                <div class="input-box">
                    <div class="input-field">
                        <input type="text" name="" placeholder="Telefono" id="" required>
                        <span class="focus"></span>
                    </div>
                    <div class="input-field">
                        <input type="text" name="" placeholder="Email" id="" required>
                        <span class="focus"></span>
                    </div>

                </div>
                
                <div class="textarea-field">
                    <textarea name="" id="" cols="30" rows="10" placeholder="Escribe tus comentarios" required></textarea>
                </div>

                <div class="btn-box">
                    <button type="submit">Submit</button>
                </div>

            </form>
        </section>
    </main>

    <script src="vistas/js/login2.js"></script>
    <script src="vistas/js/front-page.js"></script>
    <script src="vistas/js/classes/Libro.js"></script>
    <script src="vistas/js/classes/BusquedaController.js"></script>
    
</body> 
</html>