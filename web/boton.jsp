<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%--
  Created by IntelliJ IDEA.
  User: Tictum
  Date: 13/03/2017
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

    <script>

        $(document).ready(function() {


            $('#anyadirFichero').click(function() {
                var fileIndex = $('#tablaficheros tr').children().length - 1;
                $('#tablaficheros').append(
                    '<tr><td>'+
                    '   <input type="file" name="archivos['+ fileIndex +']" />'+
                    '</td></tr>');     });       });
    </script>

    <title>Subir Fichero</title>
</head>
<body>
<form:form action="subirVideo.do" method="post" enctype="multipart/form-data"  modelAttribute="listaArchivos">
    <p>Seleccione los ficheros a subir. Pulse el botón "Añadir fichero " para añadir más ficheros.</p>
    <input id="anyadirFichero" type="button" value="Añadir Fichero" />
    <table id="tablaficheros">
        <tr>
            <td><input name="archivos[0]" type="file" /></td>
        </tr>
    </table>
    <br/>
    <input type="submit" value="Subir archivo" />
</form:form>
</br>
</br>
<a href="descargarFicheros.htm">Listado de ficheros </a>
</body>
</html>