package controllers;

import beans.entities.Usuario;
import model.business.BaseBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller("UsuarioController")
public class UsuarioController implements BaseController {

    @Autowired
    @Qualifier("UsuarioBusiness")
    private BaseBusiness<Usuario> usuarioBusiness;

    @RequestMapping(value = "loginUsuario.do", method = RequestMethod.POST)
    public String loginUsuario(@RequestParam("nombreUsuario") String nombreUsuario,
                               @RequestParam("passwordUsuario") String passwordUsuario){
        List<Usuario> usuarios = usuarioBusiness.recuperarTodos();

        if(usuarios.size()>0){
            for (Usuario usuario : usuarios) {
                if(usuario.getNombreUsuario().equals(nombreUsuario) && usuario.getPassword().equals(passwordUsuario)){
                    if(usuario.isAdministrador()){
                        return PANEL_ADMIN;
                    } else{
                        return PAGINA_PRINCIPAL;
                    }
                }
            }
        }
        return LOGIN_USUARIO;
    }

}
