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
    <link rel="stylesheet" type="text/css" href="./styles/estilos_menu.css">
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_entrevista_enviar"/>>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
</head>
<body>
<main>
    <%@include file="menu.jsp"%>
    <aside  onclick="ocultarInfoUsuario()">
        <h4><sptag:message code="label_candidatos"/></h4><br/>
        <div id="buscarCandidato">
            <input type="text" id="inputBuscar" size="20" placeholder=<sptag:message code="placeholder_buscar_candidatos"/> onchange="buscarCandidato()" onkeyup="this.onchange();" oninput="this.onchange();"/>
        </div>

        <table id="tableCandidatos">
            <a href="javascript:seleccionar_todo()">Marcar todos</a> |
            <a href="javascript:deseleccionar_todo()">Marcar ninguno</a>
            <tr>
                <c:forEach var="candidato" items="${listaCandidatos}" varStatus="loop">
                <td>
                    <div class="videoIntro contenedorElemento pertenecePanel" id="videoIntro_${candidato.idCandidato}"
                         draggable="true" ondragstart="start(event)" ondragend="end(event)">
                        <div class="contenedorIcono">
                            <c:if test="${candidato.sexo=='hombre'}">
                                <img src=<sptag:message code="src_img_user_man"/> class='userIcon' width="40px" height="40px"/>
                            </c:if>
                            <c:if test="${candidato.sexo=='mujer'}">
                                <img src=<sptag:message code="src_img_user_womman"/> class='userIcon' width="40px" height="40px"/>
                            </c:if>
                            <a href="<c:url value="${pageContext.request.contextPath}/recuperarCandidato.do"><c:param name="idCandidato" value="${candidato.idCandidato}"/></c:url>"
                               title="Mostrar datos">
                                <label id="labelDatosCandidato"><c:out value="${candidato.nombre}"/> <c:out value="${candidato.apellidos}"/></label>
                            </a>
                            <a href="<c:url value="${pageContext.request.contextPath}/eliminarCandidato.do">
                              <c:param name="idCandidato" value="${candidato.idCandidato}"/></c:url>">
                                <img src=<sptag:message code="src_img_icon_delete"/> id='delete' width="23px" height="23px" title="Eliminar"/>
                                <form name="f1">
                                    <span class="select-wrapper">
                                        <input type="checkbox" value="${candidato.idCandidato}" name="ch[]" />
                                    </span>
                            </a>
                        </div>
                        <div class="elemento">
                            <c:if test="${candidato.sexo=='hombre'}">
                                <img src=<sptag:message code="src_img_user_man"/> class='userIcon' width="40px" height="40px"/>
                            </c:if>
                            <c:if test="${candidato.sexo=='mujer'}">
                                <img src=<sptag:message code="src_img_user_womman"/> class='userIcon' width="40px" height="40px"/>
                            </c:if>
                            <a href="<c:url value="${pageContext.request.contextPath}/recuperarCandidato.do"><c:param name="idCandidato" value="${candidato.idCandidato}"/></c:url>"
                               title="Mostrar datos">
                                <label id="labelDatosCandidato"><c:out value="${candidato.nombre}"/> <c:out value="${candidato.apellidos}"/></label>
                            </a>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                </c:forEach>
            </tr>
        </table>
        <p><a href="#" id="enviar" />Añadir candidatos</a></p></form>
    </aside>
    <section>
        <div id="cuerpo" onclick="ocultarInfoUsuario()">
            <h3><sptag:message code="label_entrevista"/></h3>
            <table id="tableFormularios">
                <c:set var="contadorFormularios" value="0" scope="page"/>
                <tr>
                    <c:forEach var="entrevista" items="${entrevistas}">
                    <c:set var="contadorEntrevistas" value="${contadorEntrevistas+1}" scope="page"/>
                    <td>
                        <div class="formulario" id="${entrevista.idEntrevista}"
                             onclick="seleccionar(this.className, this.id)" class="botonIndex">
                            <img width="45px" height="45px" src=<sptag:message code="src_fileE"/>/>
                            <label>${entrevista.nombreEntrevista}</label>
                            <a href="<c:url value="${pageContext.request.contextPath}/eliminarEntrevista.do">
                                  <c:param name="idEntrevista" value="${entrevista.idEntrevista}"/></c:url>">
                                <img src=<sptag:message code="src_img_icon_delete"/> id='delete' width="23px" height="23px" title="Eliminar"/>
                            </a>
                        </div>
                    </td>
                    <c:if test="${contadorEntrevistas%3 == 0}">
                </tr>
                <tr>
                    </c:if>
                    </c:forEach>
                </tr>
            </table>
            <div id="contenedor" >
                <div id="estadoContenedor" ondragenter="return enter(event)" ondragover="return over(event)"
                     ondragleave="return leave(event)" ondrop="return drop(event)">
                    Contenedor
                    <div id="nuevoForm">
                        <form:form id="enviarEntrevista" action="/entrevista_enviadaOK.jsp">
                            <button type="submit" class="botonEnviar">Enviar</button>
                            <br/><br/>
                            <hr/>
                            <br/>
                            <div class="label contenedorElemento" id="etiqueta1" draggable="true"
                                 ondragstart="start(event)" ondragend="end(event)"
                                 onclick="seleccionar(this.id)">
                            </div>
                            <br/>
                            <br/>
                            <!--
                            <button id="btnLimpiar" class="botonGuardar btnForm" disabled>Limpiar</button>
                            <button class="botonGuardar btnForm" disabled>Guardar</button>
                            -->
                        </form:form>
                    </div>
                </div>
            </div>

            <div>
                Arrastrar candidatos
            </div>

        </div>
        <%@include file="userInfo.jsp"%>
    </section>

</main>
<script type='text/javascript' src="js/entrevista_enviar.js"></script>
<script type='text/javascript'>
    function seleccionar_todo(){
        for (i=0;i<document.f1.length;i++)
            if(document.f1[i].children[0].type == "checkbox")
                document.f1[i].children[0].checked=1
    }

    function deseleccionar_todo(){
        for (i=0;i<document.f1.length;i++)
            if(document.f1[i].children[0].type == "checkbox")
                document.f1[i].children[0].checked=0
    }

    function buscarCandidato() {
        var valor = document.getElementById("inputBuscar").value;
        $('.filaCandidato').css('display','block');
        if(valor.trim().length>0){
            <c:forEach var="candidato" items="${listaCandidatos}" varStatus="loop">
            if("<c:out value="${candidato.nombre}"/>".toLowerCase().indexOf(valor.toLowerCase())!=-1 ||
                "<c:out value="${candidato.apellidos}"/>".toLowerCase().indexOf(valor.toLowerCase())!=-1 ){
                document.getElementById("${loop.index}").style.display = 'block';
            }else{
                document.getElementById("${loop.index}").style.display = 'none';
            }
            </c:forEach>
        }else{

        }
    }

    $(document).ready(function() {
        $('#enviar').click(function(){
            var selected = '';
            var che = jQuery(':checked');
            $(che).each(function(){
                if (this.checked) {
                    selected += $(this).val();
                }
            });

            if (selected != '')
                alert('Has seleccionado: '+selected);
            else
                alert('Debes seleccionar al menos una opción.');

            return false;
        });
    });
</script>

</body>
</html>
