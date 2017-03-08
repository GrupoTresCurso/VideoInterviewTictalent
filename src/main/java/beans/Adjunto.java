package beans;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by TictumManaña on 08/03/2017.
 */
@Entity
/*@Table(name="ADJUNTO")*/

public class Adjunto {
    @Id
   /*@Column(name="idAdjunto")*/
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int idAdjunto;
    private String etiquetaAdjunto;
    private int posicionEnEntrevista;

    public Adjunto() {
    }

    public Adjunto(String etiquetaAdjunto, int posicionEnEntrevista) {
        this.etiquetaAdjunto = etiquetaAdjunto;
        this.posicionEnEntrevista = posicionEnEntrevista;
    }

    public void setIdAdjunto(int idAdjunto) {
        this.idAdjunto = idAdjunto;
    }

    public void setEtiquetaAdjunto(String etiquetaAdjunto) {
        this.etiquetaAdjunto = etiquetaAdjunto;
    }

    public void setPosicionEnEntrevista(int posicionEnEntrevista) {
        this.posicionEnEntrevista = posicionEnEntrevista;
    }

    public int getIdAdjunto() {
        return idAdjunto;
    }

    public String getEtiquetaAdjunto() {
        return etiquetaAdjunto;
    }

    public int getPosicionEnEntrevista() {
        return posicionEnEntrevista;
    }
}
