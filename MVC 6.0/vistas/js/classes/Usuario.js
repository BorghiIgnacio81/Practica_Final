// *****************************************************************
//              Elementos de la vista user (GLOBALES)
// *****************************************************************



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
                        '<span class="icon-checkmark"></span>'+
                        '<span class="icon-cross"></span>'+
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
                        '<span class="icon-hammer2 penal-user"></span>'+
                        '<span class="icon-pencil edit-user"></span>'+
                        '<span class="icon-bin del-user"></span>'+
                    '</div>'+
                '</div>';
    }

    printBoxUsuario(){
        return '<div class="add-pre-item box-type1">'+
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