package beans;

import javax.persistence.*;

@Entity
public class Candidato {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int idCandidato;
    private String nombre;
    private String apellidos;
    private String dni;
    private String email;
    private int edad;
    @Column(columnDefinition = "TINYINT(1)")
    private boolean isHombre = false;
    private String numeroTelefono;
    private String rutaCurriculum;

    public Candidato() {
    }

    public Candidato(String nombre, String apellidos, String dni, String email, int edad, boolean isHombre, String numeroTelefono, String rutaCurriculum) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.dni = dni;
        this.email = email;
        this.edad = edad;
        this.isHombre = isHombre;
        this.numeroTelefono = numeroTelefono;
        this.rutaCurriculum = rutaCurriculum;
    }

    public int getIdCandidato() {
        return idCandidato;
    }

    public void setIdCandidato(int idCandidato) {
        this.idCandidato = idCandidato;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public boolean isHombre() {
        return isHombre;
    }

    public void setHombre(boolean hombre) {
        isHombre = hombre;
    }

    public String getNumeroTelefono() {
        return numeroTelefono;
    }

    public void setNumeroTelefono(String numeroTelefono) {
        this.numeroTelefono = numeroTelefono;
    }

    public String getRutaCurriculum() {
        return rutaCurriculum;
    }

    public void setRutaCurriculum(String rutaCurriculum) {
        this.rutaCurriculum = rutaCurriculum;
    }
}
