/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Espacio {
    private int id;
    private String nombre;
    private int capacidad;
    private String descripcion;
    private Integer seccionId; // Puede ser nulo
    private Integer ubicacionId; // Puede ser nulo
    private String estado; // Enum: 'Disponible', 'Ocupado', 'Deshabilitado'

    // Constructor vacío
    public Espacio() {
    }

    // Constructor con parámetros
    public Espacio(int id, String nombre, int capacidad, String descripcion, Integer seccionId, Integer ubicacionId, String estado) {
        this.id = id;
        this.nombre = nombre;
        this.capacidad = capacidad;
        this.descripcion = descripcion;
        this.seccionId = seccionId;
        this.ubicacionId = ubicacionId;
        this.estado = estado;
    }

    // Getters y Setters
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

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getSeccionId() {
        return seccionId;
    }

    public void setSeccionId(Integer seccionId) {
        this.seccionId = seccionId;
    }

    public Integer getUbicacionId() {
        return ubicacionId;
    }

    public void setUbicacionId(Integer ubicacionId) {
        this.ubicacionId = ubicacionId;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    // Método toString para depuración
    @Override
    public String toString() {
        return "Espacio{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", capacidad=" + capacidad +
                ", descripcion='" + descripcion + '\'' +
                ", seccionId=" + seccionId +
                ", ubicacionId=" + ubicacionId +
                ", estado='" + estado + '\'' +
                '}';
    }
}
