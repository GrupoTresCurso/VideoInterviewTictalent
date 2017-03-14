<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <title>VideoInterview</title>
    <link rel="stylesheet" type="text/css" href="styles/estilos_candidato.css">
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
          <td><a href="entrevista_index.html" class="linkMenu">Entrevista</a></td>
          <td><a href="video.html" class="linkMenu">Video</a></td>
        </tr>
      </table>
    </nav>
    <aside>
      <h4>Candidatos</h4>
      <table id="tableCandidatos">
        <c:forEach var="candidato" items="${listaCandidatos}">
          <td>
            <img src="https://pbs.twimg.com/profile_images/822817456880230400/p7lqbBot.jpg" width="50px" height="50px"/>
          </td>
          <td><c:out value="${candidato.nombre}" /></td>
        </c:forEach>
        <tr>
          <td>
            <img src="https://pbs.twimg.com/profile_images/822817456880230400/p7lqbBot.jpg" width="50px" height="50px"/>
          </td>
          <td>María Rodríguez</td>
        </tr>
        <tr>
          <td>
            <img src="http://gruporivas.com.mx/wp-content/uploads/2015/07/C3tK-qgN_400x400.jpeg" width="50px" height="50px"/>
          </td>
          <td>Luis Hernández</td>
        </tr>
      </table>
    </aside>
    <section>
        <h4>Agregar candidato:</h4><br/>
      <form id="formNuevoCandidato" action="${pageContext.request.contextPath}/guardarCandidato.do" method="post">
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
                              <img src="images/user.png" width="30px" height="30px">
                            </td>
                            <td class="celda">
                              <input type="text" name="nombre" id="nombre" placeholder="Introduzca nombre" size="30"/>
                            </td>
                          </tr>
                        </table>
                      </div>
                    </td>
                    <td rowspan="3" id="celdaImagen" class="celdaColumna2">
                        <input type="file" id="file" onchange="processFiles(this.files)"/>
                        <label for="file">
                            <div id="contenedorImagen" ondragenter="return enter(event)" ondragover="return over(event)" ondragleave="return leave(event)" ondrop="return drop(event)">
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
                                      <img src="images/user.png" width="30px" height="30px">
                                  </td>
                                  <td class="celda">
                                      <input type="text" name="apellidos" id="apellidos" placeholder="Introduzca apellidos"  size="30"/>
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
                              <img src="images/dni.png" width="30px" height="30px">
                            </td>
                            <td class="celda">
                              <input type="text" name="dni" id="dni" placeholder="Introduzca DNI" />
                            </td>
                          </tr>
                        </table>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="elemento">
                        <label>Sexo:</label>

                        <input type="radio" name="sexo" id="hombre"/>
                        <label for="hombre">Hombre</label>

                        <input type="radio" name="sexo" id="mujer"/>
                        <label for="mujer">Mujer</label>
                      </div>
                    </td>
                    <td  class="celdaColumna2">
                        <div class="elemento">
                           <label>Edad:</label>
                           <span class='number-wrapper'>
                              <input type="number" name="edad" id="edad" min="1" max="90" value="18"/>
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
                              <img src="images/email.png" width="30px" height="30px">
                            </td>
                            <td class="celda">
                              <input type="text" name="email" id="email" placeholder="Introduzca email"  size="30"/>
                            </td>
                          </tr>
                        </table>
                      </div>
                    </td>
                    <td  class="celdaColumna2">
                      <div class="elemento">
                        <table class="tableElementoText">
                          <tr>
                            <td class="celda">
                              <img src="images/phone.png" width="30px" height="30px">
                            </td>
                            <td class="celda">
                              <input type="text" name="numeroTelefono" id="telefono" placeholder="Introduzca teléfono" />
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
                <input type="submit"  value="Guardar" class="botonGuardar"/>
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
                if(file.type == "application/pdf"){
                    output.innerHTML =  "<img src='images/pdf.png' width='80px' height='80px'/> " +
                        "<p id='nombreArchivo'>"+file.name+"</p>";
                }else{
                    output.innerHTML =  "<img src='images/doc.png' width='80px' height='80px'/> " +
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
            if (id == 'contenedorImagen'){
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
