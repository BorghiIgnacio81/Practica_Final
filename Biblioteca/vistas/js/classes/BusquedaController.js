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
/*
    buscarLibroPorid(id){
        let aux;
        this.listaLibros.forEach(function (l) {
            if(l.idLibro == id){
                aux = new Libro(l.idLibro, l.titulo, l.autor, l.ubicacionFisica, l.editorial, l.materia, l.lugarEdicion, l.anio, l.serie, l.observaciones, l.activo);
                return aux.toJson();
            }
        });
        return aux;
    }
*/
    solicitudAjaxBuscar(target, filtros, data) {
        let datasend = { "funcion": "searchMain", "filtros": filtros, "data": data };

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "controlador/libros_controlador.php", true);
        xhr.setRequestHeader("Content-Type", "application/json");
    
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                let listaLibros = JSON.parse(xhr.responseText);
                let listado = "";
        
                libroCtrl.listaLibros = listaLibros;

                if(!listaLibros.status){
                    listaLibros.forEach(function (l) {
                        listado += (new Libro(l.idLibro, l.titulo, l.autor, l.ubicacionFisica, l.editorial, l.materia, l.lugarEdicion, l.anio, l.serie, l.observaciones, l.activo)).printToBoxMain();
                    });

                    target.innerHTML = listado;

                }else{
                    target.innerHTML = "<p>No se han encontrado resultados.</p>";
                }
        
            } else if (xhr.readyState == 4 && xhr.status != 200) {
                libroCtrl.listaLibros = null;
                target.innerHTML = "<p>Se ha producido un error, intente nuevamente.</p>";
            }
        };
    
        xhr.send(JSON.stringify(datasend));
    }
     
}

var libroCtrl = new LibroController();


var botonBuscarLibros = document.querySelector(".buscar-libro-boton");
var inputBuscarLibros = document.querySelector(".inputLibro");
var listadoResultadosLibros = document.querySelector(".busqueda-result.resultado-busqueda");
var filtroMateria = document.querySelector(".filtro-materia");
var filtroAutor = document.querySelector(".filtro-autor");
var filtroEditorial = document.querySelector(".filtro-editorial");

botonBuscarLibros.addEventListener("click", () => {
    busquedaLibro();
});


function busquedaLibro() {
    var filtroBuscarLibros = {
        "materia" : filtroMateria.value,
        "autor" : filtroAutor.value,
        "editorial" : filtroEditorial.value
    };

    console.log("Filtro seleccionado:", filtroBuscarLibros);

    libroCtrl.solicitudAjaxBuscar(listadoResultadosLibros, filtroBuscarLibros, inputBuscarLibros.value);
}
