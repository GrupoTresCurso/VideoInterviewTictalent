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
    private EntityManager manager;

    @Override
    public void insert(Video video) {
        manager.merge(video);
    }

    @Override
    public Video selectOne(int id) {
        return manager.find(Video.class, id);
    }

    @Override
    public List<Video> selectAll() {
        String sql = "SELECT video FROM beans.Video video";
        Query query = manager.createQuery(sql);
        return query.getResultList();
    }

    @Override
    public void update(Video video) {
        manager.merge(video);
    }

    @Override
    public void delete(int id) {
        manager.remove(manager.find(Video.class, id));
    }
}
