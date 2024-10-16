/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class EspacioCaracteristica {
    private int id;
    private int espacioId;
    private int caracteristicaId;

    // Constructor vacío
    public EspacioCaracteristica() {
    }

    // Constructor con parámetros
    public EspacioCaracteristica(int id, int espacioId, int caracteristicaId) {
        this.id = id;
        this.espacioId = espacioId;
        this.caracteristicaId = caracteristicaId;
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEspacioId() {
        return espacioId;
    }

    public void setEspacioId(int espacioId) {
        this.espacioId = espacioId;
    }

    public int getCaracteristicaId() {
        return caracteristicaId;
    }

    public void setCaracteristicaId(int caracteristicaId) {
        this.caracteristicaId = caracteristicaId;
    }

    // Método toString para depuración
    @Override
    public String toString() {
        return "EspacioCaracteristica{" +
                "id=" + id +
                ", espacioId=" + espacioId +
                ", caracteristicaId=" + caracteristicaId +
                '}';
    }
}
