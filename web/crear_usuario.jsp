<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h4>Crear Usuario</h4>
<form action="crearUsuario.do" method="POST">
    <input type="text" name="nombreUsuario">
    <input type="text" name="password">
    <select name="rol">
        <option value="administrador">Administrador</option>
        <option value="reclutador">Reclutador</option>
        <option value="responsableContratacion">Responsable de Contratación</option>
        <option value="candidato">Candidato</option>
    </select>
    <input type="submit" value="Nuevo Usuario">
</form>
</body>
</html>
