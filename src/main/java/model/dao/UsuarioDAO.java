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
    private EntityManager entityManager;

    public void insert(Usuario usuario) {
        entityManager.persist(usuario);
    }

    public Usuario selectOne(int id) {
        return entityManager.find(Usuario.class, id);
    }

    public List<Usuario> selectAll() {
        String sql = "SELECT u FROM beans.Usuario u";
        Query query = entityManager.createQuery(sql);
        return query.getResultList();
    }

    public void update(Usuario usuario) {
        entityManager.merge(usuario);
    }

    public void delete(int id) {
        entityManager.remove(entityManager.find(Usuario.class, id));
    }

    public Usuario selectByName(String nombreUsuario) {
        String sql = "Select u FROM beans.Usuario u WHERE u.nombreUsuario LIKE :nombreUsuario";
        Query query = entityManager.createQuery(sql);
        query.setParameter("nombreUsuario", "%" + nombreUsuario + "%");
        List<Usuario> usuariosEncontrados = query.getResultList();
        if (usuariosEncontrados.size() == 0) {
            return null;
        } else {
            return usuariosEncontrados.get(0);
        }
    }
}
