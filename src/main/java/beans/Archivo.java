package beans;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Archivo {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int idArchivo;
	private String nombreArchivo;
	private String rutaArchivo;
	
	public Archivo() {
		super();
	}

	public Archivo(String nombreArchivo, String rutaArchivo) {
		super();
		this.nombreArchivo = nombreArchivo;
		this.rutaArchivo = rutaArchivo;
	}

	public int getIdArchivo() {
		return idArchivo;
	}

	public void setIdArchivo(int idArchivo) {
		this.idArchivo = idArchivo;
	}

	public String getNombreArchivo() {
		return nombreArchivo;
	}

	public void setNombreArchivo(String nombreArchivo) {
		this.nombreArchivo = nombreArchivo;
	}

	public String getRutaArchivo() {
		return rutaArchivo;
	}

	public void setRutaArchivo(String rutaArchivo) {
		this.rutaArchivo = rutaArchivo;
	}
	
	
	
	
	
	

}
