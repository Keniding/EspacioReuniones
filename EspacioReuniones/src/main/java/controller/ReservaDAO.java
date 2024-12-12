/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import model.Reserva;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservaDAO {
    DbConexion con;

    // Constructor que inicializa la conexión usando la clase DbConexion
    public ReservaDAO() {
        con = new DbConexion();
    }

   // Método para listar todas las reservas de un usuario específico
    public List<Reserva> listarReservas(int usuarioId) {
        List<Reserva> lista = new ArrayList<>();
        String sql = "SELECT * FROM reservas WHERE usuario_id = ?"; 
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setInt(1, usuarioId); // Establecer el valor del parámetro usuario_id
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Reserva reserva = new Reserva();
                reserva.setId(rs.getInt("id"));
                reserva.setFecha(rs.getDate("fecha"));
                reserva.setHoraInicio(rs.getTime("hora_inicio"));
                reserva.setHoraFin(rs.getTime("hora_fin"));
                reserva.setUsuarioId(rs.getInt("usuario_id"));
                reserva.setEspacioId(rs.getInt("espacio_id"));
                reserva.setEstado(rs.getString("estado"));

                lista.add(reserva);
            }
            System.out.println("Reservas cargadas para el usuario " + usuarioId + ": " + lista.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    // Método para agregar una nueva reserva
    public boolean agregarReserva(Reserva reserva) {
        String sql = "INSERT INTO reservas (usuario_id, espacio_id, fecha, hora_inicio, hora_fin, estado) VALUES (?, ?, ?, ?, ?, ?)"; 
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setInt(1, reserva.getUsuarioId());
            ps.setInt(2, reserva.getEspacioId());
            ps.setDate(3, reserva.getFecha());
            ps.setTime(4, reserva.getHoraInicio());
            ps.setTime(5, reserva.getHoraFin());
            ps.setString(6, reserva.getEstado());
          
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public Reserva obtenerReservaPorId(int id) {
        Reserva reserva = null;
        String sql = "SELECT * FROM reservas WHERE Id = ?";

        try (PreparedStatement statement = con.conectar().prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                reserva = new Reserva();
                reserva.setId(resultSet.getInt("Id"));
                reserva.setUsuarioId(resultSet.getInt("Usuario_id"));
                reserva.setEspacioId(resultSet.getInt("Espacio_id"));
                reserva.setFecha(resultSet.getDate("Fecha"));
                reserva.setHoraInicio(resultSet.getTime("HoraInicio"));
                reserva.setHoraFin(resultSet.getTime("HoraFin"));
                reserva.setEstado(resultSet.getString("Estado"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejo de errores adecuado
        }

        return reserva;
    }

    // Método para actualizar una reserva existente
    public boolean actualizarReserva(Reserva reserva) {
        String sql = "UPDATE reservas SET fecha=?, hora_inicio=?, hora_fin=?, usuario_id=?, espacio_id=?, estado=? WHERE id=?";
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(reserva.getFecha().getTime()));
            ps.setTime(2, reserva.getHoraInicio());
            ps.setTime(3, reserva.getHoraFin());
            ps.setInt(4, reserva.getUsuarioId());
            ps.setInt(5, reserva.getEspacioId());
            ps.setString(6, reserva.getEstado());
            ps.setInt(7, reserva.getId());
            
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Método para eliminar una reserva
    public boolean eliminarReserva(int id) {
        String sql = "DELETE FROM reservas WHERE id=?"; 
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
