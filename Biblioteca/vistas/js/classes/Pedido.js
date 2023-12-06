class Pedido{
    constructor(idPedido, libro, usuario, cantidad, fechaPedido){
        this.idPedido = idPedido;
        this.libro = libro;
        this.usuario = usuario;
        this.cantidad = cantidad;
        this.fechaPedido = fechaPedido;

    }

    printBoxPedidoABM(){
        return '<div class="add-lp-item box-type1" >'+
                '<h4>'+this.libro.titulo+'</h4>'+
                '<div class="add-lp-content box-type1-content">'+
                    '<span class="icon-user"><p>Prof. '+ this.usuario.apellido + ' ' + this.usuario.nombre +'</p></span>'+
                    '<span class="icon-book"><p>Ejemplares: '+ this.cantidad +'</p></span>'+
                    '<span class="icon-calendar"><p>Fecha solicitada:'+ this.fechaPedido +'</p></span>'+
                '</div>'+
                '<div class="add-lp-btns box-type1-btns">'+
                    '<span class="icon-checkmark confirm-libro-pedido" idPedido="'+this.idPedido+'"></span>'+
                    '<span class="icon-pencil edit-libro-pedido" idPedido="'+this.idPedido+'"></span>'+
                    '<span class="icon-cross reject-libro-pedido" idPedido="'+this.idPedido+'"></span>'+
                '</div>'+
            '</div>';
    }

    printBoxPedidoRechazar(){
        return '<div class="add-lp-item box-type1" >'+
                '<h4>'+this.libro.titulo+'</h4>'+
                '<div class="add-lp-content box-type1-content">'+
                    '<span class="icon-books"><p>Ejemplares: '+ this.cantidad +'</p></span>'+
                    '<span class="icon-calendar"><p>Fecha solicitada: '+ this.fechaPedido +'</p></span>'+
                '</div>'+
                '<div class="add-lp-btns box-type1-btns">'+
                    '<span class="icon-cross del-pedido" idPedido="'+this.idPedido+'"></span>'+
                '</div>'+
            '</div>';
    }

    toJson(){
        return {
            "idPedido" : this.idPedido,
            "libro" : this.libro.toJson(),
            "usuario" : this.usuario.toJson(),
            "cantidad" : this.cantidad,
            "fechaPedido" : this.fechaPedido
        }
    }

}
