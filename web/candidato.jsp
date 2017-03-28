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
    <link rel="stylesheet" type="text/css" href="./styles/estilos_menu.css">
    <link rel="stylesheet" type="text/css" href=<sptag:message code="css_route_candidato"/>>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <script type='text/javascript' src=<sptag:message code="jquery_src"/>></script>
</head>
<body>
<main>
    <%@include file="menu.jsp"%>
    <input type="hidden" value="Candidato" id="enlaceActivo"/>
    <aside  onclick="ocultarInfoUsuario()">
        <h4><sptag:message code="label_candidatos"/></h4><br/>
        <div id="buscarCandidato">
            <input type="text" id="inputBuscar" size="20" placeholder=<sptag:message code="placeholder_buscar_candidatos"/> onchange="buscarCandidato()" onkeyup="this.onchange();" oninput="this.onchange();"/>
        </div>

        <table id="tableCandidatos">
            <c:forEach var="candidato" items="${listaCandidatos}" varStatus="loop">
                <tr id="${loop.index}" class="filaCandidato">
                    <td>
                        <c:if test="${candidato.sexo=='hombre'}">
                            <img src=<sptag:message code="src_img_user_man"/> class='userIcon' width="40px" height="40px"/>
                        </c:if>
                        <c:if test="${candidato.sexo=='mujer'}">
                            <img src=<sptag:message code="src_img_user_womman"/> class='userIcon' width="40px" height="40px"/>
                        </c:if>
                    </td>
                    <td>
                        <a href="<c:url value="${pageContext.request.contextPath}/recuperarCandidato.do"><c:param name="idCandidato" value="${candidato.idCandidato}"/></c:url>"
                        title="Mostrar datos">
                            <label id="labelDatosCandidato"><c:out value="${candidato.nombre}"/> <c:out value="${candidato.apellidos}"/></label>
                        </a>
                    </td>
                    <%-- http://stackoverflow.com/questions/2906582/how-to-create-an-html-button-that-acts-like-a-link--%>
                    <td>
                        <a href="<c:url value="${pageContext.request.contextPath}/eliminarCandidato.do">
                              <c:param name="idCandidato" value="${candidato.idCandidato}"/></c:url>">
                            <img src=<sptag:message code="src_img_icon_delete"/> id='delete' width="23px" height="23px" title="Eliminar"/>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </aside>
    <section>
        <div id="contenedorFormulario"  onclick="ocultarInfoUsuario()">
            <h4 class="colorTictum"><sptag:message code="label_agregar_candidato"/></h4><br/>
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
                                                                       value="${candidato.nombre}" required/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td rowspan="3" id="celdaImagen" class="celdaColumna2">
                                        <div id="contenedorImagen">
                                            <img src="images/user_man.png" id="imagenCandidato" width="130px" height="130px"/>
                                        </div>
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
                                                                       value="${candidato.apellidos}" required/>
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
                                                               placeholder=<sptag:message code="placeholder_dni"/> value="${candidato.dni}" required/>
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
                                                <input type="radio" name="sexo" value="hombre" id="hombre" onchange="cambiarFoto()"
                                                       checked="checked"/>
                                                <label for="hombre"><sptag:message code="label_hombre"/></label>

                                                <input type="radio" name="sexo" value="mujer" id="mujer"  onchange="cambiarFoto()"/>
                                                <label for="mujer"><sptag:message code="label_mujer"/></label>
                                            </c:if>
                                            <c:if test="${candidato.sexo.equals('hombre')}">
                                                <input type="radio" name="sexo" value="hombre" id="hombre" onchange="cambiarFoto()"
                                                       checked="checked"/>
                                                <label for="hombre"><sptag:message code="label_hombre"/></label>

                                                <input type="radio" name="sexo" value="mujer" id="mujer" onchange="cambiarFoto()"/>
                                                <label for="mujer"><sptag:message code="label_mujer"/></label>
                                            </c:if>
                                            <c:if test="${candidato.sexo.equals('mujer')}">
                                                <input type="radio" name="sexo" value="hombre" id="hombre" onchange="cambiarFoto()"/>
                                                <label for="hombre"><sptag:message code="label_hombre"/></label>

                                                <input type="radio" name="sexo" value="mujer" id="mujer" checked="checked" onchange="cambiarFoto()"/>
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
                                                               value="${candidato.email}" required/>
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
                                                                       value="${candidato.numeroTelefono}" required/>
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
        </div>
        <%@include file="userInfo.jsp"%>
    </section>

</main>
<script type='text/javascript' src="js/candidato.js"></script>

<script>
    function buscarCandidato() {
        var valor = document.getElementById("inputBuscar").value;
        $('.filaCandidato').css('display','block');
        if(valor.trim().length>0){
            <c:forEach var="candidato" items="${listaCandidatos}" varStatus="loop">
                if("<c:out value="${candidato.nombre}"/>".toLowerCase().indexOf(valor.toLowerCase())!=-1 ||
                    "<c:out value="${candidato.apellidos}"/>".toLowerCase().indexOf(valor.toLowerCase())!=-1 ){
                    document.getElementById("${loop.index}").style.display = 'block';
                }else{
                    document.getElementById("${loop.index}").style.display = 'none';
                }
            </c:forEach>
        }else{

        }
    }
</script>

</body>
</html>
