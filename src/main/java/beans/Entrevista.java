package beans;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Entrevista {

    @Id
    @GeneratedValue
    private int idEntrevista;
    private String nombreEntrevista;
    private String nombrePuesto;
    @Column(columnDefinition = "TINYINT(1)")
    private boolean tieneVideoIntro = false;
    @ManyToMany
    private List<Formulario> formularios;
    @ManyToMany
    private List<Video> videoTransicion;
    @ManyToMany
    private List<Video> preguntasVideo;
    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "idFormulario")
    private Formulario cuestionarioSatifaccion;
    private String mensaje;
    @ManyToMany
    private List<Candidato> listaCandidatos;

    public Entrevista() {
    }

    public Entrevista(String nombreEntrevista, String nombrePuesto, boolean tieneVideoIntro, List<Formulario> formularios, List<Video> videoTransicion, List<Video> preguntasVideo, Formulario cuestionarioSatifaccion, String mensaje, List<Candidato> listaCandidatos) {
        this.nombreEntrevista = nombreEntrevista;
        this.nombrePuesto = nombrePuesto;
        this.tieneVideoIntro = tieneVideoIntro;
        this.formularios = formularios;
        this.videoTransicion = videoTransicion;
        this.preguntasVideo = preguntasVideo;
        this.cuestionarioSatifaccion = cuestionarioSatifaccion;
        this.mensaje = mensaje;
        this.listaCandidatos = listaCandidatos;
    }

    public int getIdEntrevista() {
        return idEntrevista;
    }

    public void setIdEntrevista(int idEntrevista) {
        this.idEntrevista = idEntrevista;
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

    public boolean isTieneVideoIntro() {
        return tieneVideoIntro;
    }

    public void setTieneVideoIntro(boolean tieneVideoIntro) {
        this.tieneVideoIntro = tieneVideoIntro;
    }

    public List<Formulario> getFormularios() {
        return formularios;
    }

    public void setFormularios(List<Formulario> formularios) {
        this.formularios = formularios;
    }

    public List<Video> getVideoTransicion() {
        return videoTransicion;
    }

    public void setVideoTransicion(List<Video> videoTransicion) {
        this.videoTransicion = videoTransicion;
    }

    public List<Video> getPreguntasVideo() {
        return preguntasVideo;
    }

    public void setPreguntasVideo(List<Video> preguntasVideo) {
        this.preguntasVideo = preguntasVideo;
    }

    public Formulario getCuestionarioSatifaccion() {
        return cuestionarioSatifaccion;
    }

    public void setCuestionarioSatifaccion(Formulario cuestionarioSatifaccion) {
        this.cuestionarioSatifaccion = cuestionarioSatifaccion;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public List<Candidato> getListaCandidatos() {
        return listaCandidatos;
    }

    public void setListaCandidatos(List<Candidato> listaCandidatos) {
        this.listaCandidatos = listaCandidatos;
    }
}
