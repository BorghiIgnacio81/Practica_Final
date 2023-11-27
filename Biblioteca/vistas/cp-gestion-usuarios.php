<?php
    $usuarios = Usuarios_Controlador::get_pre_Usuarios_Controlador();
?>

<!-- Frames -->
<section class="frame-usuarios">
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
                <?php foreach ($usuarios as $usuario) : ?>
                    <div class="add-pre-item box-type1">
                        <h4><?php echo $usuario['nombre'], ', ',$usuario['apellido']; ?></h4>
                        <div class="add-pre-content box-type1-content">
                            <span class="icon-home"><p><?php echo $usuario['direccion']; ?></p></span>
                            <span class="icon-phone"><p><?php echo $usuario['telefono']; ?></p></span>
                            <span class="icon-mail"><p><?php echo $usuario['email']; ?></p></span>
                        </div>
                        <div class="add-pre-btns box-type1-btns">
                            <span class="icon-checkmark"></span>
                            <span class="icon-cross"></span>
                        </div>
                    </div>
                <?php endforeach; ?>
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
                    <label for="">Penalidad (Dias)</label>
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