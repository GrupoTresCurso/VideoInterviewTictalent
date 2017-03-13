package model.business;

import beans.Respuesta;
import model.dao.RespuestaDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

public class RespuestaBusiness implements BaseBusiness<Respuesta> {

    @Autowired
    @Qualifier("RespuestaDAO")
    private RespuestaDAO respuestaDAO;

    @Override
    public void crearNuevo(Respuesta respuesta) {
        respuestaDAO.insert(respuesta);
    }

    @Override
    public Respuesta recuperarPorId(int id) {
        return respuestaDAO.selectOne(id);
    }

    @Override
    public List<Respuesta> recuperarTodos() {
        return respuestaDAO.selectAll();
    }

    @Override
    public void borrarPorId(int id) {
        respuestaDAO.delete(id);
    }

    @Override
    public void actualizar(Respuesta respuesta) {
        respuestaDAO.update(respuesta);
    }
}
