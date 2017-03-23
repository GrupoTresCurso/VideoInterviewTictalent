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
    <link rel="stylesheet" type="text/css" href="styles/estilos_entrevista_nueva.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
                        <div id="panelElementos" onclick="deseleccionar()">
                            <details id="detailsVI" onclick="seleccionarTipoElementos(this.id)">
                                <summary id="summaryVI"><b class="colorTictum"><sptag:message
                                        code="label_videos_intro"/></b></summary>
                                <c:set var="count" value="0"/>
                                <c:forEach var="videoIntroductorio" items="${videosIntroductorios}" step="1" begin="0">
                                    <c:if test="${count==4}">
                                        <c:set var="count" value="0"/>
                                    </c:if>
                                    <div class="col${count}">
                                        <a href="#">${videoIntroductorio.nombreVideo}</a>
                                    </div>
                                    <c:set var="count" value="${count+1}"/>
                                </c:forEach>

                            </details>
                            <details id="detailsF" onclick="seleccionarTipoElementos(this.id)">
                                <summary id="summaryF"><b class="colorTictum"><sptag:message
                                        code="label_formulario"/></b></summary>
                                <table>
                                    <c:forEach var="formulario" items="${formularios}">
                                        <tr>
                                            <td>
                                                <div draggable="true" id="formulario_${formulario.idFormulario}"
                                                     ondragstart="start(event)"
                                                     ondragend="end(event)"
                                                     onclick="seleccionar(this.className, this.id)">
                                                    <div class="contenedorIcono">
                                                        <img src="images/form.png" width="45px" height="45px"/>
                                                        <p>${formulario.nombreFormulario}</p>
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
                            <details id="detailsVP" onclick="seleccionarTipoElementos(this.id)">
                                <summary id="summaryVP"><b class="colorTictum"><sptag:message
                                        code="label_pregunta_video"/></b></summary>
                                <table>
                                    <c:forEach var="videoPregunta" items="${videosPreguntas}">
                                        <tr>
                                            <td>
                                                <div draggable="true" id="video_${videoPregunta.idVideo}"
                                                     ondragstart="start(event)"
                                                     ondragend="end(event)"
                                                     onclick="seleccionar(this.className, this.id)">
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
                            <details id="detailsVT" onclick="seleccionarTipoElementos(this.id)">
                                <summary id="summaryVT"><b class="colorTictum"><sptag:message
                                        code="label_video_transicion"/></b></summary>
                                <table>
                                    <c:forEach var="videoTransicion" items="${videosTransiciones}">
                                        <tr>
                                            <td>
                                                <div draggable="true" id="video_${videoTransicion.idVideo}"
                                                     ondragstart="start(event)"
                                                     ondragend="end(event)"
                                                     onclick="seleccionar(this.className, this.id)">
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
                            <details id="detailsC" onclick="seleccionarTipoElementos(this.id)">
                                <summary id="summaryC"><b class="colorTictum"><sptag:message
                                        code="label_candidatos"/></b></summary>
                                <table>
                                    <c:forEach var="candidato" items="${candidatos}">
                                        <tr>
                                            <td>
                                                <div draggable="true" id="candidato_${candidato.idCandidato}"
                                                     ondragstart="start(event)"
                                                     ondragend="end(event)"
                                                     onclick="seleccionar(this.className, this.id)">
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
                        </div>
                    </div>

                </td>
                <td id="medio">
                    <div id="superior">
                        <div id="guia">
                        </div>
                    </div>
                    <div id="contenedor" ondragenter="return enter(event)" ondragover="return over(event)"
                         ondragleave="return leave(event)" ondrop="return drop(event)">
                        <form id="crearEntrevista" action="${pageContext.request.contextPath}/crearEntrevista.do" method="GET">

                            <div class="elemento elementoPequenio elementoLabel">
                                <input type="text" id="nombreEntrevista" placeholder="Nombre de la entrevista"/></br>
                            </div>
                            <div class="elemento elementoPequenio elementoLabel">
                                <input type="text" id="nombrePuesto" placeholder="Nombre del puesto"/></br>
                            </div>
                            <div class="elemento elementoPequenio elementoLabel">
                                <input type="text" id="mensajeFinal" placeholder="Mensaje final"/></br>
                            </div>
                            <div class="elemento elementoPequenio elementoLabel">
                                <input type="checkbox" name="videoIntroBoolean" value="Video Introductorio"/></br>
                            </div>
                            <div class="elemento">

                            </div></br>
                            <button type="submit" form="crearEntrevista" value="Crear Entrevista"
                                    class="botonGuardar"><sptag:message code="button_guardar"/>
                            </button>
                    </form>
                    </div>
                </td>
                <td id="derecha">
                    <div id="eliminar" onclick="deseleccionar()">
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
        <%@include file="userInfo.jsp" %>
    </section>
</main>
<script type='text/javascript' src="js/entrevista_nueva.js"></script>
</body>
</html>

