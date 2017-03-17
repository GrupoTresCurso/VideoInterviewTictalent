package model.business;

import beans.entities.Usuario;
import model.dao.UsuarioDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

@Service("UsuarioBusiness")
public class UsuarioBusiness implements BaseBusiness<Usuario> {

    @Autowired
    @Qualifier("UsuarioDAO")
    private UsuarioDAO usuarioDAO;

    @Transactional //Comprobacion de nombre unico para el Registro
    public void crearNuevo(Usuario usuario) {
        String nombreUsuario = usuario.getNombreUsuario();
        if(isNotRegister(nombreUsuario)){
            usuarioDAO.insert(usuario);
        }
    }

    private boolean isNotRegister(String nombreUsuario) {
        return usuarioDAO.selectByName(nombreUsuario)==null;
    }

    @Transactional(readOnly=true)
    public Usuario recuperarPorId(int id) {
        return usuarioDAO.selectOne(id);
    }

    @Transactional(readOnly=true)
    public List<Usuario> recuperarTodos() {
        return usuarioDAO.selectAll();
    }

    @Transactional
    public void borrarPorId(int id) {
        usuarioDAO.delete(id);
    }

    @Transactional
    public void actualizar(Usuario usuario) {
        usuarioDAO.update(usuario);
    }
}
