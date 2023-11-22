document.querySelector(".abrir-busqueda").addEventListener("click",()=>{
    document.querySelector(".busqueda").classList.add("active");
});

document.querySelector(".cerrar-busqueda").addEventListener("click",()=>{
    document.querySelector(".busqueda").classList.remove("active");
});

document.querySelector(".abrir-login").addEventListener("click",()=>{
    document.querySelector(".login-frame").classList.add("active");
});

document.querySelector(".cerrar-login").addEventListener("click",()=>{
    document.querySelector(".login-frame").classList.remove("active");
});