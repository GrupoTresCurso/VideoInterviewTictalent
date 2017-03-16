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
    <link rel="stylesheet" type="text/css" href="styles/estilos_entrevista.css">
    <link href="https://fonts.googleapis.com/css?family=Arvo" rel="stylesheet">
    <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
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

    <div id="cuerpo">
        <h3>Generar Entrevista:</h3><br/>
        <a href="entrevista_clonar.jsp"><div class="botonIndex"><img src="images/clone.png" width="40px" height="40px"/>Clonar Entrevista</div></a><br/>
        <a href="entrevista_nueva.jsp"><div class="botonIndex"><img src="images/new.png" width="40px" height="40px"/>Nueva Entrevista</div></a><br/>

    </div>

  </main>

    <script>


    </script>

</body>
</html>
