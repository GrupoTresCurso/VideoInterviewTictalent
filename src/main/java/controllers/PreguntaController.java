package controllers;

import beans.entities.Pregunta;
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

@Controller("PreguntaController")
public class PreguntaController implements BaseController {

    @Autowired
    @Qualifier("PreguntaBusiness")
    private BaseBusiness<Pregunta> preguntaBusiness;


    @RequestMapping(value = "/guardarPregunta.do", method = RequestMethod.GET)
    public void guardarPregunta(@ModelAttribute("pregunta") Pregunta pregunta, HttpServletResponse response) {
        preguntaBusiness.actualizar(pregunta);
        try {
            response.sendRedirect( "recuperarPreguntas.do");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/recuperarPreguntas.do",method = RequestMethod.GET)
    public String recuperarPreguntas(HttpSession session){
        ArrayList<Pregunta> listaPreguntas= (ArrayList<Pregunta>) preguntaBusiness.recuperarTodos();
        session.setAttribute("listaPreguntas",listaPreguntas);
        session.setAttribute("pregunta",null);
        return "pregunta";
    }

    @RequestMapping(value = "/recuperarPregunta.do",method = RequestMethod.GET)
    public String recuperarPregunta(@RequestParam(value="idPregunta",required=true) int id, HttpSession session, HttpServletResponse response){
        Pregunta pregunta=preguntaBusiness.recuperarPorId(id);
        session.setAttribute("pregunta",pregunta);
        return "pregunta";
    }

}
