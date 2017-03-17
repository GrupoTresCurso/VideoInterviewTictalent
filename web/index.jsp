<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sptag" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><sptag:message code="app_title"/></title>
</head>
<body>
<h1><sptag:message code="login_title"/></h1>
<form action="${pageContext.request.contextPath}/loginUsuario.do" method="post">
    <input type="text" name="nombreUsuario" id="nombreUsuario" placeholder=<sptag:message code="placeholder_nombre"/>/>
    <input type="password" name="passwordUsuario" id="passwordUsuario" placeholder=<sptag:message
            code="placeholder_password"/>/>
    <button type="submit"><sptag:message code="iniciar_sesion"/></button>
</form>
</body>
</html>
