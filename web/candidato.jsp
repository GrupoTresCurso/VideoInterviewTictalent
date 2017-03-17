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
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_candidato"/>>

    <link rel="stylesheet" href=<sptag:message code="fonts_route"/>>
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
</head>
<body>
<main>
    <header></header>
    <nav>
        <table id="tableMenu">
            <tr>
                <td><a href="principal.html" class="linkMenu"><sptag:message code="menu_opc1"/></a></td>
                <td><a href="candidato.html" class="linkMenu"><sptag:message code="menu_opc2"/></a></td>
                <td><a href="formulario.html" class="linkMenu"><sptag:message code="menu_opc3"/></a></td>
                <td><a href="entrevista_index.jsp" class="linkMenu"><sptag:message code="menu_opc4"/></a></td>
                <td><a href="video.html" class="linkMenu"><sptag:message code="menu_opc5"/></a></td>
            </tr>
        </table>
    </nav>
    <aside>
        <h4><sptag:message code="label_candidatos"/></h4>
        <table id="tableCandidatos">
            <c:forEach var="candidato" items="${listaCandidatos}">
                <tr>
                    <td>
                        <img src="https://pbs.twimg.com/profile_images/822817456880230400/p7lqbBot.jpg" width="50px"
                             height="50px"/>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/recuperarCandidato.do?idCandidato=${candidato.idCandidato}"><c:out
                                value="${candidato.nombre}"/></a></td>
                </tr>
            </c:forEach>
        </table>
    </aside>
    <section>
        <h4><sptag:message code="label_agregar_candidato"/></h4><br/>
        <form id="formNuevoCandidato" action="${pageContext.request.contextPath}/guardarCandidato.do" method="GET">
            <c:if test="${candidato.idCandidato!=null}">
                <input type="hidden" value="${candidato.idCandidato}" name="idCandidato">
            </c:if>
            <table>
                <tr>
                    <td id="celdaFormulario">
                        <table id="tableNuevoCandidato">
                            <tr>
                                <td>
                                    <div class="elemento">
                                        <table class="tableElementoText">
                                            <tr>
                                                <td class="celda">
                                                    <img width="30px" height="30px" src=<sptag:message code="src_img_user"/>>
                                                </td>
                                                <td class="celda">
                                                    <input type="text" name="nombre" id="nombre" size="30"
                                                           placeholder=<sptag:message code="placeholder_nombre"/>
                                                           value="${candidato.nombre}"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                                <td rowspan="3" id="celdaImagen" class="celdaColumna2">
                                    <input type="file" id="file" onchange="processFiles(this.files)"/>
                                    <label for="file">
                                        <div id="contenedorImagen" ondragenter="return enter(event)"
                                             ondragover="return over(event)" ondragleave="return leave(event)"
                                             ondrop="return drop(event)">
                                        </div>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="elemento">
                                        <table class="tableElementoText">
                                            <tr>
                                                <td class="celda">
                                                    <img width="30px" height="30px" src=<sptag:message code="src_img_user"/>>
                                                </td>
                                                <td class="celda">
                                                    <input type="text" name="apellidos" id="apellidos" size="30"
                                                           placeholder=<sptag:message code="placeholder_apellidos"/>
                                                           value="${candidato.apellidos}"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="elemento">
                                        <table class="tableElementoText">
                                            <tr>
                                                <td class="celda">
                                                    <img width="30px" height="30px" src=<sptag:message code="src_img_dni"/>>
                                                </td>
                                                <td class="celda">
                                                    <input type="text" name="dni" id="dni"
                                                           placeholder=<sptag:message code="placeholder_dni"/> value="${candidato.dni}"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="elemento">
                                        <label><sptag:message code="label_sexo"/></label>
                                        <c:if test="${candidato.sexo==null}">
                                            <input type="radio" name="sexo" value="hombre" id="hombre"
                                                   checked="checked"/>
                                            <label for="hombre"><sptag:message code="label_hombre"/></label>


                                            <input type="radio" name="sexo" value="mujer" id="mujer"/>
                                            <label for="mujer"><sptag:message code="label_mujer"/></label>
                                        </c:if>
                                        <c:if test="${candidato.sexo.equals('hombre')}">
                                            <input type="radio" name="sexo" value="hombre" id="hombre"
                                                   checked="checked"/>
                                            <label for="hombre"><sptag:message code="label_hombre"/></label>

                                            <input type="radio" name="sexo" value="mujer" id="mujer"/>
                                            <label for="mujer"><sptag:message code="label_mujer"/></label>
                                        </c:if>
                                        <c:if test="${candidato.sexo.equals('mujer')}">
                                            <input type="radio" name="sexo" value="hombre" id="hombre"/>
                                            <label for="hombre"><sptag:message code="label_hombre"/></label>

                                            <input type="radio" name="sexo" value="mujer" id="mujer" checked="checked"/>
                                            <label for="mujer"><sptag:message code="label_mujer"/></label>
                                        </c:if>


                                    </div>
                                </td>
                                <td class="celdaColumna2">
                                    <div class="elemento">
                                        <label><sptag:message code="label_edad"/></label>
                                        <span class='number-wrapper'>
                                            <c:if test="${candidato.edad==null}">
                                                <input type="number" name="edad" id="edad" min="1" max="90" value="18"/>
                                            </c:if>
                                            <c:if test="${candidato.edad!=null}">
                                                <input type="number" name="edad" id="edad" min="1" max="90" value="${candidato.edad}"/>
                                            </c:if>
                                         </span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="elemento">
                                        <table class="tableElementoText">
                                            <tr>
                                                <td class="celda">
                                                    <img width="30px" height="30px" src=<sptag:message code="src_img_email"/>>
                                                </td>
                                                <td class="celda">
                                                    <input type="text" name="email" id="email"
                                                           placeholder=<sptag:message code="placeholder_email"/> size="30"
                                                           value="${candidato.email}"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                                <td class="celdaColumna2">
                                    <div class="elemento">
                                        <table class="tableElementoText">
                                            <tr>
                                                <td class="celda">
                                                    <img width="30px" height="30px" src=<sptag:message code="src_img_phone"/>>
                                                </td>
                                                <td class="celda">
                                                    <input type="text" name="numeroTelefono" id="telefono"
                                                           placeholder=<sptag:message code="placeholder_telefono"/>
                                                           value="${candidato.numeroTelefono}"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <p id="errores"></p>
                                </td>
                            </tr>

                        </table>
                    </td>
                </tr>
                <tr>
                    <td id="celdaBotonGuardar">
                        <input type="submit" value="Guardar" class="botonGuardar"/>
                    </td>
                </tr>
            </table>

        </form>
    </section>

</main>

<script>
    function processFiles(files) {
        var file = files[0];
        var reader = new FileReader();
        reader.onload = function (e) {
            var output = document.getElementById("contenedorImagen");
            //output.style.backgroundImage = "url('" + e.target.result + "')";
            output.style.backgroundImage = "url('')";   //resetea fondo
            if (file.type == "application/pdf") {
                output.innerHTML = "<img src='images/pdf.png' width='80px' height='80px'/> " +
                    "<p id='nombreArchivo'>" + file.name + "</p>";
            } else {
                output.innerHTML = "<img src='images/doc.png' width='80px' height='80px'/> " +
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
        if (id == 'contenedorImagen') {
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
