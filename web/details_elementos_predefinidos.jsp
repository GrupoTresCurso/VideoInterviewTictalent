<%@ taglib prefix="sptag" uri="http://www.springframework.org/tags" %>

<details id="detailsEP" onclick="seleccionarTipoElementos(this.id)">
    <summary>
        <b class="colorTictum"><sptag:message code="label_elemetos_predefinidos_title"/></b>
    </summary>
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
                    <div class="texto contenedorElemento pertenecePanel pertenecePanelPredefinido"
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
                                        <img src="images/user.png" width="30px" height="30px">
                                    </td>
                                    <td class="celda">
                                        <input type="text" placeholder="${pregunta.labelPregunta}" size="22"/>
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
                    <div class="radio contenedorElemento pertenecePanel pertenecePanelPredefinido"
                         id="p_${pregunta.idPregunta}"
                         draggable="true" ondragstart="start(event)" ondragend="end(event)"
                         onclick="seleccionar(this.id)">
                        <div class="contenedorIcono">
                            <img src="images/icon_radio.png" width="55px" height="55px"><br/>
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
                    </div>
                </td>
            </c:if>
            <c:if test="${pregunta.tipoPregunta == 'checkbox'}">
                <c:set var="opcionesComas" value="${pregunta.opciones}"/>
                <c:set var="opciones" value="${fn:split(opcionesComas,',')}"/>
                <td>
                    <div class="checkbox contenedorElemento pertenecePanel pertenecePanelPredefinido"
                         id="p_${pregunta.idPregunta}"
                         draggable="true" ondragstart="start(event)" ondragend="end(event)"
                         onclick="seleccionar(this.id)">
                        <div class="contenedorIcono">
                            <img src=<sptag:message code="src_img_icon_checkbox"/> width="55px" height="55px"><br/>
                            <label>${pregunta.labelPregunta}</label>
                        </div>
                        <div class="elemento elementoGrande elementoPredefinido">
                            <b><label>${pregunta.labelPregunta}</label></b><br/>
                            <table>
                                <c:set var="count2" value="0" scope="page"/>
                                <c:set var="countCierre2" value="0" scope="page"/>
                                <c:forEach var="opcion" items="${opciones}">
                                    <c:if test="${count2 == 0}">
                                        <c:set var="countCierre2" value="1" scope="page"/>
                                        <tr>
                                    </c:if>
                                    <c:set var="count2" value="${count2 + 1}" scope="page"/>
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
                    <div class="area contenedorElemento pertenecePanel pertenecePanelPredefinido"
                         id="p_${pregunta.idPregunta}"
                         draggable="true" ondragstart="start(event)" ondragend="end(event)"
                         onclick="seleccionar(this.id)">
                        <div class="contenedorIcono">
                            <img src=<sptag:message code="src_img_icon_textarea"/> width="55px" height="55px"><br/>
                            <label>${pregunta.labelPregunta}</label>
                        </div>
                        <div class="elemento elementoGrande elementoPredefinido">
                            <table class="tableElementoText">
                                <tr>
                                    <td>
                                        <textarea rows="5" cols="50"
                                                  placeholder="${pregunta.labelPregunta}"> </textarea>
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
                    <div class="select contenedorElemento pertenecePanel pertenecePanelPredefinido"
                         id="p_${pregunta.idPregunta}"
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
                    </div>
                </td>
            </c:if>
            <c:if test="${pregunta.tipoPregunta == 'file'}">
                <td>
                    <div class="file contenedorElemento pertenecePanel pertenecePanelPredefinido"
                         id="p_${pregunta.idPregunta}"
                         draggable="true" ondragstart="start(event)" ondragend="end(event)"
                         onclick="seleccionar(this.id)">
                        <div class="contenedorIcono">
                            <img src="images/icon_upload.png" width="55px" height="55px"><br/>
                            Adjuntar archivo
                        </div>
                        <div class="elemento elementoMuyGrande elementoPredefinido">
                            <b><label>${pregunta.labelPregunta}</label></b><br/><br/>
                            <input type="file" name="etiqueta" id="addfile"/>
                            <label for="addfile">
                                <div >
                                    <img src="images/icon_upload.png" width="60px" height="60px"><br/>
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