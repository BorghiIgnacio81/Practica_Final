try{

let meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
let mesesDias = [31,28,31,30,31,30,31,31,30,31,30,31];
let dias = ['Dom','Lun','Mar','Mie','Jue','Vie','Sab'];

let date = new Date();

let fechaPivote = new Date(date.getFullYear(), date.getMonth(), 1, 19, 0, 0);

let fechaDesde = new Date(date);
let fechaHasta = new Date(date);
fechaHasta.setDate(fechaDesde.getDate() + 7);

cargarFecha();
cargarDias();
ponerEventos();


function cargarDias(){
    let current = new Date(fechaPivote);
    let diasHtml = "";
    for( i = 1 ; i <= mesesDias[current.getMonth()] ; i++ ){

        if(i === 1){
            if(date > current || (current.getDay() === 0 || current.getDay() === 6))
                diasHtml += "<li style='background: #333; grid-column-start:"+(current.getDay()+1)+"'>1</li>";
            else
                diasHtml += "<li class='dia-valido primer' style='grid-column-start:"+(current.getDay()+1)+"'>1</li>";
        }else{
            current.setDate(i);
            if(date > current){
                diasHtml += "<li style='background: #333'>"+i+"</li>";
            }else{
                if(current.getDay() === 0 || current.getDay() === 6)
                    diasHtml += "<li style='background: #333'>"+i+"</li>";
                else
                    diasHtml += "<li class='dia-valido primer'>"+i+"</li>";
            }
        }
    }
    document.getElementById("alm1").innerHTML = diasHtml;

    diasHtml = "";
    current = new Date(fechaPivote);
    current.setMonth(current.getMonth()+1);
    for( i = 1 ; i <= mesesDias[current.getMonth()] ; i++ ){

        if(i === 1){
            if(date > current || (current.getDay() === 0 || current.getDay() === 6))
                diasHtml += "<li style='background: #333; grid-column-start:"+(current.getDay()+1)+"'>1</li>";
            else
                diasHtml += "<li class='dia-valido segundo' style='grid-column-start:"+(current.getDay()+1)+"'>1</li>";
        }else{
            current.setDate(i);
            if(date >= current){
                diasHtml += "<li style='background: #333'>"+i+"</li>";
            }else{
                if(current.getDay() === 0 || current.getDay() === 6)
                    diasHtml += "<li style='background: #333'>"+i+"</li>";
                else
                    diasHtml += "<li class='dia-valido segundo'>"+i+"</li>";
            }
        }
    }
    document.getElementById("alm2").innerHTML = diasHtml;
}

function esBiciesto( anioActual ){
    return ((anioActual % 4 === 0 && anioActual % 100 !== 0) || anioActual % 400 === 0);
}

function ponerEventos(){
    document.querySelectorAll(".dia-valido").forEach(el => {
        el.addEventListener("click", e => {
            const dia = Number(e.target.innerHTML);
            
            if(el.className == "dia-valido primer"){
                cambiarPrestamo(dia, fechaPivote.getMonth());
            }else{
                cambiarPrestamo(dia, fechaPivote.getMonth()+1);
            }
        });
    });
}

function cambiarPrestamo(vdia, vmes){
    let fechaAux = new Date(fechaPivote);
    fechaAux.setMonth(vmes);

    document.getElementById("dia-desde").innerHTML = vdia;
    document.getElementById("mes-anio-desde").innerHTML = meses[fechaAux.getMonth()]+" - "+fechaAux.getFullYear();

    fechaAux.setDate(vdia + 7);
    document.getElementById("dia-hasta").innerHTML = fechaAux.getDate();
    document.getElementById("mes-anio-hasta").innerHTML = meses[fechaAux.getMonth()]+" - "+fechaAux.getFullYear();
}


function pintarSemana(){

}

document.querySelector(".icon-arrow-left").addEventListener("click", ()=>{
    fechaPivote.setMonth(fechaPivote.getMonth()-1);
    cargarFecha();
    cargarDias();
    ponerEventos();
});

document.querySelector(".icon-arrow-right").addEventListener("click", ()=>{
    fechaPivote.setMonth(fechaPivote.getMonth()+1);
    cargarFecha();
    cargarDias();
    ponerEventos();
});


function cargarFecha(){
    document.querySelector(".almanaque-mes.primer").innerHTML = "<p>"+meses[fechaPivote.getMonth()]+" ("+fechaPivote.getFullYear()+")</p>";
    document.querySelector(".almanaque-mes.segundo").innerHTML = "<p>"+meses[(fechaPivote.getMonth()+1)%12]+" ("+fechaPivote.getFullYear()+")</p>";
}

}catch(e){
    
}