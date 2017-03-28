var contador = 0;
var contador2=0;
var formularioCargado=0;
var elementoMovido = null;
var contenedorActual = null;
var elementoArrastrado = null;
var elementoCopiado = null;

var elementoSeleccionado = null;
var idElementoSeleccionado = null;
var etiquetaElementoSeleccionado = null;
var opcionesElementoSeleccionado = null;
var numOpcionesElementoSeleccinado = null;
var tipo = null;
var filaNuevoElementoPred;
var elementoPredefinido = null;
var numElementosPredefinidos;

var contador=0;

ajustarTamanioPagina();

var elementoNoVisible = document.querySelectorAll('.elementoNoMostrar');
for(var i = 0; i<elementoNoVisible.length; i++){
    elementoNoVisible[i].style.display = "none";
}

function ajustarTamanioPagina() {
    $('#medio').css('width', ($(window).width()-$('#izquierda').width()-$('#derecha').width()) + 'px');
    $('#contenedor').css('height', ($(window).height()*0.895) + 'px');
}


//Bloquear seleccion de texto e imágenes en página (comportamiento habitual)
function bloquearSeleccionPorDefecto() {
    /*var elementosNoSeleccionables = document.querySelectorAll('label, h1, h3, b, p');
     for(var i=0; i<elementosNoSeleccionables.length; i++){
     elementosNoSeleccionables[i].onselectstart = function() {return false;};
     }*/
    $('img').on('dragstart', function (event) {
        event.preventDefault();
    });
    $('label').on('dragstart', function (event) {
        event.preventDefault();
    });
    $('h1').on('dragstart', function (event) {
        event.preventDefault();
    });
    $('h2').on('dragstart', function (event) {
        event.preventDefault();
    });
    $('h3').on('dragstart', function (event) {
        event.preventDefault();
    });
    $('h4').on('dragstart', function (event) {
        event.preventDefault();
    });
    $('h5').on('dragstart', function (event) {
        event.preventDefault();
    });
    $('a').on('dragstart', function (event) {
        event.preventDefault();
    });
    $('b').on('dragstart', function (event) {
        event.preventDefault();
    });
    $('p').on('dragstart', function (event) {
        event.preventDefault();
    });
}



/****************************DRAG AND DROP***************************/

//Funcionamiento del drag and drop al contenedor
function start(e) {
    elementoMovido = e.target;
    e.dataTransfer.effectAllowed = 'move'; // Define el efecto como mover
    e.dataTransfer.setData("Data", e.target.id); // Coje el elemento que se va a mover
    e.dataTransfer.setDragImage(e.target, 0, 0); // Define la imagen que se vera al ser arrastrado el elemento y por donde se coje el elemento que se va a mover (el raton aparece en la esquina sup_izq con 0,0)
    //e.target.style.opacity = '0.4'; // Establece la opacidad del elemento que se va arrastrar
    //elementoMovido.querySelectorAll(".contenedorIcono")[0].style.backgroundColor = "#00B4DF";
    ocultarInfoUsuario();
}

function end(e) {
    var element = document.querySelectorAll('.elemento');
    [].forEach.call(element, function (elem) {
        elem.classList.remove('over');
    });
    e.dataTransfer.clearData("Data");
    elementoMovido.querySelectorAll(".contenedorIcono")[0].style.backgroundColor = "white";
}

function enter(e) {

    e.target.classList.add('over');
}

function leave(e) {
    e.target.classList.remove('over');
}

function over(e) {
    var id = e.target.id; // Elemento sobre el que se arrastra

    // return false para que se pueda soltar
    if (id == 'contenedor') {
        return false; // En el cuadro2 se puede soltar cualquier elemento menos el elemento con id=arrastrable3
    }
}

function drop(e) {

    contenedorActual = e.target;
    if(elementoMovido.parentNode != contenedorActual) {
        elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data"));
        elementoCopiado = elementoArrastrado.cloneNode(true);
        elementoCopiado.id = "elemento" + contador;
        elementoCopiado.style.transform = 'scale(1.0)';
        elementoCopiado.style.width = '420px';
        elementoCopiado.style.height = '51px';
        elementoCopiado.querySelectorAll('.contenedorIcono')[0].style.display = 'none';
        elementoCopiado.querySelectorAll('.contenedorElemento')[0].style.display = 'block';
        e.target.appendChild(elementoCopiado);
        contador++;
    }
    e.target.classList.remove('over');

}
