package model.dao;

import beans.Usuario;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository("UsuarioDAO")
public class UsuarioDAO implements BaseDAO<Usuario> {

    @PersistenceContext
    private EntityManager manager;

    public void insert(Usuario usuario) {
        manager.merge(usuario);
    }

    public Usuario selectOne(int id) {
        return manager.find(Usuario.class, id);
    }

    public List<Usuario> selectAll() {
        String sql = "SELECT u FROM beans.Usuario u";
        Query query = manager.createQuery(sql);
        return query.getResultList();
    }

    public void update(Usuario usuario) {
        manager.merge(usuario);
    }

    public void delete(int id) {
        manager.remove(manager.find(Usuario.class, id));
    }

    public Usuario selectByName(String nombreUsuario) {
        String sql = "Select u FROM beans.Usuario u WHERE u.nombreUsuario LIKE :nombreUsuario";
        Query query = manager.createQuery(sql);
        query.setParameter("nombreUsuario", "%" + nombreUsuario + "%");
        List<Usuario> usuariosEncontrados = query.getResultList();
        if (usuariosEncontrados.size() == 0) {
            return null;
        } else {
            return usuariosEncontrados.get(0);
        }
    }
}
