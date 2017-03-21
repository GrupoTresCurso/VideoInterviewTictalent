package controllers;

import org.springframework.stereotype.Controller;

@Controller("PreguntaController")
public class PreguntaController implements BaseController {

    @Autowired
    @Qualifier("PreguntaBusiness")
    private BaseBusiness<Pregunta> preguntaBusiness;


    @RequestMapping(value = "/guardarPregunta.do", method = RequestMethod.GET)
    public void guardarPregunta(@ModelAttribute("pregunta") Pregunta pregunta,HttpServletResponse response) {
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
    public String recuperarPregunta(@RequestParam(value="idPregunta",required=true) int id,HttpSession session, HttpServletResponse response){
        Pregunta pregunta=preguntaBusiness.recuperarPorId(id);
        session.setAttribute("pregunta",pregunta);
        return "pregunta";
    }

}
