class PedidoController{
    constructor(){
        this.listaPedidosBM = null;
    }

    // ---------------  Metodos clase PedidoController ---------------
    cantidadPedidos(){
        if(this.listaPedidosBM)
            return this.listaPedidosBM.length;
        else
            return 0;
    }

    buscarPedidoPorid(id){
        let auxPedido;
        this.listaPedidosBM.forEach(function (l) {
            if(l.idPedido == id){
                auxPedido = l;
            }
        });
        return auxPedido;
    }

    solicitudAjaxBuscar(target, filtros, boxType){
        let datasend = {"funcion" : "search", "filtros": filtros};
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "controlador/pedidos_controlador.php", true);
        xhr.setRequestHeader("Content-Type", "application/json");
    
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                let listaPedidos = JSON.parse(xhr.responseText); //el json que envía el servidor
                let listado = "";


                if(listaPedidos){
                    pedidoCtrl.listaPedidosBM = {};

                    listaPedidos.forEach(function (l) {
                        let pedidoAux = new Pedido(l.idPedido,
                            new Libro(l.idLibro, l.titulo, l.autor, l.ubicacionFisica, l.editorial, l.materia, l.lugarEdicion, l.anio, l.serie, l.observaciones),
                            new Usuario(l.idUsuario, l.nombre, l.apellido, l.dni, l.direccion, l.telefono, l.email, l.fechaNac, l.penalidad, l.tipoUsuario),
                            l.cantidad,
                            l.fechaPedido);

                        pedidoCtrl.listaPedidosBM.push(pedidoAux);

                        if(boxType == "abm")
                            listado += pedidoAux.printBoxPedidoABM();
                        else
                            listado += pedidoAux.printBoxPedidoRechazar();
                        
                    });

                    target.innerHTML = listado;

                    //Agregar eventos

                    if(boxType == "abm"){
                        agregarEventosConfirmarPedido();
                        agregarEventosEditarPedido();
                        agregarEventosRechazarPedido();
                        
                    }else{
                        modalSolicitarLibro = document.querySelector(".modal-solicitar");
                        agregarEventosEliminarPedido();
                    }

                    //fin agregar eventos

                }else{
                    target.innerHTML = "<p>No se han encontrado resultados.</p>";
                }

            } else if (xhr.readyState == 4 && xhr.status != 200) {
                pedidoCtrl.listaPedidosBM = null;
                target.innerHTML = "<p>Se ha producido un error, intente nuevamente.</p>";
            }
        };
    
        xhr.send(JSON.stringify(datasend)); //Envía la info al servidor en formato string de json
    }

    solicitudAjaxABM(pedido, accion){
        let data = {"funcion" : accion, "data" : pedido};
        
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "controlador/pedidos_controlador.php", true);
        xhr.setRequestHeader("Content-Type", "application/json");
    
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                let response = JSON.parse(xhr.responseText); //(el json de tipo {"status" : "ok"})
                
                switch(accion){
                    case "add": //profesor
                        if(response.status == "ok"){
                            alert('<span class="icon-checkmark"> Se ha generado un nuevo pedido de libro</span>');
                            buscarPedidosProfesor();
                            setTimeout(() => {
                                modalSolicitarLibro.classList.remove("active");
                            }, 2000);
                        }else{
                            alert('<span class="icon-blocked"> No se ha podido agregar el libro</span>');
                        }
                        break;
                    case "del": //profesor
                        if(response.status == "ok"){
                            alert('<span class="icon-checkmark"> Pedido de libro eliminado exitosamente</span>');
                            buscarPedidosProfesor();
                        }else{
                            alert('<span class="icon-blocked"> No se ha podido eliminar el pedido</span>');
                        }
                        break;
                    case "edit": //bibliotecaria
                        if(response.status == "ok"){
                            statusEditPedidoLibro.innerHTML = '<span class="icon-checkmark"> El pedido ha sido editado</span>';
                            buscarPedidosLibro();
                            setTimeout(() => {
                                modalLibroPedido.classList.remove("active");
                            }, 2000);
                        }else{
                            statusEditPedidoLibro.innerHTML = '<span class="icon-blocked"> No se ha podido editar el pedido</span>';
                        }
                        break;
                    case "confirm": //bibliotecaria
                        if(response.status == "ok"){
                            alert('<span class="icon-checkmark"> ¡Pedido aprobado! Los libros ya están disponibles.</span>');
                            busquedaLibro();
                        }else{
                            alert('<span class="icon-blocked"> Se ha producido un error.</span>');
                        }
                        break;
                    case "reject": //bibliotecaria
                        if(response.status == "ok"){
                            alert('<span class="icon-checkmark"> Pedido Rechazado.</span>');
                            busquedaLibro();
                        }else{
                            alert('<span class="icon-blocked"> Se ha producido un error.s</span>');
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

var pedidoCtrl = new PedidoController();