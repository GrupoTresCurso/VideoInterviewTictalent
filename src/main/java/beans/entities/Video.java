package beans.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Video {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int idVideo;

    private String nombreVideo;
    private String linkVideo;
    private String tipoVideo;

    public Video() {
    }

    public Video(String nombreVideo, String linkVideo, String tipoVideo) {
        this.nombreVideo = nombreVideo;
        this.linkVideo = linkVideo;
        this.tipoVideo = tipoVideo;
    }

    public int getIdVideo() {
        return idVideo;
    }

    public void setIdVideo(int idVideo) {
        this.idVideo = idVideo;
    }

    public String getNombreVideo() {
        return nombreVideo;
    }

    public void setNombreVideo(String nombreVideo) {
        this.nombreVideo = nombreVideo;
    }

    public String getLinkVideo() {
        return linkVideo;
    }

    public void setLinkVideo(String linkVideo) {
        this.linkVideo = linkVideo;
    }

    public String getTipoVideo() {
        return tipoVideo;
    }

    public void setTipoVideo(String tipoVideo) {
        this.tipoVideo = tipoVideo;
    }
}
