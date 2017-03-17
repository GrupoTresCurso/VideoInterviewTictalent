package controllers;

import beans.Usuario;
import model.business.BaseBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller("UsuarioController")
public class UsuarioController implements BaseController {

    @Autowired
    @Qualifier("UsuarioBusiness")
    private BaseBusiness<Usuario> usuarioBusiness;

}
