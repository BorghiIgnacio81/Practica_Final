modalResClose = document.querySelector(".close-modal-res");
modalResCancel = document.querySelector(".cancel-modal-res");
modalRes = document.querySelector(".modal-reserva");
modalResOpen = document.querySelectorAll(".open-modal-res");

modalDelResClose = document.querySelector(".close-modal-del-reserva");
modalDelResCancel = document.querySelector(".cancel-modal-del-reserva");
modalDelRes = document.querySelector(".modal-del-reserva");
modalDelResOpen = document.querySelectorAll(".cancel-reserva");



modalResClose.addEventListener("click", ()=>{
    modalRes.classList.remove('active');
});

modalResCancel.addEventListener("click", ()=>{
    modalRes.classList.remove('active');
});

for (var i = 0; i < modalResOpen.length; i++) {
    modalResOpen[i].addEventListener("click", ()=>{
        modalRes.classList.add('active');
    });
}

modalDelResClose.addEventListener("click", ()=>{
    modalDelRes.classList.remove('active');
});

modalDelResCancel.addEventListener("click", ()=>{
    modalDelRes.classList.remove('active');
});

for (var i = 0; i < modalDelResOpen.length; i++) {
    modalDelResOpen[i].addEventListener("click", ()=>{
        modalDelRes.classList.add('active');
    });
}