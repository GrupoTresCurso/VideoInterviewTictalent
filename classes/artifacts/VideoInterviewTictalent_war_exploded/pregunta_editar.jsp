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
    <meta charset="UTF-8">
    <title><sptag:message code="app_title"/></title>
    <link rel="stylesheet" type="text/css" href="./styles/estilos_menu.css">
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_formulario_index"/>>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
</head>
<body>

<main>
    <%@include file="menu.jsp" %>
    <input type="hidden" value="Formulario" id="enlaceActivo"/>
    <section>
        <div id="cuerpo" onclick="ocultarInfoUsuario()">
            <h3>Preguntas favoritas</h3>
            <c:if test="${fn:length(listaPreguntasPredefinidas)==0}">
                <br/><br/>
                <label>No hay preguntas favoritas.</label>
            </c:if>
            <c:if test="${fn:length(listaPreguntasPredefinidas)>0}">
                <table id="tableFormularios">
                    <c:set var="contadorPreguntas" value="0" scope="page"/>
                    <tr>
                        <c:forEach var="pregunta" items="${listaPreguntasPredefinidas}">
                            <c:set var="contadorPreguntas" value="${contadorPreguntas+1}" scope="page"/>
                            <td>
                                <div class="formulario" id="${pregunta.idPregunta}"
                                     onclick="seleccionar(this.className, this.id)" class="botonIndex">
                                    <c:if test="${pregunta.tipoPregunta == 'text'}">
                                        <img width="45px" height="45px" src=<sptag:message code="src_img_icon_text"/>/>
                                    </c:if>
                                    <c:if test="${pregunta.tipoPregunta == 'area'}">
                                        <img width="45px" height="45px" src=<sptag:message code="src_img_icon_textarea"/>/>
                                    </c:if>
                                    <c:if test="${pregunta.tipoPregunta == 'radio'}">
                                        <img width="45px" height="45px" src=<sptag:message code="src_img_icon_radio"/>/>
                                    </c:if>
                                    <c:if test="${pregunta.tipoPregunta == 'checkbox'}">
                                        <img width="45px" height="45px" src=<sptag:message code="src_img_icon_checkbox"/>/>
                                    </c:if>
                                    <c:if test="${pregunta.tipoPregunta == 'select'}">
                                        <img width="45px" height="45px" src=<sptag:message code="src_img_icon_select"/>/>
                                    </c:if>
                                    <c:if test="${pregunta.tipoPregunta == 'file'}">
                                        <img width="45px" height="45px" src=<sptag:message code="src_img_icon_upload"/>/>
                                    </c:if>
                                    <label>${pregunta.labelPregunta}</label>
                                    <a href="<c:url value="${pageContext.request.contextPath}/eliminarPregunta.do">
                                      <c:param name="idPregunta" value="${pregunta.idPregunta}"/></c:url>">
                                        <img src=<sptag:message code="src_img_icon_delete"/> id='delete' width="23px" height="23px" title="Eliminar"/>
                                    </a>
                                </div>
                            </td>
                            <c:if test="${contadorPreguntas%3 == 0}">
                                </tr>
                                <tr>
                            </c:if>
                        </c:forEach>
                    </tr>
                </table>
            </c:if>

        </div>
        <%@include file="userInfo.jsp"%>
    </section>
</main>
</body>
</html>
