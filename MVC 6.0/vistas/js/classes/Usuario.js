// *****************************************************************
//              Elementos de la vista user (GLOBALES)
// *****************************************************************

//  ----------------------- Buscar Usuario BM -----------------------
var botonBuscarUsuarioBM = document.querySelector(".icon-search.buscar-usuario-bm");
var inputBuscarUsuarioBM = document.querySelector(".input-buscar-usuario-bm");
var filtrosBuscarUsuarioBM = document.querySelector(".filtro-buscar-usuario-bm");
var fieldBuscarUsuarioBM = document.querySelector(".bm-user-result");

// ----------------------- Agregar Usuario -----------------------
var modalAddUserClose = document.querySelector(".close-modal-add-user");
var modalAddUserCancel = document.querySelector(".cancel-modal-add-user");
var modalAddUser = document.querySelector(".modal-frame.modal-add-user");
var botonAddUserOpen = document.querySelector(".add-new-user");
var botonAddUserSend = document.querySelector(".confirm-modal-add-user");
var fieldAddUserStatus = document.querySelector(".modal-form1-status.db-add-user");

var inputAddUserModalNombre = document.querySelector(".input-add-user.nombre");
var inputAddUserModalApellido = document.querySelector(".input-add-user.apellido");
var inputAddUserModalDNI = document.querySelector(".input-add-user.dni");
var inputAddUserModalFechaNac = document.querySelector(".input-add-user.fechaNac");
var inputAddUserModalDireccion = document.querySelector(".input-add-user.direccion");
var inputAddUserModalEmail = document.querySelector(".input-add-user.email");
var inputAddUserModalTelefono = document.querySelector(".input-add-user.telefono");


// ----------------------- Editar Usuario -----------------------
var modalEditUserClose = document.querySelector(".close-modal-edit-user");
var modalEditUserCancel = document.querySelector(".cancel-modal-edit-user");
var modalEditUser = document.querySelector(".modal-frame.modal-edit-user");
var botonEditUserOpen;
var botonEditUserSend = document.querySelector(".confirm-modal-edit-user");
var fieldEditUserStatus = document.querySelector(".modal-form1-status.db-edit-user");

var inputEditUserModalNombre = document.querySelector(".input-edit-user.nombre");
var inputEditUserModalApellido = document.querySelector(".input-edit-user.apellido");
var inputEditUserModalDNI = document.querySelector(".input-edit-user.dni");
var inputEditUserModalFechaNac = document.querySelector(".input-edit-user.fechaNac");
var inputEditUserModalDireccion = document.querySelector(".input-edit-user.direccion");
var inputEditUserModalEmail = document.querySelector(".input-edit-user.email");
var inputEditUserModalTelefono = document.querySelector(".input-edit-user.telefono");
var inputEditUserModalTipoUsuario = document.querySelector(".input-edit-user.tipoUsuario");


// ----------------------- Penalizar Usuario -----------------------
var modalPenalUserClose = document.querySelector(".close-modal-penal-user");
var modalPenalUserCancel = document.querySelector(".cancel-modal-penal-user");
var modalPenalUser = document.querySelector(".modal-frame.modal-penal-user");
var botonPenalUserOpen; //
var botonPenalUserSend = document.querySelector(".confirm-modal-penal-user");
var fieldPenalUserStatus = document.querySelector(".modal-form1-status.db-penal-user");

var inputPenalUserModal = document.querySelector(".input-penal-user");


// ----------------------- Eliminar Usuario -----------------------
var modalDelUserClose = document.querySelector(".close-modal-del-user");
var modalDelUserCancel = document.querySelector(".cancel-modal-del-user");
var modalDelUser = document.querySelector(".modal-frame.modal-del-user");
var botonDelUserOpen; //
var botonDelUserSend = document.querySelector(".confirm-modal-del-user");
var fieldDelUserStatus = document.querySelector(".modal-form1-status.db-del-user");

var labelDelUserId = document.querySelector(".icon-user.del-usuario-id");



// *****************************************************************
//                              Fin elementos 
// *****************************************************************




class Usuario{
    constructor(idUsuario, nombre, apellido, dni, direccion, telefono, email, fechaNac, penalidad, tipoUsuario){
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
        this.fechaNac = fechaNac;
        this.penalidad = penalidad;
        this.tipoUsuario = tipoUsuario
    }

