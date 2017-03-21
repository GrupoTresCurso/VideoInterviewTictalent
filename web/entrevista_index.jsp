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
    <title><sptag:message code="app_title"/></title>
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_entrevista"/>>
    <link rel="stylesheet" href=
    <sptag:message code="fonts_route"/>>
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
</head>
<body>
<main>
    <%@include file="menu.jsp" %>
    <div id="cuerpo">
        <h3><sptag:message code="label_generar_entrevista"/></h3><br/>
        <a href="entrevista_clonar.jsp">
            <div class="botonIndex"><img src="images/clone.png" width="40px" height="40px"/><sptag:message
                    code="label_clonar_entrevista"/></div>
        </a><br/>
        <a href="prueba_entrevista_nueva.html">
            <div class="botonIndex"><img src="images/new.png" width="40px" height="40px"/><sptag:message
                    code="label_nueva_entrvista"/></div>
        </a><br/>

    </div>

</main>
</body>
</html>
