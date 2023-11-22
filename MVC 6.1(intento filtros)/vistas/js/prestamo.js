const slidePrestamo = document.querySelector(".modal-slide-form");
const slidePrestamoNext1 = document.querySelector(".icon-arrow-right.next1");
const slidePrestamoNext2 = document.querySelector(".icon-arrow-right.next2");
const slidePrestamoPrev1 = document.querySelector(".icon-arrow-left.previous1");
const slidePrestamoPrev2 = document.querySelector(".icon-arrow-left.previous2");

const modalAddPrestamoClose = document.querySelectorAll(".close-modal-add-prestamo");
const modalAddPrestamo = document.querySelector(".modal-add-prestamo");
const modalAddPrestamoOpen = document.querySelector(".add-new-prestamo");

for(var i = 0; i < modalAddPrestamoClose.length; i++){
    modalAddPrestamoClose[i].addEventListener("click",()=>{
        console.log("hola");
        modalAddPrestamo.classList.remove('active');
    });
}

modalAddPrestamoOpen.addEventListener("click",()=>{
    modalAddPrestamo.classList.add('active');
});

slidePrestamoNext1.addEventListener("click",()=>{
    slidePrestamo.style.left = "-100%";
});

slidePrestamoNext2.addEventListener("click",()=>{
    slidePrestamo.style.left = "-200%";
});

slidePrestamoPrev1.addEventListener("click",()=>{
    slidePrestamo.style.left = "0%";
});

slidePrestamoPrev2.addEventListener("click",()=>{
    slidePrestamo.style.left = "-100%";
});