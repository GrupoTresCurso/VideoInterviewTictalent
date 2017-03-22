package controllers;

import beans.entities.Formulario;
import beans.entities.Pregunta;
import beans.helpers.PreguntaForm;
import model.business.BaseBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller("FormularioController")
public class FormularioController implements BaseController {

    @Autowired
    @Qualifier("FormularioBusiness")
    private BaseBusiness<Formulario> formularioBusiness;

    /*

    @RequestMapping(value = "/guardarFormulario.do", method = RequestMethod.GET)
    public void guardarFormulario(@ModelAttribute("formulario") Formulario formulario, HttpServletResponse response) {
        formularioBusiness.actualizar(formulario);
        try {
            response.sendRedirect( "recuperarFormularios.do");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/recuperarFormularios.do",method = RequestMethod.GET)
    public String recuperarFormularios(HttpSession session){
        ArrayList<Formulario> listaFormularios= (ArrayList<Formulario>) formularioBusiness.recuperarTodos();
        session.setAttribute("listaFormulario",listaFormularios);
        session.setAttribute("formulario",null);
        return "formulario";
    }

    @RequestMapping(value = "/recuperarFormulario.do",method = RequestMethod.GET)
    public String recuperarFormulario(@RequestParam(value="idFormulario",required=true) int id, HttpSession session, HttpServletResponse response){
        Formulario formulario=formularioBusiness.recuperarPorId(id);
        session.setAttribute("formulario",formulario);
        return "formulario";
    }*/

    @RequestMapping(value = "/crearFormulario.do", method = RequestMethod.GET)
    public String crearFormulario(@ModelAttribute("preguntaForm") PreguntaForm preguntaForm) {
        List <Pregunta> listaPreguntas=preguntaForm.getPreguntasSinDDBB();
        Formulario formulario=new Formulario("ASD",listaPreguntas,0);
        formularioBusiness.crearNuevo(formulario);
        return FORMULARIO;
    }


}
