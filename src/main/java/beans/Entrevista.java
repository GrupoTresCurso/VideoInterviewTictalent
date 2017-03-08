package beans;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.ArrayList;

/**
 * Created by TictumManaña on 08/03/2017.
 */
@Entity
/*@Table(name="ENTREVISTA")*/

public class Entrevista {
    @Id
   /*@Column(name="idEntrevista")*/
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int idEntrevista;
    private String nombreEntrevista;
    private String nombrePuesto;
    private boolean tieneVideoIntro;
    private ArrayList<Formulario> formularios;
    private ArrayList<Video> videoTransicion;
    private ArrayList<Video> preguntaVideo;
    private Formulario cuestionarioSatifaccion;
    private ArrayList<Adjunto> adjunto;
    private String mensaje;

    public Entrevista() {
    }

    public Entrevista(String nombreEntrevista, String nombrePuesto, boolean tieneVideoIntro, ArrayList<Formulario> formularios, ArrayList<Video> videoTransicion, ArrayList<Video> preguntaVideo, Formulario cuestionarioSatifaccion, ArrayList<Adjunto> adjunto, String mensaje) {
        this.nombreEntrevista = nombreEntrevista;
        this.nombrePuesto = nombrePuesto;
        this.tieneVideoIntro = tieneVideoIntro;
        this.formularios = formularios;
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

    public ArrayList<Formulario> getFormularios() {
        return formularios;
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

    public void setFormularios(ArrayList<Formulario> formularios) {
        this.formularios = formularios;
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
    public String getNombreEntrevista() {
        return nombreEntrevista;
    }

    public void setNombreEntrevista(String nombreEntrevista) {
        this.nombreEntrevista = nombreEntrevista;
    }

    public String getNombrePuesto() {
        return nombrePuesto;
    }

    public void setNombrePuesto(String nombrePuesto) {
        this.nombrePuesto = nombrePuesto;
    }

    public void setAdjunto(ArrayList<Adjunto> adjunto) {
        this.adjunto = adjunto;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
}
