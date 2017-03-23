var contador = 0;
var contador2=0;
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

inicializarGenerador();

function inicializarGenerador() {
    $("#perteneceFormulario").fadeOut(1000);
    ajustarTamanioPagina();
    bloquearSeleccionPorDefecto();
    ocultarElementosPanel();
    ocultarPropiedades();
    document.getElementById("nuevoForm").style.display = 'none';

}

function ajustarTamanioPagina() {
    //$('main').css('width', ($(window).width()) + 'px');
    $('nav').css('width', ($(window).width() - 30) + 'px');
    $('section').css('height', ($(window).height() - 650) + 'px');
    $('#panelElementosPrincipal').css('height', ($(window).height() - 491) + 'px');
    $('#contenedor').css('height', ($(window).height() - 92) + 'px');
    $('#contenedor').css('width', ($(window).width() - 764) + 'px');
    //$('#logoTictum').css('paddingLeft', ($(window).width() - 1085) + 'px');
    $('#userInfo').css('display','none');
    $('#logoTictum').css('paddingLeft', ($(window).width() - 1105) + 'px');
    $('#userInfo').css('left', ($(window).width() - 142) + 'px');
}

function elementoEsPredefinido(elemento) {
    if (elemento.className.indexOf("nuevoElementoPredefinido") != -1 ||
        elemento.className.indexOf("elementoPredefinido") != -1) {
        return true;
    }
    return false;
}

function hayElementosEnFormulario() {
    var numElementos = document.getElementById("contenedor").querySelectorAll(".perteneceFormulario");
    if (numElementos.length > 0) {
        return true;
    }
    return false;
}

