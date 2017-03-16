<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>VideoInterview</title>
    <link rel="stylesheet" type="text/css" href="styles/estilos_entrevista.css">
    <link href="https://fonts.googleapis.com/css?family=Arvo" rel="stylesheet">
    <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
</head>
<body>
<main>
    <header></header>
    <nav>
        <table id="tableMenu">
            <tr>
                <td><a href="principal.html" class="linkMenu">Principal</a></td>
                <td><a href="candidato.html" class="linkMenu">Candidato</a></td>
                <td><a href="formulario.html" class="linkMenu">Formulario</a></td>
                <td><a href="entrevista_index.jsp" class="linkMenu">Entrevista</a></td>
                <td><a href="video.html" class="linkMenu">Video</a></td>
            </tr>
        </table>
    </nav>
    <!--<p ondblclick="myFunction()">Double-click me</p>-->
    <div id="cuerpo">
        <h3>Clonar Entrevista:</h3><br/>
        <table id="tableEntrevista">
            <tr>
                <c:forEach var="entrevista" items="${listaEntrevistas}">
                    <td>
                        <div class="entrevista" id="${entrevista.idEntrevista}"
                             onclick="seleccionar(this.className, this.id)"><img
                                src="images/fileE.png" width="45px" height="45px"/>${entrevista.nombreEntrevista}
                        </div>
                    </td>
                </c:forEach>
                <td>
                    <div class="entrevista" id="entrevista1" onclick="seleccionar(this.className, this.id)"><img
                            src="images/fileE.png" width="45px" height="45px"/>Entrevista 1
                    </div>
                </td>
                <td>
                    <div class="entrevista" id="entrevista2" onclick="seleccionar(this.className, this.id)"><img
                            src="images/fileE.png" width="45px" height="45px"/>Entrevista 2
                    </div>
                </td>
                <td>
                    <div class="entrevista" id="entrevista3" onclick="seleccionar(this.className, this.id)"><img
                            src="images/fileE.png" width="45px" height="45px"/>Entrevista 3
                    </div>
                </td>
            </tr>
        </table>
        <div class="elementoText" id="save">
            <form action="${pageContext.request.contextPath}/clonarEntrevista.do" method="GET">
                <input type="hidden" value="" name="idEntrevista" id="valorId">
                <table class="tableElementoText">
                    <tr>
                        <td class="celda">
                            <input type="text" name="nombre" placeholder="Introduzca nombre de entrevista" size="35"/>
                        </td>
                        <td id="celdaBotonGuardar">
                            <input type="submit" value="Guardar" class="botonGuardar" id="botonGuardar"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>


    </div>

</main>

<script>
    function seleccionar(clase, id) {
        cambiarFondo(clase, id);
    }

    function cambiarFondo(clase, id) {
        var entrevistas = document.getElementsByClassName(clase);
        for (var i = 0; i < entrevistas.length; i++) {
            entrevistas[i].style.backgroundColor = "white";
        }
        document.getElementById(id).style.backgroundColor = "#C0C0C0";
        cambiarOnClickClonar(id);
    }

    function cambiarOnClickClonar(id) {
        document.getElementById("valorId").value = id;
    }

</script>

</body>
</html>
