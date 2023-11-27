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
        return this.listaLibros ? this.listaLibros.length : 0;
    }

    buscarLibroPorId(id) {
        if (!this.listaLibros) {
            return null;
        }

        for (const libro of this.listaLibros) {
            if (libro.idLibro == id) {
                return libro;
            }
        }

        return null;
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
    
                if (listaLibros) {
                    for (const libro of listaLibros) {
                        // Utiliza el método printToBox para obtener el HTML de cada libro
                        listado += libroCtrl.printToBox(libro);
                    }
    
                    // Agrega el listado al contenedor
                    target.innerHTML = listado;
                } else {
                    target.innerHTML = "<p>No se han encontrado resultados.</p>";
                }
            } else if (xhr.readyState == 4 && xhr.status != 200) {
                libroCtrl.listaLibros = null;
                target.innerHTML = "<p>Se ha producido un error, intente nuevamente.</p>";
            }
        };
    
        xhr.send(JSON.stringify(datasend));
    }
    solicitudAjaxBuscarAvanzada(target, idMateria, idAutor, idEditorial) {
        let datasend = {
            "funcion": "searchAvanzada",
            "idMateria": idMateria,
            "idAutor": idAutor,
            "idEditorial": idEditorial
        };
    
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "controlador/libros_controlador.php", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    try {
                        console.log("Respuesta del servidor:", xhr.responseText);
        
                        // Agrega una verificación para manejar null
                        let responseData = xhr.responseText.trim();
                        let listaLibros = responseData ? JSON.parse(responseData) : null;
        
                        if (listaLibros) {
                            let listado = "";
                            for (const libro of listaLibros) {
                                listado += libroCtrl.printToBox(libro);
                            }
                            target.innerHTML = listado;
                        } else {
                            target.innerHTML = "<p>No se han encontrado resultados.</p>";
                        }
                    } catch (error) {
                        console.error("Error al parsear la respuesta como JSON:", error);
                        target.innerHTML = "<p>Se ha producido un error al procesar la respuesta.</p>";
                    }
                } else {
                    libroCtrl.listaLibros = null;
                    target.innerHTML = "<p>Se ha producido un error en la solicitud, intente nuevamente.</p>";
                }
            }
        };
        
        
        
        
        xhr.send(JSON.stringify(datasend));
    }
    
     
     
}

var libroCtrl = new LibroController();

var filtroBuscarLibros = document.querySelector(".buscar-avanzada");
var botonBuscarLibros = document.querySelector(".btn.animation");
var inputBuscarLibros = document.querySelector(".inputLibro");
var listadoResultadosLibros = document.querySelector(".busqueda-result.resultado-busqueda");
function busquedaLibro() {
    console.log("Función busquedaLibro ejecutada");
    var listadoResultadosLibros = document.querySelector(".busqueda-result.resultado-busqueda");
    var filtroBuscarLibros = document.querySelector(".buscar-avanzada");
    var inputBuscarLibros = document.querySelector(".inputLibro");

    if (!listadoResultadosLibros || !filtroBuscarLibros || !inputBuscarLibros) {
        console.error("Elementos no encontrados.");
        return;
    }

    libroCtrl.solicitudAjaxBuscar(listadoResultadosLibros, filtroBuscarLibros.value, inputBuscarLibros.value);
}
function buscarLibrosAvanzada() {
    console.log("Función buscarLibrosAvanzada ejecutada");

    var listadoResultadosLibros = document.querySelector(".busqueda-result.resultado-busqueda");
    var filtroBuscarLibros = document.querySelector(".buscar-avanzada");
    var inputBuscarLibros = document.querySelector(".inputLibro");

    if (!listadoResultadosLibros || !filtroBuscarLibros || !inputBuscarLibros) {
        console.error("Elementos no encontrados.");
        return;
    }

    // Acceder al valor solo si el elemento está presente
    let idAutorElement = document.getElementById("autor");
    let idMateriaElement = document.getElementById("materia");
    let idEditorialElement = document.getElementById("editorial");

    let idAutor = idAutorElement ? idAutorElement.value : null;
    let idMateria = idMateriaElement ? idMateriaElement.value : null;
    let idEditorial = idEditorialElement ? idEditorialElement.value : null;
    libroCtrl.solicitudAjaxBuscarAvanzada(listadoResultadosLibros, idMateria, idAutor, idEditorial);
}
botonBuscarLibros.addEventListener("click", () => {
    buscarLibrosAvanzada();
});

botonBuscarLibros.addEventListener("click",()=>{
    busquedaLibro();
});
document.addEventListener("DOMContentLoaded", function () {
    // Acceder al valor solo si el elemento está presente
    let idAutorElement = document.getElementById("autor");
    let idMateriaElement = document.getElementById("materia");
    let idEditorialElement = document.getElementById("editorial");

    let idAutor = idAutorElement ? idAutorElement.value : null;
    let idMateria = idMateriaElement ? idMateriaElement.value : null;
    let idEditorial = idEditorialElement ? idEditorialElement.value : null;

    var libroCtrl = new LibroController();

    libroCtrl.solicitudAjaxBuscarAvanzada(listadoResultadosLibros, idMateria, idAutor, idEditorial);
});









