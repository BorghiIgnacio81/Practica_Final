class Libro{
    constructor(idLibro, titulo, autor, ubicacionFisica, editorial, materia, lugarEdicion, anio, serie, observaciones, activo){
        this.idLibro = idLibro;
        this.titulo = titulo;
        this.autor = autor;
        this.ubicacionFisica = ubicacionFisica;
        this.editorial = editorial;
        this.materia = materia;
        this.lugarEdicion = lugarEdicion;
        this.anio = anio;
        this.serie = serie;
        this.activo = activo;
        this.observaciones = observaciones;
    }

    // --------------  Metodos clase Libro -----------------
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

    printToBoxMain() {
        return '<div class="res-item">' +
                    '<div class="item-breef">' +
                    '<h3>' + this.titulo + '</h3>' +
                '</div>' +
            (this.activo == 1 ? '<div class="pulse"></div>' : '<div class="pulse2"></div>') +
                '<div class="item-content">' +
                    '<span class="icon-quill" title="Autor"><p>' + this.autor + '</p></span>' +
                    '<span class="icon-library" title="Editorial"><p>' + this.editorial + '</p></span>' +
                    '<p>' + this.observaciones + '</p>' + 
                '</div>' +
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
            "activo" : this.activo,
            "observaciones" : this.observaciones
        }
    }
}