    // --------------  Metodos clase Usuario  -------------------
    printBoxUsuarioPreRegistrado(){
        return '<div class="add-pre-item box-type1" >'+
                    '<h4>'+this.nombre+ ' ' +this.apellido +'</h4>'+
                    '<div class="add-pre-content box-type1-content">'+
                        '<span class="icon-home"><p>'+this.direccion+'</p></span>'+
                        '<span class="icon-phone"><p>'+this.telefono+'</p></span>'+
                        '<span class="icon-mail"><p>'+this.email+'</p></span>'+
                    '</div>'+
                    '<div class="add-pre-btns box-type1-btns">'+
                        '<span idUsuario="'+this.idUsuario+'" class="icon-checkmark"></span>'+
                        '<span idUsuario="'+this.idUsuario+'" class="icon-cross"></span>'+
                    '</div>'+
                '</div>';
    }

    printBoxUsuarioABM(){
        return '<div class="add-pre-item box-type1">'+
                    '<h4>'+this.nombre+' '+this.apellido+'</h4>'+
                    '<div class="add-pre-content box-type1-content">'+
                        '<span class="icon-home"><p>'+this.direccion+'</p></span>'+
                        '<span class="icon-phone"><p>'+this.telefono+'</p></span>'+
                        '<span class="icon-mail"><p>'+this.email+'</p></span>'+
                    '</div>'+
                    '<div class="add-pre-btns box-type1-btns">'+
                        '<span idUsuario="'+this.idUsuario+'" class="icon-hammer2 penal-user-bm"></span>'+
                        '<span idUsuario="'+this.idUsuario+'" class="icon-pencil edit-user-bm"></span>'+
                        '<span idUsuario="'+this.idUsuario+'" class="icon-bin del-user-bm"></span>'+
                    '</div>'+
                '</div>';
    }

    printBoxUsuario(){
        return '<div idUsuario="'+this.idUsuario+'" class="add-pre-item box-type1">'+
                    '<h4>'+this.nombre+' '+this.apellido+'</h4>'+
                    '<div class="add-pre-content box-type1-content">'+
                        '<span class="icon-home"><p>'+this.direccion+'</p></span>'+
                        '<span class="icon-phone"><p>'+this.telefono+'</p></span>'+
                        '<span class="icon-mail"><p>'+this.email+'</p></span>'+
                    '</div>'+
                    '<div class="add-pre-btns box-type1-btns">'+
                    '</div>'+
                '</div>';
    }

    toJson(){
        return {
            "idUsuario" : this.idUsuario,
            "nombre" : this.nombre,
            "apellido" : this.apellido,
            "dni" : this.dni,
            "direccion" : this.direccion,
            "telefono" : this.telefono,
            "email" : this.email,
            "fechaNac" : this.fechaNac,
            "penalidad" : this.penalidad,
            "tipoUsuario" : this.tipoUsuario
        };
    }
}


class UsuarioController{
    constructor(){
        this.listaUsuarioBM = null;
    }

    // ---------------  Metodos clase UsuarioController ---------------
    cantidadUsuarios(){
        if(this.listaUsuarioBM)
            return this.listaUsuarioBM.length;
        else
            return 0;
    }

    buscarUsuarioPorid(id){
        let aux;
        this.listaUsuarioBM.forEach(function (u) {
            if(u.idUsuario == id){
                aux = new Usuario(u.idUsuario, u.nombre, u.apellido, u.dni, u.direccion, u.telefono, u.email, u.fechaNac, u.penalidad, u.tipoUsuario);
                return aux.toJson();
            }
        });
        return aux;
    }

    solicitudAjaxBuscar(target, filtros, data){
        let datasend = {"funcion" : "search", "filtros": filtros, "data" : data};
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "controlador/usuarios_controlador.php", true);
        xhr.setRequestHeader("Content-Type", "application/json");
    
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                let listaUsuarios = JSON.parse(xhr.responseText); //el json que envía el servidor
                let listado = "";


                usuarioCtrl.listaUsuarioBM = listaUsuarios;

