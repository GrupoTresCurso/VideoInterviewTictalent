package model.business;

import beans.Usuario;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class UsuarioBusiness implements BaseBusiness<Usuario> {

    @Transactional
    public void crearNuevo(Usuario object) {

    }

    public Usuario recuperarPorId(int id) {
        return null;
    }

    public List<Usuario> recuperarTodos() {
        return null;
    }

    public void borrarPorId(int id) {

    }

    @Override
    public void actualizar(Usuario object) {

    }
}
