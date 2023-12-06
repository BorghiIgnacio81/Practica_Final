<section class="frame-reservas">
    <form action="" class="form-container" disabled>
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
                    <input type="text"  name="" id="" placeholder="Ingrese nombre del libro">
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

    <!-- Modals de reserva -->
<div class="modal-frame modal-reserva">
    <form action="#" class="modal-form1" disabled>
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
                <button type="button">Confirmar</button>
                <button type="button" class="cancel-modal-res">Cancelar</button>
            </div>

        </div>

    </form>
</div>

<div class="modal-frame modal-del-reserva">
    <form action="#" class="modal-form1" disabled>
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
                <button type="button">Confirmar</button>
                <button type="button" class="cancel-modal-del-reserva">Cancelar</button>
            </div>

        </div>

    </form>
</div>