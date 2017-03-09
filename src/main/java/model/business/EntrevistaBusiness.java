package model.business;

import beans.Entrevista;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EntrevistaBusiness implements BaseBusiness<Entrevista> {

    @Transactional
    public void crearNuevo(Entrevista object) {

    }

    @Transactional(readOnly=true)
    public Entrevista recuperarPorId(int id) {
        return null;
    }

    @Transactional(readOnly=true)
    public List<Entrevista> recuperarTodos() {
        return null;
    }

    @Transactional
    public void borrarPorId(int id) {

    }

    @Override
    public void actualizar(Entrevista object) {

    }
}
