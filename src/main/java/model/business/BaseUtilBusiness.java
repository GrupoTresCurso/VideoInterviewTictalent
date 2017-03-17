package model.business;

import beans.Video;

import java.util.List;

public interface BaseUtilBusiness {

    List<Video> recuperarPorTipo(String tipo);
}
