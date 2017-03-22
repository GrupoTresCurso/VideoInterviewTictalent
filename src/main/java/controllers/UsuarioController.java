package controllers;

import beans.entities.Usuario;
import model.business.BaseBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import utils.UtilHash;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller("UsuarioController")
public class UsuarioController implements BaseController {

    @Autowired
    @Qualifier("UsuarioBusiness")
    private BaseBusiness<Usuario> usuarioBusiness;

    @RequestMapping(value = "loginUsuario.do", method = RequestMethod.POST)
    public String loginUsuario(@RequestParam("nombreUsuario") String nombreUsuario,
                               @RequestParam("passwordUsuario") String passwordUsuario,
                                HttpSession session){
        List<Usuario> usuarios = usuarioBusiness.recuperarTodos();

        if(usuarios.size()>0){
            for (Usuario usuario : usuarios) {
                if(nameIsCorrect(nombreUsuario, usuario) && passwordIsCorrect(passwordUsuario, usuario)){
                    session.setAttribute("usuario", usuario);
                    if(usuario.isAdministrador()){
                        return PANEL_ADMIN;
                    } else{
                        return PAGINA_PRINCIPAL;
                    }
                }
            }
        }
        return INDEX;
    }

    @RequestMapping(value = "logoutUsuario.do", method = RequestMethod.GET)
    public String logoutUsuario(HttpSession session){
        session.invalidate();
        return INDEX;
    }

    private boolean passwordIsCorrect(@RequestParam("passwordUsuario") String passwordIntroducida, Usuario usuario) {
        String passwordGuardada = usuario.getPassword();
        return passwordGuardada.equals(UtilHash.doHash(passwordIntroducida));
    }

    private boolean nameIsCorrect(@RequestParam("nombreUsuario") String nombreUsuario, Usuario usuario) {
        return usuario.getNombreUsuario().equals(nombreUsuario);
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
        usuario.setPassword(UtilHash.doHash(usuario.getPassword()));
        usuarioBusiness.crearNuevo(usuario);
        return PANEL_ADMIN;
    }
}
