
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
                        <option value="">Sin Filtros</option>
                        <option value="l.titulo ASC">por Titulo (ASC)</option>
                        <option value="l.titulo DESC">por Titulo (DESC)</option>
                        <option value="u.apellido ASC">por Profesor (ASC)</option>
                        <option value="u.apellido DESC">por Profesor (DESC)</option>
                        <option value="p.fechaPedido ASC">por Fecha (ASC)</option>
                        <option value="p.fechaPedido DESC">por Fecha (DESC)</option>
                        
                    </select>    
                    
                </div>
            </div>

            <h3>Lista de pedidos <span class="icon-file-pdf descargar-pdf" title="Descarga lista pdf"></span></h3>
            
            <div class="add-libros-pedidos">
                
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
                        <option value="A.autor ASC">por Autor (ASC)</option>
                        <option value="A.autor DESC">por Autor (DESC)</option>
                        <option value="M.materia ASC">por Materia (ASC)</option>
                        <option value="M.materia DESC">por Materia (DESC)</option>
                    </select>    
                    
                </div>
            </div>
            
            <div class="bm-libro-result librosBM">
                

            </div>
        </article>
    </form>
</section>


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
                    <input class="solicitud-edit titulo" type="text" id="" required>
                    <label for="">Titulo</label>
                </div>
                <div class="modal-form1-input-item">
                    <input class="solicitud-edit autor" type="text" name="" id="" required>
                    <label for="">Autor</label>
                </div>
                <div class="modal-form1-input-item">
                    <input class="solicitud-edit editorial" type="text" name="" id="" required>
                    <label for="">Editorial</label>
                </div>
                <div class="modal-form1-input-item">
                    <input class="solicitud-edit materia" type="text" name="" id="" required>
                    <label for="">Materia</label>
                </div>
                <div class="modal-form1-input-item">
                    <input class="solicitud-edit origen" type="text" name="" id="" required>
                    <label for="">Lugar de edición</label>
                </div>
                <div class="modal-form1-input-item">
                    <input class="solicitud-edit anio" type="text" name="" id="" required>
                    <label for="">Año de fabricación</label>
                </div>
                <div class="modal-form1-input-item">
                    <input class="solicitud-edit edicion" type="text" name="" id="" required>
                    <label for="">Número de serie</label>
                </div>
                <div class="modal-form1-input-item">
                    <input class="solicitud-edit cantidad" type="text" name="" id="" required>
                    <label for="">Cantidad Ejemplares</label>
                </div>
                <div class="modal-form1-input-item">
                    <input class="solicitud-edit observacion" type="text" name="" id="" required>
                    <label for="">Observaciones</label>
                </div>

            </div>

            <div class="modal-form1-status db-edit-libro-pedido">

            </div>

            
            <div class="modal-form1-btns">
                <button type="button" class="confirm-modal-edit-libro-pedido">Confirmar</button>
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