<%@ taglib prefix="sptag" uri="http://www.springframework.org/tags" %>
<nav>
    <table id="tableMenu">
        <tr>
            <td onclick="ocultarInfoUsuario()"><a href="principal.jsp" class="linkMenu">
                <sptag:message code="menu_opc1"/>
            </a></td>
            <td onclick="ocultarInfoUsuario()"><a href="candidato.jsp" class="linkMenu">
                <sptag:message code="menu_opc2"/>
            </a></td>
            <td onclick="ocultarInfoUsuario()"><a href="formulario.jsp" class="linkMenu">
                <sptag:message code="menu_opc3"/>
            </a></td>
            <td onclick="ocultarInfoUsuario()"><a href="entrevista_index.jsp" class="linkMenu">
                <sptag:message code="menu_opc4"/>
            </a></td>
            <td onclick="ocultarInfoUsuario()"><a href="video.html" class="linkMenu">
                <sptag:message code="menu_opc5"/>
            </a></td>
            <td id="logoTictum" onclick="ocultarInfoUsuario()"><img src=<sptag:message code="src_img_logo"/> width="173px" height="60px"/></td>
            <td id="logoUser"><img src=<sptag:message code="src_img_usuario"/> width="35px" height="35px"
                onclick="mostrarOcultarInfoUsuario()"/>
            </td>
        </tr>

    </table>
</nav>

