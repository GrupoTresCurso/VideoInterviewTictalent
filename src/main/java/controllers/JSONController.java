package controllers;

import beans.Entrevista;
import model.business.BaseBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class JSONController {

    @Autowired
    @Qualifier("EntrevistaBusiness")
    private BaseBusiness<Entrevista> entrevistaBusiness;

    @RequestMapping(value = "/jsonController.do", method = RequestMethod.GET)
    public Entrevista listaVideos(@RequestParam(value="idEntrevista") Integer idEntrevista) {
        return entrevistaBusiness.recuperarPorId(idEntrevista);
    }

}
