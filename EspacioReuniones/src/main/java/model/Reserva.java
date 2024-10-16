/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.sql.Time;

public class Reserva {
    private int id;
    private int usuarioId;
    private int espacioId;
    private Date fecha;
    private Time horaInicio;
    private Time horaFin;
    private String estado; // Enum: 'Pendiente', 'Confirmado', 'Cancelado'

    // Constructor vacío
    public Reserva() {
    }

    // Constructor con parámetros
    public Reserva(int id, int usuarioId, int espacioId, Date fecha, Time horaInicio, Time horaFin, String estado) {
        this.id = id;
        this.usuarioId = usuarioId;
        this.espacioId = espacioId;
        this.fecha = fecha;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.estado = estado;
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public int getEspacioId() {
        return espacioId;
    }

    public void setEspacioId(int espacioId) {
        this.espacioId = espacioId;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Time horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Time getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Time horaFin) {
        this.horaFin = horaFin;
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
        return "Reserva{" +
                "id=" + id +
                ", usuarioId=" + usuarioId +
                ", espacioId=" + espacioId +
                ", fecha=" + fecha +
                ", horaInicio=" + horaInicio +
                ", horaFin=" + horaFin +
                ", estado='" + estado + '\'' +
                '}';
    }
}

