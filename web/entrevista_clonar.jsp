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
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_entrevista"/>>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
</head>
<body>
<main>
    <%@include file="menu.jsp"%>
    <section>
    <div id="cuerpo" onclick="ocultarInfoUsuario()">
        <h3><sptag:message code="label_clonar_entrevista"/></h3><br/>
        <table id="tableEntrevista">
            <tr>
                <c:forEach var="entrevista" items="${listaEntrevistas}">
                    <td>
                        <div class="entrevista" id="${entrevista.idEntrevista}"
                             onclick="seleccionar(this.className, this.id)"><img
                                width="45px" height="45px" src=<sptag:message code="src_fileE"/>/>${entrevista.nombreEntrevista}
                        </div>
                    </td>
                </c:forEach>
                <td>
                    <div class="entrevista" id="entrevista1" onclick="seleccionar(this.className, this.id)"><img
                            src=<sptag:message code="src_fileE"/> width="45px" height="45px"/>Entrevista 1
                    </div>
                </td>
                <td>
                    <div class="entrevista" id="entrevista2" onclick="seleccionar(this.className, this.id)"><img
                            src=<sptag:message code="src_fileE"/> width="45px" height="45px"/>Entrevista 2
                    </div>
                </td>
                <td>
                    <div class="entrevista" id="entrevista3" onclick="seleccionar(this.className, this.id)"><img
                            src=<sptag:message code="src_fileE"/> width="45px" height="45px"/>Entrevista 3
                    </div>
                </td>
            </tr>
        </table>
        <div class="elementoText" id="save">
            <form id="clonarEntrevista" action="${pageContext.request.contextPath}/clonarEntrevista.do" method="GET">
                <input type="hidden" value="" name="idEntrevista" id="valorId">
                <table class="tableElementoText">
                    <tr>
                        <td class="celda">
                            <input type="text" name="nombre" size="35" placeholder=<sptag:message code="placeholder_nombre_entrevista"/>/>
                        </td>
                        <td id="celdaBotonGuardar">
                            <button type="submit" form="clonarEntrevista" value="Crear Entrevista"
                                    class="botonGuardar"><sptag:message code="button_guardar"/>
                            </button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
        <%@include file="userInfo.jsp"%>
    </section>
</main>
<script type='text/javascript' src="js/entrevista_clonar.js"></script>
 </body>
</html>
