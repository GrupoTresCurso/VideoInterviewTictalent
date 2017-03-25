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
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_formulario"/>/>
</head>
<body>
<main>
    <%@include file="menu.jsp" %>

    <section onclick="ocultarInfoUsuario()">
        <table>
            <tr>
                <td id="izquierda">
                    <div id="panelElementosPrincipal">
                        <div id="panelElementos" onclick="deseleccionar()">
                            <details id="detailsE" onclick="seleccionarTipoElementos(this.id)" open>
                                <summary id="summaryE"><b class="colorTictum"><sptag:message
                                        code="label_elemetos_title"/></b></summary>
                                <table>
                                    <tr>
                                        <td>
                                            <div class="texto contenedorElemento pertenecePanel" id="texto"
                                                 draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                 onclick="seleccionar(this.id)">
                                                <div class="contenedorIcono">
                                                    <img src=
                                                         <sptag:message code="src_img_icon_text"/> width="55px"
                                                         height="55px"><br/>
                                                    <label><sptag:message code="label_icon_campo_texto"/></label>
                                                </div>
                                                <div class="elemento">
                                                    <table class="tableElementoText">
                                                        <tr>
                                                            <td class="celda">
                                                                <img src=
                                                                     <sptag:message code="src_img_user"/> width="30px"
                                                                     height="30px">
                                                            </td>
                                                            <td class="celda">
                                                                <input type="text" placeholder=
                                                                <sptag:message
                                                                        code="placeholder_label_elemento"/> size="25"/>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="capaSuperior"></div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="area contenedorElemento pertenecePanel" id="area"
                                                 draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                 onclick="seleccionar(this.id)">
                                                <div class="contenedorIcono">
                                                    <img src=
                                                         <sptag:message code="src_img_icon_textarea"/> width="55px"
                                                         height="55px"><br/>
                                                    <label><sptag:message code="label_icon_area_texto"/></label>
                                                </div>
                                                <div class="elemento elementoGrande">
                                                    <table class="tableElementoText">
                                                        <tr>
                                                            <td>
                                                                <textarea rows="3" cols="50"
                                                                          placeholder="<sptag:message
                                                                        code="placeholder_label_elemento"/>"></textarea>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="capaSuperior"></div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="radio contenedorElemento pertenecePanel" id="radio"
                                                 draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                 onclick="seleccionar(this.id)">
                                                <div class="contenedorIcono">
                                                    <img src=
                                                         <sptag:message code="src_img_icon_radio"/> width="55px"
                                                         height="55px"><br/>
                                                    <label><sptag:message code="label_icon_boton_opcion"/></label>
                                                </div>
                                                <div class="elemento">
                                                    <b><label><sptag:message code="label_elemento"/></label>:</b><br/>
                                                    <table>
                                                        <tr>
                                                            <td class="celdaOpcion">
                                                                <input type="radio" name="opcion" id="opcionR1">
                                                                <label for="opcionR1"
                                                                       class="labelOpcionR1 opcion"><sptag:message
                                                                        code="label_opcion_1"/></label>
                                                            </td>
                                                            <td class="celdaOpcion">
                                                                <input type="radio" name="opcion" id="opcionR2">
                                                                <label for="opcionR2"
                                                                       class="labelOpcionR2 opcion"><sptag:message
                                                                        code="label_opcion_2"/></label>
                                                            </td>
                                                            <td class="celdaOpcion">
                                                                <input type="radio" name="opcion" id="opcionR3">
                                                                <label for="opcionR3"
                                                                       class="labelOpcionR3 opcion"><sptag:message
                                                                        code="label_opcion_3"/></label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="capaSuperior"></div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="checkbox contenedorElemento pertenecePanel" id="check"
                                                 draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                 onclick="seleccionar(this.id)">
                                                <div class="contenedorIcono">
                                                    <img src=
                                                         <sptag:message code="src_img_icon_checkbox"/> width="55px"
                                                         height="55px"><br/>
                                                    <label><sptag:message
                                                            code="label_icon_casilla_verificacion"/></label>
                                                </div>
                                                <div class="elemento elementoGrande">
                                                    <b><label><sptag:message code="label_elemento"/></label>:</b><br/>
                                                    <table>
                                                        <tr>
                                                            <td class="celdaOpcion">
                                                                <input type="checkbox" name="opcion" id="opcionCB1">
                                                                <label for="opcionCB1"
                                                                       class="labelOpcionCB1 opcion"><sptag:message
                                                                        code="label_opcion_1"/></label>
                                                            </td>
                                                            <td class="celdaOpcion">
                                                                <input type="checkbox" name="opcion" id="opcionCB2">
                                                                <label for="opcionCB2"
                                                                       class="labelOpcionCB2 opcion"><sptag:message
                                                                        code="label_opcion_2"/></label>
                                                            </td>
                                                            <td class="celdaOpcion">
                                                                <input type="checkbox" name="opcion" id="opcionCB3">
                                                                <label for="opcionCB3"
                                                                       class="labelOpcionCB3 opcion"><sptag:message
                                                                        code="label_opcion_3"/></label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="celdaOpcion">
                                                                <input type="checkbox" name="opcion" id="opcionCB4">
                                                                <label for="opcionCB4"
                                                                       class="labelOpcionCB4 opcion"><sptag:message
                                                                        code="label_opcion_4"/></label>
                                                            </td>
                                                            <td class="celdaOpcion">
                                                                <input type="checkbox" name="opcion" id="opcionCB5">
                                                                <label for="opcionCB5"
                                                                       class="labelOpcionCB5 opcion"><sptag:message
                                                                        code="label_opcion_5"/></label>
                                                            </td>
                                                            <td class="celdaOpcion">
                                                                <input type="checkbox" name="opcion" id="opcionCB6">
                                                                <label for="opcionCB6"
                                                                       class="labelOpcionCB6 opcion"><sptag:message
                                                                        code="label_opcion_6"/></label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="capaSuperior"></div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="select contenedorElemento pertenecePanel" id="select"
                                                 draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                 onclick="seleccionar(this.id)">
                                                <div class="contenedorIcono">
                                                    <img src=
                                                         <sptag:message code="src_img_icon_select"/> width="55px"
                                                         height="55px"><br/>
                                                    <label><sptag:message code="label_icon_lista_desplegable"/></label>
                                                </div>
                                                <div class="elemento elementoPequenio">
                                                    <b><label class="labelLinea"><sptag:message
                                                            code="label_elemento"/></label>:</b>
                                                    <span class="select-wrapper">
                                                        <select>
                                                            <option value="opcion1" class="opcionSelect1"><sptag:message
                                                                    code="label_opcion_1"/></option>
                                                            <option value="opcion2" class="opcionSelect2"><sptag:message
                                                                    code="label_opcion_2"/></option>
                                                            <option value="opcion3" class="opcionSelect3"><sptag:message
                                                                    code="label_opcion_3"/></option>
                                                        </select>
                                                    </span>
                                                </div>
                                                <div class="capaSuperior"></div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="file contenedorElemento pertenecePanel" id="file"
                                                 draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                 onclick="seleccionar(this.id)">
                                                <div class="contenedorIcono">
                                                    <img src="images/icon_upload.png" width="55px" height="55px"><br/>
                                                    Adjuntar archivo
                                                </div>
                                                <div class="elemento elementoMuyGrande">
                                                    <b><label><sptag:message
                                                            code="label_elemento"/></label>:</b><br/><br/>
                                                    <input type="file" name="etiqueta" id="addfile"/>
                                                    <label for="addfile" id="labelAddFile">
                                                        <div id="contenedorAdjuntos">
                                                            <img src="images/icon_upload.png" width="60px"
                                                                 height="60px"><br/>
                                                            <label>Arrastrar y soltar archivo</label><br/>
                                                            <label>o seleccionar archivo</label>
                                                        </div>
                                                    </label>
                                                </div>
                                                <div class="capaSuperior"></div>
                                            </div>
                                        </td>
                                    </tr>

                                </table>
                            </details>
                            <br/>
                            <details id="detailsEP" onclick="seleccionarTipoElementos(this.id)">
                                <summary><b class="colorTictum"><sptag:message
                                        code="label_elemetos_predefinidos_title"/></b></summary>
                                <table id="tableElementosPredefinidos">









                                    <c:set var="count" value="0" scope="page"/>
                                    <c:set var="countCierre" value="0" scope="page"/>
                                    <c:if test="${count == 0}">
                                    </c:if>
                                    <c:forEach var="pregunta" items="${listaPreguntasPredefinidas}">
                                        <c:if test="${count == 0}">
                                            <c:set var="countCierre" value="1" scope="page"/>
                                            <tr>
                                        </c:if>
                                        <c:set var="count" value="${count + 1}" scope="page"/>
                                        <c:if test="${pregunta.tipoPregunta == 'text'}">

                                            <td>
                                                <div class="texto contenedorElemento pertenecePanel"
                                                     id="p_${pregunta.idPregunta}"
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
                                                </div>
                                            </td>
                                        </c:if>
                                        <c:if test="${pregunta.tipoPregunta == 'radio'}">
                                            <c:set var="opcionesComas" value="${pregunta.opciones}"/>
                                            <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                                            <td>
                                                <div class="radio contenedorElemento pertenecePanel"
                                                     id="p_${pregunta.idPregunta}"
                                                     draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                     onclick="seleccionar(this.id)">
                                                    <div class="contenedorIcono">
                                                        <img src="images/icon_radio.png" width="55px"
                                                             height="55px"><br/>
                                                        <label>${pregunta.labelPregunta}</label>
                                                    </div>
                                                    <div class="elemento elementoPredefinido">
                                                        <b><label>${pregunta.labelPregunta}</label>:</b><br/>
                                                        <c:forEach var="opcion" items="${opciones}">
                                                            <input type="radio">
                                                            <label class="opcion">${opcion}</label>
                                                        </c:forEach>
                                                    </div>
                                                    <div class="capaSuperior"></div>
                                                </div>
                                            </td>
                                        </c:if>
                                        <c:if test="${pregunta.tipoPregunta == 'checkbox'}">
                                            <c:set var="opcionesComas" value="${pregunta.opciones}"/>
                                            <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>

                                            <td>
                                                <div class="checkbox contenedorElemento pertenecePanel"
                                                     id="p_${pregunta.idPregunta}"
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
                                                        <b><label>${pregunta.labelPregunta}</label>:</b><br/>
                                                        <table>
                                                            <c:set var="count2" value="0" scope="page"/>
                                                            <c:set var="countCierre2" value="0" scope="page"/>
                                                            <c:forEach var="opcion" items="${opciones}">
                                                                <c:if test="${count2 == 0}">
                                                                    <c:set var="countCierre2" value="1" scope="page"/>
                                                                    <tr>
                                                                </c:if>
                                                                <td class="celdaOpcion">
                                                                    <input type="checkbox">
                                                                    <label class="labelOpcionCB1 opcion">${opcion}"</label>
                                                                </td>
                                                                <c:if test="${count2 == 3}">
                                                                    </tr>
                                                                    <c:set var="count2" value="0" scope="page"/>
                                                                    <c:set var="countCierre2" value="0" scope="page"/>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${countCierre2 == 1}">
                                                                </tr>
                                                                <c:set var="countCierre2" value="0" scope="page"/>
                                                            </c:if>
                                                        </table>
                                                    </div>
                                                    <div class="capaSuperior"></div>
                                                </div>
                                            </td>
                                        </c:if>
                                        <c:if test="${pregunta.tipoPregunta == 'area'}">
                                            <td>
                                                <div class="area contenedorElemento pertenecePanel"
                                                     id="p_${pregunta.idPregunta}"
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
                                                                <textarea rows="5" cols="50"
                                                                          placeholder=${pregunta.labelPregunta}> </textarea>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="capaSuperior"></div>
                                                </div>
                                            </td>
                                        </c:if>
                                        <c:if test="${pregunta.tipoPregunta == 'select'}">
                                            <c:set var="opcionesComas" value="${pregunta.opciones}"/>
                                            <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>

                                            <td>
                                                <div class="select contenedorElemento pertenecePanel"
                                                     id="p_${pregunta.idPregunta}"
                                                     draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                     onclick="seleccionar(this.id)">
                                                    <div class="contenedorIcono">
                                                        <img src=
                                                                 <sptag:message
                                                                         code="src_img_icon_select"/> width="55px"
                                                             height="55px"><br/>
                                                        <label>${pregunta.labelPregunta}</label>
                                                    </div>
                                                    <div class="elemento elementoPequenio elementoPredefinido">
                                                        <b><label class="labelLinea">${pregunta.labelPregunta}</label>:</b>
                                                        <span class="select-wrapper">
                                                        <select>
                                                            <c:forEach var="opcion" items="${opciones}">
                                                                <option>${opcion}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </span>
                                                    </div>
                                                    <div class="capaSuperior"></div>
                                                </div>
                                            </td>
                                        </c:if>
                                        <c:if test="${pregunta.tipoPregunta == 'file'}">
                                            <td>
                                                <div class="file contenedorElemento pertenecePanel" id="p_${pregunta.idPregunta}"
                                                     draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                     onclick="seleccionar(this.id)">
                                                    <div class="contenedorIcono">
                                                        <img src="images/icon_upload.png" width="55px" height="55px"><br/>
                                                        Adjuntar archivo
                                                    </div>
                                                    <div class="elemento elementoMuyGrande elementoPredefinido">
                                                        <b><label>${pregunta.labelPregunta}</label>:</b><br/><br/>
                                                        <input type="file" name="etiqueta" />
                                                        <label for="addfile" >
                                                            <div >
                                                                <img src="images/icon_upload.png" width="60px"
                                                                     height="60px"><br/>
                                                                <label>Arrastrar y soltar archivo</label><br/>
                                                                <label>o seleccionar archivo</label>
                                                            </div>
                                                        </label>
                                                    </div>
                                                    <div class="capaSuperior"></div>
                                                </div>
                                            </td>
                                        </c:if>

                                        <c:if test="${count == 2}">
                                            </tr>
                                            <c:set var="count" value="0" scope="page"/>
                                            <c:set var="countCierre" value="0" scope="page"/>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${countCierre == 1}">
                                        </tr>
                                        <c:set var="countCierre" value="0" scope="page"/>
                                    </c:if>
                                </table>
                            </details>
                        </div>
                        <!--  <div id="panelElementosBloqueo">
                        </div>-->
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
                                    <hr/>
                                    <br/>
                                    <div class="label contenedorElemento" id="etiqueta1" draggable="true"
                                         ondragstart="start(event)" ondragend="end(event)"
                                         onclick="seleccionar(this.id)">
                                        <div class="elemento elementoPequenio elementoLabel">
                                            <b><label id="etiquetaLabel"><sptag:message
                                                    code="label_formulario_title"/></label></b>
                                        </div>
                                    </div>
                                    <br/>
                                    <div id="contenedorElementosFormulario">
                                        <c:set var="countPredef" value="0" scope="page"/>






                                        <c:if test="${formulario != null}">
                                            <input type="hidden" size="20" name="idFormulario" value="${formulario.idFormulario}"/>

                                        <c:forEach var="pregunta" items="${formulario.preguntas}">
                                            <c:set var="countPredef" value="${countPredef + 1}" scope="page"/>
                                            <c:if test="${pregunta.tipoPregunta == 'text'}">


                                                <div class="texto contenedorElemento pertenecePanel"
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

                                                <div class="radio contenedorElemento pertenecePanel"
                                                     id="p_${countPredef}_${pregunta.idPregunta}"
                                                     draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                     onclick="seleccionar(this.id)">
                                                    <div class="contenedorIcono">
                                                        <img src="images/icon_radio.png" width="55px"
                                                             height="55px"><br/>
                                                        <label>${pregunta.labelPregunta}</label>
                                                    </div>
                                                    <div class="elemento elementoPredefinido">
                                                        <b><label>${pregunta.labelPregunta}</label>:</b><br/>
                                                        <c:forEach var="opcion" items="${opciones}">
                                                            <input type="radio">
                                                            <label class="opcion">${opcion}</label>
                                                        </c:forEach>
                                                    </div>
                                                    <div class="capaSuperior"></div>
                                                    <input type="hidden" size="20" name="identificadoresDDBB[${countPredef}].id" value="${pregunta.idPregunta}"/>
                                                </div>

                                            </c:if>
                                            <c:if test="${pregunta.tipoPregunta == 'radio'}">
                                                <c:set var="opcionesComas" value="${pregunta.opciones}"/>
                                                <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>

                                                <div class="radio contenedorElemento pertenecePanel"
                                                     id="p_${countPredef}_${pregunta.idPregunta}"
                                                     draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                     onclick="seleccionar(this.id)">
                                                    <div class="contenedorIcono">
                                                        <img src="images/icon_radio.png" width="55px"
                                                             height="55px"><br/>
                                                        <label>${pregunta.labelPregunta}</label>
                                                    </div>
                                                    <div class="elemento elementoPredefinido">
                                                        <b><label>${pregunta.labelPregunta}</label>:</b><br/>
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

                                                <div class="checkbox contenedorElemento pertenecePanel"
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
                                                        <b><label>${pregunta.labelPregunta}</label>:</b><br/>
                                                        <table>
                                                            <c:set var="count3" value="0" scope="page"/>
                                                            <c:set var="countCierre3" value="0" scope="page"/>
                                                            <c:forEach var="opcion" items="${opciones}">
                                                                <c:if test="${count3 == 0}">
                                                                    <c:set var="countCierre3" value="1" scope="page"/>
                                                                    <tr>
                                                                </c:if>
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

                                                <div class="area contenedorElemento pertenecePanel"
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
                                                                    <textarea rows="5" cols="50" placeholder=${pregunta.labelPregunta}> </textarea>
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


                                                <div class="select contenedorElemento pertenecePanel"
                                                     id="p_${countPredef}_${pregunta.idPregunta}"
                                                     draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                     onclick="seleccionar(this.id)">
                                                    <div class="contenedorIcono">
                                                        <img src=
                                                                 <sptag:message
                                                                         code="src_img_icon_select"/> width="55px"
                                                             height="55px"><br/>
                                                        <label>${pregunta.labelPregunta}</label>
                                                    </div>
                                                    <div class="elemento elementoPequenio elementoPredefinido">
                                                        <b><label class="labelLinea">${pregunta.labelPregunta}</label>:</b>
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

                                                <div class="file contenedorElemento pertenecePanel" id="p_${countPredef}_${pregunta.idPregunta}"
                                                     draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                     onclick="seleccionar(this.id)">
                                                    <div class="contenedorIcono">
                                                        <img src="images/icon_upload.png" width="55px" height="55px"><br/>
                                                        Adjuntar archivo
                                                    </div>
                                                    <div class="elemento elementoMuyGrande elementoPredefinido">
                                                        <b><label>${pregunta.labelPregunta}</label>:</b><br/><br/>
                                                        <input type="file" name="etiqueta" />
                                                        <label for="addfile" >
                                                            <div >
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









                                    </div>

                                    <br/>
                                    <!--
                                    <button id="btnLimpiar" class="botonGuardar btnForm" disabled>Limpiar</button>
                                    <button class="botonGuardar btnForm" disabled>Guardar</button>
                                    -->
                                </form:form>
                            </div>
                        </div>
                    </div>
                </td>
                <td id="derecha">
                    <h5 class="colorTictum"><sptag:message code="label_propiedades_title"/></h5>
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
                                                <input type="number" name="opciones" id="opcionesPropiedades" min="1"
                                                       onchange="crearOpciones();actualizarOpciones();"/>
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
                            <input type="checkbox" id="checkPredefinido" onchange="agregarAPredefinidos()">
                        </div>
                    </div>
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
</body>
</html>
