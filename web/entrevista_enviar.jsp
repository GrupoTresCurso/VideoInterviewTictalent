<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sptag" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
    <title><sptag:message code="app_title"/></title>
    <link rel="stylesheet" type="text/css" href="./styles/estilos_menu.css">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./styles/estilos_entrevista_enviar.css"/>
</head>
<body>
<main>
    <%@include file="menu.jsp" %>
    <input type="hidden" value="Entrevista" id="enlaceActivo"/>

    <section onclick="ocultarInfoUsuario()">
        <table>
            <tr>
                <td id="izquierda">
                    <div id="panelElementosPrincipal">
                        <div id="panelElementos">
                            <h4><sptag:message code="label_candidatos"/></h4><br/>
                            <div id="buscarCandidato">
                                <input type="text" id="inputBuscar" size="20" placeholder=
                                <sptag:message code="placeholder_buscar_candidatos"/> onchange="buscarCandidato()"
                                       onkeyup="this.onchange();" oninput="this.onchange();"/>
                            </div>
                            <div id="listaCandidatos">
                                <table id="tableCandidatos">
                                    <a href="javascript:seleccionar_todo()">Todos</a> |
                                    <a href="javascript:deseleccionar_todo()"><img src=
                                                                                   <sptag:message
                                                                                           code="src_img_icon_delete"/> width="23px"
                                                                                   height="23px"/></a>
                                    <form name="f1">
                                    <tr>
                                        <c:forEach var="candidato" items="${listaCandidatos}" varStatus="loop">
                                        <td>
                                            <div class="contenedorElemento"
                                                 id="candidatoID_${candidato.idCandidato}"
                                                 draggable="true" ondragstart="start(event)" ondragend="end(event)">
                                                <div class="contenedorIcono" id="${loop.index}">
                                                    <c:if test="${candidato.sexo=='hombre'}">
                                                        <img src=
                                                                 <sptag:message
                                                                         code="src_img_user_man"/> class='userIcon'
                                                             width="40px" height="40px"/>
                                                    </c:if>
                                                    <c:if test="${candidato.sexo=='mujer'}">
                                                        <img src=
                                                                 <sptag:message
                                                                         code="src_img_user_womman"/> class='userIcon'
                                                             width="40px" height="40px"/>
                                                    </c:if>
                                                    <a href="<c:url value="${pageContext.request.contextPath}/recuperarCandidato.do"><c:param name="idCandidato" value="${candidato.idCandidato}"/></c:url>"
                                                       title="Mostrar datos">
                                                        <label id="labelDatosCandidato"><c:out
                                                                value="${candidato.nombre}"/> <c:out
                                                                value="${candidato.apellidos}"/></label>
                                                    </a>
                                                        <!--<img src=<sptag:message code="src_img_icon_delete"/> id='delete' width="23px" height="23px" title="Eliminar"/>-->
                                                    <span>
                                                        <input type="checkbox" value="${candidato.idCandidato}"
                                                               name="ch[]"/>
                                                    </span>
                                                </div>
                                                <div class="contenedorElemento elementoNoMostrar">
                                                    <c:if test="${candidato.sexo=='hombre'}">
                                                        <img src=
                                                                 <sptag:message
                                                                         code="src_img_user_man"/> class='userIcon'
                                                             width="40px" height="40px"/>
                                                    </c:if>
                                                    <c:if test="${candidato.sexo=='mujer'}">
                                                        <img src=
                                                                 <sptag:message
                                                                         code="src_img_user_womman"/> class='userIcon'
                                                             width="40px" height="40px"/>
                                                    </c:if>
                                                    <a href="<c:url value="${pageContext.request.contextPath}/recuperarCandidato.do"><c:param name="idCandidato" value="${candidato.idCandidato}"/></c:url>"
                                                       title="Mostrar datos">
                                                        <label id="labelDatosCandidatoElemento"><c:out
                                                                value="${candidato.nombre}"/> <c:out
                                                                value="${candidato.apellidos}"/></label>
                                                    </a>
                                                    <button id="botonEliminar" onclick="eliminarCandidatoLista(this)">
                                                        <img id='delete' width="23px" height="23px" src=<sptag:message code="src_img_icon_delete"/> />
                                                    </button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        </c:forEach>

                                            <p><a href="#" id="enviar" />Añadir candidatos</a></p>
                                            </form>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </td>
                <td id="medio">
                    <div id="superior">
                        <div id="guia">
                            <h4 class="colorTictum"><sptag:message code="label_entrevista"/></h4><br/><br/>
                            <table id="tableFormularios">
                                <c:set var="contadorFormularios" value="0" scope="page"/>
                                <tr>
                                    <c:forEach var="entrevista" items="${entrevistas}">
                                    <c:set var="contadorEntrevistas" value="${contadorEntrevistas+1}" scope="page"/>
                                    <td>
                                        <div class="entrevista" id="entrevistaID${entrevista.idEntrevista}"
                                             onclick="seleccionar(this.className, this.id)" class="botonIndex">
                                            <img width="45px" height="45px" src=<sptag:message code="src_fileE"/>/>
                                            <label>${entrevista.nombreEntrevista}</label>
                                        </div>
                                    </td>
                                    <c:if test="${contadorEntrevistas%3 == 0}">
                                </tr>
                                <tr>
                                    </c:if>
                                    </c:forEach>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="contenedor"  ondragenter="return enter(event)" ondragover="return over(event)"
                         ondragleave="return leave(event)" ondrop="return drop(event)">
                        <input class="botonGuardar" value="Enviar" name="submit" type="button" onclick="window.location.href = 'entrevista_enviadaOK.jsp';"/>
                    </div>
                </td>
            </tr>
        </table>
        <%@include file="userInfo.jsp" %>
    </section>
