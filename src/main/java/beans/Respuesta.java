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

	private List<String> respuestas;

	@OneToMany
	private List<Archivo> adjuntos;

    public Respuesta() {
    }

    public Respuesta(Entrevista entrevistaRespondida, Candidato candidato, List<Video> videosRespuestas, List<String> respuestas, List<Archivo> adjuntos) {
        this.entrevistaRespondida = entrevistaRespondida;
        this.candidato = candidato;
        this.videosRespuestas = videosRespuestas;
        this.respuestas = respuestas;
        this.adjuntos = adjuntos;
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

    public List<String> getRespuestas() {
        return respuestas;
    }

    public void setRespuestas(List<String> respuestas) {
        this.respuestas = respuestas;
    }

    public List<Archivo> getAdjuntos() {
        return adjuntos;
    }

    public void setAdjuntos(List<Archivo> adjuntos) {
        this.adjuntos = adjuntos;
    }
}
