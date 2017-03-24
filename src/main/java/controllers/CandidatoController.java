package controllers;

import beans.entities.Candidato;
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

@Controller("CandidatoController")
public class CandidatoController implements BaseController {

    @Autowired
    @Qualifier("CandidatoBusiness")
    private BaseBusiness<Candidato> candidatoBusiness;


    @RequestMapping(value = "/guardarCandidato.do", method = RequestMethod.GET)
    public void guardarCandidato(@ModelAttribute("candidato") Candidato candidato,HttpServletResponse response,HttpSession session) {
        candidatoBusiness.actualizar(candidato);
        try {
            response.sendRedirect("/recuperarCandidatos.do");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/recuperarCandidatos.do",method = RequestMethod.GET)
    public String recuperarCandidatos(HttpSession session){
        ArrayList<Candidato> listaCandidatos= (ArrayList<Candidato>) candidatoBusiness.recuperarTodos();
        session.setAttribute("listaCandidatos",listaCandidatos);
        session.setAttribute("candidato",null);
        return "candidato";
    }

    @RequestMapping(value = "/recuperarCandidato.do",method = RequestMethod.GET)
    public String recuperarCandidato(@RequestParam(value="idCandidato",required=true) int id,HttpSession session, HttpServletResponse response){
        Candidato candidato=candidatoBusiness.recuperarPorId(id);
        session.setAttribute("candidato",candidato);
        return "candidato";
    }

}
