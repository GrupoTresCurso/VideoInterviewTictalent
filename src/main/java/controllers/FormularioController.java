package controllers;

import org.springframework.stereotype.Controller;

@Controller("FormularioController")
public class FormularioController implements BaseController {

    @Autowired
    @Qualifier("FormularioBusiness")
    private BaseBusiness<Formulario> formularioBusiness;


    @RequestMapping(value = "/guardarFormulario.do", method = RequestMethod.GET)
    public void guardarFormulario(@ModelAttribute("formulario") Formulario formulario,HttpServletResponse response) {
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
    public String recuperarFormulario(@RequestParam(value="idFormulario",required=true) int id,HttpSession session, HttpServletResponse response){
        Formulario formulario=formularioBusiness.recuperarPorId(id);
        session.setAttribute("formulario",formulario);
        return "formulario";
    }


}
