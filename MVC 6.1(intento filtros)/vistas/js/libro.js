modalPedidoLibroClose.addEventListener("click", ()=>{
    modalPedidoLibro.classList.remove('active');
});

modalPedidolibroCancel.addEventListener("click", ()=>{
    modalPedidoLibro.classList.remove('active');
});

for (var i = 0; i < botonPedidoLibroOpen.length; i++) {
    
    botonPedidoLibroOpen[i].addEventListener("click",()=>{
        modalPedidoLibro.classList.add('active');
    });
    
}
