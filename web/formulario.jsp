<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sptag" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
    <title><sptag:message code="app_title"/></title>
    <link rel="stylesheet" type="text/css" href="./styles/estilos_menu.css">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_formulario"/>/>
</head>
<body>
<main>
    <%@include file="menu.jsp" %>
    <input type="hidden" value="Formulario" id="enlaceActivo"/>
    <section onclick="ocultarInfoUsuario()">
        <table>
            <tr>
                <td id="izquierda">
                    <div id="panelElementosPrincipal">
                        <div id="panelElementos" onclick="deseleccionar()">
                            <%@include file="details_elementos.jsp" %>
                            <br/>
                            <%@include file="details_elementos_predefinidos.jsp" %>
                        </div>
                    </div>
                </td>
                <td id="medio">
                    <div id="contenedor" ondragenter="return enter(event)" ondragover="return over(event)"
                         ondragleave="return leave(event)" ondrop="return drop(event)">
                        <div id="estadoContenedor">
                            <div id="mensajeDefecto">
                                <br/>
                                <h4 class="colorTictum"><sptag:message code="label_contenedor_title"/></h4><br/><br/>
                                <p><sptag:message code="label_contenedor_defecto_message"/></p>
                            </div>
                            <div id="nuevoForm">
                                <form:form id="nuevoFormulario"
                                           action="${pageContext.request.contextPath}/crearFormulario.do" method="GET"
                                           modelAttribute="preguntaForm">
                                    <c:if test="${formulario.nombreFormulario == null}">
                                        <input type="text" name="nombreFormulario" class="nombreFormulario" placeholder=<sptag:message code="placeholder_nombre_formulario"/> size="35"/>
                                    </c:if>
                                    <c:if test="${formulario.nombreFormulario != null}">
                                        <input type="text" name="nombreFormulario" class="nombreFormulario" value="${formulario.nombreFormulario}" placeholder=<sptag:message code="placeholder_nombre_formulario"/> size="35"/>
                                    </c:if>

                                    <button type="submit" class="botonGuardar"><sptag:message
                                            code="button_guardar"/></button>
                                    <br/><br/>
                                    <br/>
                                    <br/>
                                    <div id="contenedorElementosFormulario">
                                        <c:set var="countPredef" value="0" scope="page"/>
                                        <c:set var="formularioCargado" value="0" scope="page"/>


                                        <c:if test="${formulario != null}">
                                            <c:set var="formularioCargado" value="1" scope="page"/>
                                            <input type="hidden" size="20" name="idFormulario" value="${formulario.idFormulario}"/>

                                            <c:forEach var="pregunta" items="${formulario.preguntas}">
                                                <c:set var="countPredef" value="${countPredef + 1}" scope="page"/>
                                                <c:if test="${pregunta.tipoPregunta == 'text'}">
                                                    <div class="texto contenedorElemento pertenecePanel elementoCargado"
                                                         id="p_${countPredef}_${pregunta.idPregunta}"
                                                         draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                         onclick="seleccionar(this.id)">
                                                        <div class="contenedorIcono">
                                                            <img src="images/icon_text.png" width="55px" height="55px"><br/>
                                                            <label>${pregunta.labelPregunta}</label>
                                                        </div>
                                                        <div class="elemento elementoPredefinido">
                                                            <table class="tableElementoText">
                                                                <tr>
                                                                    <td class="celda">
                                                                        <img src="images/user.png" width="30px"
                                                                             height="30px">
                                                                    </td>
                                                                    <td class="celda">
                                                                        <input type="text"
                                                                               placeholder="${pregunta.labelPregunta}"
                                                                               size="22"/>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div class="capaSuperior"></div>
                                                        <input type="hidden" size="20" name="identificadoresDDBB[${countPredef}].id" value="${pregunta.idPregunta}"/>
                                                    </div>
                                                </c:if>
                                                <c:if test="${pregunta.tipoPregunta == 'radio'}">
                                                    <c:set var="opcionesComas" value="${pregunta.opciones}"/>
                                                    <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                                    <div class="radio contenedorElemento pertenecePanel elementoCargado"
                                                         id="p_${countPredef}_${pregunta.idPregunta}"
                                                         draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                         onclick="seleccionar(this.id)">
                                                        <div class="contenedorIcono">
                                                            <img src="images/icon_radio.png" width="55px"
                                                                 height="55px"><br/>
                                                            <label>${pregunta.labelPregunta}</label>
                                                        </div>
                                                        <div class="elemento elementoPredefinido">
                                                            <b><label>${pregunta.labelPregunta}</label></b><br/>
                                                            <c:forEach var="opcion" items="${opciones}">
                                                                <input type="radio">
                                                                <label class="opcion">${opcion}</label>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="capaSuperior"></div>
                                                        <input type="hidden" size="20" name="identificadoresDDBB[${countPredef}].id" value="${pregunta.idPregunta}"/>
                                                    </div>
                                                </c:if>
                                                <c:if test="${pregunta.tipoPregunta == 'checkbox'}">
                                                    <c:set var="opcionesComas" value="${pregunta.opciones}"/>
                                                    <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                                    <div class="checkbox contenedorElemento pertenecePanel elementoCargado"
                                                         id="p_${countPredef}_${pregunta.idPregunta}"
                                                         draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                         onclick="seleccionar(this.id)">
                                                        <div class="contenedorIcono">
                                                            <img src=
                                                                     <sptag:message
                                                                             code="src_img_icon_checkbox"/> width="55px"
                                                                 height="55px"><br/>
                                                            <label>${pregunta.labelPregunta}</label>
                                                        </div>
                                                        <div class="elemento elementoGrande elementoPredefinido">
                                                            <b><label>${pregunta.labelPregunta}</label></b><br/>
                                                            <table>
                                                                <c:set var="count3" value="0" scope="page"/>
                                                                <c:set var="countCierre3" value="0" scope="page"/>
                                                                <c:forEach var="opcion" items="${opciones}">
                                                                    <c:if test="${count3 == 0}">
                                                                        <c:set var="countCierre3" value="1" scope="page"/>
                                                                        <tr>
                                                                    </c:if>
                                                                    <c:set var="count3" value="${count3 + 1}" scope="page"/>
                                                                    <td class="celdaOpcion">
                                                                        <input type="checkbox">
                                                                        <label class="labelOpcionCB1 opcion">${opcion}"</label>
                                                                    </td>
                                                                    <c:if test="${count3 == 3}">
                                                                        </tr>
                                                                        <c:set var="count3" value="0" scope="page"/>
                                                                        <c:set var="countCierre3" value="0" scope="page"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${countCierre3 == 1}">
                                                                    </tr>
                                                                    <c:set var="countCierre3" value="0" scope="page"/>
                                                                </c:if>
                                                            </table>
                                                        </div>
                                                        <div class="capaSuperior"></div>
                                                        <input type="hidden" size="20" name="identificadoresDDBB[${countPredef}].id" value="${pregunta.idPregunta}"/>
                                                    </div>
                                                </c:if>
                                                <c:if test="${pregunta.tipoPregunta == 'area'}">
                                                    <div class="area contenedorElemento pertenecePanel elementoCargado"
                                                         id="p_${countPredef}_${pregunta.idPregunta}"
                                                         draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                         onclick="seleccionar(this.id)">
                                                        <div class="contenedorIcono">
                                                            <img src=
                                                                     <sptag:message
                                                                             code="src_img_icon_textarea"/> width="55px"
                                                                 height="55px"><br/>
                                                            <label>${pregunta.labelPregunta}</label>
                                                        </div>
                                                        <div class="elemento elementoGrande elementoPredefinido">
                                                            <table class="tableElementoText">
                                                                <tr>
                                                                    <td>
                                                                        <textarea rows="5" cols="50" placeholder="${pregunta.labelPregunta}"></textarea>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div class="capaSuperior"></div>
                                                        <input type="hidden" size="20" name="identificadoresDDBB[${countPredef}].id" value="${pregunta.idPregunta}"/>
                                                    </div>
                                                </c:if>
                                                <c:if test="${pregunta.tipoPregunta == 'select'}">
                                                    <c:set var="opcionesComas" value="${pregunta.opciones}"/>
                                                    <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                                    <div class="select contenedorElemento pertenecePanel elementoCargado"
                                                         id="p_${countPredef}_${pregunta.idPregunta}"
                                                         draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                         onclick="seleccionar(this.id)">
                                                        <div class="contenedorIcono">
                                                            <img src=<sptag:message code="src_img_icon_select"/> width="55px" height="55px"><br/>
                                                            <label>${pregunta.labelPregunta}</label>
                                                        </div>
                                                        <div class="elemento elementoPequenio elementoPredefinido">
                                                            <b><label class="labelLinea">${pregunta.labelPregunta}</label></b>
                                                            <span class="select-wrapper">
                                                                <select>
                                                                    <c:forEach var="opcion" items="${opciones}">
                                                                        <option>${opcion}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </span>
                                                        </div>
                                                        <div class="capaSuperior"></div>
                                                        <input type="hidden" size="20" name="identificadoresDDBB[${countPredef}].id" value="${pregunta.idPregunta}"/>
                                                    </div>
                                                </c:if>
                                                <c:if test="${pregunta.tipoPregunta == 'file'}">
                                                    <div class="file contenedorElemento pertenecePanel elementoCargado"
                                                         id="p_${countPredef}_${pregunta.idPregunta}"
                                                         draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                         onclick="seleccionar(this.id)">
                                                        <div class="contenedorIcono">
                                                            <img src="images/icon_upload.png" width="55px" height="55px"><br/>
                                                            Adjuntar archivo
                                                        </div>
                                                        <div class="elemento elementoMuyGrande elementoPredefinido">
                                                            <b><label>${pregunta.labelPregunta}</label></b><br/>
                                                            <input type="file" name="etiqueta" id="addfile"/>
                                                            <label for="addfile" class="labelAddFile">
                                                                <div class="contenedorAdjuntos">
                                                                    <img src="images/icon_upload.png" width="60px"
                                                                         height="60px"><br/>
                                                                    <label>Arrastrar y soltar archivo</label><br/>
                                                                    <label>o seleccionar archivo</label>
                                                                </div>
                                                            </label>
                                                        </div>
                                                        <div class="capaSuperior"></div>
                                                        <input type="hidden" size="20" name="identificadoresDDBB[${countPredef}].id" value="${pregunta.idPregunta}"/>
                                                    </div>
                                                </c:if>
                                            </c:forEach>

                                        </c:if>
                                        <input type="hidden" size="20" id="valorCountPredef" value="${countPredef}"/>
                                        <input type="hidden" size="20" id="formularioCargado" value="${formularioCargado}"/>
                                    </div>

                                    <br/>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </td>
                <td id="derecha">
                    <h5 class="colorTictum"><sptag:message code="label_propiedades_title"/></h5>
                    <form id="agregarFavorita" novalidate action="${pageContext.request.contextPath}/guardarPreguntaFavorita.do" method="post">
                        <div id="propiedades">
                            <div id="contenedorPropiedadesDefecto"><br/><br/>
                                <p id="mensajePropiedadesDefecto"><sptag:message
                                        code="label_propiedades_defecto_message"/></p></div>
                            <div id="contenedorEtiqueta">
                                <table>
                                    <tr>
                                        <td><p><sptag:message code="label_propiedades_etiqueta"/></p></td>
                                        <td><input type="text" name="etiqueta" id="etiquetaPropiedades" size="25"
                                                   onblur="actualizarEtiqueta()"/></td>
                                    </tr>
                                </table>
                            </div>
                            <br/>
                            <div id="contenedorOpciones">
                                <table>
                                    <tr>
                                        <td><p><sptag:message code="label_propiedades_num_opciones"/></p></td>
                                        <td>
                                            <div id="contenedorNumber">
                                                <span class='number-wrapper' id="spanOpciones">
                                                    <input type="number" name="asd" id="opcionesPropiedades" min="1" onchange="crearOpciones();actualizarOpciones();"/>
                                                </span>
                                                <div id="cubiertaEntradaNumero">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <table id="tableOpciones">
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <br/>
                            <div id="contenedorActivarPredefinido">
                                <label><sptag:message code="label_propiedades_predefinido"/></label>
                                <button type="submit" id="checkPredefinido" onchange="agregarAPredefinidos()">Agregar</button>
                            </div>
                        </div>
                        <input id="a" type="hidden" name="labelPregunta" value="PruebaAjax"/>
                        <input id="b" type="hidden" name="tipoPregunta" value="text"/>
                        <input id="c" type="hidden" name="opciones" value="asd"/>
                    </form>
                    <div id="eliminar" onclick="deseleccionar()">
                        <p><sptag:message code="label_papelera_message"/></p><br/>
                        <div id="papelera" ondragenter="return enter(event)" ondragover="return overPapelera(event)"
                             ondragleave="return leavePapelera(event)" ondrop="return dropPapelera(event)">
                            <img id="imagenPapelera" src=
                            <sptag:message code="src_img_papelera_close"/> width="150px" height="150px"
                                 draggable="false">
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <%@include file="userInfo.jsp" %>
    </section>
