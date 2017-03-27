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
    <section>
        <div id="cuerpo" onclick="ocultarInfoUsuario()">
            <h3><sptag:message code="label_formulario"/></h3>
            <table id="tableFormularios">
                <c:set var="contadorFormularios" value="0" scope="page"/>
                <tr>
                    <c:forEach var="formulario" items="${listaFormularios}">
                        <c:set var="contadorFormularios" value="${contadorFormularios+1}" scope="page"/>
                        <td>
                            <div class="formulario" id="${formulario.idFormulario}"
                                 onclick="seleccionar(this.className, this.id)" class="botonIndex">
                                <img width="45px" height="45px" src=<sptag:message code="src_fileF"/>/>
                                <label><a href="<c:url value="${pageContext.request.contextPath}/recuperarFormulario.do">
                                        <c:param name="idFormulario" value="${formulario.idFormulario}"/></c:url>">${formulario.nombreFormulario}</a></label>
                                <a href="<c:url value="${pageContext.request.contextPath}/eliminarFormulario.do">
                                  <c:param name="idFormulario" value="${formulario.idFormulario}"/></c:url>">
                                    <img src=<sptag:message code="src_img_icon_delete"/> id='delete' width="23px" height="23px" title="Eliminar"/>
                                </a>
                            </div>
                        </td>
                        <c:if test="${contadorFormularios%3 == 0}">
                            </tr>
                            <tr>
                        </c:if>
                    </c:forEach>
                </tr>
            </table>

            <a href="${pageContext.request.contextPath}/nuevoFormulario.do">
                <div class="botonIndex" id="botonNuevo">
                    <img src="images/new.png" width="40px" height="40px"/>
                    <label><sptag:message code="label_nuevo_formulario"/></label>
                </div>
            </a><br/>

        </div>
        <%@include file="userInfo.jsp"%>
    </section>
</main>
</body>
</html>
