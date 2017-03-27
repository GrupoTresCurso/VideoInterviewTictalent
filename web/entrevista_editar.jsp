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
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_entrevista_clonar"/>>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
</head>
<body>
<main>
    <%@include file="menu.jsp" %>
    <section>
        <div id="cuerpo" onclick="ocultarInfoUsuario()">
            <h3>Gestionar Entrevista</h3>
            <c:if test="${fn:length(listaEntrevistas)==0}">
                <br/><br/>
                <label>No hay entrevistas creadas.</label>
            </c:if>
            <c:if test="${fn:length(listaEntrevistas)>0}">
                <table id="tableEntrevistas">
                    <c:set var="contadorEntrevistas" value="0" scope="page"/>
                    <tr>
                        <c:forEach var="entrevista" items="${listaEntrevistas}">
                            <c:set var="contadorEntrevistas" value="${contadorEntrevistas+1}" scope="page"/>
                            <td>
                                <div class="entrevista" id="${entrevista.idEntrevista}"
                                     onclick="seleccionar(this.className, this.id)">
                                    <img width="45px" height="45px" src=<sptag:message code="src_fileE"/>/>
                                    <label class="labelDatosEntrevista">
                                        <a href="<c:url value="${pageContext.request.contextPath}/recuperarEntrevista.do"><c:param name="idEntrevista" value="${entrevista.idEntrevista}"/></c:url>"
                                        title="Mostrar datos">${entrevista.nombreEntrevista}</a>
                                    </label>

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
            </c:if>
        </div>
        <%@include file="userInfo.jsp" %>
    </section>
</main>
</body>
<script type='text/javascript' src="js/entrevista_clonar.js"></script>
</body>
</html>
