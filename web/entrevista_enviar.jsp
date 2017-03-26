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
            <c:forEach var="candidato" items="${listaCandidatos}" varStatus="loop">
                <tr id="${loop.index}" class="filaCandidato">
                    <div draggable="true" ondragstart="start(event)" ondragend="end(event)"
                         onclick="seleccionar(this.id)" height="100px">
                        <td>
                            <c:if test="${candidato.sexo=='hombre'}">
                                <img src=<sptag:message code="src_img_user_man"/> class='userIcon' width="40px" height="40px"/>
                            </c:if>
                            <c:if test="${candidato.sexo=='mujer'}">
                                <img src=<sptag:message code="src_img_user_womman"/> class='userIcon' width="40px" height="40px"/>
                            </c:if>
                        </td>
                        <td>
                            <a href="<c:url value="${pageContext.request.contextPath}/recuperarCandidato.do"><c:param name="idCandidato" value="${candidato.idCandidato}"/></c:url>"
                               title="Mostrar datos">
                                <label id="labelDatosCandidato"><c:out value="${candidato.nombre}"/> <c:out value="${candidato.apellidos}"/></label>
                            </a>
                        </td>
                            <%-- http://stackoverflow.com/questions/2906582/how-to-create-an-html-button-that-acts-like-a-link--%>
                        <td>
                            <a href="<c:url value="${pageContext.request.contextPath}/eliminarCandidato.do">
                                  <c:param name="idCandidato" value="${candidato.idCandidato}"/></c:url>">
                                <img src=<sptag:message code="src_img_icon_delete"/> id='delete' width="23px" height="23px" title="Eliminar"/>
                            </a>
                        </td>
                    </div>
                </tr>
            </c:forEach>
        </table>
    </aside>
    <section>
        <div id="cuerpo" onclick="ocultarInfoUsuario()">
            <h3><sptag:message code="label_entrevista"/></h3>
            <table id="tableFormularios">
                <c:set var="contadorFormularios" value="0" scope="page"/>
                <tr>
                    <c:forEach var="entrevista" items="${listaEntrevistas}">
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
            <div id="contenedor" ondragenter="return enter(event)" ondragover="return over(event)"
                 ondragleave="return leave(event)" ondrop="return drop(event)">
                <div id="estadoContenedor">
                    <div id="nuevoForm">
                        <form:form id="nuevoFormulario"
                                   action="${pageContext.request.contextPath}/crearFormulario.do" method="GET"
                                   modelAttribute="preguntaForm">
                            <input type="text" name="nombreFormulario" class="nombreFormulario" placeholder=
                                <sptag:message code="placeholder_nombre_formulario"/> size="35"/>
                            <button type="submit" class="botonGuardar"><sptag:message
                                    code="button_guardar"/></button>
                            <br/><br/>
                            <hr/>
                            <br/>
                            <div class="label contenedorElemento" id="etiqueta1" draggable="true"
                                 ondragstart="start(event)" ondragend="end(event)"
                                 onclick="seleccionar(this.id)">
                                <div class="elemento elementoPequenio elementoLabel">
                                    <b><label id="etiquetaLabel"><sptag:message
                                            code="label_formulario_title"/></label></b>
                                </div>
                            </div>
                            <br/>
                            <div id="contenedorElementosFormulario">
                                <c:forEach var="pregunta" items="${listaPreguntas}">
                                    <c:set var="count" value="${count + 1}" scope="page"/>
                                    <c:if test="${pregunta.tipoPregunta == 'text'}">


                                        <div class="texto contenedorElemento pertenecePanel"
                                             id="p_${pregunta.idPregunta}"
                                             draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                             onclick="seleccionar(this.id)">
                                            <div class="contenedorIcono">
                                                <img src="images/icon_text.png" width="55px" height="55px"><br/>
                                                <label>${pregunta.labelPregunta}</label>
                                            </div>
                                            <div class="elemento elementoPredefinido">
                                                <table class="tableElementoText">
                                                    <tr>
                                                        <td class="celda">
                                                            <img src="images/user.png" width="30px"
                                                                 height="30px">
                                                        </td>
                                                        <td class="celda">
                                                            <input type="text"
                                                                   placeholder="${pregunta.labelPregunta}"
                                                                   size="22"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="capaSuperior"></div>
                                        </div>

                                    </c:if>
                                    <c:if test="${pregunta.tipoPregunta == 'radio'}">
                                        <c:set var="opcionesComas" value="${pregunta.opciones}"/>
                                        <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>

                                        <div class="radio contenedorElemento pertenecePanel"
                                             id="p_${pregunta.idPregunta}"
                                             draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                             onclick="seleccionar(this.id)">
                                            <div class="contenedorIcono">
                                                <img src="images/icon_radio.png" width="55px"
                                                     height="55px"><br/>
                                                <label>${pregunta.labelPregunta}</label>
                                            </div>
                                            <div class="elemento elementoPredefinido">
                                                <b><label>${pregunta.labelPregunta}</label>:</b><br/>
                                                <c:forEach var="opcion" items="${opciones}">
                                                    <input type="radio">
                                                    <label class="opcion">${opcion}</label>
                                                </c:forEach>
                                            </div>
                                            <div class="capaSuperior"></div>
                                        </div>

                                    </c:if>
                                    <c:if test="${pregunta.tipoPregunta == 'checkbox'}">
                                        <c:set var="opcionesComas" value="${pregunta.opciones}"/>
                                        <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>


                                        <div class="checkbox contenedorElemento pertenecePanel"
                                             id="p_${pregunta.idPregunta}"
                                             draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                             onclick="seleccionar(this.id)">
                                            <div class="contenedorIcono">
                                                <img src=
                                                         <sptag:message
                                                                 code="src_img_icon_checkbox"/> width="55px"
                                                     height="55px"><br/>
                                                <label>${pregunta.labelPregunta}</label>
                                            </div>
                                            <div class="elemento elementoGrande elementoPredefinido">
                                                <b><label>${pregunta.labelPregunta}</label>:</b><br/>
                                                <table>
                                                    <c:set var="count2" value="0" scope="page"/>
                                                    <c:set var="countCierre2" value="0" scope="page"/>
                                                    <c:forEach var="opcion" items="${opciones}">
                                                        <c:if test="${count == 0}">
                                                            <c:set var="countCierre2" value="1" scope="page"/>
                                                            <tr>
                                                        </c:if>
                                                        <td class="celdaOpcion">
                                                            <input type="checkbox">
                                                            <label class="labelOpcionCB1 opcion">${opcion}"</label>
                                                        </td>
                                                        <c:if test="${count == 3}">
                                                            </tr>
                                                            <c:set var="count2" value="0" scope="page"/>
                                                            <c:set var="countCierre2" value="0" scope="page"/>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${countCierre == 1}">
                                                        </tr>
                                                        <c:set var="countCierre" value="0" scope="page"/>
                                                    </c:if>
                                                </table>
                                            </div>
                                            <div class="capaSuperior"></div>
                                        </div>

                                    </c:if>
                                    <c:if test="${pregunta.tipoPregunta == 'area'}">

                                        <div class="area contenedorElemento pertenecePanel"
                                             id="p_${pregunta.idPregunta}"
                                             draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                             onclick="seleccionar(this.id)">
                                            <div class="contenedorIcono">
                                                <img src=
                                                         <sptag:message
                                                                 code="src_img_icon_textarea"/> width="55px"
                                                     height="55px"><br/>
                                                <label>${pregunta.labelPregunta}</label>
                                            </div>
                                            <div class="elemento elementoGrande elementoPredefinido">
                                                <table class="tableElementoText">
                                                    <tr>
                                                        <td>
                                                                <textarea rows="5" cols="50"
                                                                          placeholder=${pregunta.labelPregunta}> </textarea>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="capaSuperior"></div>
                                        </div>

                                    </c:if>
                                    <c:if test="${pregunta.tipoPregunta == 'select'}">
                                        <c:set var="opcionesComas" value="${pregunta.opciones}"/>
                                        <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                        <div class="select contenedorElemento pertenecePanel"
                                             id="p_${pregunta.idPregunta}"
                                             draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                             onclick="seleccionar(this.id)">
                                            <div class="contenedorIcono">
                                                <img src=
                                                         <sptag:message
                                                                 code="src_img_icon_select"/> width="55px"
                                                     height="55px"><br/>
                                                <label>${pregunta.labelPregunta}</label>
                                            </div>
                                            <div class="elemento elementoPequenio elementoPredefinido">
                                                <b><label class="labelLinea">${pregunta.labelPregunta}</label>:</b>
                                                <span class="select-wrapper">
                                                        <select>
                                                            <c:forEach var="opcion" items="${opciones}">
                                                                <option>${opcion}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </span>
                                            </div>
                                            <div class="capaSuperior"></div>
                                        </div>
                                    </c:if>
                                </c:forEach>


                            </div>

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
<script type='text/javascript' src="js/candidato.js"></script>

<script>
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
</script>

</body>
</html>
