<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sptag" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><sptag:message code="app_title"/></title>
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_principal"/>>
</head>
<body>
<nav>
    <table id="tableMenu">
        <tr>
            <td><a href="principal.jsp" class="linkMenu"><sptag:message code="menu_opc1"/></a></td>
            <td><a href="candidato.html" class="linkMenu"><sptag:message code="menu_opc2"/></a></td>
            <td><a href="formulario.html" class="linkMenu"><sptag:message code="menu_opc3"/></a></td>
            <td><a href="entrevista_index.jsp" class="linkMenu"><sptag:message code="menu_opc4"/></a></td>
            <td><a href="video.html" class="linkMenu"><sptag:message code="menu_opc5"/></a></td>
        </tr>
    </table>
</nav>
    <section>
        <div id="principal">
            <h1><sptag:message code="label_video_intewview"/></h1>
            <h3><sptag:message code="label_resumen_app"/></h3>
            <div id="listadoEntrevistas">
                <table id="tableEntrevista">
                    <tr>
                        <td>
                            <div class="entrevista" id="entrevista1" onclick="seleccionar(this.className, this.id)"><img width="45px" height="45px" src=<sptag:message code="src_fileE"/>/>Entrevista 1</div>
                        </td>
                        <td>
                            <div class="entrevista" id="entrevista2" onclick="seleccionar(this.className, this.id)"><img width="45px" height="45px" src=<sptag:message code="src_fileE"/>/>Entrevista 2</div>
                        </td>
                        <td>
                            <div class="entrevista" id="entrevista3" onclick="seleccionar(this.className, this.id)"><img width="45px" height="45px" src=<sptag:message code="src_fileE"/>/>Entrevista 3</div>
                        </td>
                    </tr>
                </table>

            </div>

        </div>
    </section>

</body>
</html>