                if(listaUsuarios){
                    listaUsuarios.forEach(function (u) {
                        listado += (new Usuario(u.idUsuario, u.nombre, u.apellido, u.dni, u.direccion, u.telefono, u.email, u.fechaNac, u.penalidad, u.tipoUsuario)).printBoxUsuarioABM();
                    });

                    target.innerHTML = listado;

                    //Agregar eventos

                    botonEditUserOpen = document.querySelectorAll(".edit-user-bm");
                    botonPenalUserOpen = document.querySelectorAll(".penal-user-bm");
                    botonDelUserOpen = document.querySelectorAll(".del-user-bm");

                    agregarEventoUsuariosEditar();
                    agregarEventoUsuariosPenalizar();
                    agregarEventoUsuariosEliminar();

                    //fin agregar eventos

                }else{
                    target.innerHTML = "<p>No se han encontrado resultados.</p>";
                }

            } else if (xhr.readyState == 4 && xhr.status != 200) {
                usuarioCtrl.listaUsuarioBM = null;
                target.innerHTML = "<p>Se ha producido un error, intente nuevamente.</p>";
            }
        };
    
        xhr.send(JSON.stringify(datasend)); //Envía la info al servidor en formato string de json
    }

    solicitudAjaxABM(user, accion){
        let data = {"funcion" : accion, "data" : user};
        
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "controlador/usuarios_controlador.php", true);
        xhr.setRequestHeader("Content-Type", "application/json");
    
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                let response = JSON.parse(xhr.responseText); //(el json de tipo {"status" : "ok"})
                
                switch(accion){
                    case "add":
                        if(response.status == "ok"){
                            fieldAddUserStatus.innerHTML = '<span class="icon-checkmark"> Usuario agregado exitosamente</span>';
                        }else{
                            fieldAddUserStatus.innerHTML = '<span class="icon-blocked"> No se ha podido agregar el usuario</span>';
                        }
                        break;
                    case "edit":
                        if(response.status == "ok"){
                            fieldEditUserStatus.innerHTML = '<span class="icon-checkmark"> Usuario editado exitosamente</span>';
                            busquedaUsuario();
                        }else{
                            fieldEditUserStatus.innerHTML = '<span class="icon-blocked"> No se ha podido editar el Usuario</span>';
                        }
                        break;
                    case "del":
                        if(response.status == "ok"){
                            fieldDelUserStatus.innerHTML = '<span class="icon-checkmark"> Usuario eliminado exitosamente</span>';
                            busquedaUsuario();
                        }else{
                            fieldDelUserStatus.innerHTML = '<span class="icon-blocked"> No se ha podido eliminar el Usuario</span>';
                        }
                        break;
                    
                }

            } else if (xhr.readyState == 4 && xhr.status != 200) {
                console.error("Error en la solicitud: " + xhr.status);
            }
        };
    
        xhr.send(JSON.stringify(data)); //Envía la info al servidor en formato string de json
    }

}

var usuarioCtrl = new UsuarioController();




// *****************************************************************
//                           Eventos de user
// *****************************************************************

// ----------------------- Evento Buscar -----------------------

botonBuscarUsuarioBM.addEventListener("click",()=>{
    busquedaUsuario();
});

function busquedaUsuario(){
    usuarioCtrl.solicitudAjaxBuscar(fieldBuscarUsuarioBM, filtrosBuscarUsuarioBM.value, inputBuscarUsuarioBM.value);
}

// ----------------------- Evento Agregar -----------------------

modalAddUserClose.addEventListener("click", ()=>{
    modalAddUser.classList.remove('active');
});

modalAddUserCancel.addEventListener("click", ()=>{
    modalAddUser.classList.remove('active');
});

botonAddUserOpen.addEventListener("click",()=>{

    fieldAddUserStatus.innerHTML = "";

    inputAddUserModalNombre.value = "";
    inputAddUserModalApellido.value = "";
    inputAddUserModalDNI.value = "";
    inputAddUserModalDireccion.value = "";
    inputAddUserModalEmail.value = "";
    inputAddUserModalTelefono.value = "";
    inputAddUserModalFechaNac.value = "";

    modalAddUser.classList.add('active');
});

botonAddUserSend.addEventListener("click",()=>{
    let usuario = new Usuario(null,
        inputAddUserModalNombre.value,
        inputAddUserModalApellido.value,
        inputAddUserModalDNI.value,
        inputAddUserModalDireccion.value,
        inputAddUserModalTelefono.value,
        inputAddUserModalEmail.value,
        inputAddUserModalFechaNac.value,
        null,
        null);

    usuarioCtrl.solicitudAjaxABM(usuario.toJson(),"add");
});


// ----------------------- Evento Editar -----------------------

modalEditUserClose.addEventListener("click", ()=>{
    modalEditUser.classList.remove('active');
});

