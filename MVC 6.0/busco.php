<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/busqueda.css">
</head>
<body>
    <div class="busqueda">

        <span class="bg-animate">
        </span>

        <div class="form-box">
            <h1 class="animation" style="--i:0; --j:21;">Búsqueda de Libros</h1>

            <form action="DBController.php" method="get">
                <div class="buscar-normal">
                    <div class="input-box animation" style="--i:1; --j:22;">
                        <input type="text" name="titulo_libro" id="titulo_libro" required placeholder="Buscar titulo de libro">
                    </div>
                    <button type="submit" class="btn animation" style="--i:3; --j:24;">Buscar</button>
                </div>
           
            </form>
        </div>
        <div class="resultado-busqueda">
            <form action="DBController.php" method="get">
                <div class="res-item">
                    <div class="item-breef">
                        <h3>Resultados de la búsqueda:</h3>
                            <ul>
                                <?php
                                session_start();
                                if (isset($_SESSION['titulos']) && count($_SESSION['titulos']) > 0) {
                                    foreach ($_SESSION['titulos'] as $titulo) {
                                        echo '<li>Título libro: ' . $titulo . '</li>';
                                    }
                                } else {
                                    echo '<li>No se encontraron libros.</li>';
                                }
                                session_unset();
                                ?>
                            </ul>
                    </div>
                </div>
                <div class="buscar-avanzada">
                    <h1> Busqueda Avanzada</h1>
                    <span class="animation">></span>
                    <div class="adv-modes">
                        <div class="adv-modes-items autor">
                            <h2>Autor</h2>
                            <div class="input-box">
                                <input type="text" name="autor" id="autor" required placeholder="Buscar autor">
                            </div>
                        </div>
                        <div class="adv-modes-items">
                            <h2>Genero</h2>
                            <div class="input-box" >
                                <select name="materia">
                                    <option value="">Drama</option>
                                    <option value="">Ciencia Ficción</option>
                                    <option value="">Policial</option>
                                    <option value="">Física</option>
                                </select>
                            </div>
                        </div>
                        <!-- <div class="adv-modes-items">
                            <h2>Materia</h2>
                            <div class="input-box">
                                <select>
                                    <option value="">Literatura</option>
                                    <option value="">Matematica</option>
                                    <option value="">Historia</option>
                                    <option value="">Física</option>
                                </select>
                            </div>
                        </div>
                        <div class="adv-modes-items">
                            <h2>Editorial</h2>
                            <div class="input-box">
                                <select>
                                    <option value="">Santillana</option>
                                    <option value="">ALgon</option>
                                    <option value="">Policial</option>
                                    <option value="">Física</option>
                                </select>
                            </div>
                        </div>
                        <div class="adv-modes-items edicion">
                            <h2>Año Edición</h2>
                            <div class="input-box">
                                <div class="anio-edit">
                                    <label for="">Desde</label>
                                    <input type="number" min="2000" max="2030">    
                                </div>
                                
                                <div class="anio-edit">
                                    <label for="">Hasta</label>
                                    <input type="number" min="2000" max="2030">    
                                </div>
                            </div>
                        </div> -->
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
