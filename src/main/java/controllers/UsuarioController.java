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

    @RequestMapping(value = "/crearUsuario.do", method = RequestMethod.POST)
    public String crearUsuario(@RequestParam(value="nombreUsuario") String nombreUsuario,@RequestParam(value="password") String password,@RequestParam(value="rol") String rol) {
        Usuario usuario;
        switch (rol) {
            case "administrador":
                usuario = new Usuario(nombreUsuario, password, true, false, false, false);
                break;
            case "reclutador":
                usuario = new Usuario(nombreUsuario, password, false, true, false, false);
                break;
            case "responsableContratacion":
                usuario = new Usuario(nombreUsuario, password, false, false, true, false);
                break;
            default:
                usuario = new Usuario(nombreUsuario, password, false, false, false, true);
                break;
        }
        usuarioBusiness.crearNuevo(usuario);
        return CREAR_USUARIO;
    }
}
