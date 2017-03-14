package controllers;

import beans.Candidato;
import model.business.BaseBusiness;
import model.business.CandidatoBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller("CandidatoController")
public class CandidatoController implements BaseController {

    @Autowired
    @Qualifier("CandidatoBusiness")
    private BaseBusiness<Candidato> candidatoBusiness;


    @RequestMapping(value = "/guardarCandidato.do", method = RequestMethod.POST)
    public String guardarCandidato(@ModelAttribute("candidato") Candidato candidato,HttpSession session) {
        candidatoBusiness.crearNuevo(candidato);
        ArrayList<Candidato> listaCandidatos= (ArrayList<Candidato>) candidatoBusiness.recuperarTodos();
        session.setAttribute("listaCandidatos",listaCandidatos);
        return "Candidato";
    }

}
