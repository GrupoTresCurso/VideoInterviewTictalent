package model.business;

import beans.entities.Respuesta;
import model.dao.RespuestaDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("RespuestaBusiness")
public class RespuestaBusiness implements BaseBusiness<Respuesta> {

    @Autowired
    @Qualifier("RespuestaDAO")
    private RespuestaDAO respuestaDAO;

    @Override
    @Transactional
    public void crearNuevo(Respuesta respuesta) {
        respuestaDAO.insert(respuesta);
    }

    @Override
    @Transactional(readOnly=true)
    public Respuesta recuperarPorId(int id) {
        return respuestaDAO.selectOne(id);
    }

    @Override
    @Transactional(readOnly=true)
    public List<Respuesta> recuperarTodos() {
        return respuestaDAO.selectAll();
    }

    @Override
    @Transactional
    public void borrarPorId(int id) {
        respuestaDAO.delete(id);
    }

    @Override
    @Transactional
    public void actualizar(Respuesta respuesta) {
        respuestaDAO.update(respuesta);
    }
}
