<section class="frame-solicitar-libro">
    <form class="form-container">
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

                    <select class="filtros-pedidos-profesor" name="" id="">
                        <option value="">-- Sin Filtros --</option>    
                        <option value="fecha ASC">por Fecha (ASC)</option>
                        <option value="fecha DESC">por Fecha (DESC)</option>
                    </select>    
                    
                </div>
            </div>

            <div class="add-libros-pedidos">
                <div class="add-lp-item box-type1" >
                    <h4>Los 3 mosquiteros</h4>
                    <div class="add-lp-content box-type1-content">
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
                        <span class="icon-books"><p>Ejemplares: 10</p></span>
                        <span class="icon-calendar"><p>Fecha solicitada: 16/10/2023</p></span>
                    </div>
                    <div class="add-lp-btns box-type1-btns">
                        
                    </div>
                </div>

                <div class="add-lp-item box-type1" >
                    <h4>Los 3 mosquiteros</h4>
                    <div class="add-lp-content box-type1-content">
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

    <!-- Modals de solicitar libro -->

<div class="modal-frame modal-solicitar" idPedido="">
    <form class="modal-form1">
        <div class="modal-form1-titulo">
            <p>Solicitar libro</p>
            <span class="icon-cross close-modal-solicitar"></span>
        </div>

        <div class="modal-form1-content">
            
            <div class="modal-form1-inputs">
                <div class="modal-form1-input-item">
                    <input class="solicitud-add titulo" type="text" id="" required>
                    <label for="">Titulo</label>
                </div>
                <div class="modal-form1-input-item">
                    <input class="solicitud-add autor" type="text" name="" id="" required>
                    <label for="">Autor</label>
                </div>
                <div class="modal-form1-input-item">
                    <input class="solicitud-add editorial" type="text" name="" id="" required>
                    <label for="">Editorial</label>
                </div>
                <div class="modal-form1-input-item">
                    <input class="solicitud-add materia" type="text" name="" id="" required>
                    <label for="">Materia</label>
                </div>
                <div class="modal-form1-input-item">
                    <input class="solicitud-add origen" type="text" name="" id="" required>
                    <label for="">Lugar de edición</label>
                </div>
                <div class="modal-form1-input-item">
                    <input class="solicitud-add anio" type="text" name="" id="" required>
                    <label for="">Año de fabricación</label>
                </div>
                <div class="modal-form1-input-item">
                    <input class="solicitud-add edicion" type="text" name="" id="" required>
                    <label for="">Número de serie</label>
                </div>
                <div class="modal-form1-input-item">
                    <input class="solicitud-add cantidad" type="text" name="" id="" required>
                    <label for="">Cantidad Ejemplares</label>
                </div>
                <div class="modal-form1-input-item">
                    <input class="solicitud-add observacion" type="text" name="" id="" required>
                    <label for="">Observaciones</label>
                </div>
            </div>

            

            
            <div class="modal-form1-btns">
                <button type="button" class="send-modal-solicitar">Confirmar</button>
                <button type="button" class="cancel-modal-solicitar">Cancelar</button>
            </div>

        </div>

    </form>
</div>