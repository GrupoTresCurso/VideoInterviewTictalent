package model.dao;

import beans.Pregunta;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Repository("PreguntaDAO")
public class PreguntaDAO implements BaseDAO<Pregunta> {

    @PersistenceContext
    EntityManager entityManager;

    public void insert(Pregunta pregunta) {
        entityManager.persist(pregunta);
    }

    public Pregunta selectOne(int id) {
        return entityManager.find(Pregunta.class, id);
    }

    public List<Pregunta> selectAll() {
        List<Pregunta> listaPreguntas=new ArrayList();

        try {
            String sql = "SELECT p FROM beans.Pregunta p";
            Query query = entityManager.createQuery(sql);
            listaPreguntas = query.getResultList();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaPreguntas;
    }

    public void update(Pregunta pregunta) {
        entityManager.merge(pregunta);
    }

    public void delete(int id) {
        entityManager.remove(entityManager.find(Pregunta.class,id));
    }
}
