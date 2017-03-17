package model.dao;

import beans.entities.Entrevista;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Repository("EntrevistaDAO")
public class EntrevistaDAO implements BaseDAO<Entrevista>{

    @PersistenceContext
    private EntityManager manager;

    @Override
    public void insert(Entrevista entrevista) {
        manager.merge(entrevista);
    }

    @Override
    public Entrevista selectOne(int id) {
        return manager.find(Entrevista.class,id);
    }

    @Override
    public List<Entrevista> selectAll() {
        List<Entrevista> listaEntrevistas=new ArrayList<>();
        try {
            String sql = "SELECT entrevista FROM beans.Entrevista entrevista";
            Query query = manager.createQuery(sql);
            listaEntrevistas = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaEntrevistas;
    }

    @Override
    public void update(Entrevista entrevista) {
        manager.merge(entrevista);

    }

    @Override
    public void delete(int id) {
        Entrevista entrevistaDDBB= manager.find(Entrevista.class,id);
        manager.remove(entrevistaDDBB);
    }
}
