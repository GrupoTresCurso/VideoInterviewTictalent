<%@ taglib prefix="sptag" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>
        <sptag:message code="app_title"/>
    </title>
    <link rel="stylesheet" type="text/css" href="./styles/estilos_menu.css">
    <link rel="stylesheet" type="text/css" href="styles/estilos_panel_administrador.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>

</head>
<body>
<main>
    <%@include file="menu.jsp"%>
    <section>
        <div id="contenedorPrincipal" onclick="ocultarInfoUsuario()">
            <div id="contenedorCentrado">
                <form action="crearUsuario.do" method="POST" onSubmit="return validarRegistro()">
                    <h2>
                        <sptag:message code="panel_admin_title"/>
                    </h2>
                    <br/><br/>
                    <div id="contenedorFormulario">
                        <table id="tableFormulario">
                            <tr>
                                <td>
                                    <!--NOMBRE DE USUARIO-->
                                    <table class="tableElementoText">
                                        <tr>
                                            <td>
                                                <img src="images/user.png" width="30px" height="30px">
                                            </td>
                                            <td>
                                                <input type="text" name="nombreUsuario" id="nombreUsuario"
                                                       placeholder=<sptag:message code="placeholder_nombre"/> size="22" tabindex="1"/>
                                            </td>
                                        </tr>
                                    </table>
                                    <p class="errores" id="errorNombre"></p>
                                    <br/>
                                </td>
                                <td id="columna2">
                                    <!--ROL DE USUARIO-->
                                    <b><label><sptag:message code="title_select_rol"/></label>:</b><br/>
                                    <span class="select-wrapper">
                                     <select name="rol" tabindex="3">
                                        <option value="administrador"><sptag:message code="rol_admin"/></option>
                                        <option value="reclutador"><sptag:message code="rol_reclutador"/></option>
                                        <option value="responsableContratacion"><sptag:message code="rol_responsable"/></option>
                                        <option value="candidato"><sptag:message code="rol_candidato"/></option>
                                    </select>
                                </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <!--CONTRASEÑA DE USUARIO-->
                                    <table class="tableElementoText">
                                        <tr>
                                            <td>
                                                <img src="images/key.png" width="30px" height="30px">
                                            </td>
                                            <td>
                                                <input type="password" name="password" id="passwordUsuario"
                                                       placeholder=<sptag:message code="placeholder_password"/> size="22" tabindex="2"/>
                                            </td>
                                        </tr>
                                    </table>
                                    <p class="errores" id="errorPassword"></p>
                                </td>
                            </tr>
                            <tr>
                                <td id="celdaBotonGuardar" colspan="2">
                                    <br/>
                                    <button type="submit" tabindex="4"><sptag:message code="button_crear_usuario"/></button><br/><br/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>

        </div>
        <%@include file="userInfo.jsp"%>
    </section>
</main>
<script type='text/javascript' src="js/panel_administrador.js"></script>
</body>
</html>

