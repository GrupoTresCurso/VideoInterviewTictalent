package beans;

import javax.persistence.*;
import java.util.List;

@Entity
public class Respuesta {

    @Id
    @GeneratedValue
	private int idRespuesta;

    @ManyToOne
	private Entrevista entrevistaRespondida;

    @OneToOne
	private Candidato candidato;

    @OneToMany
	private List<Video> videosRespuestas;

	private String[] respuestas;

	@OneToMany
	private List<Archivo> adjuntos;

	private float notaCandidato;

    public Respuesta() {
    }

    public Respuesta(Entrevista entrevistaRespondida, Candidato candidato, List<Video> videosRespuestas, String[] respuestas, List<Archivo> adjuntos, float notaCandidato) {
        this.entrevistaRespondida = entrevistaRespondida;
        this.candidato = candidato;
        this.videosRespuestas = videosRespuestas;
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

    public List<Video> getVideosRespuestas() {
        return videosRespuestas;
    }

    public void setVideosRespuestas(List<Video> videosRespuestas) {
        this.videosRespuestas = videosRespuestas;
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