</main>
<script type='text/javascript' src="js/entrevista_enviar.js"></script>
<script type="text/javascript">
    function seleccionar_todo() {
        for (i = 0; i < document.f1.length; i++)
            if (document.f1[i].type == "checkbox")
                document.f1[i].checked = 1
    }

    function deseleccionar_todo() {
        for (i = 0; i < document.f1.length; i++)
            if (document.f1[i].type == "checkbox")
                document.f1[i].checked = 0
    }

    function buscarCandidato() {
        var valor = document.getElementById("inputBuscar").value;
        $('.filaCandidato').css('display', 'block');
        if (valor.trim().length > 0) {
            <c:forEach var="candidato" items="${listaCandidatos}" varStatus="loop">
            if ("<c:out value="${candidato.nombre}"/>".toLowerCase().indexOf(valor.toLowerCase()) != -1 ||
                "<c:out value="${candidato.apellidos}"/>".toLowerCase().indexOf(valor.toLowerCase()) != -1) {
                document.getElementById("${loop.index}").style.display = 'block';
            } else {
                document.getElementById("${loop.index}").style.display = 'none';
            }
            </c:forEach>
        } else {

        }
    }
    function eliminarCandidatoLista(t) {
        t.parentNode.remove();
    }

    $(document).ready(function () {
        $('#enviar').click(function () {
            var selected = [];
            var che = jQuery(':checked');
            $(che).each(function () {
                if (this.checked) {
                    selected.push($(this).val());
                }
            });
            for (i = 0; i < selected.length; i++){
                var e = $('#candidatoID_[i]');
                var clonado = e.cloneNode(true);
                $('#contenedor').append(clonado);
            }

            if (selected != '')
                alert('Has seleccionado: ' + selected);
            else
                alert('Debes seleccionar al menos una opción.');

            return false;
        });
    });

    function seleccionar(clase, id) {
        cambiarFondo(clase, id);
    }
    function cambiarFondo(clase, id) {
        var entrevistas = document.getElementsByClassName(clase);
        for (var i = 0; i < entrevistas.length; i++) {
            entrevistas[i].style.backgroundColor = "white";
        }
        document.getElementById(id).style.backgroundColor = "#C0C0C0";
    }



</script>

</body>
</html>