var contador = 0;
var elementoMovido = null;
var elementoPanelMovido = [];
var contenedorActual = null;
var elementoCopiado = null;
var contadorElementos = [];
var maxNumElementos = 0;
var elementoGuia = null;
var posicionGuia = 0;
var nextinput = 0;

inicializarGenerador();

function inicializarGenerador() {
    $("#perteneceFormulario").fadeOut(1000);
    ajustarTamanioPagina();
    bloquearSeleccionPorDefecto();
    ocultarElementosPanel();
    mostrarSeccion('guiaVI');
    document.getElementById('videoIntroBoolean').checked = true;
    for(var i=0; i<6; i++){
        contadorElementos[i] = 0;
        elementoPanelMovido[i] = null;
    }

}

function ajustarTamanioPagina() {
    $('#medio').css('width', ($(window).width()-$('#izquierda').width()-$('#derecha').width()) + 'px');
    $('#contenedorEntrevista').css('height', ($(window).height()*0.75) + 'px');

}

function ocultarElementosPanel() {
    var elementosF = document.getElementsByClassName("elementoEntrevista");
    for (var i = 0; i < elementosF.length; i++) {
        elementosF[i].style.display = 'none';
    }
}

function devolverTipoElemento(elemento) {
    return elemento.className.split(" ")[0];
}

//Verifica si un elemento pertenece a la entrevista (ya ha sido soltado)
function elementoPerteneceAEntrevista(elemento) {
    if (elemento.className.indexOf("perteneceEntrevista") != -1) {
        return true;
    }
    return false;
}


function hayElementosEnEntrevista() {
    var numElementos = document.getElementById("contenedorElementosEntrevista"+elementoGuia).querySelectorAll(".perteneceEntrevista");
    if (numElementos.length > 0) {
        return true;
    }
    return false;
}

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


function mostrarSeccion(id){
    document.getElementById("detailsVI").style.display = 'none';
    document.getElementById("detailsF").style.display = 'none';
    document.getElementById("detailsVT").style.display = 'none';
    document.getElementById("detailsVP").style.display = 'none';
    var secciones = document.querySelectorAll('.seccionEntrevista');
    for(var i=0; i<secciones.length; i++){
        secciones[i].style.backgroundColor = '#F2F2F2';
    }
    var contenedores = document.querySelectorAll('.estadoContenedor');
    for(var i=0; i<contenedores.length; i++){
        contenedores[i].style.display = 'none';
    }
    document.getElementById(id).style.backgroundColor = 'darkgrey';
    switch (id){
        case "guiaVI":
            document.getElementById("detailsVI").style.display = 'block';
            document.getElementById("detailsVI").open = true;
            maxNumElementos = 1;
            posicionGuia = 0;
            break;
        case "guiaFP":
            document.getElementById("detailsF").style.display = 'block';
            document.getElementById("detailsF").open = true;
            maxNumElementos = 1;
            posicionGuia = 1;
            break;
        case "guiaVT":
            document.getElementById("detailsVT").style.display = 'block';
            document.getElementById("detailsVT").open = true;
            maxNumElementos = 1;
            posicionGuia = 2;
            break;
        case "guiaVP":
            document.getElementById("detailsVP").style.display = 'block';
            document.getElementById("detailsVP").open = true;
            maxNumElementos = 5;
            posicionGuia = 3;
            break;
        case "guiaFS":
            document.getElementById("detailsF").style.display = 'block';
            document.getElementById("detailsF").open = true;
            maxNumElementos = 1;
            posicionGuia = 4;
            break;
        case "guiaFA":
            document.getElementById("detailsF").style.display = 'block';
            document.getElementById("detailsF").open = true;
            maxNumElementos = 1;
            posicionGuia = 5;
            break;
    }
    elementoGuia = id.substr(4,2);
    document.getElementById("estadoContenedor"+elementoGuia).style.display='block';
    //activarVideoIntroductorio();
}

function activarVideoIntroductorio(){
    if(document.getElementById('videoIntroBoolean').checked){
        document.getElementById('guiaVI').style.borderColor = 'black';
        document.getElementById('guiaVI').style.cursor = 'pointer';
        document.getElementById('guiaVI').onclick = function(){
            mostrarSeccion('guiaVI');
        };
        mostrarSeccion('guiaVI');
    }else{
        if(!(document.getElementById('videoIntroBoolean').checked)) {
            document.getElementById('guiaVI').style.borderColor = '#FF7766';
            document.getElementById('guiaVI').style.cursor = 'not-allowed';
            document.getElementById('guiaVI').onclick = null;
            mostrarSeccion('guiaFP');
        }
    }

}

/****************************DRAG AND DROP***************************/
function start(e) {
    elementoMovido = e.target;
    e.dataTransfer.effectAllowed = 'move'; // Define el efecto como mover
    e.dataTransfer.setData("Data", e.target.id); // Coje el elemento que se va a mover
    if(elementoPerteneceAEntrevista(elementoMovido)) {
        // Define la imagen que se vera al ser arrastrado el elemento y por donde se coje el elemento que se va a mover (el raton aparece en la esquina sup_izq con 0,0)
        if(elementoPanelMovido[posicionGuia]!=null){
            e.dataTransfer.setDragImage(elementoPanelMovido[posicionGuia].querySelectorAll('.contenedorIcono')[0], 0, 0);
        }else{
            e.dataTransfer.setDragImage(e.target, 0, 0);
        }

    }else{
        elementoPanelMovido[posicionGuia] = elementoMovido;
        e.dataTransfer.setDragImage(e.target, 0, 0);
    }
    //e.target.style.opacity = '0.4'; // Establece la opacidad del elemento que se va arrastrar
    ocultarInfoUsuario();
}

