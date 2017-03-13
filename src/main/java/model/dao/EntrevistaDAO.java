package model.dao;

import beans.Entrevista;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Tictum on 09/03/2017.
 */
@Repository("EntrevistaDAO")
public class EntrevistaDAO implements BaseDAO<Entrevista>{

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public void insert(Entrevista entrevista) {
        entityManager.persist(entrevista);
    }

    @Override
    public Entrevista selectOne(int id) {
        return entityManager.find(Entrevista.class,id);
    }

    @Override
    public List<Entrevista> selectAll() {
        List<Entrevista> listaEntrevistas=new ArrayList<>();
        try {
            String sql = "SELECT entrevista FROM beans.Entrevista entrevista";
            Query query = entityManager.createQuery(sql);
            listaEntrevistas = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaEntrevistas;
    }

    @Override
    public void update(Entrevista entrevista) {
        entityManager.merge(entrevista);

    }

    @Override
    public void delete(int id) {
        Entrevista entrevistaDDBB=entityManager.find(Entrevista.class,id);
        entityManager.remove(entrevistaDDBB);
    }
}
