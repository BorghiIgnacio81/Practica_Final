const showRes = document.querySelector(".menu-item.show-reservas");
const showUser = document.querySelector(".menu-item.show-usuarios");
const showLibro = document.querySelector(".menu-item.show-libros");
const showPrest = document.querySelector(".menu-item.show-prestamos");
const showSolicitar = document.querySelector(".menu-item.show-solicitar-libro");

const frameRes = document.querySelector(".frame-reservas");
const frameUser = document.querySelector(".frame-usuarios");
const frameLibro = document.querySelector(".frame-libros");
const framePrest = document.querySelector(".frame-prestamos");
const frameSolicitar = document.querySelector(".frame-solicitar-libro");


showSolicitar.addEventListener("click",()=>{
    frameUser.classList.remove('active');
    frameLibro.classList.remove('active');
    framePrest.classList.remove('active');
    frameRes.classList.remove('active');
    setTimeout(()=>{
        frameSolicitar.classList.add('active');
    },250);
});

showRes.addEventListener("click",()=>{
    frameSolicitar.classList.remove('active');
    frameUser.classList.remove('active');
    frameLibro.classList.remove('active');
    framePrest.classList.remove('active');
    setTimeout(()=>{
        frameRes.classList.add('active');
    },250);
});

showUser.addEventListener("click",()=>{
    frameRes.classList.remove('active');
    frameLibro.classList.remove('active');
    framePrest.classList.remove('active');
    frameSolicitar.classList.remove('active');
    setTimeout(()=>{
        frameUser.classList.add('active');
    },250);
});

showLibro.addEventListener("click",()=>{
    frameUser.classList.remove('active');
    frameRes.classList.remove('active');
    framePrest.classList.remove('active');
    frameSolicitar.classList.remove('active');
    setTimeout(()=>{
        frameLibro.classList.add('active');
    },250);
});

showPrest.addEventListener("click",()=>{
    frameUser.classList.remove('active');
    frameLibro.classList.remove('active');
    frameRes.classList.remove('active');
    frameSolicitar.classList.remove('active');
    setTimeout(()=>{
        framePrest.classList.add('active');
    },250);
});