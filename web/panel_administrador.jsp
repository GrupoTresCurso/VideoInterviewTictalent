<%@ taglib prefix="sptag" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>
        <sptag:message code="app_title"/>
    </title>
    <link rel="stylesheet" type="text/css" href="styles/estilos_panel_administrador.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

</head>
<body>
<main>
    <header></header>
    <nav>
        <table id="tableMenu">
            <tr>
                <td><a href="panel_administrador.jsp" class="linkMenu linkActual">Panel de administración</a></td>
                <td id="logoTictum"><img src="images/logo1Negro.png" width="173px" height="60px"/></td>
                <td id="logoUser"><img src="images/usuario.png" width="35px" height="35px"
                                       onclick="mostrarOcultarInfoUsuario()"/></td>
            </tr>

        </table>
    </nav>

    <section onclick="ocultarInfoUsuario()">
        <div id="contenedorPrincipal">
            <form action="crearUsuario.do" method="POST">
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
                                                   placeholder='<sptag:message code="placeholder_nombre"/>' size="19" tabindex="1"/>
                                        </td>
                                    </tr>
                                </table>
                                <p class="errores">Dato no válido</p>
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
                                                   placeholder='<sptag:message code="placeholder_password"/>' size="19" tabindex="2"/>
                                        </td>
                                    </tr>
                                </table>
                                <p class="errores">Datos no válido</p>
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
        <div id="userInfo">
            <h3>Usuario1</h3>
            <p>Responsable de contratación</p><br/>
            <a href="">Logout</a>
        </div>
    </section>

    <script type='text/javascript' src="js/panel_administrador.js"></script>
</main>

</body>
</html>