</main>
<script type='text/javascript' src="js/formulario.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#agregarFavorita').submit(
            function(event) {
                $('#a').val(elementoSeleccionado.querySelectorAll('.inputLabelPregunta')[0].value);
                $('#b').val(elementoSeleccionado.querySelectorAll('.inputTipoPregunta')[0].value);
                $('#c').val(elementoSeleccionado.querySelectorAll('.inputOpciones')[0].value);

                var labelPregunta = $('#a').val();
                var tipoPregunta = $('#b').val();
                var opciones = $('#c').val();

                var data = 'labelPregunta='
                    + encodeURIComponent(labelPregunta)
                    + '&tipoPregunta='
                    + encodeURIComponent(tipoPregunta)
                    + '&opciones='
                    + encodeURIComponent(opciones);
                $.ajax({
                    url : $("#agregarFavorita").attr("action"),
                    data : data,
                    cache: false,
                    type : "POST",

                    success : function(response) {
                        lista=response;
                        /*var lista=JSON.parse(response);*/
                        var tablePreguntasPredef=document.getElementById("tableElementosPredefinidos");
                        tablePreguntasPredef.innerHTML="";
                        var contenido="";

                        var kount=0;
                        var kountCierre=0;

                        for(var i=0;i<lista.length;i++){
                            if(kount==0){
                                kountCierre=1;
                                contenido=contenido+"<tr>";
                            }
                            kount++;

                            if(lista[i].tipoPregunta=='text'){
                                contenido=contenido+
                                    "<td>"+
                                        "<div class='texto contenedorElemento pertenecePanel pertenecePanelPredefinido' id='p_"+lista[i].idPregunta+"' draggable='true' ondragstart='start(event)' ondragend='end(event)' onclick='seleccionar(this.id)'>"+
                                            "<div class='contenedorIcono'>"+
                                                "<img src='images/icon_text.png' width='55px' height='55px'><br/>"+
                                                "<label>"+lista[i].labelPregunta+"</label>"+
                                            "</div>"+
                                            "<div class='elemento elementoPredefinido elementoAjax'>"+
                                                "<table class='tableElementoText'>"+
                                                    "<tr>"+
                                                        "<td class='celda'>"+
                                                            "<img src='images/user.png' width='30px' height='30px'>"+
                                                        "</td>"+
                                                        "<td class='celda'>"+
                                                            "<input type='text' placeholder='"+lista[i].labelPregunta+"' size='22'/>"+
                                                        "</td>"+
                                                    "</tr>"+
                                                "</table>"+
                                            "</div>"+
                                            "<div class='capaSuperior'></div>"+
                                        "</div>"+
                                    "</td>";
                            }
                            if(lista[i].tipoPregunta=='radio'){
                                var opcionesComas=lista[i].opciones;
                                var opciones=opcionesComas.split(",");
                                var prepInerOpciones="";

                                for(var opcion in opciones){
                                    prepInerOpciones=prepInerOpciones+
                                            "<input type='radio'>"+
                                            "<label class='opcion'>"+opcion+"</label>";
                                }

                                contenido=contenido+
                                    "<td>"+
                                        "<div class='radio contenedorElemento pertenecePanel pertenecePanelPredefinido' id='p_"+lista[i].idPregunta+"' draggable='true' ondragstart='start(event)' ondragend='end(event)' onclick='seleccionar(this.id)'>"+
                                            "<div class='contenedorIcono'>"+
                                                "<img src='images/icon_radio.png' width='55px' height='55px'><br/>"+
                                                "<label>"+lista[i].labelPregunta+"</label>"+
                                            "</div>"+
                                            "<div class='elemento elementoPredefinido elementoAjax'>"+
                                                "<b><label>"+lista[i].labelPregunta+"</label></b><br/>"+
                                                prepInerOpciones+
                                            "</div>"+
                                            "<div class='capaSuperior'></div>"+
                                        "</div>"+
                                    "</td>";





                            }
                            if(lista[i].tipoPregunta=='checkbox'){
                                var opcionesComas=lista[i].opciones;
                                var opciones=opcionesComas.split(",");
                                var prepInerOpciones="";
                                var kount2=0;
                                var kountCierre2=0;

                                for(var opcion in opciones){
                                    if(kount2==0){
                                        kountCierre2=1;
                                        prepInerOpciones=prepInerOpciones+"<tr>";
                                    }
                                    kount2++;
                                    prepInerOpciones=prepInerOpciones+"<td class='celdaOpcion'>"+
                                            "<input type='checkbox'>"+
                                            "<label class='labelOpcionCB1 opcion'>"+opcion+"</label></td>";
                                    if(kount2==3){
                                        prepInerOpciones=prepInerOpciones+"</tr>";
                                        kount2=0;
                                        kountCierre2=0;
                                    }

                                }
                                if(kountCierre2==1){
                                    prepInerOpciones=prepInerOpciones+"</tr>";
                                }

                                contenido=contenido+
                                    "<td>"+
                                        "<div class='checkbox contenedorElemento pertenecePanel pertenecePanelPredefinido' id='p_"+lista[i].idPregunta+"' draggable='true' ondragstart='start(event)' ondragend='end(event)' onclick='seleccionar(this.id)'>"+
                                            "<div class='contenedorIcono'>"+
                                                "<img src='images/icon_checkbox.png' width='55px' height='55px'><br/>"+
                                                "<label>"+lista[i].labelPregunta+"</label>"+
                                            "</div>"+
                                            "<div class='elemento elementoGrande elementoPredefinido elementoAjax'>"+
                                                "<b><label>"+lista[i].labelPregunta+"</label></b><br/>"+
                                                "<table>"+
                                                    prepInerOpciones+
                                                "</table>"+
                                            "</div>"+
                                            "<div class='capaSuperior'></div>"+
                                        "</div>"+
                                    "</td>";
                            }
                            if(lista[i].tipoPregunta=='area'){
                                contenido=contenido+
                                    "<td>"+
                                        "<div class='area contenedorElemento pertenecePanel pertenecePanelPredefinido' id='p_"+lista[i].idPregunta+"' draggable='true' ondragstart='start(event)' ondragend='end(event)' onclick='seleccionar(this.id)'>"+
                                            "<div class='contenedorIcono'>"+
                                                "<img src='images/icon_textarea.png' width='55px' height='55px'><br/>"+
                                                "<label>"+lista[i].labelPregunta+"</label>"+
                                            "</div>"+
                                            "<div class='elemento elementoGrande elementoPredefinido elementoAjax'>"+
                                                "<table class='tableElementoText'>"+
                                                    "<tr><td><textarea rows='5' cols='50' placeholder='"+lista[i].labelPregunta+"'></textarea></td></tr>"+
                                                "</table>"+
                                            "</div>"+
                                            "<div class='capaSuperior'></div>"+
                                        "</div>"+
                                    "</td>";
                            }
                            if(lista[i].tipoPregunta=='select'){
                                var opcionesComas=lista[i].opciones;
                                var opciones=opcionesComas.split(",");
                                var prepInerOpciones="";

                                for(var opcion in opciones){
                                    prepInerOpciones=prepInerOpciones+"<option>"+opcion+"</option>"
                                }
                                contenido=contenido+
                                    "<td>"+
                                        "<div class='select contenedorElemento pertenecePanel pertenecePanelPredefinido' id='p_"+lista[i].idPregunta+"' draggable='true' ondragstart='start(event)' ondragend='end(event)' onclick='seleccionar(this.id)'>"+
                                            "<div class='contenedorIcono'>"+
                                                "<img src='images/icon_select.png' width='55px' height='55px'><br/>"+
                                                "<label>"+lista[i].labelPregunta+"</label>"+
                                            "</div>"+
                                            "<div class='elemento elementoPequenio elementoPredefinido elementoAjax'>"+
                                                "<b><label class='labelLinea'>"+lista[i].labelPregunta+"</label></b>"+
                                                "<span class='select-wrapper'>"+
                                                    "<select>"+
                                                        prepInerOpciones+
                                                    "</select>"+
                                                "</span>"+
                                            "</div>"+
                                            "<div class='capaSuperior'></div>"+
                                        "</div>"+
                                    "</td>";
                            }

                            if(lista[i].tipoPregunta=='select'){
                                contenido=contenido+
                                    "<td>"+
                                        "<div class='file contenedorElemento pertenecePanel pertenecePanelPredefinido' id='p_"+lista[i].idPregunta+"' draggable='true' ondragstart='start(event)' ondragend='end(event)' onclick='seleccionar(this.id)'>"+
                                            "<div class='contenedorIcono'>"+
                                                "<img src='images/icon_upload.png' width='55px' height='55px'><br/>"+
                                                "Adjuntar archivo"+
                                            "</div>"+
                                            "<div class='elemento elementoMuyGrande elementoPredefinido elementoAjax'>"+
                                                "<b><label>"+lista[i].labelPregunta+"</label></b><br/><br/>"+
                                                "<input type='file' name='etiqueta' id='addfile'/>"+
                                                "<label for='addfile' class='labelAddFile'>"+
                                                    "<div class='contenedorAdjuntos'>"+
                                                        "<img src='images/icon_upload.png' width='60px' height='60px'><br/>"+
                                                        "<label>Arrastrar y soltar archivo</label><br/>"+
                                                        "<label>o seleccionar archivo</label>"+
                                                    "</div>"+
                                                "</label>"+
                                            "</div>"+
                                            "<div class='capaSuperior'></div>"+
                                        "</div>"+
                                    "</td>";
                            }
                            if(kount==1){
                                contenido=contenido+"</tr>";
                                kount=0;
                                kountCierre=0;
                            }
                        }
                        if(kountCierre==1){
                            contenido=contenido+"</tr>";

                        }
                        tablePreguntasPredef.innerHTML=contenido;
                    },
                    error : function(xhr, status, error) {
                        alert(xhr.responseText);
                    }
                });
                return false;
            });
    });
    var elementosAjax = document.querySelectorAll('.elementoAjax');
    for(var i=0; i<elementosAjax.length; i++){
        elementosAjax[i].style.display = 'none';
    }
</script>

</body>
</html>


