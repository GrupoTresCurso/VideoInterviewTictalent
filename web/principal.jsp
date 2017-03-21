<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Principal</title>
    <link rel="stylesheet" type="text/css" href="styles/estilos_principal.css">
</head>
<body>
<nav>
    <table id="tableMenu">
        <tr>
            <td><a href="principal.jsp" class="linkMenu">Principal</a></td>
            <td><a href="candidato.html" class="linkMenu">Candidato</a></td>
            <td><a href="formulario.html" class="linkMenu">Formulario</a></td>
            <td><a href="entrevista_index.jsp" class="linkMenu">Entrevista</a></td>
            <td><a href="video.html" class="linkMenu">Video</a></td>
        </tr>
    </table>
</nav>
    <section>
        <div id="principal">
            <h1>Video Interview</h1>
            <h3>Este sistema te permite la creacción de entrevistas, a través de un sencillo constructor con el que puedes añadir distintos tipos de secciones y elementos.</h3>
            <div id="listadoEntrevistas">
                <table id="tableEntrevista">
                    <tr>
                        <td>
                            <div class="entrevista" id="entrevista1" onclick="seleccionar(this.className, this.id)"><img src="images/fileE.png" width="45px" height="45px"/>Entrevista 1</div>
                        </td>
                        <td>
                            <div class="entrevista" id="entrevista2" onclick="seleccionar(this.className, this.id)"><img src="images/fileE.png" width="45px" height="45px"/>Entrevista 2</div>
                        </td>
                        <td>
                            <div class="entrevista" id="entrevista3" onclick="seleccionar(this.className, this.id)"><img src="images/fileE.png" width="45px" height="45px"/>Entrevista 3</div>
                        </td>
                    </tr>
                </table>

            </div>

        </div>
    </section>

</body>
</html>