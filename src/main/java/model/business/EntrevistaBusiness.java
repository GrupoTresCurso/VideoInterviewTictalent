package model.business;

import beans.Entrevista;
import model.dao.EntrevistaDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("EntrevistaBusiness")
public class EntrevistaBusiness implements BaseBusiness<Entrevista> {

    @Autowired
    @Qualifier("EntrevistaDAO")
    private EntrevistaDAO entrevistaDAO;

    @Transactional
    public void crearNuevo(Entrevista entrevista) {
        entrevistaDAO.insert(entrevista);
    }

    @Transactional(readOnly=true)
    public Entrevista recuperarPorId(int id) {
        return entrevistaDAO.selectOne(id);
    }

    @Transactional(readOnly=true)
    public List<Entrevista> recuperarTodos() {
        return entrevistaDAO.selectAll();
    }

    @Transactional
    public void borrarPorId(int id) {
        entrevistaDAO.delete(id);
    }

    @Transactional
    public void actualizar(Entrevista entrevista) {
        entrevistaDAO.update(entrevista);
    }
}
