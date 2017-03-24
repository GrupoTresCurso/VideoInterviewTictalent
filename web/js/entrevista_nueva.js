var contador = 0;
var elementoMovido = null;
var contenedorActual = null;
var elementoArrastrado = null;
var elementoCopiado = null;
var elementoGuia = null;
var nextinput = 0;

var elementos = document.getElementsByClassName("elemento");
for (var i = 0; i < elementos.length; i++) {
    elementos[i].style.display = 'none';
}

var elementoSeleccionado = null;
var etiquetaElementoSeleccionado = null;
var opcionesElementoSeleccionado = null;
var numOpcionesElementoSeleccinado = null;
var tipo = null;

function seleccionar(clase, id) {
    var entrevistas = document.getElementsByClassName(clase);
    for (var i = 0; i < entrevistas.length; i++) {
        entrevistas[i].style.backgroundColor = "white";
    }
    document.getElementById(id).style.backgroundColor = "#C0C0C0";
}

function start(e) {
    elementoMovido = e.target;
    e.dataTransfer.effectAllowed = 'move'; // Define el efecto como mover
    e.dataTransfer.setData("Data", e.target.id); // Coje el elemento que se va a mover
    e.dataTransfer.setDragImage(e.target, 0, 0); // Define la imagen que se vera al ser arrastrado el elemento y por donde se coje el elemento que se va a mover (el raton aparece en la esquina sup_izq con 0,0)
    //e.target.style.opacity = '0.4'; // Establece la opacidad del elemento que se va arrastrar
}

function end(e) {
    var element = document.querySelectorAll('.elemento');
    [].forEach.call(element, function (elem) {
        elem.classList.remove('over');
    });
    e.dataTransfer.clearData("Data");
}

function ignoreDrag(e) {
    e.stopPropagation();
    e.preventDefault();
}

function enter(e) {
    ignoreDrag(e);
    e.target.classList.add('over');
}

function leave(e) {
    e.target.classList.remove('over');
}

function over(e) {
    ignoreDrag(e);
    var id = e.target.id;
    if (id == 'contenedorVideo') {
        return false;
    }
}

function drop(e) {
    contenedorActual = e.target;
    if (elementoMovido.parentNode != contenedorActual) {
        elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data"));
        elementoCopiado = elementoArrastrado.cloneNode(true);
        elementoCopiado.style.transform = 'scale(1.0)';
        elementoCopiado.style.width = '50px';
        elementoCopiado.style.height = '50px';
        if (devolverTipoElemento(elementoMovido) == "number" || devolverTipoElemento(elementoMovido) == "select" ||
            devolverTipoElemento(elementoMovido) == "date") {
            elementoCopiado.style.height = '36px';
        }
        if (devolverTipoElemento(elementoMovido) == "area" || devolverTipoElemento(elementoMovido) == "checkbox") {
            elementoCopiado.style.height = '94px';
        }
        elementoCopiado.querySelectorAll('.contenedorIcono')[0].style.display = 'none';
        elementoCopiado.querySelectorAll('.elemento')[0].style.display = 'block';
        //elementoCopiado.querySelectorAll('.capaSuperior')[0].style.display = 'none';
        //e.target.appendChild(elementoCopiado);

        elementoGuia = elementoCopiado.cloneNode(true);
        elementoGuia.style.float = 'left';
        var tr = document.getElementById("guia");
        tr.appendChild(elementoGuia);

        //e.target.appendChild();
        /*contenedorGuia.innerHTML = "<img src='images/movie.png' width='40px' height='40px'/> " +
         "<p>Video Intro 1</p>";*/

        agregarCampos(elementoCopiado);
        contador++;
    }
    e.target.classList.remove('over');

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
    $("#contenedorEntrevista").append(campo);
    campo = '';
}

function devolverTipoElemento(elemento) {
    return elemento.className.split(" ")[0];
}

/**************************PAPELERA*****************************/

function leavePapelera(e) {
    document.getElementById("imagenPapelera").src = "images/papelera_close.png";
}

function overPapelera(e) {
    if (e.preventDefault) {
        e.preventDefault();
    }
    document.getElementById("imagenPapelera").src = "images/papelera_open.png";
    e.dataTransfer.dropEffect = 'move';
    var id = e.target.id;
    if (id == 'papelera') {
        return false;
    }
}

function dropPapelera(e) {
    elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data")); // Elemento arrastrado
    elementoArrastrado.parentNode.removeChild(elementoArrastrado); // Elimina el elemento
    document.getElementById("imagenPapelera").src = "images/papelera_close.png";
}

//Selecciona y ocultar tipos de elementos (nuevos o predefinidos)
function seleccionarTipoElementos(id) {
    if (id == "detailsVI") {
        document.getElementById("detailsF").open = false;
        document.getElementById("detailsVP").open = false;
        document.getElementById("detailsVT").open = false;
        document.getElementById("detailsC").open = false;
    }
    if (id == "detailsF") {
        document.getElementById("detailsVI").open = false;
        document.getElementById("detailsVP").open = false;
        document.getElementById("detailsVT").open = false;
        document.getElementById("detailsC").open = false;
    }
    if (id == "detailsVP") {
        document.getElementById("detailsVI").open = false;
        document.getElementById("detailsF").open = false;
        document.getElementById("detailsVT").open = false;
        document.getElementById("detailsC").open = false;
    }
    if (id == "detailsVT") {
        document.getElementById("detailsVI").open = false;
        document.getElementById("detailsF").open = false;
        document.getElementById("detailsVP").open = false;
        document.getElementById("detailsC").open = false;
    }
    if (id == "detailsC") {
        document.getElementById("detailsF").open = false;
        document.getElementById("detailsVP").open = false;
        document.getElementById("detailsVT").open = false;
        document.getElementById("detailsVI").open = false;
    }

}
