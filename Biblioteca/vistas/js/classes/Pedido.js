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
                    '<span class="icon-user"><p>Prof. '+ this.usuario.nombre + ' ' + this.usuario.apellido +'</p></span>'+
                    '<span class="icon-book"><p>Ejemplares: '+ this.cantidad +'</p></span>'+
                    '<span class="icon-calendar"><p>Fecha solicitada:'+ this.fechaPedido +'</p></span>'+
                '</div>'+
                '<div class="add-lp-btns box-type1-btns">'+
                    '<span class="icon-checkmark add-libro-pedido" idPedido="'+this.idPedido+'"></span>'+
                    '<span class="icon-pencil edit-libro-pedido" idPedido="'+this.idPedido+'"></span>'+
                    '<span class="icon-cross del-libro-pedido" idPedido="'+this.idPedido+'"></span>'+
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
                    '<span class="icon-cross" idPedido="'+this.idPedido+'"></span>'+
                '</div>'+
            '</div>';
    }


}