function end(e) {
    /*var element = document.querySelectorAll('.elementoEntrevista');
    [].forEach.call(element, function (elem) {
        elem.classList.remove('over');
    });
    e.dataTransfer.clearData("Data");
    elementoMovido.querySelectorAll(".contenedorIcono")[0].style.backgroundColor = "white";*/
}

/*function ignoreDrag(e) {
    e.stopPropagation();
    e.preventDefault();
}*/

function enter(e) {
    e.target.classList.add('over');
}

function leave(e) {
    e.target.classList.remove('over');
}

function over(e) {
    //ignoreDrag(e);
    var id = e.target.id;
    if (id == 'contenedorEntrevista') {
        return false;
    }
}

function drop(e) {
    contenedorActual = e.target;
    if (elementoMovido.parentNode.parentNode.parentNode != contenedorActual
        && contadorElementos[posicionGuia]<maxNumElementos) {
       elementoCopiado = elementoMovido.cloneNode(true);
        contadorElementos[posicionGuia]++;
        if(elementoCopiado.id=="area"||elementoCopiado.id=="check"||elementoCopiado.id=="select"||elementoCopiado.id=="radio"||elementoCopiado.id=="texto"
            || elementoCopiado.id=="file"){
            elementoCopiado.id = elementoCopiado.id+ "_" + contador;
        }else {
            var aux=elementoCopiado.id.split("_");
            var id=aux[1];
            elementoCopiado.id="p"+"_"+contador+"_"+id;
        }
        elementoCopiado.style.transform = 'scale(1.0)';
        elementoCopiado.style.width = document.getElementsByClassName('delimitadorElementoEntrevista')[0].style.width;
        elementoCopiado.style.height = document.getElementsByClassName('delimitadorElementoEntrevista')[0].style.height;
        elementoCopiado.classList.remove("pertenecePanel");
        elementoCopiado.classList.add("perteneceEntrevista");
        if (devolverTipoElemento(elementoMovido) == "formulario" ) {
            //    elementoCopiado.style.height = '600px';
        }
        if (devolverTipoElemento(elementoMovido) == "video") {
            //elementoCopiado.style.height = '400px';
        }
        elementoCopiado.querySelectorAll('.contenedorIcono')[0].style.display = 'none';
        elementoCopiado.querySelectorAll('.elementoEntrevista')[0].style.display = 'block';
        elementoCopiado.querySelectorAll('.capaSuperior')[0].style.display = 'none';

        //elementoContenedor = elementoCopiado.cloneNode(true);
        //elementoContenedor.style.float = 'left';
        var contenedor = document.getElementById("contenedorElementosEntrevista"+elementoGuia);
        contenedor.appendChild(elementoCopiado);
        $("#" + elementoCopiado.id).fadeOut(0);
        //e.target.appendChild();
        /*contenedorGuia.innerHTML = "<img src='images/movie.png' width='40px' height='40px'/> " +
         "<p>Video Intro 1</p>";*/

        agregarCampos(elementoCopiado);
        contador++;
    }
    e.target.classList.remove('over');
    document.getElementById("mensajeDefecto"+elementoGuia).style.display = 'none';
    document.getElementById("contenedorElementosEntrevista"+elementoGuia).style.display = 'block';
    $("#" + elementoCopiado.id).fadeIn(1000);
}

function agregarCampos(elementoCopiado) {
    var aux = elementoCopiado.id.split("_");
    var tipo = aux[0];
    var id = aux[1];
    if (tipo === "video") {
        campo = '<input type="hidden" size="20" name="videos[]" value="' + id + '"/>';
    } else if (tipo === "formulario") {
        campo = '<input type="hidden" size="20" name="formularios[]" value="' + id + '"/>';
    } else {
        campo = '<input type="hidden" size="20" name="candidatos[]" value="' + id + '"/>';
    }
    $(".elementoForm").append(campo);
    campo = '';
}


/**************************PAPELERA*****************************/

function leavePapelera(e) {
    document.getElementById("imagenPapelera").src = "images/papelera_close.png";
}

function overPapelera(e) {
    if (e.preventDefault) {
        e.preventDefault();
    }
    if (elementoPerteneceAEntrevista(elementoMovido)) {
        document.getElementById("imagenPapelera").src = "images/papelera_open.png";
        e.dataTransfer.dropEffect = 'move';
        var id = e.target.id;
        if (id == 'papelera') {
            return false;
        }
    }
}

function dropPapelera(e) {
    if (elementoPerteneceAEntrevista(elementoMovido)) {
        $("#" + elementoMovido.id).fadeOut(600);
        setTimeout(function () {
                document.getElementById("contenedorElementosEntrevista"+elementoGuia).removeChild(elementoMovido); // Elimina el elemento
                contadorElementos[posicionGuia]--;
                if (!hayElementosEnEntrevista()) {
                    document.getElementById("mensajeDefecto"+elementoGuia).style.display = 'block';
                    document.getElementById("contenedorElementosEntrevista"+elementoGuia).style.display = 'none';
                }
            },
            600);
        document.getElementById("imagenPapelera").src = "images/papelera_close.png";
    }
}
