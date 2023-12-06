// ****************************************************************************
//  Elementos de la vista Solicitar (Profesor) (GLOBALES)
// ****************************************************************************

var gridSolicitudesProfesor = document.querySelector(".add-libros-pedidos");
var filtrosSolicitudesProfesor = document.querySelector(".filtros-pedidos-profesor");
var botonAddPedido = document.querySelector(".add-solicitud-libro");
var botonesDelPedido;
var modalSolicitarLibroClose = document.querySelector(".close-modal-solicitar");
var modalSolicitarLibroCancel = document.querySelector(".cancel-modal-solicitar");

var modalSolicitarLibro;
var botonSendSolicitarLibro = document.querySelector(".send-modal-solicitar");

var inputAddSolicitudTitulo = document.querySelector(".solicitud-add.titulo");
var inputAddSolicitudAutor = document.querySelector(".solicitud-add.autor");
var inputAddSolicitudEditorial = document.querySelector(".solicitud-add.editorial");
var inputAddSolicitudMateria = document.querySelector(".solicitud-add.materia");
var inputAddSolicitudOrigen = document.querySelector(".solicitud-add.origen");
var inputAddSolicitudAnio = document.querySelector(".solicitud-add.anio");
var inputAddSolicitudEdicion = document.querySelector(".solicitud-add.edicion");
var inputAddSolicitudCantidad = document.querySelector(".solicitud-add.cantidad");
var inputAddSolicitudObservacion = document.querySelector(".solicitud-add.observacion");


// ****************************************************************************
//                                Fin Elementos 
// ****************************************************************************




// *****************************************************************
//                      Eventos de pedidos (Profesor)
// *****************************************************************

// ------------------------ Metodos Buscar ----------------------------

function buscarPedidosProfesor(){
    pedidoCtrl.solicitudAjaxBuscar(gridSolicitudesProfesor, filtrosSolicitudesProfesor.value, "prof");
}

filtrosSolicitudesProfesor.addEventListener("change", ()=>{
    buscarPedidosProfesor();
});

// ------------------------ Metodos agregar ----------------------------
modalSolicitarLibroClose.addEventListener("click", ()=>{
    modalSolicitarLibro.classList.remove('active');
});

modalSolicitarLibroCancel.addEventListener("click", ()=>{
    modalSolicitarLibro.classList.remove('active');
});

botonAddPedido.addEventListener("click",()=>{
    modalSolicitarLibro.classList.add('active');
});

botonSendSolicitarLibro.addEventListener("click", ()=>{
    if(inputAddSolicitudTitulo.value != "" && inputAddSolicitudAutor.value != "" && inputAddSolicitudEditorial.value != "" &&
        inputAddSolicitudMateria.value != "" && inputAddSolicitudOrigen.value != "" && inputAddSolicitudAnio.value != "" &&
        inputAddSolicitudEdicion.value != "" && inputAddSolicitudCantidad.value != "" && inputAddSolicitudObservacion.value != ""){

        let pedidoAux = new Pedido(null,
            new Libro(null, 
                inputAddSolicitudTitulo.value, 
                inputAddSolicitudAutor.value,
                null, 
                inputAddSolicitudEditorial.value, 
                inputAddSolicitudMateria.value, 
                inputAddSolicitudOrigen.value, 
                inputAddSolicitudAnio.value, 
                inputAddSolicitudEdicion.value, 
                inputAddSolicitudObservacion.value),
            new Usuario(null, null, null, null, null, null, null, null, null, null, null, null), // <---- Los datos del usuario vienen de la variable $_SESSION
            inputAddSolicitudCantidad.value,
            null);

        pedidoCtrl.solicitudAjaxABM(pedidoAux.toJson(), "add");
    }else{
        alert("Hay campos sin llenar todavía");
    }
});


// ---------------------------- Metodos Cancelar ----------------------------------

function agregarEventosEliminarPedido(){
    botonesDelPedido = document.querySelectorAll(".del-pedido");
    for (let i = 0; i < botonesDelPedido.length ; i++) {
        botonesDelPedido[i].addEventListener("click",()=>{
            let idPedido = botonesDelPedido[i].getAttribute("idPedido");
            pedidoCtrl.solicitudAjaxABM({"idPedido": idPedido}, "del");
        });
    }
}


// *****************************************************************
//                                Fin Eventos
// *****************************************************************

buscarPedidosProfesor();