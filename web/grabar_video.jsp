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
    <link rel="stylesheet" type="text/css" href="styles/estilos_video_grabar.css">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
    <script src="https://cdn.webrtc-experiment.com/RecordRTC.js"></script>
</head>

<body>
<main>
    <%@include file="menu.jsp" %>

    <aside onclick="ocultarInfoUsuario()">
        <h4><sptag:message code="label_opciones_video"/></h4>
        <table id="tableOpcionesVideo">
            <tr>
                <td>
                    <a href="grabar_video.jsp">
                        <img class="imagenP" width="50px" height="50px" src=<sptag:message code="src_webcam"/>/>
                    </a>
                </td>
                <td><a href="grabar_video.jsp"><sptag:message code="label_nuevo_video"/></a></td>
            </tr>
            <tr>
                <td>
                    <a href="cargar_video.jsp">
                        <img width="50px" height="50px" src=<sptag:message code="src_file"/>/>
                    </a>
                </td>
                <td><a href="cargar_video.jsp"><sptag:message code="label_cargar_video"/></a></td>
                </tr>
        </table>
    </aside>
    <article>
        <section class="experiment recordrtc" id="medio">
            <h2 class="header">

                <select class="media-container-format" hidden>
                    <option>vp8</option>
                </select>

                <div style="margin-top: 10px;">
                    <video controls muted height="440px" width="600px"></video>
                </div>

                <button id="btn-start-recording"><img src="images/record.png" width="40px" height="40px"></button>
                <!--<button id="btn-stop-recording"><img src="images/stop.png" width="40px" height="40px"></button>-->
                <button id="btn-pause-recording" style="display: none; font-size: 15px;"><img src="images/pause.png" width="40px" height="40px"></button>
                <button id="save-to-disk" display="none"><img src="images/save.png" width="40px" height="40px"></button>
                </div>

                <hr style="border-top: 0;border-bottom: 1px solid rgb(189, 189, 189);margin: 4px -12px;margin-top: 8px;">
            </h2>
            <%@include file="userInfo.jsp" %>
        </section>
    </article>
</main>
<script type='text/javascript' src="js/grabar_video.js"></script>
<script type='text/javascript' src="js/formulario.js"></script>
</body>
</html>
