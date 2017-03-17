package model.business;

import beans.Video;
import model.dao.VideoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("UtilBusiness")
public class UtilBusiness implements BaseUtilBusiness {

    @Autowired
    @Qualifier("VideoDAO")
    private VideoDAO videoDAO;

    @Override
    public List<Video> recuperarPorTipo(String tipo) {
        return videoDAO.selectByType(tipo);
    }
}
