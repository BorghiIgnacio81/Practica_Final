//Elementos de la vista libro

//Buscar libro
var filtroBuscarLibrosBM = document.querySelector(".filtro-libro-bm");
var botonBuscarLibrosBM = document.querySelector(".icon-search.buscarLibroBM");
var inputBuscarLibrosBM = document.querySelector(".inputLibroBM");
var listadoResultadosLibrosBM = document.querySelector(".bm-libro-result.librosBM");

//Agregar libro + Modal
var modalAddLibroClose = document.querySelector(".close-modal-add-libro");
var modalAddLibroCancel = document.querySelector(".cancel-modal-add-libro");
var modalAddLibro = document.querySelector(".modal-add-libro");
var modalAddLibroOpen = document.querySelector(".add-new-libro");
var modalAddBotonSend = document.querySelector(".confirm-modal-add-libro");
var modalStatusAdd = document.querySelector(".db-add-libro");

var campoTituloAdd = document.querySelector(".libro-add.titulo");
var campoAutorAdd = document.querySelector(".libro-add.autor");
var campoUbicacionAdd = document.querySelector(".libro-add.ubicacion");
var campoEditorialAdd = document.querySelector(".libro-add.editorial");
var campoMaterialAdd = document.querySelector(".libro-add.materia");
var campoOrigenAdd = document.querySelector(".libro-add.origen");
var campoAnioAdd = document.querySelector(".libro-add.anio");
var campoEdicionAdd = document.querySelector(".libro-add.edicion");
var campoObservacionAdd = document.querySelector(".libro-add.observacion");


//Editar libro + modal
var modalEditLibroClose = document.querySelector(".close-modal-edit-libro");
var modalEditLibroCancel = document.querySelector(".cancel-modal-edit-libro");
var modalEditLibro = document.querySelector(".modal-frame.modal-edit-libro");
var botonEditLibroOpen = document.querySelectorAll(".edit-libro");
var modalEditBotonSend = document.querySelector(".confirm-modal-edit-libro");
var modalStatusEdit = document.querySelector(".db-edit-libro");

var campoTituloEdit = document.querySelector(".libro-edit.titulo");
var campoEditorialEdit = document.querySelector(".libro-edit.editorial");
var campoAutorEdit = document.querySelector(".libro-edit.autor");
var campoAnioEdit = document.querySelector(".libro-edit.anio");
var campoEdicionEdit = document.querySelector(".libro-edit.edicion");
var campoUbicacionEdit = document.querySelector(".libro-edit.ubicacion");
var campoObservacionEdit = document.querySelector(".libro-edit.observacion");


//Editar libro pedido + modal pedido
var modalPedidoLibroClose = document.querySelector(".close-modal-edit-libro-pedido");
var modalPedidolibroCancel = document.querySelector(".cancel-modal-edit-libro-pedido");
var modalPedidoLibro = document.querySelector(".modal-edit-libro-pedido");
var botonPedidoLibroOpen = document.querySelectorAll(".edit-libro-pedido");
var modalEditBotonSend = document.querySelector(".confirm-modal-edit-libro-pedido");
var modalStatusEdit = document.querySelector(".db-edit-libro-pedido");

var campoTituloEdit = document.querySelector(".libro-edit-pedido.titulo");
var campoEditorialEdit = document.querySelector(".libro-edit-pedido.editorial");
var campoAutorEdit = document.querySelector(".libro-edit-pedido.autor");
var campoAnioEdit = document.querySelector(".libro-edit-pedido.anio");
var campoEjemplaresEdit = document.querySelector(".libro-edit-pedido.ejemplares");
var campoEdicionEdit = document.querySelector(".libro-edit-pedido.edicion");
var campoUbicacionEdit = document.querySelector(".libro-edit-pedido.ubicacion");
var campoObservacionEdit = document.querySelector(".libro-edit-pedido.observacion");



var modalDelLibroClose = document.querySelector(".close-modal-del-libro");
var modalDelLibroCancel = document.querySelector(".cancel-modal-del-libro");
var modalDelLibro = document.querySelector(".modal-del-libro");
var modalDelLibroOpen = document.querySelectorAll(".del-libro");



//Fin elementos 






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

    //Metodos

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
            "Titulo" : this.titulo,
            "autor" : this.autor,
            "UbicacionBiblioteca" : this.ubicacionFisica,
            "Editorial" : this.editorial,
            "materia" : this.materia,
            "Lugar_Edicion" : this.lugarEdicion,
            "anio" : this.anio,
            "serie" : this.serie,
            "observaciones" : this.observaciones
        }
    }



}


class LibroController{
    
    constructor(){
        this.listaLibrosBM = null;
    }

    cantidadLibros(){
        if(this.listaLibrosBM)
            return this.listaLibrosBM.length;
        else
            return 0;
    }

    buscarLibroPorid(id){
        this.listaLibrosBM.forEach(function (l) {
            if(l.idLibro == id)
                return new Libro(l.idLibro, l.titulo, l.autor, l.ubicacionFisica, l.editorial, l.materia, l.lugarEdicion, l.anio, l.serie, l.observaciones);
        });
    }

