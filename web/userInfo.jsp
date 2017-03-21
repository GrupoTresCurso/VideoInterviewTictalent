<%@ taglib prefix="sptag" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="userInfo">
    <h3>${sessionScope.usuario.nombreUsuario}</h3>
    <p>
        <c:choose>
            <c:when test="${sessionScope.usuario.reclutador}">
                <sptag:message code="label_reclutador"/>
            </c:when>
            <c:when test="${sessionScope.usuario.responsableContratacion}">
                <sptag:message code="label_responsable_contratacion"/>
            </c:when>
            <c:when test="${sessionScope.usuario.candidato}">
                <sptag:message code="label_candidato"/>
            </c:when>
            <c:when test="${sessionScope.usuario.administrador}">
                <sptag:message code="label_administrador"/>
            </c:when>
        </c:choose>
    </p>
    <br/>
    <a href="${pageContext.request.contextPath}/logoutUsuario.do"><sptag:message code="label_logout"/></a>
</div>