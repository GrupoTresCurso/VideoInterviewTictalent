package model.dao;

import beans.Video;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository("VideoDAO")
public class VideoDAO implements BaseDAO<Video> {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void insert(Video video) {
        entityManager.persist(video);
    }

    @Override
    public Video selectOne(int id) {
        return entityManager.find(Video.class, id);
    }

    @Override
    public List<Video> selectAll() {
        String sql = "SELECT video FROM beans.Video video";
        Query query = entityManager.createQuery(sql);
        return query.getResultList();
    }

    @Override
    public void update(Video video) {
        entityManager.merge(video);
    }

    @Override
    public void delete(int id) {
        entityManager.remove(entityManager.find(Video.class, id));
    }
}
