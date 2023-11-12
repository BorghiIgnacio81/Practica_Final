// *****************************************************************
//              Elementos de la vista user (GLOBALES)
// *****************************************************************

//  ----------------------- Buscar Usuario BM ----------------------
var inputBuscarUsuarioBM = document.querySelector(".icon-search.buscar-usuario-bm");
var botonBuscarUsuarioBM = document.querySelector(".input-buscar-usuario-bm");
var filtrosBuscarUsuarioBM = document.querySelector(".filtro-buscar-usuario-bm");
var fieldBuscarUsuarioBM = document.querySelector(".bm-user-result");




var modalAddUserClose = document.querySelector(".close-modal-add-user");
var modalAddUserCancel = document.querySelector(".cancel-modal-add-user");
var modalAddUser = document.querySelector(".modal-frame.modal-add-user");
var modalAddUserOpen = document.querySelector(".add-new-user");

var modalEditUserClose = document.querySelector(".close-modal-edit-user");
var modalEditUserCancel = document.querySelector(".cancel-modal-edit-user");
var modalEditUser = document.querySelector(".modal-frame.modal-edit-user");
var modalEditUserOpen = document.querySelectorAll(".edit-user");

var modalPenalUserClose = document.querySelector(".close-modal-penal-user");
var modalPenalUserCancel = document.querySelector(".cancel-modal-penal-user");
var modalPenalUser = document.querySelector(".modal-frame.modal-penal-user");
var modalPenalUserOpen = document.querySelectorAll(".penal-user");

var modalDelUserClose = document.querySelector(".close-modal-del-user");
var modalDelUserCancel = document.querySelector(".cancel-modal-del-user");
var modalDelUser = document.querySelector(".modal-frame.modal-del-user");
var modalDelUserOpen = document.querySelectorAll(".del-user");


// *****************************************************************
//                              Fin elementos 
// *****************************************************************




class Usuario{
    constructor(idUsuario, nombre, apellido, dni, direccion, telefono, email, edad, imgPerfil){
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
        this.edad = edad;
        this.imgPerfil = imgPerfil;
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
                        '<span idUsuario="'+this.idUsuario+'" class="icon-hammer2 penal-user"></span>'+
                        '<span idUsuario="'+this.idUsuario+'" class="icon-pencil edit-user"></span>'+
                        '<span idUsuario="'+this.idUsuario+'" class="icon-bin del-user"></span>'+
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
            "edad" : this.edad,
            "imgPerfil" : this.imgPerfil
        };
    }
}







// *****************************************************************
//                           Eventos de user
// *****************************************************************

modalEditUserClose.addEventListener("click", ()=>{
    modalEditUser.classList.remove('active');
});

modalEditUserCancel.addEventListener("click", ()=>{
    modalEditUser.classList.remove('active');
});


modalPenalUserClose.addEventListener("click", ()=>{
    modalPenalUser.classList.remove('active');
});

modalPenalUserCancel.addEventListener("click", ()=>{
    modalPenalUser.classList.remove('active');
});


modalDelUserClose.addEventListener("click", ()=>{
    modalDelUser.classList.remove('active');
});

modalDelUserCancel.addEventListener("click", ()=>{
    modalDelUser.classList.remove('active');
});


for (var i = 0; i < modalDelUserOpen.length; i++) {
    
    modalEditUserOpen[i].addEventListener("click",()=>{
        modalEditUser.classList.add('active');
    });
    
    
    modalPenalUserOpen[i].addEventListener("click",()=>{
        modalPenalUser.classList.add('active');
    });
    
    
    modalDelUserOpen[i].addEventListener("click",()=>{
        modalDelUser.classList.add('active');
    });
    
}


modalAddUserClose.addEventListener("click", ()=>{
    modalAddUser.classList.remove('active');
});

modalAddUserCancel.addEventListener("click", ()=>{
    modalAddUser.classList.remove('active');
});

modalAddUserOpen.addEventListener("click",()=>{
    modalAddUser.classList.add('active');
});