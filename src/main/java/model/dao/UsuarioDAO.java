package model.dao;

import beans.Usuario;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Repository("UsuarioDAO")
public class UsuarioDAO implements BaseDAO<Usuario> {

    @PersistenceContext
    EntityManager entityManager;

    public void insert(Usuario usuario) {
        entityManager.persist(usuario);
    }

    public Usuario selectOne(int id) {
        return entityManager.find(Usuario.class, id);
    }

    public Usuario selectByName(String nombreUsuario){
        List<Usuario> usuariosEncontrados = null;
        String sql = "Select u FROM beans.Usuario u WHERE u.nombreUsuario LIKE :nombreUsuario";
        Query query = entityManager.createQuery(sql);
        query.setParameter("nombreUsuario", "%"+nombreUsuario+"%");
        usuariosEncontrados = query.getResultList();
        Usuario usuarioDDBB=usuariosEncontrados.get(0);
        return usuarioDDBB;
    }

    public List<Usuario> selectAll() {
        List<Usuario> listaUsuarios=new ArrayList();

        try {
            String sql = "SELECT u FROM beans.Usuario u";
            Query query = entityManager.createQuery(sql);
            listaUsuarios = query.getResultList();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaUsuarios;
    }

    public void update(Usuario usuario) {
        entityManager.merge(usuario);
    }

    public void delete(int id) {
        entityManager.remove(entityManager.find(Usuario.class,id));
    }
}
