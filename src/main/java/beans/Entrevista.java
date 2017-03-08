package beans;

import java.lang.reflect.Array;
import java.util.ArrayList;

/**
 * Created by TictumManaña on 08/03/2017.
 */
public class Entrevista {

    private int idEntrevista;
    private boolean tieneVideoIntro;
    private ArrayList<Formulario> Formulario;
    private ArrayList<Video> videoTransicion;
    private ArrayList<Video> preguntaVideo;
    private Formulario cuestionarioSatifaccion;
    private ArrayList<Adjunto> adjunto;
    private String mensaje;

    public Entrevista() {
    }

    public Entrevista(int idEntrevista, boolean tieneVideoIntro, ArrayList<beans.Formulario> formulario, ArrayList<Video> videoTransicion, ArrayList<Video> preguntaVideo, beans.Formulario cuestionarioSatifaccion, ArrayList<Adjunto> adjunto, String mensaje) {
        this.idEntrevista = idEntrevista;
        this.tieneVideoIntro = tieneVideoIntro;
        Formulario = formulario;
        this.videoTransicion = videoTransicion;
        this.preguntaVideo = preguntaVideo;
        this.cuestionarioSatifaccion = cuestionarioSatifaccion;
        this.adjunto = adjunto;
        this.mensaje = mensaje;
    }

    public int getIdEntrevista() {
        return idEntrevista;
    }

    public boolean isTieneVideoIntro() {
        return tieneVideoIntro;
    }

    public ArrayList<beans.Formulario> getFormulario() {
        return Formulario;
    }

    public ArrayList<Video> getVideoTransicion() {
        return videoTransicion;
    }

    public ArrayList<Video> getPreguntaVideo() {
        return preguntaVideo;
    }

    public beans.Formulario getCuestionarioSatifaccion() {
        return cuestionarioSatifaccion;
    }

    public ArrayList<Adjunto> getAdjunto() {
        return adjunto;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setIdEntrevista(int idEntrevista) {
        this.idEntrevista = idEntrevista;
    }

    public void setTieneVideoIntro(boolean tieneVideoIntro) {
        this.tieneVideoIntro = tieneVideoIntro;
    }

    public void setFormulario(ArrayList<beans.Formulario> formulario) {
        Formulario = formulario;
    }

    public void setVideoTransicion(ArrayList<Video> videoTransicion) {
        this.videoTransicion = videoTransicion;
    }

    public void setPreguntaVideo(ArrayList<Video> preguntaVideo) {
        this.preguntaVideo = preguntaVideo;
    }

    public void setCuestionarioSatifaccion(beans.Formulario cuestionarioSatifaccion) {
        this.cuestionarioSatifaccion = cuestionarioSatifaccion;
    }

    public void setAdjunto(ArrayList<Adjunto> adjunto) {
        this.adjunto = adjunto;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
}
