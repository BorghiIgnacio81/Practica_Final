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

    constructor(json){
        this.idUsuario = json.idUsuario;
        this.nombre = json.nombre;
        this.apellido = json.apellido;
        this.dni = json.dni;
        this.direccion = json.direccion;
        this.telefono = json.telefono;
        this.email = json.email;
        this.edad = json.edad;
        this.imgPerfil = json.imgPerfil;
    }

    //Getters
    get idUsuario(){
        return this.idUsuario;
    }

    get nombre(){
        return this.nombre;
    }

    get apellido(){
        return this.apellido;
    }

    get dni(){
        return this.dni;
    }

    get direccion(){
        return this.direccion;
    }

    get telefono(){
        return this.telefono;
    }

    get email(){
        return this.email;
    }

    get edad(){
        return this.edad;
    }

    get imgPerfil(){
        return this.imgPerfil;
    }

    //Setters
    set idUsuario(idUsuario){
        this.idUsuario = idUsuario;
    }

    set nombre(nombre){
        this.nombre =nombre;
    }

    set apellido(apellido){
        this.apellido =apellido;
    }

    set dni(dni){
        this.dni =dni;
    }

    set direccion(direccion){
        this.direccion = direccion;
    }

    set telefono(telefono){
        this.telefono = telefono;
    }

    set email(email){
        this.email = email;
    }

    set edad(edad){
        this.edad =edad;
    }

    set imgPerfil(imgPerfil){
        this.imgPerfil =imgPerfil;
    }

    //Metodos
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


