modalSolicitarLibroClose = document.querySelector(".close-modal-solicitar");
modalSolicitarLibroCancel = document.querySelector(".cancel-modal-solicitar");
modalSolicitarLibro = document.querySelector(".modal-frame.modal-solicitar");
modalSolicitarLibroOpen = document.querySelector(".add-solicitud-libro");


modalSolicitarLibroClose.addEventListener("click", ()=>{
    modalSolicitarLibro.classList.remove('active');
});

modalSolicitarLibroCancel.addEventListener("click", ()=>{
    modalSolicitarLibro.classList.remove('active');
});

modalSolicitarLibroOpen.addEventListener("click",()=>{
    modalSolicitarLibro.classList.add('active');
});