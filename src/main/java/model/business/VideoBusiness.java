package model.business;

import beans.Video;
import model.dao.VideoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("VideoBusiness")
public class VideoBusiness implements BaseBusiness<Video> {

    @Autowired
    @Qualifier("VideoDAO")
    private VideoDAO videoDAO;

    @Override
    public void crearNuevo(Video object) {

    }

    @Override
    public Video recuperarPorId(int id) {
        return null;
    }

    @Override
    public List<Video> recuperarTodos() {
        return null;
    }

    @Override
    public void borrarPorId(int id) {

    }

    @Override
    public void actualizar(Video object) {

    }
}
