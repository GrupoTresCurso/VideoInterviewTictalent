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
    <%@include file="menu.jsp" %>
    <section>
        <div id="cuerpo" onclick="ocultarInfoUsuario()">
            <h3><sptag:message code="label_generar_entrevista"/></h3><br/>
            <a href="${pageContext.request.contextPath}/recuperarEntrevistas.do">
                <div class="botonIndex"><img src="images/clone.png" width="40px" height="40px"/><sptag:message
                        code="label_clonar_entrevista"/></div>
            </a><br/>
            <a href="${pageContext.request.contextPath}/recuperarVideosFormularios.do">
                <div class="botonIndex"><img src="images/new.png" width="40px" height="40px"/><sptag:message
                        code="label_nueva_entrvista"/></div>
            </a><br/>
        </div>
        <%@include file="userInfo.jsp"%>
</section>
</main>
</body>
</html>
