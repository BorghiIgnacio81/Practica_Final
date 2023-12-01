class Libro{
    constructor(idLibro, titulo, autor, ubicacionFisica, editorial, materia, lugarEdicion, anio, serie, observaciones, activo, profesor, cantidad, fechaPedido){
        this.idLibro = idLibro;
        this.titulo = titulo;
        this.autor = autor;
        this.ubicacionFisica = ubicacionFisica;
        this.editorial = editorial;
        this.materia = materia;
        this.lugarEdicion = lugarEdicion;
        this.anio = anio;
        this.serie = serie;
        this.observaciones = observaciones;
        this.activo = activo;
        this.profesor = profesor;
        this.cantidad = cantidad;
        this.fechaPedido = fechaPedido;
    }

    // --------------  Metodos clase Libro -----------------
    printBoxLibrosPedidos(){
        return '<div class="add-pre-item box-type1" >'+
                    '<h4>'+this.titulo+'</h4>'+
                    '<div class="add-pre-content box-type1-content">'+
                        '<span class="icon-user"><p>Prof. '+this.profesor+'</p></span>'+
                        '<span class="icon-book"><p>Cantidad: '+this.cantidad+'</p></span>'+
                        '<span class="icon-calendar"><p>Fecha solicitada: '+this.fechaPedido+'</p></span>'+
                    '</div>'+
                    '<div class="add-pre-btns box-type1-btns">'+
                        '<span class="icon-checkmark"'+this.idLibro+'" class="icon-checkmark libro-pedido-add"></span>'+
                        '<span class="icon-pencil edit-libro-pedido"'+this.idLibro+'"class="icon-pencil edit-libro-pedido"></span>'+
                        '<span class="icon-cross"'+this.idLibro+'" class="icon-cross libro-pedido-del"></span>'+
                    '</div>'+
                '</div>';
    }
    
    printBoxLibroBM(){
        return '<div class="add-pre-item box-type1">'+
                '<h4>'+this.titulo+'</h4>'+
                '<div class="add-pre-content box-type1-content">'+
                    '<span class="icon-quill" title="Autor"><p>'+this.autor+'</p></span>'+
                    '<span class="icon-book" title="Materia"><p>'+this.materia+'</p></span>'+
                    '<span class="icon-library" title="Editorial"><p>'+this.editorial+'</p></span>'+
                '</div>'+
                '<div class="add-pre-btns box-type1-btns">'+
                    '<span idLibro="'+this.idLibro+'" class="icon-pencil edit-libro"></span>'+
                    '<span idLibro="'+this.idLibro+'" class="icon-bin del-libro"></span>'+
                '</div>'+
            '</div>';
    }

    printBoxLibro(){
        return '<div class="add-pre-item box-type1">'+
                '<h4>'+this.titulo+'</h4>'+
                '<div class="add-pre-content box-type1-content">'+
                    '<span class="icon-quill" title="Autor"><p>'+this.autor+'</p></span>'+
                    '<span class="icon-book" title="Materia"><p>'+this.materia+'</p></span>'+
                    '<span class="icon-library" title="Editorial"><p>'+this.editorial+'</p></span>'+
                '</div>'+
                '<div class="add-pre-btns box-type1-btns">'+
                '</div>'+
            '</div>';
    }

    toJson(){
        return {
            "idLibro" : this.idLibro,
            "titulo" : this.titulo,
            "autor" : this.autor,
            "ubicacionFisica" : this.ubicacionFisica,
            "editorial" : this.editorial,
            "materia" : this.materia,
            "lugarEdicion" : this.lugarEdicion,
            "anio" : this.anio,
            "serie" : this.serie,
            "observaciones" : this.observaciones,
            "activo" : this.activo,
            "profesor" : this.profesor,
            "cantidad" :this.cantidad,
            "fechaPedido" : this.fechaPedido
        }
    }
}