class Usuario{
    constructor(idUsuario, username, password, nombre, apellido, dni, direccion, telefono, email, fechaNac, penalidad, tipoUsuario){
        this.idUsuario = idUsuario;
        this.username = username;
        this.password = password;
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
                        '<span idUsuario="'+this.idUsuario+'" class="icon-checkmark pre-registrado-add"></span>'+
                        '<span idUsuario="'+this.idUsuario+'" class="icon-cross pre-registrado-del"></span>'+
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
            "username" : this.username,
            "password" : this.password,
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