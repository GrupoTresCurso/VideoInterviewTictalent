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
                            <c:forEach var="entrevista" items="${listaEntrevistas}" begin="0" end="2">
                                <c:if test="${entrevista != null}">
                                    <td>
                                        <div class="entrevista">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <img width="45px" height="45px" src=<sptag:message code="src_fileE"/>/>
                                                    </td>
                                                    <td>
                                                        <a href="<c:url value="${pageContext.request.contextPath}/recuperarEntrevista.do"><c:param name="idEntrevista" value="${entrevista.idEntrevista}"/></c:url>"
                                                           title="Mostrar entrevista">
                                                            <label>${entrevista.nombreEntrevista}</label>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </c:if>
                            </c:forEach>
                        </tr>
                    </table>

                </div>

            <%@include file="userInfo.jsp"%>
        </section>
    </main>
</body>
</html>