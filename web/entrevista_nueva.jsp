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
                            <details id="detailsVI" onclick="seleccionarTipoElementos(this.id)">
                                <summary id="summaryVI">
                                    <b class="colorTictum"><sptag:message code="label_videos_intro"/></b>
                                </summary>
                                <table>
                                    <c:set var="contadorVideosIntroductorio" value="0" scope="page"/>
                                    <tr>
                                        <c:forEach var="videoIntroductorio" items="${videosIntroductorios}">
                                            <c:set var="contadorVideosIntroductorio" value="${contadorVideosIntroductorio+1}" scope="page"/>
                                            <td>
                                                <div class="videoIntro contenedorElemento pertenecePanel" id="videoIntro_${videosIntroductorios.idVideo}"
                                                     draggable="true" ondragstart="start(event)" ondragend="end(event)">
                                                    <div class="contenedorIcono">
                                                        <img src="images/icon_video.png" width="55px" height="55px"/>
                                                        <label>${videoIntroductorio.nombreVideo}</label>
                                                    </div>
                                                    <div class="elementoEntrevista">
                                                        <img src="images/icon_video.png" width="55px" height="55px"/>
                                                    </div>
                                                </div>
                                            </td>
                                            <c:if test="${contadorVideosIntroductorio%2 == 0}">
                                                </tr>
                                                <tr>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                </table>
                            </details>
                            <details id="detailsF" onclick="seleccionarTipoElementos(this.id)">
                                <summary id="summaryF">
                                    <b class="colorTictum"><sptag:message code="label_formulario"/></b>
                                </summary>
                                 <table>
                                    <c:forEach var="formulario" items="${formularios}">
                                        <tr>
                                            <td>
                                                <div class="formulario contenedorElemento pertenecePanel" id="formulario_${formulario.idFormulario}"
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
                                                            <form:form class="formulario">
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
                                                                                            <textarea rows="5" cols="50" placeholder="${preguntaFormulario.labelPregunta}"> </textarea>
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
                                                            </form:form>
                                                        </div>
                                                    </div>
                                                    <div class="capaSuperior"></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                 </table>
                            </details>
                            <details id="detailsVP" onclick="seleccionarTipoElementos(this.id)">
                                <summary id="summaryVP">
                                    <b class="colorTictum"><sptag:message code="label_pregunta_video"/></b>
                                </summary>
                                <table>
                                    <c:set var="contadorVideosPregunta" value="0" scope="page"/>
                                    <tr>
                                        <c:forEach var="videoPregunta" items="${videosPreguntas}">
                                            <c:set var="contadorVideosPregunta" value="${contadorVideosPregunta+1}" scope="page"/>
                                            <td>
                                                <div class="videoPregunta contenedorElemento pertenecePanel" id="video_${videoPregunta.idVideo}"
                                                     draggable="true"ondragstart="start(event)" ondragend="end(event)">
                                                    <div class="contenedorIcono">
                                                        <img src="images/icon_video.png" width="55px" height="55px"/>
                                                        <label>${videoPregunta.nombreVideo}</label>
                                                    </div>
                                                    <div class="elementoEntrevista">
                                                        <img src="images/icon_video.png" width="55px" height="55px"/>
                                                    </div>
                                                </div>
                                            </td>
                                            <c:if test="${contadorVideosPregunta%2 == 0}">
                                                </tr>
                                                <tr>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                </table>
                            </details>
                            <details id="detailsVT" onclick="seleccionarTipoElementos(this.id)">
                                <summary id="summaryVT">
                                    <b class="colorTictum"><sptag:message code="label_video_transicion"/></b>
                                </summary>
                                <table>
                                    <c:set var="contadorVideosTransicion" value="0" scope="page"/>
                                    <tr>
                                        <c:forEach var="videoTransicion" items="${videosTransiciones}">
                                            <c:set var="contadorVideosTransicion" value="${contadorVideosTransicion+1}" scope="page"/>
                                            <td>
                                                <div class="videoTransicion contenedorElemento pertenecePanel"  id="video_${videoTransicion.idVideo}"
                                                      draggable="true"ondragstart="start(event)" ondragend="end(event)">
                                                    <div class="col${count} contenedorIcono">
                                                        <img src="images/icon_video.png" width="55px" height="55px"/>
                                                        <label>${videoTransicion.nombreVideo}</label>
                                                    </div>
                                                    <div class="elementoEntrevista">
                                                        <img src="images/icon_video.png" width="55px" height="55px"/>
                                                    </div>
                                                </div>
                                            </td>
                                            <c:if test="${contadorVideosPregunta%2 == 0}">
                                                </tr>
                                                <tr>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                </table>
                            </details>
                        </div>
                    </div>

                </td>
                <td id="medio">
                    <div id="superior">
                        <div id="guia">
                        </div>
                    </div>
                    <div id="contenedorEntrevista" ondragenter="return enter(event)" ondragover="return over(event)"
                         ondragleave="return leave(event)" ondrop="return drop(event)">
                        <div id="estadoContenedor">
                            <div id="mensajeDefecto">
                                <h4 class="colorTictum"><sptag:message code="label_contenedor_entrevista_title"/></h4><br/><br/>
                                <p id="mensajeNoHayElementos">No hay elementos</p>
                            </div>
                            <div id="contenedorElementosEntrevista">

                            </div>
                        </div>
                    </div>
                </td>
                <td id="derecha">
                    <h5 class="colorTictum"><sptag:message code="label_opciones_entrevista"/></h5>
                    <div id="propiedades">
                        <br/>
                        <div id="contenedorOpciones">
                            <div class="elementoForm elementoPequenio elementoLabel">
                                <input type="text" id="nombreEntrevista" placeholder="Nombre de la entrevista"/></br>
                            </div>
                            <div class="elementoForm elementoPequenio elementoLabel">
                                <input type="text" id="nombrePuesto" placeholder="Nombre del puesto"/></br>
                            </div>
                            <div class="elementoForm elementoPequenio elementoLabel">
                                <input type="text" id="mensajeFinal" placeholder="Mensaje final"/></br>
                            </div>
                            <div class="elementoForm elementoPequenio elementoLabel">
                                <input type="checkbox" name="videoIntroBoolean" value="Video Introductorio"/>¿Tiene Vídeo introductorio?</br>
                            </div>
                        </div>
                        <br/>
                        <button type="submit" class="botonGuardar"><sptag:message code="button_guardar"/></button>
                    </div>
                    <div id="eliminar">
                        <p><sptag:message code="label_papelera_message"/></p><br/>
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

