package model.business;

import beans.entities.Video;

import java.util.List;

public interface BaseUtilBusiness {

    List<Video> recuperarPorTipo(String tipo);
}
