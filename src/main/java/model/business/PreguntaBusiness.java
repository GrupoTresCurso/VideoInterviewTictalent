package model.business;

import beans.Pregunta;
import model.dao.PreguntaDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("PreguntaBusiness")
public class PreguntaBusiness implements BaseBusiness<Pregunta> {

    @Autowired
    @Qualifier("PreguntaDAO")
    private PreguntaDAO preguntaDAO;

    @Transactional
    public void crearNuevo(Pregunta pregunta) {
        preguntaDAO.insert(pregunta);
    }
    @Transactional(readOnly=true)
    public Pregunta recuperarPorId(int id) {
        return preguntaDAO.selectOne(id);
    }

    @Transactional(readOnly=true)
    public List<Pregunta> recuperarTodos() {
        return preguntaDAO.selectAll();
    }

    @Transactional
    public void borrarPorId(int id) {
        preguntaDAO.delete(id);
    }

    @Transactional
    public void actualizar(Pregunta pregunta) {
        preguntaDAO.update(pregunta);
    }
}
