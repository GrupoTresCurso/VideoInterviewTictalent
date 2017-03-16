package model.dao;

import beans.Pregunta;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository("PreguntaDAO")
public class PreguntaDAO implements BaseDAO<Pregunta> {

    @PersistenceContext
    private EntityManager manager;

    public void insert(Pregunta pregunta) {
        manager.merge(pregunta);
    }

    public Pregunta selectOne(int id) {
        return manager.find(Pregunta.class, id);
    }

    public List<Pregunta> selectAll() {

        String sql = "SELECT pregunta FROM beans.Pregunta pregunta";
        Query query = manager.createQuery(sql);

        return query.getResultList();
    }

    public void update(Pregunta pregunta) {
        manager.merge(pregunta);
    }

    public void delete(int id) {
        manager.remove(manager.find(Pregunta.class, id));
    }
}