function cantidadElementosPredefinidos() {
    var numElementos = document.getElementById("detailsEP").querySelectorAll(".pertenecePanel");
    return numElementos.length;
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

//Ocultar elementos en el panel
function ocultarElementosPanel() {
    var elementos = document.getElementsByClassName("elemento");
    for (var i = 0; i < elementos.length; i++) {
        if (elementos[i].className.indexOf("elementoLabel") != -1) {
            elementos[i].style.display = 'block';
            elementos[i].style.height = '25px';
            elementos[i].style.width = '550px';
            elementos[i].parentNode.style.height = '25px';
            elementos[i].parentNode.style.width = '550px';
        } else {
            elementos[i].style.display = 'none';
        }
    }
    document.getElementById("panelElementosBloqueo").style.display = 'none';
}

//Ocultar propiedades de elementos
function ocultarPropiedades() {
    document.getElementById("contenedorPropiedadesDefecto").style.display = "block";
    document.getElementById("contenedorEtiqueta").style.display = "none";
    document.getElementById("contenedorOpciones").style.display = "none";
    document.getElementById("contenedorActivarPredefinido").style.display = "none";
}

//Mostrar propiedades del label (Edición del título)
function mostrarPropiedadesLabel() {
    document.getElementById("contenedorPropiedadesDefecto").style.display = "none";
    document.getElementById("contenedorEtiqueta").style.display = "block";
}

//Mostrar propiedades sin opciones
function mostrarPropiedadesNoOpciones() {
    document.getElementById("contenedorPropiedadesDefecto").style.display = "none";
    document.getElementById("contenedorEtiqueta").style.display = "block";
    document.getElementById("contenedorActivarPredefinido").style.display = "block";
}

//Mostrar propiedades con opciones
function mostrarPropiedadesOpciones() {
    document.getElementById("contenedorPropiedadesDefecto").style.display = "none";
    document.getElementById("contenedorEtiqueta").style.display = "block";
    document.getElementById("contenedorOpciones").style.display = "block";
    document.getElementById("contenedorActivarPredefinido").style.display = "block";
    var inputs = document.getElementById("contenedorOpciones").querySelectorAll("input");
    [].forEach.call(inputs, function (inp) {
        inp.style.height = '15px';

    });
}

//Devuelve el tipo de elemento(texto, radio, checkbox, ....)
function devolverTipoElemento(elemento) {
    return elemento.className.split(" ")[0];
}

//Selecciona y ocultar tipos de elementos (nuevos o predefinidos)
function seleccionarTipoElementos(id) {
    if (id == "detailsE") {
        document.getElementById("detailsEP").open = false;
    }
    if (id == "detailsEP") {
        document.getElementById("detailsE").open = false;
    }
}

//Verifica si un elemento pertenece al formulario (ya ha sido soltado)
function elementoPerteneceAFormulario(elemento) {
    if (elemento.className.indexOf("perteneceFormulario") != -1) {
        return true;
    }
    return false;
}

//Función a realizar de acuerdo al tipo de elemento seleccinado en el formulario
function seleccionar(id) {
    idElementoSeleccionado = id;
    elementoSeleccionado = document.getElementById(id);
    document.getElementById("mensajePropiedadesDefecto").innerHTML = "No hay elemento seleccionado";
    if (elementoSeleccionado != null) {
        deseleccionar();
        elementoSeleccionado.style.boxShadow = "0px 0px 2px 2px rgba(0,180,223,1)";
        tipo = devolverTipoElemento(elementoSeleccionado);
        ocultarPropiedades();
        var elemento = elementoSeleccionado.querySelectorAll('.elemento')[0];
        if (!elementoEsPredefinido(elemento)) {
            var tablaElemento = elemento.querySelectorAll('table')[0];
            var celdaElemento = null;
            var elementoLabel = null;
            var opciones = null;
            var listaOpciones = [];
            document.getElementById("checkPredefinido").checked = false;
            switch (tipo) {
                case "label":
                    mostrarPropiedadesLabel();
                    elementoLabel = elemento.querySelectorAll('label')[0];
                    etiquetaElementoSeleccionado = elementoLabel.innerHTML;
                    numOpcionesElementoSeleccinado = 0;
                    break;
                case "texto":
                    mostrarPropiedadesNoOpciones();
                    celdaElemento = tablaElemento.querySelectorAll('tr')[0].querySelectorAll('td')[1];
                    var input = celdaElemento.querySelectorAll('input')[0];
                    etiquetaElementoSeleccionado = input.placeholder;
                    numOpcionesElementoSeleccinado = 0;
                    break;
                case "area":
                    mostrarPropiedadesNoOpciones();
                    celdaElemento = tablaElemento.querySelectorAll('tr')[0].querySelectorAll('td')[0];
                    var textarea = celdaElemento.querySelectorAll('textarea')[0];
                    etiquetaElementoSeleccionado = textarea.placeholder;
                    numOpcionesElementoSeleccinado = 0;
                    break;
                case "radio":
                    mostrarPropiedadesOpciones();
                    cantidadOpciones("2", "3");
                    elementoLabel = elemento.querySelectorAll('b')[0].querySelectorAll('label')[0];
                    celdaElemento = tablaElemento.querySelectorAll('tr')[0];
                    opciones = celdaElemento.querySelectorAll('td');
                    for (var i = 0; i < opciones.length; i++) {
                        listaOpciones[i] = opciones[i].querySelectorAll('.opcion')[0].innerHTML;
                    }
                    numOpcionesElementoSeleccinado = opciones.length;
                    opcionesElementoSeleccionado = listaOpciones;
                    etiquetaElementoSeleccionado = elementoLabel.innerHTML;
                    break;
                case "checkbox":
                    mostrarPropiedadesOpciones();
                    cantidadOpciones("2", "6");
                    elementoLabel = elemento.querySelectorAll('b')[0].querySelectorAll('label')[0];
                    celdaElemento = tablaElemento.querySelectorAll('tr')[0];
                    opciones = celdaElemento.querySelectorAll('td');
                    for (var i = 0; i < opciones.length; i++) {
                        listaOpciones[i] = opciones[i].querySelectorAll('.opcion')[0].innerHTML;
                    }
                    numOpcionesElementoSeleccinado = opciones.length;
                    celdaElemento = tablaElemento.querySelectorAll('tr')[1];
                    opciones = celdaElemento.querySelectorAll('td');
                    for (var j = 0; j < opciones.length; j++) {
                        listaOpciones[j + i] = opciones[j].querySelectorAll('.opcion')[0].innerHTML;
                    }
                    numOpcionesElementoSeleccinado += opciones.length;
                    opcionesElementoSeleccionado = listaOpciones;
                    etiquetaElementoSeleccionado = elementoLabel.innerHTML;
                    break;
                case "select":
                    mostrarPropiedadesOpciones();
                    cantidadOpciones("2", "10");
                    elementoLabel = elemento.querySelectorAll('b')[0].querySelectorAll('label')[0];
                    opciones = elemento.querySelectorAll('span')[0].querySelectorAll('select')[0].querySelectorAll('option');
                    for (var i = 0; i < opciones.length; i++) {
                        listaOpciones[i] = opciones[i].innerHTML;
                    }
                    numOpcionesElementoSeleccinado = opciones.length;
                    opcionesElementoSeleccionado = listaOpciones;
                    etiquetaElementoSeleccionado = elementoLabel.innerHTML;
                    break;
            }
            document.getElementById("etiquetaPropiedades").value = etiquetaElementoSeleccionado;
            document.getElementById("opcionesPropiedades").value = numOpcionesElementoSeleccinado;
            if (tipo == "radio" || tipo == "checkbox" || tipo == "select") {
                crearOpciones();
            }
        }else{
            document.getElementById("mensajePropiedadesDefecto").innerHTML = "Elemento predefinido.";
        }

    }
}

//Funcion a relizar cuando se deselecciona un elemento del formulario
function deseleccionar() {
    ocultarPropiedades();
    document.getElementById("opcionesPropiedades").value = "";
    document.getElementById("etiquetaPropiedades").value = "";
    var elementos = document.getElementsByClassName('contenedorElemento');
    for (var i = 0; i < elementos.length; i++) {
        elementos[i].style.borderColor = "#C8C6C6";
        elementos[i].style.boxShadow = ""
    }
    document.getElementById("mensajePropiedadesDefecto").innerHTML = "No hay elemento seleccionado";
}

//Actualizar la etiqueta de los elementos predefinidos
function asignarEtiquetaElementoPred() {
    tipo = devolverTipoElemento(elementoSeleccionado);
    var elemento = elementoSeleccionado.querySelectorAll('.elemento')[0];
    var tablaElemento = elemento.querySelectorAll('table')[0];
    var celdaElemento = null;
    var elementoLabel = null;
    var labelElemento = null;
    switch (tipo) {
        case "texto":
            celdaElemento = tablaElemento.querySelectorAll('tr')[0].querySelectorAll('td')[1];
            var input = celdaElemento.querySelectorAll('input')[0];
            labelElemento = input.placeholder;
            break;
        case "area":
            celdaElemento = tablaElemento.querySelectorAll('tr')[0].querySelectorAll('td')[0];
            var textarea = celdaElemento.querySelectorAll('textarea')[0];
            labelElemento = textarea.placeholder;
            break;
        case "radio":
            elementoLabel = elemento.querySelectorAll('b')[0].querySelectorAll('label')[0];
            labelElemento = elementoLabel.innerHTML;
            break;
        case "checkbox":
            elementoLabel = elemento.querySelectorAll('b')[0].querySelectorAll('label')[0];
            labelElemento = elementoLabel.innerHTML;
            break;
        case "select":
            elementoLabel = elemento.querySelectorAll('b')[0].querySelectorAll('label')[0];
            labelElemento = elementoLabel.innerHTML;
            break;
    }
    var id = "elementoP" + (numElementosPredefinidos + 1);
    document.getElementById(id).querySelectorAll('.contenedorIcono')[0].querySelectorAll('label')[0].innerHTML = labelElemento;
}

function actualizarEtiqueta() {
    tipo = devolverTipoElemento(elementoSeleccionado);
    var nuevo = document.getElementById("etiquetaPropiedades").value;
    var elemento = elementoSeleccionado.querySelectorAll('.elemento')[0];
    var tablaElemento = elemento.querySelectorAll('table')[0];
    var celdaElemento = null;
    var elementoLabel = null;
    switch (tipo) {
        case "label":
            elementoLabel = elemento.querySelectorAll('label')[0];
            elementoLabel.innerHTML = nuevo;
            break;
        case "texto":
            celdaElemento = tablaElemento.querySelectorAll('tr')[0].querySelectorAll('td')[1];
            var input = celdaElemento.querySelectorAll('input')[0];
            var inputLabelPregunta = elementoSeleccionado.querySelectorAll('.inputLabelPregunta')[0];
            inputLabelPregunta.value = nuevo;
            input.placeholder = nuevo;
            break;
        case "area":
            celdaElemento = tablaElemento.querySelectorAll('tr')[0].querySelectorAll('td')[0];
            var textarea = celdaElemento.querySelectorAll('textarea')[0];
            var inputLabelPregunta = elementoSeleccionado.querySelectorAll('.inputLabelPregunta')[0];
            inputLabelPregunta.value = nuevo;
            textarea.placeholder = nuevo;
            break;
        case "radio":
            elementoLabel = elemento.querySelectorAll('b')[0].querySelectorAll('label')[0];
            var inputLabelPregunta = elementoSeleccionado.querySelectorAll('.inputLabelPregunta')[0];
            inputLabelPregunta.value = nuevo;
            elementoLabel.innerHTML = nuevo;

            break;
        case "checkbox":
            elementoLabel = elemento.querySelectorAll('b')[0].querySelectorAll('label')[0];
            var inputLabelPregunta = elementoSeleccionado.querySelectorAll('.inputLabelPregunta')[0];
            inputLabelPregunta.value = nuevo;
            elementoLabel.innerHTML = nuevo;
            break;
        case "select":
            elementoLabel = elemento.querySelectorAll('b')[0].querySelectorAll('label')[0];
            var inputLabelPregunta = elementoSeleccionado.querySelectorAll('.inputLabelPregunta')[0];
            inputLabelPregunta.value = nuevo;
            elementoLabel.innerHTML = nuevo;
            break;
    }
}

//Limita el numero de opciones
function cantidadOpciones(min, max) {
    document.getElementById("opcionesPropiedades").min = min;
    document.getElementById("opcionesPropiedades").max = max;
}

//Actualizar las opciones de los elementos del formulario
function actualizarOpciones() {
    tipo = devolverTipoElemento(elementoSeleccionado);
    numOpcionesElementoSeleccinado = document.getElementById("opcionesPropiedades").value;
    var elemento = elementoSeleccionado.querySelectorAll('.elemento')[0];
    var table = null;
    var select = null;
    switch (tipo) {
        case "radio":
            table = elemento.querySelectorAll('table')[0];
            table.innerHTML = "";
            var row = table.insertRow(0);
            for (var i = 0; i < numOpcionesElementoSeleccinado; i++) {
                //contenedor.innerHTML += "<br/>Opcion"+(i+1)+"<input class='inputOpcion' type='text' size='6'/>"
                var celda = row.insertCell(i);
                celda.classList.add('celdaOpcion');
                if (opcionesElementoSeleccionado[i] != null) {
                    celda.innerHTML = "<input type='radio' name='opcion' id='opcionR" + (i + 1) + "'/>" +
                        "<label for='opcionR" + (i + 1) + "' class='labelOpcionR" + (i + 1) + " opcion'>" + opcionesElementoSeleccionado[i] + "</label>";
                } else {
                    celda.innerHTML = "<input type='radio' name='opcion' id='opcionR" + (i + 1) + "'/>" +
                        "<label for='opcionR" + (i + 1) + "' class='labelOpcionR" + (i + 1) + " opcion'>Opción" + (i + 1) + "</label>";
                }
            }
            break;
        case "checkbox":
            table = elemento.querySelectorAll('table')[0];
            table.innerHTML = "";
            var row1, row2;
            if (numOpcionesElementoSeleccinado <= 3) {
                row1 = table.insertRow(0);
                for (var i = 0; i < numOpcionesElementoSeleccinado; i++) {
                    var celda = row1.insertCell(i);
                    celda.classList.add('celdaOpcion');
                    if (opcionesElementoSeleccionado[i] != null) {
                        celda.innerHTML = "<input type='checkbox' name='opcion' id='opcionCB" + (i + 1) + "'/>" +
                            "<label for='opcionCB" + (i + 1) + "' class='labelOpcionCB" + (i + 1) + " opcion'>" + opcionesElementoSeleccionado[i] + "</label>";
                    } else {
                        celda.innerHTML = "<input type='checkbox' name='opcion' id='opcionCB" + (i + 1) + "'/>" +
                            "<label for='opcionCB" + (i + 1) + "' class='labelOpcionCB" + (i + 1) + " opcion'>Opción" + (i + 1) + "</label>";
                    }
                }
            } else {
                row1 = table.insertRow(0);
                for (var i = 0; i < 3; i++) {
                    var celda = row1.insertCell(i);
                    celda.classList.add('celdaOpcion');
                    if (opcionesElementoSeleccionado[i] != null) {
                        celda.innerHTML = "<input type='checkbox' name='opcion' id='opcionCB" + (i + 1) + "'/>" +
                            "<label for='opcionCB" + (i + 1) + "' class='labelOpcionCB" + (i + 1) + " opcion'>" + opcionesElementoSeleccionado[i] + "</label>";
                    } else {
                        celda.innerHTML = "<input type='radio' name='opcion' id='opcionCB" + (i + 1) + "'/>" +
                            "<label for='opcionCB" + (i + 1) + "' class='labelOpcionCB" + (i + 1) + " opcion'>Opción" + (i + 1) + "</label>";
                    }
                }
                row2 = table.insertRow(1);
                for (var i = 3; i < numOpcionesElementoSeleccinado; i++) {
                    var celda = row2.insertCell(i - 3);
                    celda.classList.add('celdaOpcion');
                    if (opcionesElementoSeleccionado[i] != null) {
                        celda.innerHTML = "<input type='checkbox' name='opcion' id='opcionCB" + (i + 1) + "'/>" +
                            "<label for='opcionCB" + (i + 1) + "' class='labelOpcionCB" + (i + 1) + " opcion'>" + opcionesElementoSeleccionado[i] + "</label>";
                    } else {
                        celda.innerHTML = "<input type='radio' name='opcion' id='opcionCB" + (i + 1) + "'/>" +
                            "<label for='opcionCB" + (i + 1) + "' class='labelOpcionCB" + (i + 1) + " opcion'>Opción" + (i + 1) + "</label>";
                    }
                }
            }

            break;
        case "select":
            select = elemento.querySelectorAll('span')[0].querySelectorAll('select')[0];
            select.innerHTML = "";
            for (var i = 0; i < numOpcionesElementoSeleccinado; i++) {
                var option = document.createElement("option");
                option.classList.add('opcionSelect' + (i + 1));
                if (opcionesElementoSeleccionado[i] != null) {
                    option.text = opcionesElementoSeleccionado[i];
                } else {
                    option.text = "Opción" + (i + 1);
                }
                option.value = option.innerHTML;
                select.add(option);
            }
            break;
    }
}

//Actualizar el valor de una opcion de algún elemento del formulario con un posicion determinada
function actualizarOpcionValor(position) {
    var nuevo = document.getElementById("inputOpcion" + (position + 1)).value;
    opcionesElementoSeleccionado[position] = nuevo;
    tipo = devolverTipoElemento(elementoSeleccionado);
    switch (tipo) {
        case "radio":
            document.getElementsByClassName("labelOpcionR" + (position + 1))[1].innerHTML = nuevo + "";
            break;
        case "checkbox":
            document.getElementsByClassName("labelOpcionCB" + (position + 1))[1].innerHTML = nuevo + "";
            break;
        case "select":
            var opcion = document.getElementsByClassName("opcionSelect" + (position + 1))[1];
            if (opcion != null) {
                document.getElementsByClassName("opcionSelect" + (position + 1))[1].innerHTML = nuevo + "";
            } else {
                document.getElementsByClassName("opcionSelect" + (position + 1))[0].innerHTML = nuevo + "";
            }
            break;
    }

}

//Crear el número de opciones (label e input) de acuerdo al numOpcionesElementoSeleccinado en propiedades
function crearOpciones() {
    var table = document.getElementById("tableOpciones");
    table.innerHTML = "";
    numOpcionesElementoSeleccinado = document.getElementById("opcionesPropiedades").value;
    for (var i = 0; i < numOpcionesElementoSeleccinado; i++) {
        //contenedor.innerHTML += "<br/>Opcion"+(i+1)+"<input class='inputOpcion' type='text' size='6'/>"
        var row = table.insertRow(i);
        var celda1 = row.insertCell(0);
        var celda2 = row.insertCell(1);
        celda1.innerHTML = "Opción " + (i + 1) + ": ";
        if (opcionesElementoSeleccionado[i] != null) {
            celda2.innerHTML = "<input type='text' id='inputOpcion" + (i + 1) + "' onblur='actualizarOpcionValor(" + i + ")' size='20' value='" + opcionesElementoSeleccionado[i] + "'/>"
        } else {
            celda2.innerHTML = "<input type='text' id='inputOpcion" + (i + 1) + "' onblur='actualizarOpcionValor(" + i + ")' size='20' value='Opcion" + (i + 1) + "'/>"
        }
    }
    document.getElementById("etiquetaPropiedades").value = etiquetaElementoSeleccionado;
    document.getElementById("opcionesPropiedades").value = numOpcionesElementoSeleccinado;
}

//Agrega un elemento del formulario al panel de elementos como predefinido
function agregarAPredefinidos() {
    numElementosPredefinidos = cantidadElementosPredefinidos();
    elementoPredefinido = elementoSeleccionado.cloneNode(true);
    elementoPredefinido.id = "elementoP" + (numElementosPredefinidos + 1);
    elementoPredefinido.style.width = '90px';
    elementoPredefinido.style.height = '90px';
    elementoPredefinido.style.marginBottom = '0px';
    elementoPredefinido.style.boxShadow = '';
    elementoPredefinido.classList.add("pertenecePanel");
    elementoPredefinido.classList.remove("perteneceFormulario");
    elementoPredefinido.querySelectorAll('.contenedorIcono')[0].style.display = 'block';
    elementoPredefinido.querySelectorAll('.elemento')[0].style.display = 'none';
    elementoPredefinido.querySelectorAll('.elemento')[0].classList.add("nuevoElementoPredefinido");
    elementoPredefinido.querySelectorAll('.capaSuperior')[0].style.display = 'block';
    filaNuevoElementoPred = Math.floor(numElementosPredefinidos / 2);
    var table = document.getElementById("tableElementosPredefinidos");
    var celda = null;
    if (numElementosPredefinidos % 2 != 0) {
        var row = document.getElementById("rowP" + (filaNuevoElementoPred + 1));
        row.innerHTML += "<td>" + elementoPredefinido.outerHTML + "</td>";
    } else {
        var row = table.insertRow(filaNuevoElementoPred);
        row.id = "rowP" + (filaNuevoElementoPred + 1);
        celda = row.insertCell(0);
        celda.innerHTML = elementoPredefinido.outerHTML;
    }
    asignarEtiquetaElementoPred();
    ocultarPropiedades();
}


var informacionUsuarioMostrada = false;
function mostrarOcultarInfoUsuario() {
    if(!informacionUsuarioMostrada){
        $('#userInfo').css('display','block');
        informacionUsuarioMostrada = true;
    }else{
        $('#userInfo').css('display','none');
        informacionUsuarioMostrada = false;
    }
}

function ocultarInfoUsuario() {
    $('#userInfo').css('display','none');
    informacionUsuarioMostrada = false;
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
    if (elementoMovido.parentNode.parentNode.parentNode.parentNode.parentNode != contenedorActual) {
        //elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data"));
        elementoCopiado = elementoMovido.cloneNode(true);
        if(elementoCopiado.id=="area"||elementoCopiado.id=="check"||elementoCopiado.id=="select"||elementoCopiado.id=="radio"||elementoCopiado.id=="texto"){
            elementoCopiado.id = elementoCopiado.id+ "_" + contador;
        }else {
            var aux=elementoCopiado.id.split("_");
            var id=aux[1];
            elementoCopiado.id="p"+"_"+contador+"_"+id;
        }
        elementoCopiado.style.transform = 'scale(1.0)';
        elementoCopiado.style.width = '550px';
        elementoCopiado.style.height = '50px';
        elementoCopiado.style.marginBottom = '10px';
        elementoCopiado.classList.remove("pertenecePanel");
        elementoCopiado.classList.add("perteneceFormulario");
        if (devolverTipoElemento(elementoMovido) == "select") {
            elementoCopiado.style.height = '37px';
        }
        if (devolverTipoElemento(elementoMovido) == "area" || devolverTipoElemento(elementoMovido) == "checkbox") {
            elementoCopiado.style.height = '94px';
        }
        elementoCopiado.querySelectorAll('.contenedorIcono')[0].style.display = 'none';
        elementoCopiado.querySelectorAll('.elemento')[0].style.display = 'block';
        elementoCopiado.querySelectorAll('.capaSuperior')[0].style.display = 'none';
        document.getElementById("contenedorElementosFormulario").appendChild(elementoCopiado);
        $("#" + elementoCopiado.id).fadeOut(0);
        agregarCampos(elementoCopiado);
        contador++;
    }
    e.target.classList.remove('over');
    document.getElementById("mensajeDefecto").style.display = 'none';
    document.getElementById("nuevoForm").style.display = 'block';
    $("#" + elementoCopiado.id).fadeIn(1000);

    seleccionar(elementoCopiado.id);

}

function agregarCampos(elementoCopiado){
    var aux=elementoCopiado.id.split("_");
    var tipo=aux[0];
    var id=aux[2];
    if(tipo==="p"){
        campo = '<input type="hidden" size="20" name="identificadoresDDBB['+contador2+'].id" value="'+id+'"/>';
        $("#"+elementoCopiado.id+"").append(campo);
    }else{
        campo = '<input class="inputLabelPregunta" type="hidden" name="preguntasSinDDBB['+contador2+'].labelPregunta" value="A"/>';
        campo2 = '<input type="hidden" name="preguntasSinDDBB['+contador2+'].tipoPregunta" value="'+tipo+'"/>';
        campo3 = '<input class="inputOpciones" type="hidden" name="preguntasSinDDBB['+contador2+'].opciones" value="A"/>';
        campo4 = '<input class="inputFavorito" type="hidden" name="preguntasSinDDBB['+contador2+'].favorito" value="0"/>';
        $("#"+elementoCopiado.id+"").append(campo);
        $("#"+elementoCopiado.id+"").append(campo2);
        $("#"+elementoCopiado.id+"").append(campo3);
        $("#"+elementoCopiado.id+"").append(campo4);
    }
    campo = '';
    campo2 = '';
    campo3 = '';
    campo4 = '';
    contador2++;
}

//Funcionamiento del drag and drop de la papelera

function leavePapelera(e) {
    document.getElementById("imagenPapelera").src = "images/papelera_close.png";
}

function overPapelera(e) {
    if (e.preventDefault) {
        e.preventDefault();
    }
    if (elementoPerteneceAFormulario(elementoMovido)) {
        document.getElementById("imagenPapelera").src = "images/papelera_open.png";
        e.dataTransfer.dropEffect = 'move';
        var id = e.target.id;
        if (id == 'papelera') {
            return false;
        }
    }
}

function dropPapelera(e) {
    if (elementoPerteneceAFormulario(elementoMovido)) {
        $("#" + elementoMovido.id).fadeOut(600);
        setTimeout(function () {
                document.getElementById("contenedorElementosFormulario").removeChild(elementoMovido); // Elimina el elemento
                if (!hayElementosEnFormulario()) {
                    document.getElementById("mensajeDefecto").style.display = 'block';
                    document.getElementById("nuevoForm").style.display = 'none';
                }
            },
            600);
        document.getElementById("imagenPapelera").src = "images/papelera_close.png";
        ocultarPropiedades();
        deseleccionar();
    }

}


