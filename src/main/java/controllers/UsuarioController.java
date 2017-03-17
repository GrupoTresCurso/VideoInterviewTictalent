package controllers;

import beans.entities.Usuario;
import model.business.BaseBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("UsuarioController")
public class UsuarioController implements BaseController {

    @Autowired
    @Qualifier("UsuarioBusiness")
    private BaseBusiness<Usuario> usuarioBusiness;

    @RequestMapping(value = "/crearUsuario.do", method = RequestMethod.POST)
    public String crearUsuario(@RequestParam(value="nombreUsuario") String nombreUsuario,@RequestParam(value="password") String password,@RequestParam(value="rol") String rol) {
        Usuario usuario;
        if (rol.equals("administrador")){
            usuario=new Usuario(nombreUsuario,password,true,false,false,false);
        }else if(rol.equals("reclutador")){
            usuario=new Usuario(nombreUsuario,password,false,true,false,false);
        }else if(rol.equals("responsableContratacion")){
            usuario=new Usuario(nombreUsuario,password,false,false,true,false);
        }else {
            usuario=new Usuario(nombreUsuario,password,false,false,false,true);
        }
        usuarioBusiness.crearNuevo(usuario);
        return CREAR_USUARIO;
    }

}
