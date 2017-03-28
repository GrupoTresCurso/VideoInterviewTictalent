package controllers;

import beans.entities.Pregunta;
import model.business.BaseBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller("PreguntaController")
public class PreguntaController implements BaseController {

    @Autowired
    @Qualifier("PreguntaBusiness")
    private BaseBusiness<Pregunta> preguntaBusiness;


    @RequestMapping(value = "guardarPreguntaFavorita.do", method = RequestMethod.POST)
    public @ResponseBody List<Pregunta> guardarPreguntaFavorita(@RequestParam(value="labelPregunta") String labelPregunta,@RequestParam(value="tipoPregunta") String tipoPregunta,@RequestParam(value="opciones") String opcioness,HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Pregunta pregunta=new Pregunta(labelPregunta,tipoPregunta,opcioness,true);
        preguntaBusiness.crearNuevo(pregunta);
        List<Pregunta> listaPreguntas= preguntaBusiness.recuperarTodos();
        List<Pregunta> listaPreguntasPredefinidas=new ArrayList<Pregunta>();
        for (Pregunta pregunta2:listaPreguntas) {
            if(pregunta2.isFavorito()){
                listaPreguntasPredefinidas.add(pregunta2);
            }
        }
        return listaPreguntasPredefinidas;
    }




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
        List<Pregunta> listaPreguntas=  preguntaBusiness.recuperarTodos();
        List<Pregunta> listaPreguntasPredefinidas=new ArrayList<Pregunta>();
        for (Pregunta pregunta:listaPreguntas) {
            if(pregunta.isFavorito()){
                listaPreguntasPredefinidas.add(pregunta);
            }
        }
        session.setAttribute("listaPreguntasPredefinidas",listaPreguntasPredefinidas);
        return FORMULARIO;
    }

    @RequestMapping(value = "/recuperarPreguntasGestion.do",method = RequestMethod.GET)
    public String recuperarPreguntasGestion(HttpSession session){
        List<Pregunta> listaPreguntas=  preguntaBusiness.recuperarTodos();
        List<Pregunta> listaPreguntasPredefinidas=new ArrayList<Pregunta>();
        for (Pregunta pregunta:listaPreguntas) {
            if(pregunta.isFavorito()){
                listaPreguntasPredefinidas.add(pregunta);
            }
        }
        session.setAttribute("listaPreguntasPredefinidas",listaPreguntasPredefinidas);
        return PREGUNTA_GESTION;
    }


    @RequestMapping(value = "/eliminarPregunta.do",method = RequestMethod.GET)
    public void eliminarPregunta(@RequestParam(value="idPregunta",required=true) int id, HttpServletResponse response){
        preguntaBusiness.borrarPorId(id);
        try {
            response.sendRedirect( "recuperarPreguntasGestion.do");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
