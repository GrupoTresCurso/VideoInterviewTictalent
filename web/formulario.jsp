<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sptag" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title><sptag:message code="app_title"/></title>
    <link rel="stylesheet" type="text/css" href="styles/estilos_formulario.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<main>
    <nav onclick="deseleccionar()">
        <table id="tableMenu">
            <tr>
                <td><a href="principal.jsp" class="linkMenu"><sptag:message code="menu_opc1"/></a></td>
                <td><a href="candidato.html" class="linkMenu"><sptag:message code="menu_opc2"/></a></td>
                <td><a href="formulario.jsp" class="linkMenu linkActual"><sptag:message code="menu_opc3"/></a></td>
                <td><a href="entrevista_index.html" class="linkMenu"><sptag:message code="menu_opc4"/></a></td>
                <td><a href="video.html" class="linkMenu"><sptag:message code="menu_opc5"/></a></td>
                <td id="logoTictum"><img src="images/logo1Negro.png" width="173px" height="60px"/></td>
                <td id="logoUser"><img src="images/usuario.png" width="35px" height="35px"
                                       onclick="mostrarOcultarInfoUsuario()"/></td>
            </tr>

        </table>
    </nav>

    <section onclick="ocultarInfoUsuario()">
        <table>
            <tr>
                <td id="izquierda">
                    <div id="panelElementosPrincipal">
                        <div id="panelElementos" onclick="deseleccionar()">
                            <details id="detailsE" onclick="seleccionarTipoElementos(this.id)" open>
                                <summary id="summaryE"><b class="colorTictum"><sptag:message code="label_elemetos_title"/></b></summary>
                                <table>
                                    <tr>
                                        <td>
                                            <div class="texto contenedorElemento pertenecePanel" id="texto1"
                                                 draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                 onclick="seleccionar(this.id)">
                                                <div class="contenedorIcono">
                                                    <img src="images/icon_text.png" width="55px" height="55px"><br/>
                                                    <label><sptag:message code="label_icon_campo_texto"/>/label>
                                                </div>
                                                <div class="elemento">
                                                    <table class="tableElementoText">
                                                        <tr>
                                                            <td class="celda">
                                                                <img src="images/user.png" width="30px" height="30px">
                                                            </td>
                                                            <td class="celda">
                                                                <input type="text" placeholder="Etiqueta" size="25"/>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="capaSuperior"></div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="area contenedorElemento pertenecePanel" id="area1"
                                                 draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                 onclick="seleccionar(this.id)">
                                                <div class="contenedorIcono">
                                                    <img src="images/icon_textarea.png" width="55px" height="55px"><br/>
                                                    <label><sptag:message code="label_icon_area_texto"/></label>
                                                </div>
                                                <div class="elemento elementoGrande">
                                                    <table class="tableElementoText">
                                                        <tr>
                                                            <td>
                                                                <textarea rows="5" cols="50"
                                                                          placeholder="Etiqueta"></textarea>
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
                                            <div class="radio contenedorElemento pertenecePanel" id="radio1"
                                                 draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                 onclick="seleccionar(this.id)">
                                                <div class="contenedorIcono">
                                                    <img src="images/icon_radio.png" width="55px" height="55px"><br/>
                                                    <label><sptag:message code="label_icon_boton_opcion"/></label>
                                                </div>
                                                <div class="elemento">
                                                    <b><label>Etiqueta</label>:</b><br/>
                                                    <table>
                                                        <tr>
                                                            <td class="celdaOpcion">
                                                                <input type="radio" name="opcion" id="opcionR1">
                                                                <label for="opcionR1" class="labelOpcionR1 opcion">Opción1</label>
                                                            </td>
                                                            <td class="celdaOpcion">
                                                                <input type="radio" name="opcion" id="opcionR2">
                                                                <label for="opcionR2" class="labelOpcionR2 opcion">Opción2</label>
                                                            </td>
                                                            <td class="celdaOpcion">
                                                                <input type="radio" name="opcion" id="opcionR3">
                                                                <label for="opcionR3" class="labelOpcionR3 opcion">Opción3</label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="capaSuperior"></div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="checkbox contenedorElemento pertenecePanel" id="check1"
                                                 draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                 onclick="seleccionar(this.id)">
                                                <div class="contenedorIcono">
                                                    <img src="images/icon_checkbox.png" width="55px" height="55px"><br/>
                                                    <label>Casilla verificación</label>
                                                </div>
                                                <div class="elemento elementoGrande">
                                                    <b><label>Etiqueta</label>:</b><br/>
                                                    <table>
                                                        <tr>
                                                            <td class="celdaOpcion">
                                                                <input type="checkbox" name="opcion" id="opcionCB1">
                                                                <label for="opcionCB1" class="labelOpcionCB1 opcion">Opción1</label>
                                                            </td>
                                                            <td class="celdaOpcion">
                                                                <input type="checkbox" name="opcion" id="opcionCB2">
                                                                <label for="opcionCB2" class="labelOpcionCB2 opcion">Opción2</label>
                                                            </td>
                                                            <td class="celdaOpcion">
                                                                <input type="checkbox" name="opcion" id="opcionCB3">
                                                                <label for="opcionCB3" class="labelOpcionCB3 opcion">Opción3</label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="celdaOpcion">
                                                                <input type="checkbox" name="opcion" id="opcionCB4">
                                                                <label for="opcionCB4" class="labelOpcionCB4 opcion">Opción4</label>
                                                            </td>
                                                            <td class="celdaOpcion">
                                                                <input type="checkbox" name="opcion" id="opcionCB5">
                                                                <label for="opcionCB5" class="labelOpcionCB5 opcion">Opción5</label>
                                                            </td>
                                                            <td class="celdaOpcion">
                                                                <input type="checkbox" name="opcion" id="opcionCB6">
                                                                <label for="opcionCB6" class="labelOpcionCB6 opcion">Opción6</label>
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
                                            <div class="select contenedorElemento pertenecePanel" id="select1"
                                                 draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                 onclick="seleccionar(this.id)">
                                                <div class="contenedorIcono">
                                                    <img src="images/icon_select.png" width="55px" height="55px"><br/>
                                                    <label>Lista desplegable</label>
                                                </div>
                                                <div class="elemento elementoPequenio">
                                                    <b><label class="labelLinea">Etiqueta</label>:</b>
                                                    <span class="select-wrapper">
                                        <select>
                                            <option value="opcion1" class="opcionSelect1">Opción 1</option>
                                            <option value="opcion2" class="opcionSelect2">Opción 2</option>
                                            <option value="opcion3" class="opcionSelect3">Opción 3</option>
                                        </select>
                                    </span>
                                                </div>
                                                <div class="capaSuperior"></div>
                                            </div>
                                        </td>
                                    </tr>

                                </table>
                            </details>
                            <br/>
                            <details id="detailsEP" onclick="seleccionarTipoElementos(this.id)">
                                <summary><b class="colorTictum">Elementos predefinidos</b></summary>
                                <table id="tableElementosPredefinidos">
                                    <tr id="rowP1">
                                        <td>
                                            <div class="texto contenedorElemento pertenecePanel" id="elementoP1"
                                                 draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                 onclick="seleccionar(this.id)">
                                                <div class="contenedorIcono">
                                                    <img src="images/icon_text.png" width="55px" height="55px"><br/>
                                                    <label>Nombre</label>
                                                </div>
                                                <div class="elemento elementoPredefinido">
                                                    <table class="tableElementoText">
                                                        <tr>
                                                            <td class="celda">
                                                                <img src="images/user.png" width="30px" height="30px">
                                                            </td>
                                                            <td class="celda">
                                                                <input type="text" name="nombre"
                                                                       placeholder="Introduzca nombre" size="22"/>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="capaSuperior"></div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="texto contenedorElemento pertenecePanel" id="elementoP2"
                                                 draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                 onclick="seleccionar(this.id)">
                                                <div class="contenedorIcono">
                                                    <img src="images/icon_text.png" width="55px" height="55px"><br/>
                                                    <label>Apellidos</label>
                                                </div>
                                                <div class="elemento elementoPredefinido">
                                                    <table class="tableElementoText">
                                                        <tr>
                                                            <td class="celda">
                                                                <img src="images/email.png" width="30px" height="30px">
                                                            </td>
                                                            <td class="celda">
                                                                <input type="text" placeholder="Introduzca email"
                                                                       size="22"/>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="capaSuperior"></div>
                                            </div>
                                        </td>

                                    </tr>
                                    <tr id="rowP2">
                                        <td>
                                            <div class="radio contenedorElemento pertenecePanel" id="elementoP3"
                                                 draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                 onclick="seleccionar(this.id)">
                                                <div class="contenedorIcono">
                                                    <img src="images/icon_radio.png" width="55px" height="55px"><br/>
                                                    <label>Sexo</label>
                                                </div>
                                                <div class="elemento elementoPredefinido">
                                                    <b><label>Sexo</label>:</b><br/>

                                                    <input type="radio" name="hombre" id="hombre">
                                                    <label for="hombre" class="opcion">Hombre</label>

                                                    <input type="radio" name="mujer" id="mujer">
                                                    <label for="mujer" class="opcion">Mujer</label>
                                                </div>
                                                <div class="capaSuperior"></div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="select contenedorElemento pertenecePanel" id="elementoP4"
                                                 draggable="true" ondragstart="start(event)" ondragend="end(event)"
                                                 onclick="seleccionar(this.id)">
                                                <div class="contenedorIcono">
                                                    <img src="images/icon_select.png" width="55px" height="55px"><br/>
                                                    <label>Países</label>
                                                </div>
                                                <div class="elemento elementoPequenio elementoPredefinido">
                                                    <b><label class="labelLinea">Nacionalidad</label>:</b>
                                                    <span class="select-wrapper">
                                                        <select name="pais">
                                                              <option value="defecto">Elegir una opción</option>
                                                              <option value="AF">Afganistán</option>
                                                              <option value="AL">Albania</option>
                                                              <option value="DE">Alemania</option>
                                                              <option value="AD">Andorra</option>
                                                              <option value="AO">Angola</option>
                                                              <option value="AI">Anguilla</option>
                                                              <option value="AQ">Antártida</option>
                                                              <option value="AG">Antigua y Barbuda</option>
                                                              <option value="AN">Antillas Holandesas</option>
                                                              <option value="SA">Arabia Saudí</option>
                                                              <option value="DZ">Argelia</option>
                                                              <option value="AR">Argentina</option>
                                                              <option value="AM">Armenia</option>
                                                              <option value="AW">Aruba</option>
                                                              <option value="AU">Australia</option>
                                                              <option value="AT">Austria</option>
                                                              <option value="AZ">Azerbaiyán</option>
                                                              <option value="BS">Bahamas</option>
                                                              <option value="BH">Bahrein</option>
                                                              <option value="BD">Bangladesh</option>
                                                              <option value="BB">Barbados</option>
                                                              <option value="BE">Bélgica</option>
                                                              <option value="BZ">Belice</option>
                                                              <option value="BJ">Benin</option>
                                                              <option value="BM">Bermudas</option>
                                                              <option value="BY">Bielorrusia</option>
                                                              <option value="MM">Birmania</option>
                                                              <option value="BO">Bolivia</option>
                                                              <option value="BA">Bosnia y Herzegovina</option>
                                                              <option value="BW">Botswana</option>
                                                              <option value="BR">Brasil</option>
                                                              <option value="BN">Brunei</option>
                                                              <option value="BG">Bulgaria</option>
                                                              <option value="BF">Burkina Faso</option>
                                                              <option value="BI">Burundi</option>
                                                              <option value="BT">Bután</option>
                                                              <option value="CV">Cabo Verde</option>
                                                              <option value="KH">Camboya</option>
                                                              <option value="CM">Camerún</option>
                                                              <option value="CA">Canadá</option>
                                                              <option value="TD">Chad</option>
                                                              <option value="CL">Chile</option>
                                                              <option value="CN">China</option>
                                                              <option value="CY">Chipre</option>
                                                              <option value="VA">Ciudad del Vaticano (Santa Sede)</option>
                                                              <option value="CO">Colombia</option>
                                                              <option value="KM">Comores</option>
                                                              <option value="CG">Congo</option>
                                                              <option value="CD">Congo, República Democrática del</option>
                                                              <option value="KR">Corea</option>
                                                              <option value="KP">Corea del Norte</option>
                                                              <option value="CI">Costa de Marfíl</option>
                                                              <option value="CR">Costa Rica</option>
                                                              <option value="HR">Croacia (Hrvatska)</option>
                                                              <option value="CU">Cuba</option>
                                                              <option value="DK">Dinamarca</option>
                                                              <option value="DJ">Djibouti</option>
                                                              <option value="DM">Dominica</option>
                                                              <option value="EC">Ecuador</option>
                                                              <option value="EG">Egipto</option>
                                                              <option value="SV">El Salvador</option>
                                                              <option value="AE">Emiratos Árabes Unidos</option>
                                                              <option value="ER">Eritrea</option>
                                                              <option value="SI">Eslovenia</option>
                                                              <option value="ES" selected>España</option>
                                                              <option value="US">Estados Unidos</option>
                                                              <option value="EE">Estonia</option>
                                                              <option value="ET">Etiopía</option>
                                                              <option value="FJ">Fiji</option>
                                                              <option value="PH">Filipinas</option>
                                                              <option value="FI">Finlandia</option>
                                                              <option value="FR">Francia</option>
                                                              <option value="GA">Gabón</option>
                                                              <option value="GM">Gambia</option>
                                                              <option value="GE">Georgia</option>
                                                              <option value="GH">Ghana</option>
                                                              <option value="GI">Gibraltar</option>
                                                              <option value="GD">Granada</option>
                                                              <option value="GR">Grecia</option>
                                                              <option value="GL">Groenlandia</option>
                                                              <option value="GP">Guadalupe</option>
                                                              <option value="GU">Guam</option>
                                                              <option value="GT">Guatemala</option>
                                                              <option value="GY">Guayana</option>
                                                              <option value="GF">Guayana Francesa</option>
                                                              <option value="GN">Guinea</option>
                                                              <option value="GQ">Guinea Ecuatorial</option>
                                                              <option value="GW">Guinea-Bissau</option>
                                                              <option value="HT">Haití</option>
                                                              <option value="HN">Honduras</option>
                                                              <option value="HU">Hungría</option>
                                                              <option value="IN">India</option>
                                                              <option value="ID">Indonesia</option>
                                                              <option value="IQ">Irak</option>
                                                              <option value="IR">Irán</option>
                                                              <option value="IE">Irlanda</option>
                                                              <option value="BV">Isla Bouvet</option>
                                                              <option value="CX">Isla de Christmas</option>
                                                              <option value="IS">Islandia</option>
                                                              <option value="KY">Islas Caimán</option>
                                                              <option value="CK">Islas Cook</option>
                                                              <option value="CC">Islas de Cocos o Keeling</option>
                                                              <option value="FO">Islas Faroe</option>
                                                              <option value="HM">Islas Heard y McDonald</option>
                                                              <option value="FK">Islas Malvinas</option>
                                                              <option value="MP">Islas Marianas del Norte</option>
                                                              <option value="MH">Islas Marshall</option>
                                                              <option value="UM">Islas menores de Estados Unidos</option>
                                                              <option value="PW">Islas Palau</option>
                                                              <option value="SB">Islas Salomón</option>
                                                              <option value="SJ">Islas Svalbard y Jan Mayen</option>
                                                              <option value="TK">Islas Tokelau</option>
                                                              <option value="TC">Islas Turks y Caicos</option>
                                                              <option value="VI">Islas Vírgenes (EE.UU.)</option>
                                                              <option value="VG">Islas Vírgenes (Reino Unido)</option>
                                                              <option value="WF">Islas Wallis y Futuna</option>
                                                              <option value="IL">Israel</option>
                                                              <option value="IT">Italia</option>
                                                              <option value="JM">Jamaica</option>
                                                              <option value="JP">Japón</option>
                                                              <option value="JO">Jordania</option>
                                                              <option value="KZ">Kazajistán</option>
                                                              <option value="KE">Kenia</option>
                                                              <option value="KG">Kirguizistán</option>
                                                              <option value="KI">Kiribati</option>
                                                              <option value="KW">Kuwait</option>
                                                              <option value="LA">Laos</option>
                                                              <option value="LS">Lesotho</option>
                                                              <option value="LV">Letonia</option>
                                                              <option value="LB">Líbano</option>
                                                              <option value="LR">Liberia</option>
                                                              <option value="LY">Libia</option>
                                                              <option value="LI">Liechtenstein</option>
                                                              <option value="LT">Lituania</option>
                                                              <option value="LU">Luxemburgo</option>
                                                              <option value="MK">Macedonia, Ex-República Yugoslava de</option>
                                                              <option value="MG">Madagascar</option>
                                                              <option value="MY">Malasia</option>
                                                              <option value="MW">Malawi</option>
                                                              <option value="MV">Maldivas</option>
                                                              <option value="ML">Malí</option>
                                                              <option value="MT">Malta</option>
                                                              <option value="MA">Marruecos</option>
                                                              <option value="MQ">Martinica</option>
                                                              <option value="MU">Mauricio</option>
                                                              <option value="MR">Mauritania</option>
                                                              <option value="YT">Mayotte</option>
                                                              <option value="MX">México</option>
                                                              <option value="FM">Micronesia</option>
                                                              <option value="MD">Moldavia</option>
                                                              <option value="MC">Mónaco</option>
                                                              <option value="MN">Mongolia</option>
                                                              <option value="MS">Montserrat</option>
                                                              <option value="MZ">Mozambique</option>
                                                              <option value="NA">Namibia</option>
                                                              <option value="NR">Nauru</option>
                                                              <option value="NP">Nepal</option>
                                                              <option value="NI">Nicaragua</option>
                                                              <option value="NE">Níger</option>
                                                              <option value="NG">Nigeria</option>
                                                              <option value="NU">Niue</option>
                                                              <option value="NF">Norfolk</option>
                                                              <option value="NO">Noruega</option>
                                                              <option value="NC">Nueva Caledonia</option>
                                                              <option value="NZ">Nueva Zelanda</option>
                                                              <option value="OM">Omán</option>
                                                              <option value="NL">Países Bajos</option>
                                                              <option value="PA">Panamá</option>
                                                              <option value="PG">Papúa Nueva Guinea</option>
                                                              <option value="PK">Paquistán</option>
                                                              <option value="PY">Paraguay</option>
                                                              <option value="PE">Perú</option>
                                                              <option value="PN">Pitcairn</option>
                                                              <option value="PF">Polinesia Francesa</option>
                                                              <option value="PL">Polonia</option>
                                                              <option value="PT">Portugal</option>
                                                              <option value="PR">Puerto Rico</option>
                                                              <option value="QA">Qatar</option>
                                                              <option value="UK">Reino Unido</option>
                                                              <option value="CF">República Centroafricana</option>
                                                              <option value="CZ">República Checa</option>
                                                              <option value="ZA">República de Sudáfrica</option>
                                                              <option value="DO">República Dominicana</option>
                                                              <option value="SK">República Eslovaca</option>
                                                              <option value="RE">Reunión</option>
                                                              <option value="RW">Ruanda</option>
                                                              <option value="RO">Rumania</option>
                                                              <option value="RU">Rusia</option>
                                                              <option value="EH">Sahara Occidental</option>
                                                              <option value="KN">Saint Kitts y Nevis</option>
                                                              <option value="WS">Samoa</option>
                                                              <option value="AS">Samoa Americana</option>
                                                              <option value="SM">San Marino</option>
                                                              <option value="VC">San Vicente y Granadinas</option>
                                                              <option value="SH">Santa Helena</option>
                                                              <option value="LC">Santa Lucía</option>
                                                              <option value="ST">Santo Tomé y Príncipe</option>
                                                              <option value="SN">Senegal</option>
                                                              <option value="SC">Seychelles</option>
                                                              <option value="SL">Sierra Leona</option>
                                                              <option value="SG">Singapur</option>
                                                              <option value="SY">Siria</option>
                                                              <option value="SO">Somalia</option>
                                                              <option value="LK">Sri Lanka</option>
                                                              <option value="PM">St. Pierre y Miquelon</option>
                                                              <option value="SZ">Suazilandia</option>
                                                              <option value="SD">Sudán</option>
                                                              <option value="SE">Suecia</option>
                                                              <option value="CH">Suiza</option>
                                                              <option value="SR">Surinam</option>
                                                              <option value="TH">Tailandia</option>
                                                              <option value="TW">Taiwán</option>
                                                              <option value="TZ">Tanzania</option>
                                                              <option value="TJ">Tayikistán</option>
                                                              <option value="TF">Territorios franceses del Sur</option>
                                                              <option value="TP">Timor Oriental</option>
                                                              <option value="TG">Togo</option>
                                                              <option value="TO">Tonga</option>
                                                              <option value="TT">Trinidad y Tobago</option>
                                                              <option value="TN">Túnez</option>
                                                              <option value="TM">Turkmenistán</option>
                                                              <option value="TR">Turquía</option>
                                                              <option value="TV">Tuvalu</option>
                                                              <option value="UA">Ucrania</option>
                                                              <option value="UG">Uganda</option>
                                                              <option value="UY">Uruguay</option>
                                                              <option value="UZ">Uzbekistán</option>
                                                              <option value="VU">Vanuatu</option>
                                                              <option value="VE">Venezuela</option>
                                                              <option value="VN">Vietnam</option>
                                                              <option value="YE">Yemen</option>
                                                              <option value="YU">Yugoslavia</option>
                                                              <option value="ZM">Zambia</option>
                                                              <option value="ZW">Zimbabue</option>
                                                        </select>
                                                    </span>
                                                </div>
                                                <div class="capaSuperior"></div>
                                            </div>
                                        </td>
                                    </tr>

                                </table>
                            </details>
                        </div>
                        <div id="panelElementosBloqueo">

                        </div>
                    </div>

                </td>
                <td id="medio">
                    <div id="contenedor" ondragenter="return enter(event)" ondragover="return over(event)"
                         ondragleave="return leave(event)" ondrop="return drop(event)">
                        <div id="estadoContenedor">
                            <div id="mensajeDefecto">
                                <br/>
                                <h4 class="colorTictum">Generador de formularios</h4><br/><br/>
                                <p>Arrastrar y soltar elementos.</p>
                            </div>
                            <div id="nuevoForm">
                                <input type="text" name="nombreFormulario" class="nombreFormulario"
                                       placeholder="Introduzca nombre de formulario" size="35"/>
                                <button type="submit" class="botonGuardar">Guardar</button>
                                <br/><br/>
                                <hr/>
                                <br/>
                                <form id="nuevoFormulario" action="" method="POST">
                                    <div class="label contenedorElemento" id="etiqueta1" draggable="true"
                                         ondragstart="start(event)" ondragend="end(event)"
                                         onclick="seleccionar(this.id)">
                                        <div class="elemento elementoPequenio elementoLabel">
                                            <b><label id="etiquetaLabel">Título de formulario</label></b>
                                        </div>
                                    </div>
                                    <br/>
                                    <div id="contenedorElementosFormulario">

                                    </div>

                                    <br/>
                                    <!--
                                    <button id="btnLimpiar" class="botonGuardar btnForm" disabled>Limpiar</button>
                                    <button class="botonGuardar btnForm" disabled>Guardar</button>
                                    -->
                                </form>
                            </div>
                        </div>
                    </div>
                </td>
                <td id="derecha">
                    <h5 class="colorTictum">Propiedades</h5>
                    <div id="propiedades">
                        <div id="contenedorPropiedadesDefecto"><br/><br/>
                            <p id="mensajePropiedadesDefecto">No hay elemento seleccionado.</p></div>
                        <div id="contenedorEtiqueta">
                            <table>
                                <tr>
                                    <td><p><sptag:message code="cualquiercosa"/></p></td>
                                    <td><input type="text" name="etiqueta" id="etiquetaPropiedades" size="25"
                                               onblur="actualizarEtiqueta()"/></td>
                                </tr>
                            </table>
                        </div>
                        <br/>
                        <div id="contenedorOpciones">
                            <table>
                                <tr>
                                    <td><p>Nº opciones:</p></td>
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
                            <label>Predefinido:</label>
                            <input type="checkbox" id="checkPredefinido" onchange="agregarAPredefinidos()">
                        </div>
                    </div>
                    <div id="eliminar" onclick="deseleccionar()">
                        <p>Arrastrar y soltar en la papelera para eliminar elementos</p><br/>
                        <div id="papelera" ondragenter="return enter(event)" ondragover="return overPapelera(event)"
                             ondragleave="return leavePapelera(event)" ondrop="return dropPapelera(event)">
                            <img id="imagenPapelera" src="images/papelera_close.png" width="150px" height="150px"
                                 draggable="false">
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <div id="userInfo">
            <h3>Usuario1</h3>
            <p>Responsable de contratación</p><br/>
            <a href="">Logout</a>
        </div>
    </section>
</main>
<script type='text/javascript' src="js/formulario.js"></script>
</body>
</html>
