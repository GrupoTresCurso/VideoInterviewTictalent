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
                                                    <div class="elemento">
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
                                    <c:forEach var="formulario" items="${formularios}">
                                        <div class="formulario contenedorElemento pertenecePanel" id="formulario_${formulario.idFormulario}"
                                             draggable="true" ondragstart="start(event)" ondragend="end(event)">
                                            <div class="contenedorIcono">
                                                <table>
                                                    <tr>
                                                        <td><img src="images/icon_formulario.png" width="55px" height="55px"/></td>
                                                        <td class="labelIcono"><label>${formulario.nombreFormulario}</label></td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="elemento">
                                                <!--   -->
                                            </div>
                                        </div>
                                    </c:forEach>
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
                                                    <div class="elemento">
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
                                                    <div class="elemento">
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
                        <form id="crearEntrevista" action="${pageContext.request.contextPath}/crearEntrevista.do" method="GET">

                            <div class="elemento">

                            </div></br>
                            <button type="submit" form="crearEntrevista" value="Crear Entrevista"
                                    class="botonGuardar"><sptag:message code="button_guardar"/>
                            </button>
                    </form>
                    </div>
                </td>
                <td id="derecha">
                    <div id="propiedades">

                        <div id="contenedorEtiqueta">
                            <table>
                                <tr>
                                    <td><p>Opciones de la entrevista</p></td>
                                </tr>
                            </table>
                        </div>
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

