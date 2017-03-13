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
    EntityManager entityManager;

    @Override
    public void insert(Respuesta respuesta) {
        entityManager.persist(respuesta);
    }

    @Override
    public Respuesta selectOne(int id) {
        return entityManager.find(Respuesta.class, id);
    }

    @Override
    public List<Respuesta> selectAll() {
        String sql = "SELECT respuesta FROM beans.Respuesta respuesta";
        Query query = entityManager.createQuery(sql);

        return query.getResultList();
    }

    @Override
    public void update(Respuesta respuesta) {
        entityManager.merge(respuesta);
    }

    @Override
    public void delete(int id) {
        entityManager.remove(entityManager.find(Respuesta.class, id));
    }
}
