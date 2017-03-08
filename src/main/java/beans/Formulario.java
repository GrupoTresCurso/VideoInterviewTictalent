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
/*@Table(name="FORMULARIO")*/

public class Formulario {
    @Id
   /*@Column(name="idFormulario")*/
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int idFormulario;
    private String nombreFormulario;
    private ArrayList<Pregunta> preguntas;

    public Formulario() {
    }

    public Formulario(String nombreFormulario, ArrayList<Pregunta> preguntas) {
        this.nombreFormulario = nombreFormulario;
        this.preguntas = preguntas;
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

    public ArrayList<Pregunta> getPreguntas() {
        return preguntas;
    }
}
