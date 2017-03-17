package controllers;

import beans.Candidato;
import beans.Entrevista;
import beans.Formulario;
import beans.Video;
import model.business.BaseBusiness;
import model.business.VideoBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller("EntrevistaController")
public class EntrevistaController implements BaseController {

    @Autowired
    @Qualifier("EntrevistaBusiness")
    private BaseBusiness<Entrevista> entrevistaBusiness;

    @Autowired
    @Qualifier("FormularioBusiness")
    private BaseBusiness<Formulario> formularioBusiness;

    @Autowired
    @Qualifier("VideoBusiness")
    private BaseBusiness<Video> videoBusiness;

    @RequestMapping(value = "/recuperarEntrevistas.do", method = RequestMethod.GET)
    public String recuperarEntrevistas(HttpSession session) {
        ArrayList<Entrevista> listaEntrevistas= (ArrayList<Entrevista>) entrevistaBusiness.recuperarTodos();
        session.setAttribute("listaEntrevistas",listaEntrevistas);
        return ENTREVISTA_CLONAR;
    }

    @RequestMapping(value = "/clonarEntrevista.do", method = RequestMethod.GET)
    public void clonarEntrevista(@RequestParam(value="idEntrevista",required=true) int idEntrevista, @RequestParam(value="nombre") String nombre,HttpServletResponse response) {
        Entrevista entrevistaDDBB=entrevistaBusiness.recuperarPorId(idEntrevista);
        Entrevista entrevistaCopia=new Entrevista(nombre,entrevistaDDBB.getNombrePuesto(),entrevistaDDBB.getMensaje(),entrevistaDDBB.getFormularios(),entrevistaDDBB.getCuestionarioSatisfaccion(),entrevistaDDBB.isTieneVideoIntro(),entrevistaDDBB.getListaVideos(),entrevistaDDBB.getListaCandidatos());
        entrevistaBusiness.crearNuevo(entrevistaCopia);
        try {
            response.sendRedirect( "recuperarEntrevistas.do");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /*
    @RequestMapping(value = "/recuperarVideosFormularios.do", method = RequestMethod.GET)
    public String recuperar(HttpSession session) {
        List<Video> videosIntroductorios=((VideoBusiness)videoBusiness).recuperarPorTipo("videoIntroductorio");
        List<Video> videosPreguntas=((VideoBusiness)videoBusiness).recuperarPorTipo("videoPregunta");
        List<Video> videosTransiciones=((VideoBusiness)videoBusiness).recuperarPorTipo("videoTransicion");
        List<Formulario> formularios=formularioBusiness.recuperarTodos();
        session.setAttribute("videosIntroductorios",videosIntroductorios);
        session.setAttribute("videosPreguntas",videosPreguntas);
        session.setAttribute("videosTransiciones",videosTransiciones);
        session.setAttribute("formularios",formularios);
        return ENTREVISTA_NUEVA;
    }
    */

}
