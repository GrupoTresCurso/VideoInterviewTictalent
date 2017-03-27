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
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_formulario_index"/>>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
</head>
<body>
<main>
    <%@include file="menu.jsp" %>
    <% int contadorFormularios=0; %>
    <section>
        <div id="cuerpo" onclick="ocultarInfoUsuario()">
            <h3><sptag:message code="label_lista_formularios"/></h3><br/>

            <table id="tableFormularios">

                <tr>
                <c:forEach var="entrevista" items="${listaEntrevistas}">
                    <%contadorFormularios++;%>
                    <td>
                        <div class="formulario" id="${formulario.idFormulario}"
                             onclick="seleccionar(this.className, this.id)">
                            <img width="45px" height="45px" src=<sptag:message
                                    code="src_fileF"/>/>${formulario.nombreFormulario}
                        </div>
                    </td>
                    <% if(contadorFormularios%2==0){
                    %>
                    </tr>
                    <tr>
                    <%}%>
                </c:forEach>
                </tr>
            </table>

            <a href="${pageContext.request.contextPath}/recuperarVideosFormularios.do">
                <div class="botonIndex"><img src="images/new.png" width="40px" height="40px"/><sptag:message
                        code="label_nuevo_formulario"/></div>
            </a><br/>

        </div>
        <%@include file="userInfo.jsp"%>
    </section>
</main>
</body>
</html>
