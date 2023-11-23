<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
    
    <aside>
        <div class="avatar">
            <img src="vistas/img/129868.PNG">
            <span class="icon-cross"></span>
        </div>

        <div class="menu-dash">
            <div class="menu-item show-solicitar-libro">
                <span class="icon-clipboard"></span>
                <p>Solicitar Libro</p>
            </div>
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

        </div>
    </aside>


    <!-- Frames -->
    <section class="frame-usuarios active">
        <form action="" class="form-container">
            <h1>Gestión de Usuarios</h1>
            <article class="a-user">
                <h2>Alta de usuario</h2>
                <div class="add-new-user">
                    <span class="icon-plus"></span>
                    <p>Nuevo usuario</p>
                </div>

                <h3>Pre registros por aprobar</h3>
                <div class="add-pre-registred">
                    <div class="add-pre-item box-type1" >
                        <h4>Pablo Perez</h4>
                        <div class="add-pre-content box-type1-content">
                            <span class="icon-home"><p>Alberdi 345</p></span>
                            <span class="icon-phone"><p>+345515964</p></span>
                            <span class="icon-mail"><p>pabloperez@gmail.com</p></span>
                        </div>
                        <div class="add-pre-btns box-type1-btns">
                            <span class="icon-checkmark"></span>
                            <span class="icon-cross"></span>
                        </div>
                    </div>
                    <div class="add-pre-item box-type1">
                        <h4>Pablo Perez</h4>
                        <div class="add-pre-content box-type1-content">
                            <span class="icon-home"><p>Alberdi 345</p></span>
                            <span class="icon-phone"><p>+345515964</p></span>
                            <span class="icon-mail"><p>pabloperez@gmail.com</p></span>
                        </div>
                        <div class="add-pre-btns box-type1-btns" >
                            <span class="icon-checkmark"></span>
                            <span class="icon-cross"></span>
                        </div>
                    </div>
                    
                    
                </div>
            </article>
            
            <article class="bm-user">
                <h2>Baja, Modificación y Penalidad</h2>
                <div class="bm-user-buscar">
                    <div class="user-buscador search-type1">
                        <span class="icon-search buscar-usuario-bm"></span>
                        <input class="input-buscar-usuario-bm" type="text" name="" id="" placeholder="Ingrese nombre, apellido o dni">
                    </div>
                </div>

                <div class="frame-filters-select">
                    <h3>Filtrar:</h3>
                    <div class="frame-filters-select-container">
                        <span class="icon-play3"></span>

                        <select class="filtro-buscar-usuario-bm" name="" id="">
                            <option value="">Sin Filtros</option>
                            <option value="apellido ASC">por Apellido (ASC)</option>
                            <option value="apellido DESC">por Apellido (DESC)</option>
                            <option value="direccion ASC">por Domicilio (ASC)</option>
                            <option value="direccion DESC">por Domicilio (DESC)</option>
    
                        </select>    
                        
                    </div>
                </div>

                <div class="bm-user-result">
                    
                </div>
            </article>
        </form>
    </section>

    <section class="frame-reservas">
        <form action="" class="form-container">
            <h1>Gestión de Reservas</h1>
            <article class="mis-reservas">
                <h2>Reservas activas</h2>

                <div class="res-activas">
                    <div class="res-act-item box-type1">
                        <h4>393034# Caperucita roja</h4>
                        <div class="add-pre-content box-type1-content">
                            <span class="icon-upload"><p>Retiro: 13/10/2023</p></span>
                            <span class="icon-download"><p>Devolución: 20/10/2023</p></span>
                        </div>
                        <div class="add-pre-btns box-type1-btns">
                            <span class="icon-cross cancel-reserva"></span>
                        </div>
                    </div>

                    <div class="res-act-item-penalized box-type1">
                        <b>Penalizado por: 23:21:40</b>
                        <p>Espera que se cumpla el plazo para tener tu espacio de reserva disponible nuevamente.</p>
                    </div>

                    <div class="res-act-item-vacio box-type1">
                        <p>Espacio disponible para una nueva reserva.</p>
                    </div>

                    <div class="res-act-item-vacio box-type1">
                        <p>Espacio disponible para una nueva reserva.</p>
                    </div>
                </div>

            </article>
            <article class="add-reserva">
                <h2>Nueva reserva</h2>
                <div class="add-res-buscar">
                    <div class="add-res-buscador search-type1">
                        <span class="icon-search"></span>
                        <input type="text" name="" id="" placeholder="Ingrese nombre del libro">
                    </div>
                </div>

                <div class="frame-filters-select">
                    <h3>Filtrar:</h3>
                    <div class="frame-filters-select-container">
                        <span class="icon-play3"></span>

                        <select name="" id="">
                            <option value="">por Fecha (ASC)</option>
                            <option value="">por Fecha (DESC)</option>
                            <option value="">por Libro (ASC)</option>
                            <option value="">por Libro (DESC)</option>
                            <option value="">por Estado: Aprobados</option>
                            <option value="">por Estado: Rechazados</option>
                            <option value="">por Estado: A confirmar</option>
    
                        </select>    
                        
                    </div>
                </div>

                <div class="add-res-libro-result">
                    <div class="add-pre-item box-type1">
                        <h4>949292# Caperusita rosa y los enanos</h4>
                        <div class="add-pre-content box-type1-content">
                            <span class="icon-quill" title="Autor"><p>Jose Hernandez</p></span>
                            <span class="icon-book" title="Materia"><p>Matemáticas</p></span>
                            <span class="icon-library" title="Editorial"><p>Santillana</p></span>
                        </div>
                        <div class="add-pre-btns box-type1-btns">
                            <span class="icon-plus open-modal-res"></span>
                        </div>
                    </div>
                    
                    <div class="add-pre-item box-type1">
                        <h4>949292# Caperusita rosa y los enanos</h4>
                        <div class="add-pre-content box-type1-content">
                            <span class="icon-quill" title="Autor"><p>Jose Hernandez</p></span>
                            <span class="icon-book" title="Materia"><p>Matemáticas</p></span>
                            <span class="icon-library" title="Editorial"><p>Santillana</p></span>
                        </div>
                        <div class="add-pre-btns box-type1-btns">
                            <span class="icon-plus open-modal-res"></span>
                        </div>
                    </div>
                    
                    <div class="add-pre-item box-type1">
                        <h4>949292# Caperusita rosa y los enanos</h4>
                        <div class="add-pre-content box-type1-content">
                            <span class="icon-quill" title="Autor"><p>Jose Hernandez</p></span>
                            <span class="icon-book" title="Materia"><p>Matemáticas</p></span>
                            <span class="icon-library" title="Editorial"><p>Santillana</p></span>
                        </div>
                        <div class="add-pre-btns box-type1-btns">
                            <span class="icon-plus open-modal-res"></span>
                        </div>
                    </div>

                </div>

            </article>
        </form>
    </section>

    <section class="frame-libros">
        <form action="" class="form-container">
            <h1>Gestión de Libros</h1>
            <article class="a-libro">
                <h2>Alta de libro</h2>
                
                <div class="add-new-libro">
                    <span class="icon-plus"></span>
                    <p>Nuevo libro</p>
                </div>

                <div class="frame-filters-select">
                    <h3>Filtrar:</h3>
                    <div class="frame-filters-select-container">
                        <span class="icon-play3"></span>

                        <select name="" id="" class="filtro-libro-pedido">
                            <option value="">por Titulo (ASC)</option>
                            <option value="">por Titulo (DESC)</option>
                            <option value="">por Autor (ASC)</option>
                            <option value="">por Autor (DESC)</option>
                            <option value="">por Materia (ASC)</option>
                            <option value="">por Materia (DESC)</option>
                            
                        </select>    
                        
                    </div>
                </div>

                <h3>Lista de pedidos <span class="icon-file-pdf descargar-pdf" title="Descarga lista pdf"></span></h3>
                
                <div class="add-libros-pedidos">
                    <div class="add-lp-item box-type1" >
                        <h4>Los 3 mosquiteros</h4>
                        <div class="add-lp-content box-type1-content">
                            <span class="icon-user"><p>Prof. Pablo Perez</p></span>
                            <span class="icon-book"><p>Cantidad: 10</p></span>
                            <span class="icon-calendar"><p>Fecha solicitada: 16/10/2023</p></span>
                        </div>
                        <div class="add-lp-btns box-type1-btns">
                            <span class="icon-checkmark" idPedido="123"></span>
                            <span class="icon-pencil edit-libro-pedido" idPedido="123"></span>
                            <span class="icon-cross" idPedido="123"></span>
                        </div>
                    </div>

                    <div class="add-lp-item box-type1" >
                        <h4>Los 3 mosquiteros</h4>
                        <div class="add-lp-content box-type1-content">
                            <span class="icon-user"><p>Prof. Pablo Perez</p></span>
                            <span class="icon-book"><p>Cantidad: 10</p></span>
                            <span class="icon-calendar"><p>Fecha solicitada: 16/10/2023</p></span>
                        </div>
                        <div class="add-lp-btns box-type1-btns">
                            <span class="icon-checkmark"></span>
                            <span class="icon-pencil edit-libro-pedido"></span>
                            <span class="icon-cross"></span>
                        </div>
                    </div>

                    <div class="add-lp-item box-type1" >
                        <h4>Los 3 mosquiteros</h4>
                        <div class="add-lp-content box-type1-content">
                            <span class="icon-user"><p>Prof. Pablo Perez</p></span>
                            <span class="icon-book"><p>Cantidad: 10</p></span>
                            <span class="icon-calendar"><p>Fecha solicitada: 16/10/2023</p></span>
                        </div>
                        <div class="add-lp-btns box-type1-btns">
                            <span class="icon-checkmark"></span>
                            <span class="icon-pencil edit-libro-pedido"></span>
                            <span class="icon-cross"></span>
                        </div>
                    </div>
                    
                </div>
            </article>
            
            <article class="bm-libro">
                <h2>Baja y Modificación</h2>
                <div class="bm-libro-buscar">
                    <div class="libro-buscador search-type1">
                        <span class="icon-search buscarLibroBM"></span>
                        <input type="text" name="" id="" class="inputLibroBM" placeholder="Ingrese titulo, autor, editorial o materia">
                    </div>
                    
                </div>

                <div class="frame-filters-select">
                    <h3>Filtrar:</h3>
                    <div class="frame-filters-select-container">
                        <span class="icon-play3"></span>

                        <select name="" id="" class="filtro-libro-bm">
                            <option value="">Sin filtros</option>
                            <option value="titulo ASC">por Titulo (ASC)</option>
                            <option value="titulo DESC">por Titulo (DESC)</option>
                            <option value="autor ASC">por Autor (ASC)</option>
                            <option value="autor DESC">por Autor (DESC)</option>
                            <option value="materia ASC">por Materia (ASC)</option>
                            <option value="materia DESC">por Materia (DESC)</option>
    
                        </select>    
                        
                    </div>
                </div>
                
                <div class="bm-libro-result librosBM">
                    

                </div>
            </article>
        </form>
    </section>

    <section class="frame-prestamos">
        <form action="" class="form-container">
            <h1>Gestión de Préstamos</h1>
            <article class="a-prestamo">
                <h2>Alta de Préstamo</h2>
                <div class="add-new-prestamo">
                    <span class="icon-plus"></span>
                    <p>Nuevo préstamo</p>
                </div>
                <h3>Lista de reservas activas</h3>
                <div class="bm-prestamo-buscar">
                    <div class="user-buscador search-type1">
                        <span class="icon-search"></span>
                        <input type="text" name="" id="" placeholder="Ingrese dni, titulo del libro o nro de reserva">
                    </div>
                </div>

                <div class="frame-filters-select">
                    <h3>Filtrar:</h3>
                    <div class="frame-filters-select-container">
                        <span class="icon-play3"></span>

                        <select name="" id="">
                            <option value="">por Fecha (ASC)</option>
                            <option value="">por Fecha (DESC)</option>
                            <option value="">por Libro (ASC)</option>
                            <option value="">por Libro (DESC)</option>
                            <option value="">por Estado: Aprobados</option>
                            <option value="">por Estado: Rechazados</option>
                            <option value="">por Estado: A confirmar</option>
    
                        </select>    
                        
                    </div>
                </div>

                <div class="bm-prestamo-result">
                    <div class="add-pre-item box-type1">
                        <h4>Reserva #123124523</h4>
                        <div class="add-pre-content box-type1-content">
                            <span class="icon-book"><p>Caperucita rosa</p></span>
                            <span class="icon-user"><p>Pablo Perez</p></span>
                            <span class="icon-arrow-up"><p>18/10/2023 (Retirado)</p></span>
                            <span class="icon-arrow-down"><p>25/10/2023 (A devolver)</p></span>
                        </div>
                        <div class="add-pre-btns box-type1-btns">
                            <span class="icon-checkmark edit-user"></span>
                            <span class="icon-cross"></span>
                        </div>
                    </div>
                    <div class="add-pre-item box-type1">
                        <h4>Reserva #123124523</h4>
                        <div class="add-pre-content box-type1-content">
                            <span class="icon-book"><p>Caperucita rosa</p></span>
                            <span class="icon-user"><p>Pablo Perez</p></span>
                            <span class="icon-arrow-up"><p>18/10/2023 (Retirado)</p></span>
                            <span class="icon-arrow-down"><p>25/10/2023 (A devolver)</p></span>
                        </div>
                        <div class="add-pre-btns box-type1-btns">
                            <span class="icon-checkmark edit-user"></span>
                            <span class="icon-cross"></span>
                        </div>
                    </div>
                    <div class="add-pre-item box-type1">
                        <h4>Reserva #123124523</h4>
                        <div class="add-pre-content box-type1-content">
                            <span class="icon-book"><p>Caperucita rosa</p></span>
                            <span class="icon-user"><p>Pablo Perez</p></span>
                            <span class="icon-arrow-up"><p>18/10/2023 (Retirado)</p></span>
                            <span class="icon-arrow-down"><p>25/10/2023 (A devolver)</p></span>
                        </div>
                        <div class="add-pre-btns box-type1-btns">
                            <span class="icon-checkmark edit-user"></span>
                            <span class="icon-cross"></span>
                        </div>
                    </div>
                    <div class="add-pre-item box-type1">
                        <h4>Reserva #123124523</h4>
                        <div class="add-pre-content box-type1-content">
                            <span class="icon-book"><p>Caperucita rosa</p></span>
                            <span class="icon-user"><p>Pablo Perez</p></span>
                            <span class="icon-arrow-up"><p>18/10/2023 (Retirado)</p></span>
                            <span class="icon-arrow-down"><p>25/10/2023 (A devolver)</p></span>
                        </div>
                        <div class="add-pre-btns box-type1-btns">
                            <span class="icon-checkmark edit-user"></span>
                            <span class="icon-cross"></span>
                        </div>
                    </div>

                </div>
            </article>
            
            <article class="bm-user">
                <h2>Préstamos activos</h2>
                <div class="bm-prestamo-buscar">
                    <div class="prestamo-buscador search-type1">
                        <span class="icon-search"></span>
                        <input type="text" name="" id="" placeholder="Ingrese nombre, apellido o dni">
                    </div>
                </div>

                <div class="frame-filters-select">
                    <h3>Filtrar:</h3>
                    <div class="frame-filters-select-container">
                        <span class="icon-play3"></span>

                        <select name="" id="">
                            <option value="">por Fecha (ASC)</option>
                            <option value="">por Fecha (DESC)</option>
                            <option value="">por Libro (ASC)</option>
                            <option value="">por Libro (DESC)</option>
                            <option value="">por Estado: Aprobados</option>
                            <option value="">por Estado: Rechazados</option>
                            <option value="">por Estado: A confirmar</option>
    
                        </select>    
                        
                    </div>
                </div>

                <div class="bm-prestamo-result">
                    <div class="add-pre-item box-type1">
                        <h4>Préstamo #123124523</h4>
                        <div class="add-pre-content box-type1-content">
                            <span class="icon-book"><p>Caperucita rosa</p></span>
                            <span class="icon-user"><p>Pablo Perez</p></span>
                            <span class="icon-arrow-up"><p>18/10/2023 (Retirado)</p></span>
                            <span class="icon-arrow-down"><p>25/10/2023 (A devolver)</p></span>
                        </div>
                        <div class="add-pre-btns box-type1-btns">
                            <span class="icon-hour-glass edit-user"></span>
                            <span class="icon-download2"></span>
                        </div>
                    </div>
                    <div class="add-pre-item box-type1">
                        <h4>Préstamo #123124523</h4>
                        <div class="add-pre-content box-type1-content">
                            <span class="icon-book"><p>Caperucita rosa</p></span>
                            <span class="icon-user"><p>Pablo Perez</p></span>
                            <span class="icon-arrow-up"><p>18/10/2023 (Retirado)</p></span>
                            <span class="icon-arrow-down"><p>25/10/2023 (A devolver)</p></span>
                        </div>
                        <div class="add-pre-btns box-type1-btns">
                            <span class="icon-hour-glass edit-user"></span>
                            <span class="icon-download2"></span>
                        </div>
                    </div>
                    <div class="add-pre-item box-type1">
                        <h4>Préstamo #123124523</h4>
                        <div class="add-pre-content box-type1-content">
                            <span class="icon-book"><p>Caperucita rosa</p></span>
                            <span class="icon-user"><p>Pablo Perez</p></span>
                            <span class="icon-arrow-up"><p>18/10/2023 (Retirado)</p></span>
                            <span class="icon-arrow-down"><p>25/10/2023 (A devolver)</p></span>
                        </div>
                        <div class="add-pre-btns box-type1-btns">
                            <span class="icon-hour-glass edit-user"></span>
                            <span class="icon-download2"></span>
                        </div>
                    </div>
                    <div class="add-pre-item box-type1">
                        <h4>Préstamo #123124523</h4>
                        <div class="add-pre-content box-type1-content">
                            <span class="icon-book"><p>Caperucita rosa</p></span>
                            <span class="icon-user"><p>Pablo Perez</p></span>
                            <span class="icon-arrow-up"><p>18/10/2023 (Retirado)</p></span>
                            <span class="icon-arrow-down"><p>25/10/2023 (A devolver)</p></span>
                        </div>
                        <div class="add-pre-btns box-type1-btns">
                            <span class="icon-hour-glass edit-user"></span>
                            <span class="icon-download2"></span>
                        </div>
                    </div>

                </div>
            </article>
        </form>
    </section>

    <section class="frame-solicitar-libro">
        <form action="" class="form-container">
            <h1>Solicitar nuevo libro</h1>
            <article class="a-libro">
                <h2>Estado de solicitudes:</h2>
                
                <div class="add-new-libro">
                    <span class="icon-plus add-solicitud-libro"></span>
                    <p>Solicitar libro</p>
                </div>

                <div class="frame-filters-select">
                    <h3>Filtrar:</h3>
                    <div class="frame-filters-select-container">
                        <span class="icon-play3"></span>

                        <select name="" id="">
                            <option value="">por Fecha (ASC)</option>
                            <option value="">por Fecha (DESC)</option>
                            <option value="">por Libro (ASC)</option>
                            <option value="">por Libro (DESC)</option>
                            <option value="">por Estado: Aprobados</option>
                            <option value="">por Estado: Rechazados</option>
                            <option value="">por Estado: A confirmar</option>
    
                        </select>    
                        
                    </div>
                </div>

                <div class="add-libros-pedidos">
                    <div class="add-lp-item box-type1" >
                        <h4>Los 3 mosquiteros</h4>
                        <div class="add-lp-content box-type1-content">
                            <span class="icon-flag"><p>Estado: </p></span>
                            <span class="icon-books"><p>Ejemplares: 10</p></span>
                            <span class="icon-calendar"><p>Fecha solicitada: 16/10/2023</p></span>
                        </div>
                        <div class="add-lp-btns box-type1-btns">
                            <span class="icon-cross"></span>
                        </div>
                    </div>

                    <div class="add-lp-item box-type1" >
                        <h4>Los 3 mosquiteros</h4>
                        <div class="add-lp-content box-type1-content">
                            <span class="icon-flag"><p>Estado: </p></span>
                            <span class="icon-books"><p>Ejemplares: 10</p></span>
                            <span class="icon-calendar"><p>Fecha solicitada: 16/10/2023</p></span>
                        </div>
                        <div class="add-lp-btns box-type1-btns">
                            
                        </div>
                    </div>

                    <div class="add-lp-item box-type1" >
                        <h4>Los 3 mosquiteros</h4>
                        <div class="add-lp-content box-type1-content">
                            <span class="icon-flag"><p>Estado: </p></span>
                            <span class="icon-books"><p>Ejemplares: 10</p></span>
                            <span class="icon-calendar"><p>Fecha solicitada: 16/10/2023</p></span>
                        </div>
                        <div class="add-lp-btns box-type1-btns">
                            
                        </div>
                    </div>
                    
                </div>
            </article>
            
        </form>
    </section>
    

    <!-- Modals de reserva -->
    <div class="modal-frame modal-reserva">
        <form action="#" class="modal-form1">
            <div class="modal-form1-titulo">
                <p>Confirmar reserva - Fijar fecha</p>
                <span class="icon-cross close-modal-res"></span>
            </div>

            <div class="modal-form1-content">
                <div class="reserva-user-info">
                    <span class="icon-user"></span>
                    <p>#12354125 - Pablo Perez</p>
                </div>
                <div class="reserva-libro-info">
                    <span class="icon-book"></span>
                    <p>Caperusita y el lobo feroz</p>
                </div>
                
                <div class="reserva-seleccionar-fechas">
                    <div class="calendario">
                        <div class="display-fecha">
                            <div class="display-desde">
                                <h1 id="dia-desde">18</h1>
                                <p id="mes-anio-desde">Octubre - 2023</p>
                            </div>
                            <div class="display-hasta">
                                <h1 id="dia-hasta">25</h1>
                                <p id="mes-anio-hasta">Octubre - 2023</p>
                            </div>
                        </div>
            
                        <div class="almanaques">
                            <span class="icon-arrow-left"></span>
                            <span class="icon-arrow-right"></span>
            
                            <div class="almanaque">
                                <div class="almanaque-mes primer">
                                    <!-- Auto Generado con JS -->
                                </div>
                                <div class="almanaque-fechas">
                                        <li>Dom</li>
                                        <li>Lun</li>
                                        <li>Mar</li>
                                        <li>Mie</li>
                                        <li>Jue</li>
                                        <li>Vie</li>
                                        <li>Sab</li>
                                </div>
                                <div class="almanaque-dias" id="alm1">
                                    <!-- Auto Generado con JS -->
                                </div>
                            </div>
                            
                            <div class="almanaque">
                                <div class="almanaque-mes segundo">
                                    <!-- Auto Generado con JS -->
                                </div>
                                <div class="almanaque-fechas">
                                        <li>Dom</li>
                                        <li>Lun</li>
                                        <li>Mar</li>
                                        <li>Mie</li>
                                        <li>Jue</li>
                                        <li>Vie</li>
                                        <li>Sab</li>
                                </div>
                                <div class="almanaque-dias" id="alm2">
                                        <!-- Auto Generado con JS -->
                                </div>
            
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-form1-btns">
                    <button type="submit">Confirmar</button>
                    <button type="button" class="cancel-modal-res">Cancelar</button>
                </div>

            </div>

        </form>
    </div>

    <div class="modal-frame modal-del-reserva">
        <form action="#" class="modal-form1">
            <div class="modal-form1-titulo">
                <p>Eliminar libro</p>
                <span class="icon-cross close-modal-del-reserva"></span>
            </div>

            <div class="modal-form1-content">
                
                <div class="modal-form1-confirmdialog">
                    <p>¿Está seguro de dar de baja la siguiente reserva?</p>
                    <span class="icon-user del-user-id"><p>Reserva: 123415135 - Libro: Caperucita Roja</p></span>
                </div>

                
                <div class="modal-form1-btns">
                    <button type="submit">Confirmar</button>
                    <button type="button" class="cancel-modal-del-reserva">Cancelar</button>
                </div>

            </div>

        </form>
    </div>


    <!-- Modals de usuario -->
    <div class="modal-frame modal-add-user">
        <form action="#" class="modal-form1">
            <div class="modal-form1-titulo">
                <p>Agregar nuevo usuario</p>
                <span class="icon-cross close-modal-add-user"></span>
            </div>

            <div class="modal-form1-content">
                
                <div class="modal-form1-inputs">
                    <div class="modal-form1-input-item">
                        <input class="input-add-user nombre" type="text" id="" required>
                        <label for="">Nombre</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="input-add-user apellido" type="text" name="" id="" required>
                        <label for="">Apellido</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="input-add-user dni" type="text" name="" id="" required>
                        <label for="">DNI</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="input-add-user fechaNac" type="date" name="" id="" required>
                        <label for="">Fecha de Nacimiento</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="input-add-user direccion" type="text" name="" id="" required>
                        <label for="">Domicilio</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="input-add-user email" type="text" name="" id="" required>
                        <label for="">Email</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="input-add-user telefono" type="text" name="" id="" required>
                        <label for="">Telefono</label>
                    </div>
                </div>

                <div class="modal-form1-status db-add-user">

                </div>

                
                <div class="modal-form1-btns">
                    <button type="button" class="confirm-modal-add-user">Confirmar</button>
                    <button type="button" class="cancel-modal-add-user">Cancelar</button>
                </div>

            </div>

        </form>
    </div>

    <div class="modal-frame modal-edit-user">
        <form action="#" class="modal-form1">
            <div class="modal-form1-titulo">
                <p>Agregar nuevo usuario</p>
                <span class="icon-cross close-modal-edit-user"></span>
            </div>

            <div class="modal-form1-content">
                
                <div class="modal-form1-inputs">
                    <div class="modal-form1-input-item">
                        <input class="input-edit-user nombre" type="text" id="" required>
                        <label for="">Nombre</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="input-edit-user apellido" type="text" name="" id="" required>
                        <label for="">Apellido</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="input-edit-user dni" type="text" name="" id="" required>
                        <label for="">DNI</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="input-edit-user fechaNac" type="date" name="" id="" required>
                        <label for="">Fecha de Nacimiento</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="input-edit-user direccion" type="text" name="" id="" required>
                        <label for="">Domicilio</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="input-edit-user email" type="text" name="" id="" required>
                        <label for="">Email</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="input-edit-user telefono" type="text" name="" id="" required>
                        <label for="">Telefono</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="input-edit-user tipoUsuario" type="text" name="" id="" required>
                        <label for="">Privilegios</label>
                    </div>
                </div>

                <div class="modal-form1-status db-edit-user">

                </div>
                
                <div class="modal-form1-btns">
                    <button type="button" class="confirm-modal-edit-user">Confirmar</button>
                    <button type="button" class="cancel-modal-edit-user">Cancelar</button>
                </div>

            </div>

        </form>
    </div>

    <div class="modal-frame modal-penal-user">
        <form action="#" class="modal-form1">
            <div class="modal-form1-titulo">
                <p>Agregar nuevo usuario</p>
                <span class="icon-cross close-modal-penal-user"></span>
            </div>

            <div class="modal-form1-content">
                
                <div class="modal-form1-inputs user-penalidad">
                    <div class="modal-form1-input-item">
                        <input class="input-penal-user" type="number" id="" required>
                        <label for="">Penalidad (Horas)</label>
                    </div>
                </div>

                <div class="modal-form1-status db-penal-user">

                </div>
                
                <div class="modal-form1-btns">
                    <button type="button" class="confirm-modal-penal-user">Confirmar</button>
                    <button type="button" class="cancel-modal-penal-user">Cancelar</button>
                </div>

            </div>

        </form>
    </div>

    <div class="modal-frame modal-del-user">
        <form action="#" class="modal-form1">
            <div class="modal-form1-titulo">
                <p>Agregar nuevo usuario</p>
                <span class="icon-cross close-modal-del-user"></span>
            </div>

            <div class="modal-form1-content">
                
                <div class="modal-form1-confirmdialog">
                    <p>¿Está seguro de eliminar el siguiente elemento?</p>
                    <span class="icon-user del-usuario-id">

                    </span>
                </div>

                <div class="modal-form1-status db-del-user">
                    
                </div>
                
                <div class="modal-form1-btns">
                    <button type="button" class="confirm-modal-del-user">Confirmar</button>
                    <button type="button" class="cancel-modal-del-user">Cancelar</button>
                </div>

            </div>

        </form>
    </div>

    <!-- Modals de prestamo -->

    <div class="modal-frame modal-add-prestamo">
        <div class="modal-slide-container">
            <div class="modal-slide-form">
                <div class="modal-slide-form-box">
                    <h1>Cargar Usuario</h1>
                    <form action="#" method="post" class="modal-slide-busqueda search-type1">
                        <span class="icon-search"></span>
                        <input type="text" name="" id="" placeholder="Ingrese nombre, apellido o dni">
                    </form>
                    <div class="modal-slide-result">
                        <div class="modal-slide-result-item valido">
                            <h4>ID: 123145</h4>
                            <div class="modal-slide-item-content">
                                <span class="icon-user"><p>Pablo Perez</p></span>
                                <span class="icon-profile"><p>DNI: 35677234</p></span>
                                <span class="icon-location"><p>Alberdi 3232</p></span>
                            </div>
                        </div>
                        <div class="modal-slide-result-item penalizado">
                            <h4>ID: 123145</h4>
                            <div class="modal-slide-item-content">
                                <span class="icon-user"><p>Pablo Perez</p></span>
                                <span class="icon-profile"><p>DNI: 35677234</p></span>
                                <span class="icon-location"><p>Alberdi 3232</p></span>
                            </div>
                        </div>
                        <div class="modal-slide-result-item">
                            <h4>ID: 123145</h4>
                            <div class="modal-slide-item-content">
                                <span class="icon-user"><p>Pablo Perez</p></span>
                                <span class="icon-profile"><p>DNI: 35677234</p></span>
                                <span class="icon-location"><p>Alberdi 3232</p></span>
                            </div>
                        </div>
                    </div>
                    <div class="modal-slide-buttons">
                        
                        <button type="button" class="close-modal-add-prestamo">Cancelar</button>
                        <span class="icon-arrow-right next1"><p>Siguiente</p></span>
                    </div>
                </div>
                <div class="modal-slide-form-box">
                    <h1>Cargar Libro</h1>
                    <form action="#" method="post" class="modal-slide-busqueda search-type1">
                        <span class="icon-search"></span>
                        <input type="text" name="" id="" placeholder="Ingrese titulo, materia o isbn">
                    </form>
                    <div class="modal-slide-result">
                        <div class="modal-slide-result-item valido">
                            <h4>ID: 123145</h4>
                            <div class="modal-slide-item-content">
                                <span class="icon-book"><p>Caperucita RED</p></span>
                                <span class="icon-books"><p>Disponibles: 5</p></span>
                                <span class="icon-location"><p>Sección A6-n32</p></span>
                            </div>
                        </div>
                        <div class="modal-slide-result-item penalizado">
                            <h4>ID: 123145</h4>
                            <div class="modal-slide-item-content">
                                <span class="icon-book"><p>Caperucita RED</p></span>
                                <span class="icon-books"><p>Disponibles: 0</p></span>
                                <span class="icon-location"><p>Sección A6-n32</p></span>
                            </div>
                        </div>
                        <div class="modal-slide-result-item valido">
                            <h4>ID: 123145</h4>
                            <div class="modal-slide-item-content">
                                <span class="icon-book"><p>Caperucita RED</p></span>
                                <span class="icon-books"><p>Disponibles: 5</p></span>
                                <span class="icon-location"><p>Sección A6-n32</p></span>
                            </div>
                        </div>
                        <div class="modal-slide-result-item valido">
                            <h4>ID: 123145</h4>
                            <div class="modal-slide-item-content">
                                <span class="icon-book"><p>Caperucita RED</p></span>
                                <span class="icon-books"><p>Disponibles: 5</p></span>
                                <span class="icon-location"><p>Sección A6-n32</p></span>
                            </div>
                        </div>
                    </div>
                    <div class="modal-slide-buttons">
                        <span class="icon-arrow-left previous1"><p>Atras</p></span>
                        <button type="button" class="close-modal-add-prestamo">Cancelar</button>
                        <span class="icon-arrow-right next2"><p>Siguiente</p></span>
                    </div>
                </div>
                <div class="modal-slide-form-box">
                    <h1>Confirmar Préstamo</h1>
                    
                    <div class="modal-slide-confirm-data">
                        <span class="icon-user"><p>Pablo Perez</p></span>
                        <span class="icon-book"><p>Caperucita RED</p></span>
                        <span class="icon-upload"><p>Retiro: 24/10/2023</p></span>
                        <span class="icon-download"><p>Devolución: 31/10/2023</p></span>
                    </div>

                    <div class="modal-slide-buttons">
                        <span class="icon-arrow-left previous2"><p>Atras</p></span>
                        <button type="button" class="close-modal-add-prestamo">Cancelar</button>
                        <button type="button">Confirmar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modals de libro -->

    <div class="modal-frame modal-add-libro">
        <form action="#" class="modal-form1">
            <div class="modal-form1-titulo">
                <p>Agregar nuevo libro</p>
                <span class="icon-cross close-modal-add-libro"></span>
            </div>

            <div class="modal-form1-content">
                
                <div class="modal-form1-inputs">
                    <div class="modal-form1-input-item">
                        <input class="libro-add titulo" type="text" id="" required>
                        <label for="">Titulo</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="libro-add autor" type="text" name="" id="" required>
                        <label for="">Autor</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="libro-add ubicacion" type="text" name="" id="" required>
                        <label for="">Ubicación en biblioteca</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="libro-add editorial" type="text" name="" id="" required>
                        <label for="">Editorial</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="libro-add materia" type="text" name="" id="" required>
                        <label for="">Materia</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="libro-add origen" type="text" name="" id="" required>
                        <label for="">Lugar de edición</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="libro-add anio" type="text" name="" id="" required>
                        <label for="">Año de fabricación</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="libro-add edicion" type="text" name="" id="" required>
                        <label for="">Número de serie</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="libro-add observacion" type="text" name="" id="" required>
                        <label for="">Observaciones</label>
                    </div>

                </div>

                <div class="modal-form1-status db-add-libro">

                </div>
                
                <div class="modal-form1-btns">
                    <button type="button" class="confirm-modal-add-libro" >Confirmar</button>
                    <button type="button" class="cancel-modal-add-libro">Cancelar</button>
                </div>

            </div>

        </form>
    </div>

    <div class="modal-frame modal-edit-libro-pedido">
        <form action="#" class="modal-form1">
            <div class="modal-form1-titulo">
                <p>Editar Pedido</p>
                <span class="icon-cross close-modal-edit-libro-pedido"></span>
            </div>

            <div class="modal-form1-content">
                
                <div class="modal-form1-inputs">
                    <div class="modal-form1-input-item">
                        <input class="libro-edit-pedido titulo" type="text" id="" required>
                        <label for="">Titulo</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="libro-edit-pedido editorial" type="text" name="" id="" required>
                        <label for="">Editorial</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="libro-edit-pedido autor" type="text" name="" id="" required>
                        <label for="">Autor</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="libro-edit-pedido anio" type="text" name="" id="" required>
                        <label for="">Año de fabricación</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="libro-edit-pedido ejemplares" type="text" name="" id="" required>
                        <label for="">Número de Ejemplares</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="libro-edit-pedido edicion" type="text" name="" id="" required>
                        <label for="">Edición</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="libro-edit-pedido ubicacion" type="text" name="" id="" required>
                        <label for="">Ubicación</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input class="libro-edit-pedido observacion" type="text" name="" id="" required>
                        <label for="">Observaciones</label>
                    </div>

                </div>

                <div class="modal-form1-status db-edit-libro-pedido">

                </div>

                
                <div class="modal-form1-btns">
                    <button type="submit" class="confirm-modal-edit-libro-pedido">Confirmar</button>
                    <button type="button" class="cancel-modal-edit-libro-pedido">Cancelar</button>
                </div>

            </div>

        </form>
    </div>

    <div class="modal-frame modal-edit-libro">
        <form action="#" class="modal-form1">
            <div class="modal-form1-titulo">
                <p>Editar Libro</p>
                <span class="icon-cross close-modal-edit-libro"></span>
            </div>

            <div class="modal-form1-content">
                
                <div class="modal-form1-inputs">
                    <div class="modal-form1-input-item">
                        <input type="text" class="libro-edit titulo" id="" required>
                        <label for="">Titulo</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input type="text" class="libro-edit autor" name="" id="" required>
                        <label for="">Autor</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input type="text" class="libro-edit ubicacion" name="" id="" required>
                        <label for="">Ubicación en biblioteca</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input type="text" class="libro-edit editorial" name="" id="" required>
                        <label for="">Editorial</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input type="text" class="libro-edit materia" name="" id="" required>
                        <label for="">Materia</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input type="text" class="libro-edit origen" name="" id="" required>
                        <label for="">Lugar de edición</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input type="text" class="libro-edit anio" name="" id="" required>
                        <label for="">Año de fabricación</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input type="text" class="libro-edit edicion" name="" id="" required>
                        <label for="">Número de edición</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input type="text" class="libro-edit observacion" name="" id="" required>
                        <label for="">Observaciones</label>
                    </div>

                </div>

                <div class="modal-form1-status db-edit-libro">

                </div>

                
                <div class="modal-form1-btns">
                    <button type="button" class="confirm-modal-edit-libro">Confirmar</button>
                    <button type="button" class="cancel-modal-edit-libro">Cancelar</button>
                </div>

            </div>

        </form>
    </div>

    <div class="modal-frame modal-del-libro">
        <form action="#" class="modal-form1">
            <div class="modal-form1-titulo">
                <p>Eliminar libro</p>
                <span class="icon-cross close-modal-del-libro"></span>
            </div>

            <div class="modal-form1-content">
                
                <div class="modal-form1-confirmdialog">
                    <p>¿Está seguro de eliminar el siguiente elemento?</p>
                    <span class="icon-book del-libro-id"></span>
                </div>

                <div class="modal-form1-status db-del-libro">

                </div>
                
                <div class="modal-form1-btns">
                    <button type="button" class="confirm-modal-del-libro">Confirmar</button>
                    <button type="button" class="cancel-modal-del-libro">Cancelar</button>
                </div>

            </div>

        </form>
    </div>

    <!-- Modals de solicitar libro -->

    <div class="modal-frame modal-solicitar">
        <form action="#" class="modal-form1">
            <div class="modal-form1-titulo">
                <p>Solicitar libro</p>
                <span class="icon-cross close-modal-solicitar"></span>
            </div>

            <div class="modal-form1-content">
                
                <div class="modal-form1-inputs">
                    <div class="modal-form1-input-item">
                        <input type="text" id="" required>
                        <label for="">Titulo</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input type="text" name="" id="" required>
                        <label for="">Editorial</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input type="text" name="" id="" required>
                        <label for="">Autor</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input type="text" name="" id="" required>
                        <label for="">Cantidad Ejemplares</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input type="text" name="" id="" required>
                        <label for="">Número de edición</label>
                    </div>
                    <div class="modal-form1-input-item">
                        <input type="text" name="" id="" required>
                        <label for="">Observaciones</label>
                    </div>

                </div>

                
                <div class="modal-form1-btns">
                    <button type="submit">Confirmar</button>
                    <button type="button" class="cancel-modal-solicitar">Cancelar</button>
                </div>

            </div>

        </form>
    </div>

    <!-- Scripts -->
    <script src="vistas/js/classes/Libro.js"></script>
    <script src="vistas/js/classes/Usuario.js"></script>
    <script src="vistas/js/calendario.js"></script>
    <script src="vistas/js/reservas.js"></script>
    <script src="vistas/js/dashboard-menu.js"></script>
    <script src="vistas/js/libro.js"></script>
    <script src="vistas/js/prestamo.js"></script>
    <script src="vistas/js/solicitar-libro.js"></script>
    

</body>
</html>