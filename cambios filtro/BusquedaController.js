class Libro{
    constructor(idLibro, titulo, autor, ubicacionFisica, editorial, materia, lugarEdicion, anio, serie, observaciones){
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
    }

}
class LibroController {
    constructor() {
        this.listaLibros = null;
    }
    cantidadLibros() {
        if(this.listaLibros)
            return this.listaLibros.length;
        else
            return 0;
    }

    buscarLibroPorid(id){
        let aux;
        this.listaLibros.forEach(function (l) {
            if(l.idLibro == id){
                aux = new Libro(l.idLibro, l.titulo, l.autor, l.ubicacionFisica, l.editorial, l.materia, l.lugarEdicion, l.anio, l.serie, l.observaciones);
                return aux.toJson();
            }
        });
        return aux;
    }
    printToBox(libro) {
        return '<div class="res-item">' +
            '<div class="item-breef">' +
            '<h3>' + libro.titulo + '</h3>' +
            '</div>' +
            '<div class="pulse"></div>' + //activo
            '<div class="item-content">' +
            '<span class="icon-quill" title="Autor"><p>' + libro.autor + '</p></span>' +
            '<span class="icon-library" title="Editorial"><p>' + libro.editorial + '</p></span>' +
            '<p>' + libro.observaciones + '</p>' + 
            '</div>' +
            '</div>';
    }
    toJson(libro) {
        return {
            "idLibro": libro.idLibro,
            "titulo": libro.titulo,
            "autor": libro.autor,
            "ubicacionFisica": libro.ubicacionFisica,
            "editorial": libro.editorial,
            "materia": libro.materia,
            "lugarEdicion": libro.lugarEdicion,
            "anio": libro.anio,
            "serie": libro.serie,
            "observaciones": libro.observaciones
        };
    }
    

    solicitudAjaxBuscar(target, filtros, data) {
        let datasend = { "funcion": "search", "filtros": filtros, "data": data };
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "controlador/libros_controlador.php", true);
        xhr.setRequestHeader("Content-Type", "application/json");
    
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                let listaLibros = JSON.parse(xhr.responseText);
                let listado = "";
        
                libroCtrl.listaLibros = listaLibros;
        
                if (Array.isArray(listaLibros)) { // Verifica si listaLibros es un array
                    for (const libro of listaLibros) {
                        // Utiliza el método printToBox para obtener el HTML de cada libro
                        listado += libroCtrl.printToBox(libro);
                    }
                } else {
                    // Si no es un array, simplemente imprime un mensaje de error
                    console.error("La respuesta no es un array:", listaLibros);
                    target.innerHTML = "<p>Se ha producido un error en la respuesta del servidor.</p>";
                    return;
                }
        
                // Agrega el listado al contenedor
                target.innerHTML = listado;
            } else if (xhr.readyState == 4 && xhr.status != 200) {
                libroCtrl.listaLibros = null;
                target.innerHTML = "<p>Se ha producido un error, intente nuevamente.</p>";
            }
        };
    
        xhr.send(JSON.stringify(datasend));
    }
     
}

var libroCtrl = new LibroController();


var botonBuscarLibros = document.querySelector(".btn.animation");
var inputBuscarLibros = document.querySelector(".inputLibro");
var listadoResultadosLibros = document.querySelector(".busqueda-result.resultado-busqueda");
var filtroMateria = document.querySelector(".filtro-materia");
var filtroAutor = document.querySelector(".filtro-autor");
var filtroEditorial = document.querySelector(".filtro-editorial");

botonBuscarLibros.addEventListener("click", () => {
    busquedaLibro();
});

var formBusqueda = document.querySelector("form");
formBusqueda.addEventListener("submit", function (event) {
    event.preventDefault();
    busquedaLibro();
});
filtroMateria.addEventListener("change", function () {
    busquedaLibro();
});

filtroAutor.addEventListener("change", function () {
    busquedaLibro();
});

filtroEditorial.addEventListener("change", function () {
    busquedaLibro();
});

function busquedaLibro() {
    console.log("Función busquedaLibro ejecutada");
    var listadoResultadosLibros = document.querySelector(".busqueda-result.resultado-busqueda");
    var inputBuscarLibros = document.querySelector(".inputLibro");
    var filtroBuscarLibros;

    if (!listadoResultadosLibros || !inputBuscarLibros) {
        console.error("Elementos no encontrados.");
        return;
    }

    if (filtroMateria && filtroMateria.value) {
        filtroBuscarLibros = filtroMateria;
    } 
    if (filtroAutor && filtroAutor.value) {
        filtroBuscarLibros = filtroAutor;
    } 
    if (filtroEditorial && filtroEditorial.value) {
        filtroBuscarLibros = filtroEditorial;
    }

    let filtroSeleccionado = filtroBuscarLibros ? filtroBuscarLibros.value : "";
    console.log("Filtro seleccionado:", filtroSeleccionado);

    libroCtrl.solicitudAjaxBuscar(listadoResultadosLibros, filtroSeleccionado, inputBuscarLibros.value);
}
