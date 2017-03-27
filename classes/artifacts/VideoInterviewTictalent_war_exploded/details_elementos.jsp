<%@ taglib prefix="sptag" uri="http://www.springframework.org/tags" %>
<details id="detailsE" onclick="seleccionarTipoElementos(this.id)" open>
    <summary id="summaryE">
        <b class="colorTictum"><sptag:message code="label_elemetos_title"/></b>
    </summary>
    <table>
        <tr>
            <td>
                <div class="texto contenedorElemento pertenecePanel" id="text"
                     draggable="true" ondragstart="start(event)" ondragend="end(event)"
                     onclick="seleccionar(this.id)">
                    <div class="contenedorIcono">
                        <img src=<sptag:message code="src_img_icon_text"/> width="55px" height="55px"><br/>
                        <label><sptag:message code="label_icon_campo_texto"/></label>
                    </div>
                    <div class="elemento">
                        <table class="tableElementoText">
                            <tr>
                                <td class="celda">
                                    <img src=<sptag:message code="src_img_user"/> width="30px" height="30px">
                                </td>
                                <td class="celda">
                                    <input type="text" placeholder=<sptag:message code="placeholder_label_elemento"/> size="25"/>
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
                        <img src=<sptag:message code="src_img_icon_textarea"/> width="55px" height="55px"><br/>
                        <label><sptag:message code="label_icon_area_texto"/></label>
                    </div>
                    <div class="elemento elementoGrande">
                        <table class="tableElementoText">
                            <tr>
                                <td>
                                    <textarea rows="3" cols="50"
                                            placeholder="<sptag:message code="placeholder_label_elemento"/>">
                                    </textarea>
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
                        <img src=<sptag:message code="src_img_icon_radio"/> width="55px" height="55px"><br/>
                        <label><sptag:message code="label_icon_boton_opcion"/></label>
                    </div>
                    <div class="elemento">
                        <b><label><sptag:message code="label_elemento"/></label></b><br/>
                        <table>
                            <tr>
                                <td class="celdaOpcion">
                                    <input type="radio" name="opcion" id="opcionR1">
                                    <label for="opcionR1" class="labelOpcionR1 opcion">
                                        <sptag:message code="label_opcion_1"/></label>
                                </td>
                                <td class="celdaOpcion">
                                    <input type="radio" name="opcion" id="opcionR2">
                                    <label for="opcionR2" class="labelOpcionR2 opcion">
                                        <sptag:message code="label_opcion_2"/></label>
                                </td>
                                <td class="celdaOpcion">
                                    <input type="radio" name="opcion" id="opcionR3">
                                    <label for="opcionR3" class="labelOpcionR3 opcion">
                                        <sptag:message code="label_opcion_3"/></label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="capaSuperior"></div>
                </div>
            </td>
            <td>
                <div class="checkbox contenedorElemento pertenecePanel" id="checkbox"
                     draggable="true" ondragstart="start(event)" ondragend="end(event)"
                     onclick="seleccionar(this.id)">
                    <div class="contenedorIcono">
                        <img src=<sptag:message code="src_img_icon_checkbox"/> width="55px" height="55px"><br/>
                        <label><sptag:message code="label_icon_casilla_verificacion"/></label>
                    </div>
                    <div class="elemento elementoGrande">
                        <b><label><sptag:message code="label_elemento"/></label></b><br/>
                        <table>
                            <tr>
                                <td class="celdaOpcion">
                                    <input type="checkbox" name="opcion" id="opcionCB1">
                                    <label for="opcionCB1" class="labelOpcionCB1 opcion">
                                        <sptag:message code="label_opcion_1"/></label>
                                </td>
                                <td class="celdaOpcion">
                                    <input type="checkbox" name="opcion" id="opcionCB2">
                                    <label for="opcionCB2" class="labelOpcionCB2 opcion">
                                        <sptag:message code="label_opcion_2"/></label>
                                </td>
                                <td class="celdaOpcion">
                                    <input type="checkbox" name="opcion" id="opcionCB3">
                                    <label for="opcionCB3" class="labelOpcionCB3 opcion">
                                        <sptag:message code="label_opcion_3"/></label>
                                </td>
                            </tr>
                            <tr>
                                <td class="celdaOpcion">
                                    <input type="checkbox" name="opcion" id="opcionCB4">
                                    <label for="opcionCB4" class="labelOpcionCB4 opcion">
                                        <sptag:message code="label_opcion_4"/></label>
                                </td>
                                <td class="celdaOpcion">
                                    <input type="checkbox" name="opcion" id="opcionCB5">
                                    <label for="opcionCB5" class="labelOpcionCB5 opcion">
                                        <sptag:message code="label_opcion_5"/></label>
                                </td>
                                <td class="celdaOpcion">
                                    <input type="checkbox" name="opcion" id="opcionCB6">
                                    <label for="opcionCB6" class="labelOpcionCB6 opcion">
                                        <sptag:message code="label_opcion_6"/></label>
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
                        <img src=<sptag:message code="src_img_icon_select"/> width="55px" height="55px"><br/>
                        <label><sptag:message code="label_icon_lista_desplegable"/></label>
                    </div>
                    <div class="elemento elementoPequenio">
                        <b><label class="labelLinea"><sptag:message code="label_elemento"/></label></b>
                        <span class="select-wrapper">
                            <select>
                                <option value="opcion1" class="opcionSelect1">
                                    <sptag:message code="label_opcion_1"/></option>
                                <option value="opcion2" class="opcionSelect2">
                                    <sptag:message code="label_opcion_2"/></option>
                                <option value="opcion3" class="opcionSelect3">
                                    <sptag:message code="label_opcion_3"/></option>
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
                        <img src=<sptag:message code="src_img_icon_upload"/> width="55px" height="55px"><br/>
                        <label><sptag:message code="label_icon_adjuntar_archivo"/></label>
                    </div>
                    <div class="elemento elementoMuyGrande">
                        <b><label><sptag:message code="label_elemento"/></label></b><br/>
                        <input type="file" name="etiqueta" id="addfile"/>
                        <label for="addfile" id="labelAddFile">
                            <div id="contenedorAdjuntos">
                                <img src="images/icon_upload.png" width="60px" height="60px"><br/>
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

