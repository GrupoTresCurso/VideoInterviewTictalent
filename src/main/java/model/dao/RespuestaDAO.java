package model.dao;

import beans.Respuesta;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository("RespuestaDAO")
public class RespuestaDAO implements BaseDAO<Respuesta> {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public void insert(Respuesta respuesta) {
        manager.merge(respuesta);
    }

    @Override
    public Respuesta selectOne(int id) {
        return manager.find(Respuesta.class, id);
    }

    @Override
    public List<Respuesta> selectAll() {
        String sql = "SELECT respuesta FROM beans.Respuesta respuesta";
        Query query = manager.createQuery(sql);

        return query.getResultList();
    }

    @Override
    public void update(Respuesta respuesta) {
        manager.merge(respuesta);
    }

    @Override
    public void delete(int id) {
        manager.remove(manager.find(Respuesta.class, id));
    }
}
