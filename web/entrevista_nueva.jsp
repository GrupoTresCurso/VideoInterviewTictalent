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
    <meta charset="UTF-8">
    <title><sptag:message code="app_title"/></title>
    <link rel="stylesheet" type="text/css" href="./styles/estilos_menu.css">
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_entrevista_nueva"/>>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
</head>
<body>
<main>
    <%@include file="menu.jsp" %>
    <section onclick="ocultarInfoUsuario()">
        <table>
            <tr>
                <td id="izquierda">
                    <div id="panelElementosPrincipal">
                        <div id="panelElementos">
                            <details id="detailsVI">
                                <summary id="summaryVI">
                                    <b class="colorTictum"><sptag:message code="label_videos_intro"/></b>
                                </summary>
                                <table>
                                    <c:forEach var="videoIntroductorio" items="${videosIntroductorios}">
                                        <tr>
                                            <td>
                                                <div class="video contenedorElemento pertenecePanel" id="video_${videoIntroductorio.idVideo}"
                                                     draggable="true" ondragstart="start(event)" ondragend="end(event)">
                                                    <div class="contenedorIcono">
                                                        <img src="images/icon_video.png" width="55px" height="55px"/>
                                                        <label>${videoIntroductorio.nombreVideo}</label>
                                                    </div>
                                                    <div class="elementoEntrevista">
                                                        <div class="delimitadorElementoEntrevista">
                                                            <div class="elementoVideo">
                                                                <img src="images/icon_video.png" width="150px" height="150px"/><br/>
                                                                <label>${videoIntroductorio.nombreVideo}</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="capaSuperior"></div>
                                                </div>
                                            </td>
                                        </tr>
                                     </c:forEach>
                                </table>
                            </details>
                            <details id="detailsF">
                                <summary id="summaryF">
                                    <b class="colorTictum"><sptag:message code="label_formulario"/></b>
                                </summary>
                                 <table>
                                    <c:forEach var="formulario" items="${formularios}">
                                        <tr>
                                            <td>
                                                <div class="formulario contenedorElemento pertenecePanel" id="form_${formulario.idFormulario}"
                                                     draggable="true" ondragstart="start(event)" ondragend="end(event)">
                                                    <div class="contenedorIcono">
                                                        <table>
                                                            <tr>
                                                                <td><img src="images/icon_formulario.png" width="40px" height="40px"/></td>
                                                                <td class="labelIcono"><label>${formulario.nombreFormulario}</label></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="elementoEntrevista">
                                                        <div class="delimitadorElementoEntrevista">
                                                            <c:set var="countPreguntas" value="0" scope="page"/>
                                                            <h3 class="colorTictum">${formulario.nombreFormulario}</h3>
                                                            <br/>
                                                            <c:forEach var="preguntaFormulario" items="${formulario.preguntas}">
                                                                <c:set var="countPreguntas" value="${countPreguntas + 1}" scope="page"/>
                                                                <c:if test="${preguntaFormulario.tipoPregunta == 'text'}">
                                                                    <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                                        <div class="elemento">
                                                                            <table class="tableElementoText">
                                                                                <tr>
                                                                                    <td class="celda">
                                                                                        <img src="images/user.png" width="30px" height="30px">
                                                                                    </td>
                                                                                    <td class="celda">
                                                                                        <input type="text" placeholder="${preguntaFormulario.labelPregunta}" size="22"/>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${preguntaFormulario.tipoPregunta == 'area'}">
                                                                    <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                                        <div class="elemento">
                                                                            <table class="tableElementoText">
                                                                                <tr>
                                                                                    <td>
                                                                                        <textarea rows="5" cols="50" placeholder="${preguntaFormulario.labelPregunta}"></textarea>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${preguntaFormulario.tipoPregunta == 'radio'}">
                                                                    <c:set var="opcionesComas" value="${preguntaFormulario.opciones}"/>
                                                                    <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                                                    <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                                        <div class="elemento">
                                                                            <b><label>${preguntaFormulario.labelPregunta}</label></b><br/>
                                                                            <c:forEach var="opcion" items="${opciones}">
                                                                                <input type="radio">
                                                                                <label class="opcion">${opcion}</label>
                                                                            </c:forEach>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${preguntaFormulario.tipoPregunta == 'checkbox'}">
                                                                    <c:set var="opcionesComas" value="${preguntaFormulario.opciones}"/>
                                                                    <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                                                    <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                                        <div class="elemento">
                                                                            <b><label>${preguntaFormulario.labelPregunta}</label></b><br/>
                                                                            <table>
                                                                                <c:set var="count3" value="0" scope="page"/>
                                                                                <c:set var="countCierre3" value="0" scope="page"/>
                                                                                <c:forEach var="opcion" items="${opciones}">
                                                                                    <c:if test="${count3 == 0}">
                                                                                        <c:set var="countCierre3" value="1" scope="page"/>
                                                                                        <tr>
                                                                                    </c:if>
                                                                                    <c:set var="count3" value="${count3 + 1}" scope="page"/>
                                                                                    <td class="celdaOpcion">
                                                                                        <input type="checkbox">
                                                                                        <label class="labelOpcionCB1 opcion">${opcion}"</label>
                                                                                    </td>
                                                                                    <c:if test="${count3 == 3}">
                                                                                        </tr>
                                                                                        <c:set var="count3" value="0" scope="page"/>
                                                                                        <c:set var="countCierre3" value="0" scope="page"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <c:if test="${countCierre3 == 1}">
                                                                                    </tr>
                                                                                    <c:set var="countCierre3" value="0" scope="page"/>
                                                                                </c:if>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${preguntaFormulario.tipoPregunta == 'select'}">
                                                                    <c:set var="opcionesComas" value="${preguntaFormulario.opciones}"/>
                                                                    <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                                                    <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                                        <div class="elemento">
                                                                            <b><label class="labelLinea">${preguntaFormulario.labelPregunta}</label></b>
                                                                            <span class="select-wrapper">
                                                                            <select>
                                                                                <c:forEach var="opcion" items="${opciones}">
                                                                                    <option>${opcion}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </span>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${preguntaFormulario.tipoPregunta == 'file'}">
                                                                    <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                                        <div class="elemento">
                                                                            <b><label>${preguntaFormulario.labelPregunta}</label></b><br/>
                                                                            <input type="file" name="etiqueta" id="addfile"/>
                                                                            <label for="addfile" >
                                                                                <div >
                                                                                    <img src="images/icon_upload.png" width="60px" height="60px"><br/>
                                                                                    <label>Arrastrar y soltar archivo</label><br/>
                                                                                    <label>o seleccionar archivo</label>
                                                                                </div>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <div class="capaSuperior"></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                 </table>
                            </details>
                            <details id="detailsVP">
                                <summary id="summaryVP">
                                    <b class="colorTictum"><sptag:message code="label_pregunta_video"/></b>
                                </summary>
                                <table>
                                    <c:forEach var="videoPregunta" items="${videosPreguntas}">
                                        <tr>
                                            <td>
                                                <div class="video contenedorElemento pertenecePanel" id="video_${videoPregunta.idVideo}"
                                                     draggable="true"ondragstart="start(event)" ondragend="end(event)">
                                                    <div class="contenedorIcono">
                                                        <img src="images/icon_video.png" width="55px" height="55px"/>
                                                        <label>${videoPregunta.nombreVideo}</label>
                                                    </div>
                                                    <div class="elementoEntrevista">
                                                        <div class="delimitadorElementoEntrevista">
                                                            <div class="elementoVideo">
                                                                <img src="images/icon_video.png" width="150px" height="150px"/><br/>
                                                                <label>${videoPregunta.nombreVideo}</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="capaSuperior"></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </details>
                            <details id="detailsVT">
                                <summary id="summaryVT">
                                    <b class="colorTictum"><sptag:message code="label_video_transicion"/></b>
                                </summary>
                                <table>
                                    <c:forEach var="videoTransicion" items="${videosTransiciones}">
                                        <tr>
                                            <td>
                                                <div class="video contenedorElemento pertenecePanel"  id="video_${videoTransicion.idVideo}"
                                                      draggable="true"ondragstart="start(event)" ondragend="end(event)">
                                                    <div class="contenedorIcono">
                                                        <img src="images/icon_video.png" width="55px" height="55px"/>
                                                        <label>${videoTransicion.nombreVideo}</label>
                                                    </div>
                                                    <div class="elementoEntrevista">
                                                        <div class="delimitadorElementoEntrevista">
                                                            <div class="elementoVideo">
                                                                <img src="images/icon_video.png" width="150px" height="150px"/><br/>
                                                                <label>${videoTransicion.nombreVideo}</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="capaSuperior"></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </details>
                        </div>
                    </div>

                </td>
                <td id="medio">
                    <div id="superior">
                        <div id="guia">
                            <table id="tableGuia">
                                <tr>
                                    <td class="seccionEntrevista" id="guiaVI" onclick="mostrarSeccion(this.id)">
                                       <img src="images/icon_video_introductorio.png" height="45px" width="45px" title="Video introductorio"/>
                                    </td>
                                    <td class="seccionEntrevista" id="guiaFP" onclick="mostrarSeccion(this.id)">
                                        <img src="images/icon_formulario.png" height="45px" width="45px" title="Preguntas entrevista"/>
                                    </td>
                                    <td class="seccionEntrevista" id="guiaVT" onclick="mostrarSeccion(this.id)">
                                        <img src="images/icon_video_transicion.png" height="45px" width="45px" title="Video transicion"/>
                                    </td>
                                    <td class="seccionEntrevista" id="guiaVP" onclick="mostrarSeccion(this.id)">
                                        <img src="images/icon_video_pregunta.png" height="45px" width="45px" title="Video preguntas"/>
                                    </td>
                                    <td class="seccionEntrevista" id="guiaFS" onclick="mostrarSeccion(this.id)">
                                        <img src="images/icon_formulario_satisfaccion.png" height="45px" width="45px" title="Cuestionario satisfacción"/>
                                    </td>
                                    <td class="seccionEntrevista" id="guiaFA" onclick="mostrarSeccion(this.id)">
                                        <img src="images/icon_formulario_adjunto.png" height="45px" width="45px" title="Adjuntos"/>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="contenedorEntrevista" ondragenter="return enter(event)" ondragover="return over(event)"
                         ondragleave="return leave(event)" ondrop="return drop(event)">
            <!-------------------------------------------------------------------------------------------------->
            <!-------------------------------------------------------------------------------------------------->
            <form:form id="nuevaEntrevista"
            action="${pageContext.request.contextPath}/crearEntrevista.do" method="GET">
						<c:set var="entrevistaCargada" value="0" scope="page"/>
                        <c:set var="countElements" value="0" scope="page"/>
                        <c:if test="${entrevista != null}">
                            <h2>HOLA ${entrevista.nombreEntrevista}</h2>
                            <c:set var="entrevistaCargada" value="1" scope="page"/>
                            <input type="hidden" size="20" name="idEntrevista" value="${entrevista.idEntrevista}"/>
                        </c:if>
                        <c:if test="${entrevista == null}">
                            <h2>HOLA NUEVO</h2>
                        </c:if>
                        <!-------------------------------SECCION VIDEO INTRODUCTORIO--------------------------------------------------->
                        <div id="estadoContenedorVI" class="estadoContenedor">
                            <div id="mensajeDefectoVI" class="mensajeDefecto">
                                <h4 class="colorTictum"><sptag:message code="label_contenedor_entrevista_title"/></h4><br/><br/>
                                <p class="mensajeNoHayElementos">
                                    Arrastrar y soltar video introductorio.<br/>
                                    (Máximo 1)
                                </p>
                            </div>
                            <div id="contenedorElementosEntrevistaVI" class="contenedorElementosEntrevista">
                                <c:if test="${entrevista != null}">
                                    <c:set var="countElements" value="${countElements + 1}" scope="page"/>
                                    <div class="video contenedorElemento perteneceEntrevista elementoCargado"
                                         id="video_${countElements}__${entrevista.videos[0].idVideo}"
                                         draggable="true" ondragstart="start(event)" ondragend="end(event)">
                                        <div class="contenedorIcono">
                                            <table>
                                                <tr>
                                                    <td><img src="images/icon_video.png" width="40px" height="40px"/></td>
                                                    <td class="labelIcono"><label>${entrevista.videos[0].nombreVideo}</label></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="elementoEntrevista">
                                            <div class="delimitadorElementoEntrevista">
                                            <!-----------CONTENIDO DEL ELEMENTO VIDEO---------------->
                                                <div class="elementoVideo">
                                                    <img src="images/icon_video.png" width="150px" height="150px"/><br/>
                                                    <label>${entrevista.videos[0].nombreVideo}</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="capaSuperior"></div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <!------------------------------------------------------------------------------------------------------------->
                        <!-------------------------------SECCION FORM PREGUNTAS-------------------------------------------------------->
                        <div id="estadoContenedorFP" class="estadoContenedor">
                            <div id="mensajeDefectoFP" class="mensajeDefecto">
                                <h4 class="colorTictum"><sptag:message code="label_contenedor_entrevista_title"/></h4><br/><br/>
                                <p class="mensajeNoHayElementos">
                                    Arrastrar y soltar formulario de preguntas.<br/>
                                    (Máximo 1)
                                </p>
                            </div>
                            <div id="contenedorElementosEntrevistaFP" class="contenedorElementosEntrevista">
                                <c:if test="${entrevista != null}">
                                    <c:set var="countElements" value="${countElements + 1}" scope="page"/>
                                    <div class="formulario contenedorElemento perteneceEntrevista elementoCargado"
                                         id="form_${countElements}_${entrevista.formularios[0].idFormulario}"
                                         draggable="true" ondragstart="start(event)" ondragend="end(event)">
                                        <div class="contenedorIcono">
                                            <table>
                                                <tr>
                                                    <td><img src="images/icon_formulario.png" width="40px" height="40px"/></td>
                                                    <td class="labelIcono"><label>${entrevista.formularios[0].nombreFormulario}</label></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="elementoEntrevista">
                                            <div class="delimitadorElementoEntrevista">
                                                <c:set var="countPreguntas" value="0" scope="page"/>
                                                <h3 class="colorTictum">${entrevista.formularios[0].nombreFormulario}</h3>
                                                <br/>
                                                <c:forEach var="preguntaFormulario" items="${entrevista.formularios[0].preguntas}">
                                                    <c:set var="countPreguntas" value="${countPreguntas + 1}" scope="page"/>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'text'}">
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <table class="tableElementoText">
                                                                    <tr>
                                                                        <td class="celda">
                                                                            <img src="images/user.png" width="30px" height="30px">
                                                                        </td>
                                                                        <td class="celda">
                                                                            <input type="text" placeholder="${preguntaFormulario.labelPregunta}" size="22"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'area'}">
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <table class="tableElementoText">
                                                                    <tr>
                                                                        <td>
                                                                            <textarea rows="5" cols="50" placeholder="${preguntaFormulario.labelPregunta}"></textarea>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'radio'}">
                                                        <c:set var="opcionesComas" value="${preguntaFormulario.opciones}"/>
                                                        <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <b><label>${preguntaFormulario.labelPregunta}</label></b><br/>
                                                                <c:forEach var="opcion" items="${opciones}">
                                                                    <input type="radio">
                                                                    <label class="opcion">${opcion}</label>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'checkbox'}">
                                                        <c:set var="opcionesComas" value="${preguntaFormulario.opciones}"/>
                                                        <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <b><label>${preguntaFormulario.labelPregunta}</label></b><br/>
                                                                <table>
                                                                    <c:set var="count3" value="0" scope="page"/>
                                                                    <c:set var="countCierre3" value="0" scope="page"/>
                                                                    <c:forEach var="opcion" items="${opciones}">
                                                                        <c:if test="${count3 == 0}">
                                                                            <c:set var="countCierre3" value="1" scope="page"/>
                                                                            <tr>
                                                                        </c:if>
                                                                        <c:set var="count3" value="${count3 + 1}" scope="page"/>
                                                                        <td class="celdaOpcion">
                                                                            <input type="checkbox">
                                                                            <label class="labelOpcionCB1 opcion">${opcion}"</label>
                                                                        </td>
                                                                        <c:if test="${count3 == 3}">
                                                                            </tr>
                                                                            <c:set var="count3" value="0" scope="page"/>
                                                                            <c:set var="countCierre3" value="0" scope="page"/>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:if test="${countCierre3 == 1}">
                                                                        </tr>
                                                                        <c:set var="countCierre3" value="0" scope="page"/>
                                                                    </c:if>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'select'}">
                                                        <c:set var="opcionesComas" value="${preguntaFormulario.opciones}"/>
                                                        <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <b><label class="labelLinea">${preguntaFormulario.labelPregunta}</label></b>
                                                                <span class="select-wrapper">
                                                                            <select>
                                                                                <c:forEach var="opcion" items="${opciones}">
                                                                                    <option>${opcion}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </span>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'file'}">
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <b><label>${preguntaFormulario.labelPregunta}</label></b><br/>
                                                                <input type="file" name="etiqueta" id="addfile_${preguntaFormulario.idPregunta}"/>
                                                                <label for="addfile_${preguntaFormulario.idPregunta}" >
                                                                    <div >
                                                                        <img src="images/icon_upload.png" width="60px" height="60px"><br/>
                                                                        <label>Arrastrar y soltar archivo</label><br/>
                                                                        <label>o seleccionar archivo</label>
                                                                    </div>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="capaSuperior"></div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <!------------------------------------------------------------------------------------------------------------->
                        <!-----------------------------------SECCION VIDEO TRANSICION-------------------------------------------------->
                        <div id="estadoContenedorVT" class="estadoContenedor">
                            <div id="mensajeDefectoVT"  class="mensajeDefecto">
                                <h4 class="colorTictum"><sptag:message code="label_contenedor_entrevista_title"/></h4><br/><br/>
                                <p class="mensajeNoHayElementos">
                                    Arrastrar y soltar video de transición.<br/>
                                    (Máximo 1)
                                </p>
                            </div>
                            <div id="contenedorElementosEntrevistaVT" class="contenedorElementosEntrevista">
                                <c:if test="${entrevista != null}">
                                    <c:set var="countElements" value="${countElements + 1}" scope="page"/>
                                    <div class="video contenedorElemento perteneceEntrevista elementoCargado"
                                         id="video_${countElements}_${entrevista.videos[1].idVideo}"
                                         draggable="true" ondragstart="start(event)" ondragend="end(event)">
                                        <div class="contenedorIcono">
                                            <table>
                                                <tr>
                                                    <td><img src="images/icon_video.png" width="40px" height="40px"/></td>
                                                    <td class="labelIcono"><label>${entrevista.videos[1].nombreVideo}</label></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="elementoEntrevista">
                                            <div class="delimitadorElementoEntrevista">
                                                <!-----------CONTENIDO DEL ELEMENTO VIDEO---------------->
                                                <div class="elementoVideo">
                                                    <img src="images/icon_video.png" width="150px" height="150px"/><br/>
                                                    <label>${entrevista.videos[1].nombreVideo}</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="capaSuperior"></div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <!------------------------------------------------------------------------------------------------------------->
                        <!--------------------------------------SECCCION VIDEO PREGUNTAS----------------------------------------------->
                        <div id="estadoContenedorVP" class="estadoContenedor">
                            <div id="mensajeDefectoVP" class="mensajeDefecto">
                                <h4 class="colorTictum"><sptag:message code="label_contenedor_entrevista_title"/></h4><br/><br/>
                                <p class="mensajeNoHayElementos">
                                    Arrastrar y soltar videos de preguntas.<br/>
                                    (Máximo 5)
                                </p>
                            </div>
                            <div id="contenedorElementosEntrevistaVP" class="contenedorElementosEntrevista">
                                <c:if test="${entrevista != null}">
                                    <c:forEach var="videoPreguntaEntrevista" items="${entrevista.videos}" begin="2" end="${fn:length(entrevista.videos)-1}">
                                        <c:set var="countElements" value="${countElements + 1}" scope="page"/>
                                        <div class="video contenedorElemento perteneceEntrevista elementoCargado"
                                             id="video_${countElements}_${videoPreguntaEntrevista.idVideo}"
                                             draggable="true" ondragstart="start(event)" ondragend="end(event)">
                                            <div class="contenedorIcono">
                                                <table>
                                                    <tr>
                                                        <td><img src="images/icon_video.png" width="40px" height="40px"/></td>
                                                        <td class="labelIcono"><label>${videoPreguntaEntrevista.nombreVideo}</label></td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="elementoEntrevista">
                                                <div class="delimitadorElementoEntrevista">
                                                    <!-----------CONTENIDO DEL ELEMENTO VIDEO---------------->
                                                    <div class="elementoVideo">
                                                        <img src="images/icon_video.png" width="150px" height="150px"/><br/>
                                                        <label>${videoPreguntaEntrevista.nombreVideo}</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="capaSuperior"></div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                        <!------------------------------------------------------------------------------------------------------------->
                        <!------------------------------------SECCION CUESTIONARIO SATISFACCION---------------------------------------->
                        <div id="estadoContenedorFS" class="estadoContenedor">
                            <div id="mensajeDefectoFS" class="mensajeDefecto">
                                <h4 class="colorTictum"><sptag:message code="label_contenedor_entrevista_title"/></h4><br/><br/>
                                <p class="mensajeNoHayElementos">
                                    Arrastrar y soltar formulario de satisfacción.<br/>
                                    (Máximo 1)
                                </p>
                            </div>
                            <div id="contenedorElementosEntrevistaFS" class="contenedorElementosEntrevista">
                                <c:if test="${entrevista != null}">
                                    <c:set var="countElements" value="${countElements + 1}" scope="page"/>
                                    <div class="formulario contenedorElemento perteneceEntrevista elementoCargado"
                                         id="form_${countElements}_${entrevista.cuestionarioSatisfaccion.idFormulario}"
                                         draggable="true" ondragstart="start(event)" ondragend="end(event)">
                                        <div class="contenedorIcono">
                                            <table>
                                                <tr>
                                                    <td><img src="images/icon_formulario.png" width="40px" height="40px"/></td>
                                                    <td class="labelIcono"><label>${entrevista.cuestionarioSatisfaccion.nombreFormulario}</label></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="elementoEntrevista">
                                            <div class="delimitadorElementoEntrevista">
                                                <c:set var="countPreguntas" value="0" scope="page"/>
                                                <h3 class="colorTictum">${entrevista.cuestionarioSatisfaccion.nombreFormulario}</h3>
                                                <br/>
                                                <c:forEach var="preguntaFormulario" items="${entrevista.cuestionarioSatisfaccion.preguntas}">
                                                    <c:set var="countPreguntas" value="${countPreguntas + 1}" scope="page"/>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'text'}">
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <table class="tableElementoText">
                                                                    <tr>
                                                                        <td class="celda">
                                                                            <img src="images/user.png" width="30px" height="30px">
                                                                        </td>
                                                                        <td class="celda">
                                                                            <input type="text" placeholder="${preguntaFormulario.labelPregunta}" size="22"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'area'}">
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <table class="tableElementoText">
                                                                    <tr>
                                                                        <td>
                                                                            <textarea rows="5" cols="50" placeholder="${preguntaFormulario.labelPregunta}"></textarea>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'radio'}">
                                                        <c:set var="opcionesComas" value="${preguntaFormulario.opciones}"/>
                                                        <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <b><label>${preguntaFormulario.labelPregunta}</label></b><br/>
                                                                <c:forEach var="opcion" items="${opciones}">
                                                                    <input type="radio">
                                                                    <label class="opcion">${opcion}</label>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'checkbox'}">
                                                        <c:set var="opcionesComas" value="${preguntaFormulario.opciones}"/>
                                                        <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <b><label>${preguntaFormulario.labelPregunta}</label></b><br/>
                                                                <table>
                                                                    <c:set var="count3" value="0" scope="page"/>
                                                                    <c:set var="countCierre3" value="0" scope="page"/>
                                                                    <c:forEach var="opcion" items="${opciones}">
                                                                        <c:if test="${count3 == 0}">
                                                                            <c:set var="countCierre3" value="1" scope="page"/>
                                                                            <tr>
                                                                        </c:if>
                                                                        <c:set var="count3" value="${count3 + 1}" scope="page"/>
                                                                        <td class="celdaOpcion">
                                                                            <input type="checkbox">
                                                                            <label class="labelOpcionCB1 opcion">${opcion}"</label>
                                                                        </td>
                                                                        <c:if test="${count3 == 3}">
                                                                            </tr>
                                                                            <c:set var="count3" value="0" scope="page"/>
                                                                            <c:set var="countCierre3" value="0" scope="page"/>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:if test="${countCierre3 == 1}">
                                                                        </tr>
                                                                        <c:set var="countCierre3" value="0" scope="page"/>
                                                                    </c:if>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'select'}">
                                                        <c:set var="opcionesComas" value="${preguntaFormulario.opciones}"/>
                                                        <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <b><label class="labelLinea">${preguntaFormulario.labelPregunta}</label></b>
                                                                <span class="select-wrapper">
                                                                            <select>
                                                                                <c:forEach var="opcion" items="${opciones}">
                                                                                    <option>${opcion}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </span>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'file'}">
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <b><label>${preguntaFormulario.labelPregunta}</label></b><br/>
                                                                <input type="file" name="etiqueta" id="addfile_${preguntaFormulario.idPregunta}"/>
                                                                <label for="addfile_${preguntaFormulario.idPregunta}" >
                                                                    <div >
                                                                        <img src="images/icon_upload.png" width="60px" height="60px"><br/>
                                                                        <label>Arrastrar y soltar archivo</label><br/>
                                                                        <label>o seleccionar archivo</label>
                                                                    </div>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="capaSuperior"></div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <!------------------------------------------------------------------------------------------------------------->
                        <!--------------------------------------SECCION FORM ADJUNTOS-------------------------------------------------->
                        <div id="estadoContenedorFA" class="estadoContenedor">
                            <div id="mensajeDefectoFA" class="mensajeDefecto">
                                <h4 class="colorTictum"><sptag:message code="label_contenedor_entrevista_title"/></h4><br/><br/>
                                <p class="mensajeNoHayElementos">
                                    Arrastrar y soltar formulario de adjuntos.<br/>
                                    (Máximo 1)
                                </p>
                            </div>
                            <div id="contenedorElementosEntrevistaFA" class="contenedorElementosEntrevista">
                                <c:if test="${entrevista != null}">
                                    <c:set var="countElements" value="${countElements + 1}" scope="page"/>
                                    <div class="formulario contenedorElemento perteneceEntrevista elementoCargado"
                                         id="form_${countElements}_${entrevista.formularios[entrevista.formularios.size()-1].idFormulario}"
                                         draggable="true" ondragstart="start(event)" ondragend="end(event)">
                                        <div class="contenedorIcono">
                                            <table>
                                                <tr>
                                                    <td><img src="images/icon_formulario.png" width="40px" height="40px"/></td>
                                                    <td class="labelIcono"><label>${entrevista.formularios[entrevista.formularios.size()-1].nombreFormulario}</label></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="elementoEntrevista">
                                            <div class="delimitadorElementoEntrevista">
                                                <c:set var="countPreguntas" value="0" scope="page"/>
                                                <h3 class="colorTictum">${entrevista.formularios[entrevista.formularios.size()-1].nombreFormulario}</h3>
                                                <br/>
                                                <c:forEach var="preguntaFormulario" items="${entrevista.formularios[entrevista.formularios.size()-1].preguntas}">
                                                    <c:set var="countPreguntas" value="${countPreguntas + 1}" scope="page"/>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'text'}">
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <table class="tableElementoText">
                                                                    <tr>
                                                                        <td class="celda">
                                                                            <img src="images/user.png" width="30px" height="30px">
                                                                        </td>
                                                                        <td class="celda">
                                                                            <input type="text" placeholder="${preguntaFormulario.labelPregunta}" size="22"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'area'}">
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <table class="tableElementoText">
                                                                    <tr>
                                                                        <td>
                                                                            <textarea rows="5" cols="50" placeholder="${preguntaFormulario.labelPregunta}"></textarea>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'radio'}">
                                                        <c:set var="opcionesComas" value="${preguntaFormulario.opciones}"/>
                                                        <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <b><label>${preguntaFormulario.labelPregunta}</label></b><br/>
                                                                <c:forEach var="opcion" items="${opciones}">
                                                                    <input type="radio">
                                                                    <label class="opcion">${opcion}</label>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'checkbox'}">
                                                        <c:set var="opcionesComas" value="${preguntaFormulario.opciones}"/>
                                                        <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <b><label>${preguntaFormulario.labelPregunta}</label></b><br/>
                                                                <table>
                                                                    <c:set var="count3" value="0" scope="page"/>
                                                                    <c:set var="countCierre3" value="0" scope="page"/>
                                                                    <c:forEach var="opcion" items="${opciones}">
                                                                        <c:if test="${count3 == 0}">
                                                                            <c:set var="countCierre3" value="1" scope="page"/>
                                                                            <tr>
                                                                        </c:if>
                                                                        <c:set var="count3" value="${count3 + 1}" scope="page"/>
                                                                        <td class="celdaOpcion">
                                                                            <input type="checkbox">
                                                                            <label class="labelOpcionCB1 opcion">${opcion}"</label>
                                                                        </td>
                                                                        <c:if test="${count3 == 3}">
                                                                            </tr>
                                                                            <c:set var="count3" value="0" scope="page"/>
                                                                            <c:set var="countCierre3" value="0" scope="page"/>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:if test="${countCierre3 == 1}">
                                                                        </tr>
                                                                        <c:set var="countCierre3" value="0" scope="page"/>
                                                                    </c:if>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'select'}">
                                                        <c:set var="opcionesComas" value="${preguntaFormulario.opciones}"/>
                                                        <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <b><label class="labelLinea">${preguntaFormulario.labelPregunta}</label></b>
                                                                <span class="select-wrapper">
                                                                            <select>
                                                                                <c:forEach var="opcion" items="${opciones}">
                                                                                    <option>${opcion}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </span>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${preguntaFormulario.tipoPregunta == 'file'}">
                                                        <div id="p_${countPreguntas}_${preguntaFormulario.idPregunta}">
                                                            <div class="elemento">
                                                                <b><label>${preguntaFormulario.labelPregunta}</label></b><br/>
                                                                <input type="file" name="etiqueta" id="addfile_${preguntaFormulario.idPregunta}"/>
                                                                <label for="addfile_${preguntaFormulario.idPregunta}" >
                                                                    <div >
                                                                        <img src="images/icon_upload.png" width="60px" height="60px"><br/>
                                                                        <label>Arrastrar y soltar archivo</label><br/>
                                                                        <label>o seleccionar archivo</label>
                                                                    </div>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="capaSuperior"></div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <!------------------------------------------------------------------------------------------------------------->
						<input type="hidden" size="20" id="entrevistaCargada" value="${entrevistaCargada}"/>
					</div>
                </td>
                <td id="derecha">
                    <h5 class="colorTictum"><sptag:message code="label_opciones_entrevista"/></h5>
                    <div id="propiedades">
                        <br/>
                        <div id="contenedorOpciones">
                            <div class="elementoForm">
                                <c:if test="${entrevista.nombreEntrevista == null}">
                                    <input type="text" name="nombreEntrevista" class="nombreEntrevista" placeholder="Nombre de la entrevista"/></br>
                                </c:if>
                                <c:if test="${entrevista.nombreEntrevista != null}">
                                    <input type="text" name="nombreEntrevista" class="nombreEntrevista" value="${entrevista.nombreEntrevista}" placeholder="Nombre de la entrevista" size="35"/></br>
                                </c:if>
                            </div>
                            <div class="elementoForm">
                                <c:if test="${entrevista.nombrePuesto == null}">
                                    <input type="text" name="nombrePuesto" class="nombrePuesto" placeholder="Nombre del puesto"/></br>
                                </c:if>
                                <c:if test="${entrevista.nombrePuesto != null}">
                                    <input type="text" name="nombrePuesto" class="nombrePuesto" value="${entrevista.nombrePuesto}" placeholder="Nombre del puesto" size="35"/></br>
                                </c:if>
                            </div>
                            <div class="elementoForm">
                                <c:if test="${entrevista.mensaje == null}">
                                    <input type="text" name="mensaje" class="mensaje" placeholder="Mensaje final"/></br>
                                </c:if>
                                <c:if test="${entrevista.mensaje != null}">
                                    <input type="text" name="mensaje" class="mensaje" value="${entrevista.mensaje}" placeholder="Mensaje final" size="35"/></br>
                                </c:if>
                            </div>
                            <div class="elementoForm">
                                <c:if test="${entrevista.tieneVideoIntro}">
                                    <input type="checkbox" id="videoIntroBoolean" name="tieneVideoIntro" class="tieneVideoIntro" onchange="activarVideoIntroductorio()" checked/>
                                    ¿Tiene Vídeo introductorio?</br>
                                </c:if>
                                <c:if test="${not entrevista.tieneVideoIntro}">
                                    <input type="checkbox" id="videoIntroBoolean" name="tieneVideoIntro" class="tieneVideoIntro" onchange="activarVideoIntroductorio()"/>
                                    ¿Tiene Vídeo introductorio?</br>
                                </c:if>
                            </div>
                        </div>
                        <br/>
                        <button type="submit" class="botonGuardar"><sptag:message code="button_guardar"/></button>
                    </div>
            </form:form>
            <!-------------------------------------------------------------------------------------------------->
            <!-------------------------------------------------------------------------------------------------->
                    <div id="eliminar">
                        <p><sptag:message code="label_papelera_message2"/></p><br/>
                        <div id="papelera" ondragenter="return enter(event)" ondragover="return overPapelera(event)"
                             ondragleave="return leavePapelera(event)" ondrop="return dropPapelera(event)">
                            <img id="imagenPapelera" src=
                            <sptag:message code="src_img_papelera_close"/> width="150px" height="150px"
                                 draggable="false">
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        </section>
        <%@include file="userInfo.jsp" %>
    </section>
</main>
<script type='text/javascript' src="js/entrevista_nueva.js"></script>
</body>
</html>

