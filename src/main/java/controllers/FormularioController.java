package controllers;

import beans.entities.Formulario;
import beans.entities.Pregunta;
import beans.helpers.ID;
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

    @Autowired
    @Qualifier("PreguntaBusiness")
    private BaseBusiness<Pregunta> preguntaBusiness;

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
    }*/

    @RequestMapping(value = "/nuevoFormulario.do", method = RequestMethod.GET)
    public void nuevoFormulario(HttpSession session,HttpServletResponse response) {
        session.setAttribute("formulario",null);
        try {
            response.sendRedirect("/recuperarPreguntas.do");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/recuperarFormularios.do", method = RequestMethod.GET)
    public String recuperarFormularios(HttpSession session) {
        ArrayList<Formulario> listaFormularios = (ArrayList<Formulario>) formularioBusiness.recuperarTodos();
        session.setAttribute("listaFormularios", listaFormularios);
        return FORMULARIO_INDEX;
    }

    @RequestMapping(value = "/recuperarFormulario.do",method = RequestMethod.GET)
    public void recuperarFormulario(@RequestParam(value="idFormulario",required=true) int id, HttpSession session,HttpServletResponse response){
        Formulario formulario=formularioBusiness.recuperarPorId(id);
        session.setAttribute("formulario",formulario);
        try {
            response.sendRedirect("/recuperarPreguntas.do");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/eliminarFormulario.do",method = RequestMethod.GET)
    public void eliminarCandidato(@RequestParam(value="idFormulario",required=true) int id, HttpServletResponse response){
        formularioBusiness.borrarPorId(id);
        try {
            response.sendRedirect("/recuperarFormularios.do");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/crearFormulario.do", method = RequestMethod.GET)
    public void crearFormulario(HttpServletResponse response,@ModelAttribute("preguntaForm") PreguntaForm preguntaForm,@RequestParam(value="idFormulario",required=false) Integer idFormulario,@RequestParam(value="nombreFormulario",required=false) String nombreFormulario) {
        List <Pregunta> listaPreguntas=new ArrayList<>();
        List <Pregunta> listaPreguntasSinDDBB=preguntaForm.getPreguntasSinDDBB();
        List <ID> listIdentificadores=preguntaForm.getIdentificadoresDDBB();

        if(listaPreguntasSinDDBB!=null){
            for (Pregunta pregunta : listaPreguntasSinDDBB) {
                preguntaBusiness.crearNuevo(pregunta);
                listaPreguntas.add(pregunta);
            }
        }
        if(listIdentificadores!=null){
            for (ID id : listIdentificadores) {
                Pregunta pregunta=preguntaBusiness.recuperarPorId(id.getId());
                listaPreguntas.add(pregunta);
            }
        }
        if(idFormulario!=null){
            Formulario formularioDDBB=formularioBusiness.recuperarPorId(idFormulario);
            formularioDDBB.setPreguntas(listaPreguntas);
            formularioDDBB.setNombreFormulario(nombreFormulario);
            formularioBusiness.actualizar(formularioDDBB);
        }else {
            Formulario formulario=new Formulario(nombreFormulario,listaPreguntas);
            formularioBusiness.crearNuevo(formulario);
        }
        try {
            response.sendRedirect("/recuperarFormularios.do");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
