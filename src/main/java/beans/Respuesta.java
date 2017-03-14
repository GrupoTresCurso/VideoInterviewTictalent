package beans;

import javax.persistence.*;
import java.util.List;

@Entity
public class Respuesta {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int idRespuesta;

    @ManyToOne(cascade=CascadeType.ALL)
	private Entrevista entrevistaRespondida;

    @OneToOne(cascade=CascadeType.ALL)
	private Candidato candidato;

    @OneToMany(cascade=CascadeType.ALL)
	private List<Video> videoRespuestas;

	private String[] respuestas;

	@OneToMany(cascade=CascadeType.ALL)
	private List<Archivo> adjuntos;

	private float notaCandidato;

    public Respuesta() {
    }

    public Respuesta(Entrevista entrevistaRespondida, Candidato candidato, List<Video> videoRespuestas, String[] respuestas, List<Archivo> adjuntos, float notaCandidato) {        this.entrevistaRespondida = entrevistaRespondida;
        this.candidato = candidato;
        this.videoRespuestas = videoRespuestas;
        this.respuestas = respuestas;
        this.adjuntos = adjuntos;
        this.notaCandidato = notaCandidato;
    }

    public int getIdRespuesta() {
        return idRespuesta;
    }

    public void setIdRespuesta(int idRespuesta) {
        this.idRespuesta = idRespuesta;
    }

    public Entrevista getEntrevistaRespondida() {
        return entrevistaRespondida;
    }

    public void setEntrevistaRespondida(Entrevista entrevistaRespondida) {
        this.entrevistaRespondida = entrevistaRespondida;
    }

    public Candidato getCandidato() {
        return candidato;
    }

    public void setCandidato(Candidato candidato) {
        this.candidato = candidato;
    }

    public List<Video> getVideoRespuestas() {
        return videoRespuestas;
    }

    public void setVideoRespuestas(List<Video> videoRespuestas) {
        this.videoRespuestas = videoRespuestas;
    }

    public String[] getRespuestas() {
        return respuestas;
    }

    public void setRespuestas(String[] respuestas) {
        this.respuestas = respuestas;
    }

    public List<Archivo> getAdjuntos() {
        return adjuntos;
    }

    public void setAdjuntos(List<Archivo> adjuntos) {
        this.adjuntos = adjuntos;
    }

    public float getNotaCandidato() {
        return notaCandidato;
    }

    public void setNotaCandidato(float notaCandidato) {
        this.notaCandidato = notaCandidato;
    }
}
