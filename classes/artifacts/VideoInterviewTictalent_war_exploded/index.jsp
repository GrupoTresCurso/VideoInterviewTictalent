<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sptag" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title>
        <sptag:message code="app_title"/>
    </title>
    <link href="https://fonts.googleapis.com/css?family=Arvo" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_index"/>>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
</head>
<body>
<main>
    <header>
        <img width="288px" height="100px" src=<sptag:message code="src_img_logo"/>/>
    </header>
    <aside>
        <img width="199px" height="200px" src=<sptag:message code="src_img_videoInterviewPNG"/>/><br/><br/>
        <h2><sptag:message code="label_video_intewview"/></h2>
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
                                               placeholder=<sptag:message code="placeholder_nombre"/> size="23"
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
                                               placeholder=<sptag:message code="placeholder_password"/> size="23"
                                               tabindex="2"/>
                                    </td>
                                </tr>
                            </table>
                            <br/>
                        </td>
                    </tr>
                    <tr>
                        <td id="celdaBotonGuardar">
                            <!--<p id="errores"><sptag:message code="label_datos_incorrectos"/></p><br/>-->
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

</body>
</html>
