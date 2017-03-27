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
    <meta charset="UTF-8">
    <title><sptag:message code="app_title"/></title>
    <link rel="stylesheet" type="text/css" href="./styles/estilos_menu.css">
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_principal"/>>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
</head>
<body>
    <main>
        <%@include file="menu.jsp"%>
        <input type="hidden" value="Principal" id="enlaceActivo"/>
        <section>
            <div id="mensaje"  onclick="ocultarInfoUsuario()">
				<h1><sptag:message code="label_video_intewview"/></h1><br/>
                <h3><sptag:message code="label_resumen_app"/></h3>
            </div>
            <div id="principal"  onclick="ocultarInfoUsuario()">
                <img src="images/fondo_inicio2.png"/>
            </div>
            <div id="listadoEntrevistas"  onclick="ocultarInfoUsuario()">
                    <label>Entrevistas recientes</label>
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

            <%@include file="userInfo.jsp"%>
        </section>
    </main>
</body>
</html>