<%@ taglib prefix="sptag" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><sptag:message code="app_title"/></title>
</head>
<body>
<h4><sptag:message code="panel_admin_title"/></h4>
<form action="crearUsuario.do" method="POST">
    <input type="text" name="nombreUsuario" id="nombreUsuario" placeholder=<sptag:message code="placeholder_nombre"/>>
    <input type="text" name="password" id="passwordUsuario" placeholder=<sptag:message code="placeholder_password"/>>
    <sptag:message code="title_select_rol"/>
    <select name="rol">
        <option value="administrador"><sptag:message code="rol_admin"/></option>
        <option value="reclutador"><sptag:message code="rol_reclutador"/></option>
        <option value="responsableContratacion"><sptag:message code="rol_responsable"/></option>
        <option value="candidato"><sptag:message code="rol_candidato"/></option>
    </select>
    <button type="submit"><sptag:message code="button_crear_usuario"/></button>
</form>
</body>
</html>
