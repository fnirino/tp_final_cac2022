package Clases;

import java.sql.Date;

public class Socios {

	private int id;
	private String nombre;
	private String apellido;
	private int dni;
	private String email;
	private Date alta;
	private boolean estado;
	
	public Socios(int id, String name, String lname, int dni, String email, Date fecha, boolean estado) {
		super();
		this.id = id;
		this.nombre = name;
		this.apellido = lname;
		this.dni = dni;
		this.email = email;
		this.alta = fecha;
		this.estado = estado;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public int getDni() {
		return dni;
	}
	public void setDni(int dni) {
		this.dni = dni;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getAlta() {
		return alta;
	}
	public void setAlta(Date alta) {
		this.alta = alta;
	}
	public boolean getEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	
	
}
