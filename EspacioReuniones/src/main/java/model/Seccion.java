/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Bruce Porras
 */
public class Seccion {
    private int id;
    private String nombre;
    private Integer ubicacionId; // Puede ser nulo según la estructura de la tabla
    private String descripcion;

    // Constructor vacío
    public Seccion() {
    }

    // Constructor con parámetros
    public Seccion(int id, String nombre, Integer ubicacionId, String descripcion) {
        this.id = id;
        this.nombre = nombre;
        this.ubicacionId = ubicacionId;
        this.descripcion = descripcion;
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

    public Integer getUbicacionId() {
        return ubicacionId;
    }

    public void setUbicacionId(Integer ubicacionId) {
        this.ubicacionId = ubicacionId;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    // Método toString para depuración
    @Override
    public String toString() {
        return "Seccion{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", ubicacionId=" + ubicacionId +
                ", descripcion='" + descripcion + '\'' +
                '}';
    }
}