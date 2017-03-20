<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sptag" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title>
        <sptag:message code="app_title"/>
    </title>
    <link rel="stylesheet" type="text/css" href="styles/estilos_index.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<main>
    <header>
        <img src="images/logo1Negro.png" width="288px" height="100px"/>
    </header>
    <aside>
        <img src="images/videoInterviewPNG.png" width="199px" height="200px"/><br/><br/>
        <h2>Video Interview</h2>
    </aside>
    <div id="separador"></div>
    <section>
        <form action="${pageContext.request.contextPath}/loginUsuario.do" method="post">
            <h2>
                <sptag:message code="login_title"/>
            </h2>
            <br/>
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
                                               placeholder='<sptag:message code="placeholder_nombre"/>' size="19"
                                               tabindex="1"/>
                                    </td>
                                </tr>
                            </table>
                            <br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <!--CONTRASEÑA-->
                            <table class="tableElementoText">
                                <tr>
                                    <td>
                                        <img src="images/key.png" width="30px" height="30px">
                                    </td>
                                    <td>
                                        <input type="password" name="passwordUsuario" id="passwordUsuario"
                                               placeholder='<sptag:message code="placeholder_password"/>' size="19"
                                               tabindex="2"/>
                                    </td>
                                </tr>
                            </table>
                            <br/>
                        </td>
                    </tr>
                    <tr>
                        <td id="celdaBotonGuardar">
                            <p id="errores">Datos incorrectos</p><br/>
                            <button type="submit" tabindex="3">
                                <sptag:message code="iniciar_sesion"/>
                            </button>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </section>
</main>

<script type='text/javascript' src="js/index.js"></script>

</body>
</html>
