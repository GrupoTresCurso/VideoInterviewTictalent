<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sptag" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title><sptag:message code="app_title"/></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="styles/estilos_entrevista_nueva.css">
    <link href="https://fonts.googleapis.com/css?family=Arvo" rel="stylesheet">
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
</head>
<body>
<header></header>
<nav>
    <table id="tableMenu">
        <tr>
            <td><a href="principal.html" class="linkMenu"><sptag:message code="menu_opc1"/></a></td>
            <td><a href="candidato.html" class="linkMenu"><sptag:message code="menu_opc2"/></a></td>
            <td><a href="formulario.html" class="linkMenu"><sptag:message code="menu_opc3"/></a></td>
            <td><a href="entrevista_index.jsp" class="linkMenu"><sptag:message code="menu_opc4"/></a></td>
            <td><a href="video.html" class="linkMenu"><sptag:message code="menu_opc5"/></a></td>
        </tr>
    </table>
</nav>
<aside>
    <details>
        <summary>Videos introductorios</summary>
        <table>
            <c:forEach var="videoIntroductorio" items="${videosIntroductorios}">
                <tr>
                    <td>
                        <div draggable="true" class="entrevista" id="videoIntro" ondragstart="start(event)"
                             ondragend="end(event)" onclick="seleccionar(this.className, this.id)">
                            <div class="contenedorIcono">
                                <img src="images/movie.png" width="45px" height="45px"/>
                                <p>${videoIntroductorio.nombreVideo}</p>
                                <p>${videoIntroductorio.idVideo}</p>
                            </div>
                            <div id="elementoVideoIntro" class="elemento">
                                <img src="images/movie.png" width="45px" height="45px"/>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </details>
    <details>
        <summary>Formularios</summary>
        <table>
            <c:forEach var="formulario" items="${formularios}">
                <tr>
                    <td>
                        <div draggable="true" class="entrevista" id="formulario" ondragstart="start(event)"
                             ondragend="end(event)" onclick="seleccionar(this.className, this.id)">
                            <div class="contenedorIcono">
                                <img src="images/form.png" width="45px" height="45px"/>
                                <p>${formulario.nombreFormulario}</p>
                                <p>${formulario.idFormulario}</p>
                            </div>
                            <div id="elementoFormulario" class="elemento">
                                <img src="images/form.png" width="45px" height="45px"/>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </details>
    <details>
        <summary>Preguntas tipo vídeo</summary>
        <table>
            <c:forEach var="videoPregunta" items="${videosPreguntas}">
                <tr>
                    <td>
                        <div draggable="true" class="entrevista" id="videoPregunta" ondragstart="start(event)"
                             ondragend="end(event)" onclick="seleccionar(this.className, this.id)">
                            <div class="contenedorIcono">
                                <img src="images/webcam.png" width="45px" height="45px"/>
                                <p>${videoPregunta.nombreVideo}</p>
                            </div>
                            <div id="elementoVideoPregunta" class="elemento">
                                <img src="images/webcam.png" width="45px" height="45px"/>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </details>
    <details>
        <summary>Videos transición</summary>
        <table>
            <c:forEach var="videoTransicion" items="${videosTransiciones}">
                <tr>
                    <td>
                        <div draggable="true" class="entrevista" id="videoTransicion" ondragstart="start(event)"
                             ondragend="end(event)" onclick="seleccionar(this.className, this.id)">
                            <div class="contenedorIcono">
                                <img src="images/movie.png" width="45px" height="45px"/>
                                <p>${videoTransicion.nombreVideo}</p>
                            </div>
                            <div id="elementoVideoTransicion" class="elemento">
                                <img src="images/movie.png" width="45px" height="45px"/>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </details>
    <details>
        <summary>Candidatos</summary>
        <table>
            <c:forEach var="candidato" items="${candidatos}">
                <tr>
                    <td>
                        <div draggable="true" class="entrevista" id="candidatos" ondragstart="start(event)"
                             ondragend="end(event)" onclick="seleccionar(this.className, this.id)">
                            <div class="contenedorIcono">
                                <img src="images/user.png" width="45px" height="45px"/>
                                <p>${candidato.nombre}</p>
                            </div>
                            <div id="elementoCandidato" class="elemento">
                                <img src="images/user.png" width="45px" height="45px"/>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </details>
</aside>

<table>
    <tr>
        <td id="medio">
            <section>
                <div id="superior">
                    <div id="guia">
                    </div>
                </div>
                <form id="crearEntrevista">
                    <div id="contenedorEntrevista" ondragenter="return enter(event)" ondragover="return over(event)"
                         ondragleave="return leave(event)" ondrop="return drop(event)">
                    </div>
                    <input type="submit" value="Crear Entrevista" class="botonGuardar"/>
                </form>
            </section>
        </td>
        <td>
            <div id="eliminar" onclick="deseleccionar()">
                Arrastrar y soltar en la papelera para eliminar elementos<br/>
                <!--<img src="images/flecha.png" width="50px" height="50px">-->
                <div id="papelera" ondragenter="return enter(event)" ondragover="return overPapelera(event)"
                     ondragleave="return leavePapelera(event)" ondrop="return dropPapelera(event)">
                    <img id="imagenPapelera" src="images/papelera_close.png" width="180px" height="180px">
                </div>
            </div>
        </td>
    </tr>
</table>


</main>

<script>
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
            elementoCopiado.id = "elemento" + contador;
            elementoCopiado.style.transform = 'scale(1.0)';
            elementoCopiado.style.width = '420px';
            elementoCopiado.style.height = '51px';
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
            var tr = document.getElementById("guia");
            tr.appendChild(elementoGuia);


            //e.target.appendChild();
            /*contenedorGuia.innerHTML = "<img src='images/movie.png' width='40px' height='40px'/> " +
             "<p>Video Intro 1</p>";*/

            agregarCampos();
            contador++;
        }
        e.target.classList.remove('over');

    }

    function agregarCampos(){
        nextinput++;
        campo = '<input type="text" size="20" id="campo' + nextinput + '"&nbsp; name="campo' + nextinput + '"&nbsp; />';
        $("#crearEntrevista").append(campo);
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

</script>

</body>
</html>
