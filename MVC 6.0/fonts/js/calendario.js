let meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
let mesesDias = [31,28,31,30,31,30,31,31,30,31,30,31];
let dias = ['Dom','Lun','Mar','Mie','Jue','Vie','Sab'];

let nextMonth = 0;

let date = new Date();
let diaActual = date.getDate();
let mesActual = date.getMonth();
let anioActual = date.getFullYear();

let desdeDay = diaActual;
let desdeMonth = mesActual;
let desdeYear = anioActual;

let hastaDay = 0;
let hastaMonth = 0;
let hastaYear = 0;

let fechaIndice = date;

calcularFechaHasta(desdeDay, desdeMonth);



function calcularFechaHasta(dia, mes){
    if(dia+7 > mesesDias[mes]){
        hastaDay = dia + 7 - mesesDias[mes];
        hastaMonth++;
        if(hastaMonth > 11){
            hastaMonth = 0;
            hastaYear++;
        }
    }
}


cargarDiasAnteriores("alm1");


function cargarDias(htmlClass){
    let current;
    for(i = 1; i <= mesesDias[mesActual] ; i++ ){

    }

}


function cargarDiasAnteriores( htmlClass){
    let current;
    let primerDia = new Date(anioActual, mesActual,1);
    let diasHtml = "";
    for( i = 1 ; i <= mesesDias[mesActual] ; i++ ){
        if(i === 1)
            diasHtml += "<li style='background: #333; grid-column-start:"+(primerDia.getDay+1)+"'>1</li>";
        else{

            if(i < diaActual){
                diasHtml += "<li style='background: #333'>"+i+"</li>";
            }else{
                current = new Date(anioActual,mesActual,i);
                if(current.getDay() === 0 || current.getDay() === 6)
                    diasHtml += "<li style='background: #333'>"+i+"</li>";
                else
                    diasHtml += "<li class='dia-valido primer'>"+i+"</li>";
            }
        }
            
    }
    

    
    document.getElementById(htmlClass).innerHTML = diasHtml;


}

/*
cargarAlmanaqueActual("alm1");
cargarAlmanaque("alm2");




function cargarAlmanaqueActual( htmlClass){
    let diasHtml = "";
    
    for(i = 1; i < dia ; i++){
        if(i === 1)
            diasHtml += "<li style='background: #333; grid-column-start:"+(dia%7-date.getDay())+"'>1</li>";
        else
            diasHtml += "<li style='background: #333'>"+i+"</li>";
    }

    for(i = dia; i <= mesesDias[mes+nextMonth]; i++){
        if(i%7+gap === 0 || i%7+gap === -1)
            diasHtml += "<li style='background: #333'>"+i+"</li>";    
        else
            diasHtml += "<li class='dia-valido'>"+i+"</li>";
            
    }

    document.getElementById(htmlClass).innerHTML = diasHtml;
}

function cargarAlmanaque( htmlClass){
    let diasHtml = "";
    let calc = 0;
    let cantDias = 1;

    for(i = 0; i < nextMonth+1; i++)
        cantDias += mesesDias[mes + nextMonth];

    console.log(cantDias);

    for(i = 1; i <= mesesDias[mes+nextMonth+1]; i++){
        calc = (cantDias+i)%7+gap-1;
        console.log(calc);
        if(calc === 0 || calc === 1){
            diasHtml += "<li style='background: #333'>"+i+"</li>";
        }else{
            if(i === 1)
                diasHtml += "<li class='dia-valido' style='grid-column-start:"+(calc)+"'>1</li>";
            else
                diasHtml += "<li class='dia-valido'>"+i+"</li>";
        }
    }

    document.getElementById(htmlClass).innerHTML = diasHtml;
}

*/
function esBiciesto( anioActual ){
    return ((anioActual % 4 === 0 && anioActual % 100 !== 0) || anioActual % 400 === 0);
}

document.querySelectorAll(".dia-valido").forEach(el => {
    el.addEventListener("click", e => {
        const valor = Number(e.target.innerHTML);
        desdeDay = valor;

        if(el.className == "dia-valido primer"){
            cambiarPrestamo(desdeDay, desdeMonth, desdeYear);

        }else{
            desdeMonth++;
            cambiarPrestamo(desdeDay, desdeMonth, desdeYear);
        }
        //const id = e.target.getAttribute("id");
        cambiarPrestamo(valor,);

    });
});

function cambiarPrestamo(vdia, vmes, vanio){



    document.getElementById("dia-desde").innerHTML = vdia;

    if(vdia+7 > mesesDias[vmes]){
        document.getElementById("dia-hasta").innerHTML = vdia - mesesDias[vmes];
    }
}

/*
function pintarSemana(){

}

document.querySelector(".icon-arrow-left").addEventListener("click", ()=>{
    if(nextMonth > 0)
        nextMonth--;

    cargarAlmanaqueActual("alm1");
    cargarAlmanaque("alm2");
    
});

document.querySelector(".icon-arrow-right").addEventListener("click", ()=>{
    nextMonth++;

    cargarAlmanaqueActual("alm1");
    cargarAlmanaque("alm2");
});
*/