    solicitudAjaxBuscar(target, filtros, data) {
        let datasend = {"funcion": "search", "filtros": filtros, "data": data};
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "controlador/libros_controlador.php", true);
        xhr.setRequestHeader("Content-Type", "application/json");
    
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    try {
                        // Intenta analizar la respuesta JSON
                        let response = JSON.parse(xhr.responseText);
    
                        // Verifica si hay un error en la respuesta
                        if (response.hasOwnProperty("error")) {
                            console.error("Error en la respuesta del servidor: " + response.error);
                            return;
                        }
    
                        // Verifica si hay datos en la respuesta
                        if (response.hasOwnProperty("respuesta") && Array.isArray(response.respuesta)) {
                            // Procesa los datos de los libros
                            let listado = "";
                            response.respuesta.forEach(function (libro) {
                                listado += (new Libro(libro.idLibro, libro.titulo, libro.autor, libro.ubicacionFisica, libro.editorial, libro.materia, libro.lugarEdicion, libro.anio, libro.serie, libro.observaciones)).printBoxLibroBM();
                            });
    
                            target.innerHTML = listado;
                        } else {
                            console.error("Respuesta del servidor no contiene datos válidos.");
                        }
                    } catch (e) {
                        console.error("Error al analizar la respuesta JSON: " + e.message);
                    }
                } else {
                    console.error("Error en la solicitud: " + xhr.status);
                }
            }
        };
    
        xhr.send(JSON.stringify(datasend));
    }
    

    solicitudAjaxABM(libro, accion){
        let data = {"funcion" : accion, "data" : libro};
        
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "controlador/libros_controlador.php", true);
        xhr.setRequestHeader("Content-Type", "application/json");
    
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                let response = JSON.parse(xhr.responseText); //(el json de tipo {"status" : "ok"})
                
                switch(accion){
                    case "add":
                        if(response.status == "ok"){
                            modalStatusAdd.innerHTML = '<span class="icon-checkmark"> Libro agregado exitosamente</span>';
                            
                        }else{
                            modalStatusAdd.innerHTML = '<span class="icon-blocked"> No se ha podido agregar el libro</span>';
                        }
                        break;
                    case "edit":
                        if(response.status == "ok"){
                            modalStatusEdit.innerHTML = '<span class="icon-checkmark"> Libro agregado exitosamente</span>';
                            
                        }else{
                            modalStatusEdit.innerHTML = '<span class="icon-blocked"> No se ha podido agregar el libro</span>';
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

var libroCtrl = new LibroController();

// Eventos de libros

// Evento buscar
botonBuscarLibrosBM.addEventListener("click",()=>{
    libroCtrl.solicitudAjaxBuscar(listadoResultadosLibrosBM, filtroBuscarLibrosBM.value, inputBuscarLibrosBM.value);
});

// Eventos añadir libro

modalAddLibroClose.addEventListener("click", ()=>{
    modalAddLibro.classList.remove('active');
});

modalAddLibroCancel.addEventListener("click", ()=>{
    modalAddLibro.classList.remove('active');
});

modalAddLibroOpen.addEventListener("click",()=>{
    campoTituloAdd.value = "";
    campoAutorAdd.value = "";
    campoUbicacionAdd.value = "";
    campoEditorialAdd.value = "";
    campoMaterialAdd.value = "";
    campoOrigenAdd.value = "";
    campoAnioAdd.value = "";
    campoEdicionAdd.value = "";
    campoObservacionAdd.value = "";
    modalAddLibro.classList.add('active');

});

modalAddBotonSend.addEventListener("click",()=>{
    let libro = new Libro(null,
    campoTituloAdd.value,
    campoAutorAdd.value,
    campoUbicacionAdd.value,
    campoEditorialAdd.value,
    campoMaterialAdd.value,
    campoOrigenAdd.value,
    campoAnioAdd.value,
    campoEdicionAdd.value,
    campoObservacionAdd.value);

    libroCtrl.solicitudAjaxABM(libro.toJson(),"add");
});

// Eventos editar libro

modalEditLibroClose.addEventListener("click", ()=>{
    modalEditLibro.classList.remove('active');
});

modalEditLibroCancel.addEventListener("click", ()=>{
    modalEditLibro.classList.remove('active');
});

for (let i = 0; i < libroCtrl.cantidadLibros(); i++) {
    botonEditLibroOpen[i].addEventListener("click",()=>{
        
        modalEditLibro.classList.add('active');
    });
}

modalEditBotonSend.addEventListener("click", ()=>{
    let libro = new Libro(null,
        campoTituloEdit.value,
        campoAutorEdit.value,
        campoUbicacionEdit.value,
        campoEditorialEdit.value,
        campoMaterialEdit.value,
        campoOrigenEdit.value,
        campoAnioEdit.value,
        campoEdicionEdit.value,
        campoObservacionEdit.value);
    
    libroCtrl.solicitudAjaxABM(libro.toJson(),"edit");
});


// Eventos eliminar libro

for (let i = 0; i < libroCtrl.cantidadLibros(); i++) {
    modalDelLibroOpen[i].addEventListener("click",()=>{
        modalDelLibro.classList.add('active');
    });
}

modalDelLibroClose.addEventListener("click", ()=>{
    modalDelLibro.classList.remove('active');
});

modalDelLibroCancel.addEventListener("click", ()=>{
    modalDelLibro.classList.remove('active');
});

alert(botonPedidoLibroOpen.getAttribute("idPedido"));