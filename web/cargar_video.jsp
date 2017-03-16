<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>VideoInterview</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="styles/estilos_video.css">
    <link href="https://fonts.googleapis.com/css?family=Arvo" rel="stylesheet">

    <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile1.4.5.min.js"></script>
</head>
<body>
<main>
    <header></header>
    <nav>
        <table id="tableMenu">
            <tr>
                <td><a href="principal.html" class="linkMenu">Principal</a></td>
                <td><a href="candidato.html" class="linkMenu">Candidato</a></td>
                <td><a href="formulario.html" class="linkMenu">Formulario</a></td>
                <td><a href="entrevista_index.jsp" class="linkMenu">Entrevista</a></td>
                <td><a href="video.html" class="linkMenu">Video</a></td>
            </tr>
        </table>
    </nav>
    <aside>
        <h4>Opciones de vídeo</h4>
        <table id="tableOpcionesVideo">
            <tr>
                <td>
                    <a href="grabar_video.html">
                        <img src="icons/webcam.png" width="50px" height="50px"/>
                    </a>
                </td>
                <td><a href="grabar_video.html">Crear vídeo</a></td>
            </tr>
            <tr>
                <td>
                    <a href="cargar_video.jsp">
                        <img src="icons/file.png" width="50px" height="50px"/>
                    </a>
                </td>
                <td><a href="cargar_video.jsp">Cargar vídeo</a></td>
            </tr>
        </table>
    </aside>
    <section>
        <h4>Arrastrar y soltar vídeo</h4><br/>
        <form id="formSubirVideo" action="${pageContext.request.contextPath}/subirVideo.do" method="GET" enctype="multipart/form-data" modelAttribute="listaVideos">
            <td rowspan="3" id="celdaImagen" class="celdaColumna2">
                <input type="file" id="file" name="archivos[0]" onchange="processFiles(this.files)"/>
                <label for="file">
                    <div id="contenedorVideo" ondragenter="return enter(event)" ondragover="return over(event)" ondragleave="return leave(event)" ondrop="return drop(event)">
                    </div>
                </label>
                <input type="submit"  value="Guardar" class="botonGuardar"/>
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
                output.innerHTML =  "<img src='images/mp4.png' width='80px' height='80px'/> " +
                    "<p id='nombreArchivo'>"+file.name+"</p>";
            }else{
                output.innerHTML =  "<img src='images/video_file.png' width='80px' height='80px'/> " +
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