modalEditUserCancel.addEventListener("click", ()=>{
    modalEditUser.classList.remove('active');
});

function agregarEventoUsuariosEditar(){
    for (let i = 0; i < usuarioCtrl.cantidadUsuarios(); i++) {
        
        botonEditUserOpen[i].addEventListener("click",()=>{
            let idUsuario = botonEditUserOpen[i].getAttribute("idUsuario");
            let objUsuario = usuarioCtrl.buscarUsuarioPorid(idUsuario);
            console.log(objUsuario);
            fieldEditUserStatus.innerHTML = "";

            inputEditUserModalNombre.value = objUsuario.nombre;
            inputEditUserModalApellido.value = objUsuario.apellido;
            inputEditUserModalDNI.value = objUsuario.dni;
            inputEditUserModalDireccion.value = objUsuario.direccion;
            inputEditUserModalEmail.value = objUsuario.email;
            inputEditUserModalTelefono.value = objUsuario.telefono;
            inputEditUserModalFechaNac.value = objUsuario.fechaNac;
            inputEditUserModalTipoUsuario.value = objUsuario.tipoUsuario;
    
            modalEditUser.setAttribute("idUsuarioTemp", idUsuario);
    
            modalEditUser.classList.add('active');
        });
    }
}

botonEditUserSend.addEventListener("click", ()=>{
    let usuario = new Usuario(modalEditUser.getAttribute("idUsuarioTemp"),
        inputEditUserModalNombre.value,
        inputEditUserModalApellido.value,
        inputEditUserModalDNI.value,
        inputEditUserModalDireccion.value,
        inputEditUserModalTelefono.value,
        inputEditUserModalEmail.value,
        inputEditUserModalFechaNac.value,
        null,
        inputEditUserModalTipoUsuario.value);
    
    usuarioCtrl.solicitudAjaxABM(usuario.toJson(),"edit");
});


// ----------------------- Evento Penalizar -----------------------

modalPenalUserClose.addEventListener("click", ()=>{
    modalPenalUser.classList.remove('active');
});

modalPenalUserCancel.addEventListener("click", ()=>{
    modalPenalUser.classList.remove('active');
});

function agregarEventoUsuariosPenalizar(){
    for (let i = 0; i < usuarioCtrl.cantidadUsuarios(); i++) {
        
        botonPenalUserOpen[i].addEventListener("click",()=>{
            let idUsuario = botonPenalUserOpen[i].getAttribute("idUsuario");
            let objUsuario = usuarioCtrl.buscarUsuarioPorid(idUsuario);
            
            fieldPenalUserStatus.innerHTML = "";

            inputPenalUserModal.value = objUsuario.penalidad;
    
            modalPenalUser.setAttribute("idUsuarioTemp", idUsuario);
    
            modalPenalUser.classList.add('active');
        });
    }
}


botonPenalUserSend.addEventListener("click", ()=>{
    let usuario = usuarioCtrl.buscarUsuarioPorid(modalPenalUser.getAttribute("idUsuarioTemp"));

    usuario.penalidad = inputPenalUserModal.value;
    
    usuarioCtrl.solicitudAjaxABM(usuario.toJson(),"del");
});


// ----------------------- Evento Eliminar -----------------------

modalDelUserClose.addEventListener("click", ()=>{
    modalDelUser.classList.remove('active');
});

modalDelUserCancel.addEventListener("click", ()=>{
    modalDelUser.classList.remove('active');
});

function agregarEventoUsuariosEliminar(){
    for (let i = 0; i < usuarioCtrl.cantidadUsuarios(); i++) {
        botonDelUserOpen[i].addEventListener("click",()=>{
            let idUsuario = botonDelUserOpen[i].getAttribute("idUsuario");
            let objUsuario = usuarioCtrl.buscarUsuarioPorid(idUsuario);
            
            fieldDelUserStatus.innerHTML = "";

            labelDelUserId.innerHTML = "<p>"+objUsuario.nombre+" "+ objUsuario.apellido+"</p>";

            modalDelUser.setAttribute("idUsuarioTemp", idUsuario);

            modalDelUser.classList.add('active');
        });
    }
}

botonDelUserSend.addEventListener("click", ()=>{
    let usuario = usuarioCtrl.buscarUsuarioPorid(modalDelUser.getAttribute("idUsuarioTemp"));
    
    usuarioCtrl.solicitudAjaxABM(usuario.toJson(),"del");
});