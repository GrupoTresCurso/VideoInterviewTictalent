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
            <h3><sptag:message code="label_clonar_entrevista"/></h3>
            <table id="tableEntrevistas">
                <c:set var="contadorEntrevistas" value="0" scope="page"/>
                <tr>
                    <c:forEach var="entrevista" items="${listaEntrevistas}">
                    <td>
                        <div class="entrevista" id="${entrevista.idEntrevista}"
                             onclick="seleccionar(this.className, this.id)">
                            <img width="45px" height="45px" src=<sptag:message code="src_fileE"/>/>
                            <label>${entrevista.nombreEntrevista}</label>
                        </div>
                    </td>
                    <c:if test="${contadorFormularios%3 == 0}">
                        </tr>
                        <tr>
                    </c:if>
                    </c:forEach>
                </tr>
            </table>
            <div class="elementoText" id="save">
                <form id="clonarEntrevista" action="${pageContext.request.contextPath}/clonarEntrevista.do"
                      method="GET">
                    <input type="hidden" value="" name="idEntrevista" id="valorId">
                    <table class="tableElementoText">
                        <tr>
                            <td class="celda">
                                <input type="text" name="nombre" size="35" required placeholder=<sptag:message
                                        code="placeholder_nombre_entrevista"/>/>
                            </td>
                            <td class="celda">
                                <button type="submit" form="clonarEntrevista" value="Crear Entrevista"
                                        id="botonGuardar" disabled="true" class="botonGuardar"><sptag:message
                                        code="button_guardar"/>
                                </button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <%@include file="userInfo.jsp" %>
    </section>
</main>
</body>
<script type='text/javascript' src="js/entrevista_clonar.js"></script>
</body>
</html>
