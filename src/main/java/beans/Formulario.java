package beans;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Formulario {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int idFormulario;
    private String nombreFormulario;
    @ManyToMany
    private List<Pregunta> preguntas;
    private int posicionEnEntrevista;

    public Formulario() {
    }

    public Formulario(String nombreFormulario, List<Pregunta> preguntas, int posicionEnEntrevista) {
        this.nombreFormulario = nombreFormulario;
        this.preguntas = preguntas;
        this.posicionEnEntrevista = posicionEnEntrevista;
    }

    public void setIdFormulario(int idFormulario) {
        this.idFormulario = idFormulario;
    }

    public void setNombreFormulario(String nombreFormulario) {
        this.nombreFormulario = nombreFormulario;
    }

    public void setPreguntas(ArrayList<Pregunta> preguntas) {
        this.preguntas = preguntas;
    }

    public int getIdFormulario() {
        return idFormulario;
    }

    public String getNombreFormulario() {
        return nombreFormulario;
    }

    public List<Pregunta> getPreguntas() {
        return preguntas;
    }

    public void setPreguntas(List<Pregunta> preguntas) {
        this.preguntas = preguntas;
    }

    public int getPosicionEnEntrevista() {
        return posicionEnEntrevista;
    }

    public void setPosicionEnEntrevista(int posicionEnEntrevista) {
        this.posicionEnEntrevista = posicionEnEntrevista;
    }
}
