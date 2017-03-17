package model.business;

import beans.Video;
import model.dao.VideoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("VideoBusiness")
public class VideoBusiness implements BaseBusiness<Video> {

    @Autowired
    @Qualifier("VideoDAO")
    private VideoDAO videoDAO;

    @Override
    @Transactional
    public void crearNuevo(Video video) {
        videoDAO.insert(video);
    }

    @Override
    @Transactional(readOnly=true)
    public Video recuperarPorId(int id) {
        return videoDAO.selectOne(id);
    }

    @Override
    @Transactional(readOnly=true)
    public List<Video> recuperarTodos() {
        return videoDAO.selectAll();
    }

    @Override
    @Transactional
    public void borrarPorId(int id) {
        videoDAO.delete(id);
    }

    @Override
    @Transactional
    public void actualizar(Video video) {
        videoDAO.update(video);
    }

    @Transactional(readOnly=true)
    public List<Video> recuperarPorTipo(String tipo) {
        return videoDAO.selectByType(tipo);
    }

}
