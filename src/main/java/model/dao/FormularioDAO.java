package model.dao;

import beans.entities.Formulario;
import beans.entities.Pregunta;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Repository("FormularioDAO")
public class FormularioDAO implements BaseDAO<Formulario> {

    @PersistenceContext
    private EntityManager manager;

    public void insert(Formulario formulario) {
        manager.merge(formulario);
    }

    public Formulario selectOne(int id) {
        String prepareQuery = "select formulario from beans.entities.Formulario formulario where idFormulario = :id";
        Query query = manager.createQuery(prepareQuery);
        query.setParameter("id", id);
        return (Formulario) query.getSingleResult();
    }

    public List<Formulario> selectAll() {
        String prepareQuery = "select formulario from beans.entities.Formulario formulario";
        Query query = manager.createQuery(prepareQuery);
        return query.getResultList();
    }

    public void update(Formulario formulario) {
        manager.merge(formulario);
    }

    public void delete(int id) {
        Formulario formulario = manager.find(Formulario.class, id);
        List<Pregunta> listaPreguntas=formulario.getPreguntas();
        for (Pregunta pregunta : listaPreguntas) {
            if(!pregunta.isFavorito()){
                Pregunta preguntaNoFav=manager.find(Pregunta.class,pregunta.getIdPregunta());
                manager.remove(preguntaNoFav);
            }
        }
        formulario.setPreguntas(new ArrayList<>());
        manager.merge(formulario);
        manager.remove(formulario);
    }
}
