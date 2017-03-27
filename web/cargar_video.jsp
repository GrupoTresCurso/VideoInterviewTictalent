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
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_video"/>>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>

</head>
<body>
<main>
    <%@include file="menu.jsp" %>
    <aside onclick="ocultarInfoUsuario()">
        <h4><sptag:message code="label_opc_video"/></h4>
        <table id="tableOpcionesVideo">
            <tr>
                <a href="grabar_video.jsp">
                    <td>
                        <img class="imagenP" width="50px" height="50px" src=<sptag:message code="src_webcam"/>/>
                    </td>
                    <td><a href="grabar_video.jsp"><sptag:message code="label_nuevo_video"/></a></td>
                </a>
            </tr>
            <tr>
                <a href="cargar_video.jsp">
                    <td>
                        <img class="imagenP" width="50px" height="50px" src=<sptag:message code="src_file"/>/>
                    </td>
                    <td><a href="cargar_video.jsp"><sptag:message code="label_cargar_video"/></a></td>
                </a>
            </tr>
        </table>
    </aside>
    <section onclick="ocultarInfoUsuario()">
        <div id="medio"  onclick="ocultarInfoUsuario()">
            <h4><sptag:message code="label_arrastrar_video"/></h4><br/>
            <form id="formSubirVideo" action="${pageContext.request.contextPath}/subirVideo.do" method="POST"
                  enctype="multipart/form-data" modelAttribute="listaVideos">
                <td rowspan="3" id="celdaImagen" class="celdaColumna2">
                    <input type="file" id="file" name="archivos[0]" onchange="processFiles(this.files)"/>
                    <label for="file">
                        <div id="contenedorVideo" ondragenter="return enter(event)" ondragover="return over(event)"
                             ondragleave="return leave(event)" ondrop="return drop(event)">
                            <h1 id="divArrastrar"><sptag:message code="label_arrastrar_video"/></h1>
                            <img class="imagenP" width="100px" height="100px" src=<sptag:message code="src_img_upload"/>>
                        </div>
                    </label>
                    <table>
                        <tr>
                            <td class="celdaOpcion">
                                <input type="radio" name="opcion" id="opcionR1">
                                <label for="opcionR1" class="labelOpcionR1 opcion">Introducción</label>
                            </td>
                            <td class="celdaOpcion">
                                <input type="radio" name="opcion" id="opcionR2">
                                <label for="opcionR2" class="labelOpcionR2 opcion">Pregunta</label>
                            </td>
                            <td class="celdaOpcion">
                                <input type="radio" name="opcion" id="opcionR3">
                                <label for="opcionR3" class="labelOpcionR3 opcion">Transición</label>
                            </td>
                        </tr>
                    </table>
                    <button type="submit" form="formSubirVideo" value="Crear Entrevista"
                            class="botonGuardar"><sptag:message code="button_guardar"/>
                    </button>
            </form>
        </div>
    </section>

</main>

<script>
    function processFiles(files) {
        var file = files[0];
        var reader = new FileReader();
        reader.onload = function (e) {
            var output = document.getElementById("contenedorVideo");
            //output.style.backgroundImage = "url('" + e.target.result + "')";
            output.style.backgroundImage = "url('')";   //resetea fondo
            if (file.type == "video/mp4") {
                output.innerHTML = "<img src='images/mp4.png' width='100px' height='100px'/> " +
                    "<p id='nombreArchivo'>" + file.name + "</p>";
            } else if (file.type == "video/avi") {
                output.innerHTML = "<img src='images/avi.png' width='100px' height='100px'/> " +
                    "<p id='nombreArchivo'>" + file.name + "</p>";
            } else if (file.type == "video/mov") {
                output.innerHTML = "<img src='images/mov.png' width='100px' height='100px'/> " +
                    "<p id='nombreArchivo'>" + file.name + "</p>";
            } else {
                output.innerHTML = "<img src='images/video_file.png' width='100px' height='100px'/> " +
                    "<p id='nombreArchivo'>" + file.name + "</p>";
            }
        };
        reader.readAsDataURL(file);
    }

    function ignoreDrag(e) {
        e.stopPropagation();
        e.preventDefault();
    }

    function enter(e) {
        ignoreDrag(e);
        e.target.classList.add('over');
    }

    function leave(e) {
        e.target.classList.remove('over');
    }

    function over(e) {
        ignoreDrag(e);
        var id = e.target.id;
        if (id == 'contenedorVideo') {
            return false;
        }
    }

    function drop(e) {
        ignoreDrag(e);
        var data = e.dataTransfer;
        var files = data.files;

        processFiles(files);
        e.target.classList.remove('over');
    }

</script>

</body>
</html>