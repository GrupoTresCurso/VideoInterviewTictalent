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
    <title><sptag:message code="app_title"/></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_video"/>>
    <link  rel="stylesheet" href=<sptag:message code="fonts_route"/>>

    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
</head>
<body>
<main>
    <header></header>
    <%@include file="menu.jsp"%>
    <aside>
        <h4><sptag:message code="label_opc_video"/></h4>
        <table id="tableOpcionesVideo">
            <tr>
                <td>
                    <a href="grabar_video.html">
                        <img class="imagenP" width="50px" height="50px"src=<sptag:message code="src_webcam"/>/>
                    </a>
                </td>
                <td><a href="grabar_video.html"><sptag:message code="label_crear_video"/></a></td>
            </tr>
            <tr>
                <td>
                    <a href="cargar_video.jsp">
                        <img class="imagenP" width="50px" height="50px" src=<sptag:message code="src_file"/>/>
                    </a>
                </td>
                <td><a href="cargar_video.jsp"><sptag:message code="label_cargar_video"/></a></td>
            </tr>
        </table>
    </aside>
    <section>
        <h4><sptag:message code="label_arrastrar_video"/></h4><br/>
        <form id="formSubirVideo" action="${pageContext.request.contextPath}/subirVideo.do" method="POST" enctype="multipart/form-data"  modelAttribute="listaVideos">
            <td rowspan="3" id="celdaImagen" class="celdaColumna2">
                <input type="file" id="file" name="archivos[0]" onchange="processFiles(this.files)"/>
                <label for="file">
                    <div id="contenedorVideo" ondragenter="return enter(event)" ondragover="return over(event)" ondragleave="return leave(event)" ondrop="return drop(event)">
                        <h1 id="divArrastrar"><sptag:message code="label_arrastrar_video"/></h1>
                        <img class="imagenP" width="100px" height="100px" src=<sptag:message code="src_img_upload"/>>
                    </div>
                </label>
                <input type="submit" value=src=<sptag:message code="button_guardar"/> class="botonGuardar"/>
        </form>
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
            if(file.type == "video/mp4"){
                output.innerHTML =  "<img src='images/mp4.png' width='100px' height='100px'/> " +
                    "<p id='nombreArchivo'>"+file.name+"</p>";
            }else if(file.type == "video/avi"){
                output.innerHTML =  "<img src='images/avi.png' width='100px' height='100px'/> " +
                    "<p id='nombreArchivo'>"+file.name+"</p>";
            }else if(file.type == "video/mov"){
                output.innerHTML =  "<img src='images/mov.png' width='100px' height='100px'/> " +
                    "<p id='nombreArchivo'>"+file.name+"</p>";
            }else{
                output.innerHTML =  "<img src='images/video_file.png' width='100px' height='100px'/> " +
                    "<p id='nombreArchivo'>"+file.name+"</p>";
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
        if (id == 'contenedorVideo'){
            return false;
        }
    }

    function drop(e){
        ignoreDrag(e);
        var data = e.dataTransfer;
        var files = data.files;

        processFiles(files);
        e.target.classList.remove('over');
    }

</script>

</body>
</html>