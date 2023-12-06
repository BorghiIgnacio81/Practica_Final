// ****************************************************************************
//  Elementos de la vista Pedidos (Libros) (GLOBALES)
// ****************************************************************************

var filtrosPedidosLibro = document.querySelector(".filtro-libro-pedido");
var gridPedidosLibro = document.querySelector(".add-libros-pedidos");

var botonesConfirmPedidosLibro;
var botonesEditPedidosLibro;
var botonesRejectPedidosLibro;

var modalLibroPedido = document.querySelector(".modal-edit-libro-pedido");
var botonCloseModalEditPedido = document.querySelector(".close-modal-edit-libro-pedido");
var botonCancelModalEditPedido = document.querySelector(".cancel-modal-edit-libro-pedido");
var statusEditPedidoLibro = document.querySelector(".db-edit-libro-pedido");
var botonSendPedidoLibro = document.querySelector(".confirm-modal-edit-libro-pedido");

var inputEditPedidoTitulo = document.querySelector(".solicitud-edit.titulo");
var inputEditPedidoAutor = document.querySelector(".solicitud-edit.autor");
var inputEditPedidoEditorial = document.querySelector(".solicitud-edit.editorial");
var inputEditPedidoMateria = document.querySelector(".solicitud-edit.materia");
var inputEditPedidoOrigen = document.querySelector(".solicitud-edit.origen");
var inputEditPedidoAnio = document.querySelector(".solicitud-edit.anio");
var inputEditPedidoEdicion = document.querySelector(".solicitud-edit.edicion");
var inputEditPedidoCantidad = document.querySelector(".solicitud-edit.cantidad");
var inputEditPedidoObservacion = document.querySelector(".solicitud-edit.observacion");


// ****************************************************************************
//                                Fin Elementos 
// ****************************************************************************




// *****************************************************************
//                      Eventos de pedidos (Libros)
// *****************************************************************

// ------------------------ Metodo Buscar ----------------------------

function buscarPedidosLibro(){
    pedidoCtrl.solicitudAjaxBuscar(gridPedidosLibro, filtrosPedidosLibro.value, "abm");
}

filtrosPedidosLibro.addEventListener("change", ()=>{
    buscarPedidosLibro();
});

// ------------------------ Metodo Editar -----------------------------

botonCancelModalEditPedido.addEventListener("click", ()=>{
    modalLibroPedido.classList.remove('active');
});

botonCloseModalEditPedido.addEventListener("click", ()=>{
    modalLibroPedido.classList.remove('active');
});

function agregarEventosEditarPedido(){
    botonesEditPedidosLibro = document.querySelectorAll(".edit-libro-pedido");
    for (let i = 0; i < botonesEditPedidosLibro.length ; i++) {
        botonesEditPedidosLibro[i].addEventListener("click",()=>{
            let idPedido = botonesEditPedidosLibro[i].getAttribute("idPedido");
            let objPedido = pedidoCtrl.buscarPedidoPorid(idPedido);
            statusEditPedidoLibro.innerHTML = "";

            inputEditPedidoTitulo.value = objPedido.libro.titulo;
            inputEditPedidoAutor.value = objPedido.libro.autor;
            inputEditPedidoEditorial.value = objPedido.libro.editorial;
            inputEditPedidoMateria.value = objPedido.libro.materia;
            inputEditPedidoOrigen.value = objPedido.libro.lugarEdicion;
            inputEditPedidoAnio.value = objPedido.libro.anio;
            inputEditPedidoEdicion.value = objPedido.libro.serie;
            inputEditPedidoCantidad.value = objPedido.cantidad;
            inputEditPedidoObservacion.value = objPedido.libro.observaciones;

            modalLibroPedido.setAttribute("idPedidoTemp", idPedido);
    
            modalLibroPedido.classList.add('active');
        });
    }
}

botonSendPedidoLibro.addEventListener("click", ()=>{

    if(inputEditPedidoTitulo.value != "" &&
        inputEditPedidoAutor.value != "" &&
        inputEditPedidoEditorial.value != "" &&
        inputEditPedidoMateria.value != "" &&
        inputEditPedidoOrigen.value != "" &&
        inputEditPedidoAnio.value != "" &&
        inputEditPedidoEdicion.value != "" &&
        inputEditPedidoCantidad.value != "" &&
        inputEditPedidoObservacion.value != "" ){

        let pedidoAux = new Pedido(null,
            new Libro(null, 
                inputEditPedidoTitulo.value, 
                inputEditPedidoAutor.value,
                null, 
                inputEditPedidoEditorial.value, 
                inputEditPedidoMateria.value, 
                inputEditPedidoOrigen.value, 
                inputEditPedidoAnio.value, 
                inputEditPedidoEdicion.value, 
                inputEditPedidoObservacion.value),
            new Usuario(null, null, null, null, null, null, null, null, null, null, null, null), // <---- Los datos del usuario vienen de la variable $_SESSION
            inputEditPedidoCantidad.value,
            null);
    
        libroCtrl.solicitudAjaxABM(pedidoAux.toJson(),"edit");
    }else{
        statusEditPedidoLibro.innerHTML = "<span class='icon-warning'>Por favor complete los campos antes de enviar.</span>";
    }

});


// ------------------------ Metodos confirmar ----------------------------

function agregarEventosConfirmarPedido(){
    botonesConfirmPedidosLibro = document.querySelectorAll(".confirm-libro-pedido");
    for (let i = 0; i < botonesConfirmPedidosLibro.length ; i++) {
        botonesConfirmPedidosLibro[i].addEventListener("click",()=>{
            let idPedido = botonesConfirmPedidosLibro[i].getAttribute("idPedido");
            pedidoCtrl.solicitudAjaxABM({"idPedido": idPedido}, "confirm");
        });
    }
}


// ---------------------------- Metodos Cancelar ----------------------------------

function agregarEventosRechazarPedido(){
    botonesRejectPedidosLibro = document.querySelectorAll(".reject-libro-pedido");
    for (let i = 0; i < botonesRejectPedidosLibro.length ; i++) {
        botonesRejectPedidosLibro[i].addEventListener("click",()=>{
            let idPedido = botonesRejectPedidosLibro[i].getAttribute("idPedido");
            pedidoCtrl.solicitudAjaxABM({"idPedido": idPedido}, "reject");
        });
    }
}


// *****************************************************************
//                                Fin Eventos
// *****************************************************************

buscarPedidosLibro();