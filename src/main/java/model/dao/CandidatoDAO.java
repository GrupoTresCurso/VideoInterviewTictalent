package model.dao;

import beans.Candidato;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository("CandidatoDAO")
public class CandidatoDAO implements BaseDAO<Candidato> {

    @PersistenceContext
    private EntityManager manager;

    public void insert(Candidato candidato) {
        manager.persist(candidato);
    }

    public Candidato selectOne(int id) {
        String prepareQuery = "select candidato from beans.Candidato candidato where idCandidato = :id";
        Query query = manager.createQuery(prepareQuery);
        query.setParameter("id", id);
        return (Candidato) query.getSingleResult();
    }

    public List<Candidato> selectAll() {
        String prepareQuery = "select candidato from beans.Candidato candidato";
        Query query = manager.createQuery(prepareQuery);
        return query.getResultList();
    }

    public void update(Candidato candidato) {
        manager.merge(candidato);
    }

    public void delete(int id) {
        Candidato candidato = manager.find(Candidato.class, id);
        manager.remove(candidato);
    }
}
