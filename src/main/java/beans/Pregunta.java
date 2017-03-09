package beans;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Pregunta {

    @Id
    @GeneratedValue
    private int idPregunta;
    private String labelPregunta;
    private String tipoPregunta;
    private List<String> opciones;
    private int posicionEnFormulario;

    public Pregunta() {
    }

    public Pregunta(String labelPregunta, String tipoPregunta, ArrayList<String> opciones, int posicionEnFormulario) {
        this.labelPregunta = labelPregunta;
        this.tipoPregunta = tipoPregunta;
        this.opciones = opciones;
        this.posicionEnFormulario = posicionEnFormulario;
    }

    public int getIdPregunta() {
        return idPregunta;
    }

    public void setIdPregunta(int idPregunta) {
        this.idPregunta = idPregunta;
    }

    public String getLabelPregunta() {
        return labelPregunta;
    }

    public void setLabelPregunta(String labelPregunta) {
        this.labelPregunta = labelPregunta;
    }

    public String getTipoPregunta() {
        return tipoPregunta;
    }

    public void setTipoPregunta(String tipoPregunta) {
        this.tipoPregunta = tipoPregunta;
    }

    public List<String> getOpciones() {
        return opciones;
    }

    public void setOpciones(ArrayList<String> opciones) {
        this.opciones = opciones;
    }

    public int getPosicionEnFormulario() {
        return posicionEnFormulario;
    }

    public void setPosicionEnFormulario(int posicionEnFormulario) {
        this.posicionEnFormulario = posicionEnFormulario;
    }
}
