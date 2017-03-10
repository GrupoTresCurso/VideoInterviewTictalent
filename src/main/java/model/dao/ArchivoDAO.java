package model.dao;

import beans.Archivo;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by Tictum on 10/03/2017.
 */

@Repository("ArchivoDAO")
public class ArchivoDAO implements BaseDAO<Archivo>{

    @PersistenceContext
    private EntityManager manager;

    @Override
    public void insert(Archivo archivo) {
        manager.persist(archivo);
    }

    @Override
    public Archivo selectOne(int id) {
        return manager.find(Archivo.class,id);
    }

    @Override
    public List<Archivo> selectAll() {
        String prepareQuery = "select archivo from beans.Archivo archivo";
        Query query = manager.createQuery(prepareQuery);
        return query.getResultList();
    }

    @Override
    public void update(Archivo archivo) {
        manager.merge(archivo);
    }

    @Override
    public void delete(int id) {
        Archivo archivoDDBB=manager.find(Archivo.class,id);
        manager.remove(archivoDDBB);
    }
}
