<%@ taglib prefix="sptag" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="./styles/styleMenu.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
</head>
<body>
<nav onclick="deseleccionar()">
    <table id="tableMenu">
        <tr>
            <td><a href="principal.jsp" class="linkMenu">
                <sptag:message code="menu_opc1"/>
            </a></td>
            <td><a href="candidato.jsp" class="linkMenu">
                <sptag:message code="menu_opc2"/>
            </a></td>
            <td><a href="formulario.jsp" class="linkMenu linkActual">
                <sptag:message code="menu_opc3"/>
            </a></td>
            <td><a href="entrevista_index.jsp" class="linkMenu">
                <sptag:message code="menu_opc4"/>
            </a></td>
            <td><a href="video.html" class="linkMenu">
                <sptag:message code="menu_opc5"/>
            </a></td>
            <td id="logoTictum"><img src=<sptag:message code="src_img_logo"/> width="173px" height="60px"/></td>
            <td id="logoUser"><img src=<sptag:message code="src_img_usuario"/> width="35px" height="35px"
                onclick="mostrarOcultarInfoUsuario()"/>
            </td>
        </tr>

    </table>
</nav>
</body>
</html>