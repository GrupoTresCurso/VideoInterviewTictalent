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
    <title>VideoInterview</title>
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_entrevista"/>>
    <link rel="stylesheet" href=<sptag:message code="fonts_route"/>>
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
</head>
<body>
<main>
    <header></header>
    <nav>
        <table id="tableMenu">
            <tr>
                <td><a href="principal.jsp" class="linkMenu"><sptag:message code="menu_opc1"/></a></td>
                <td><a href="candidato.html" class="linkMenu"><sptag:message code="menu_opc2"/></a></td>
                <td><a href="formulario.jsp" class="linkMenu"><sptag:message code="menu_opc3"/></a></td>
                <td><a href="entrevista_index.jsp" class="linkMenu"><sptag:message code="menu_opc4"/></a></td>
                <td><a href="video.html" class="linkMenu"><sptag:message code="menu_opc5"/></a></td>
            </tr>
        </table>
    </nav>
    <!--<p ondblclick="myFunction()">Double-click me</p>-->
    <div id="cuerpo">
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
            <form action="${pageContext.request.contextPath}/clonarEntrevista.do" method="GET">
                <input type="hidden" value="" name="idEntrevista" id="valorId">
                <table class="tableElementoText">
                    <tr>
                        <td class="celda">
                            <input type="text" name="nombre" size="35" placeholder=<sptag:message code="placeholder_nombre_entrevista"/>/>
                        </td>
                        <td id="celdaBotonGuardar">
                            <input type="submit" value=<sptag:message code="button_guardar"/> class="botonGuardar" id="botonGuardar"/>
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
