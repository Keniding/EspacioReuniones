/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import model.Seccion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SeccionDAO {
    DbConexion con;

    // Constructor que inicializa la conexión usando la clase DbConexion
    public SeccionDAO() {
        con = new DbConexion();
    }

    // Método para listar todas las secciones
    public List<Seccion> listarSecciones() {
        List<Seccion> lista = new ArrayList<>();
        String sql = "SELECT * FROM secciones"; 
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Seccion seccion = new Seccion();
                seccion.setId(rs.getInt("id"));
                seccion.setNombre(rs.getString("nombre"));
                seccion.setUbicacionId(rs.getInt("ubicacion_id")); 
                seccion.setDescripcion(rs.getString("descripcion")); 
                lista.add(seccion);
            }
            System.out.println("Secciones cargadas: " + lista.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Método para agregar una nueva sección
    public boolean agregarSeccion(Seccion seccion) {
        String sql = "INSERT INTO secciones (nombre, ubicacion_id, descripcion) VALUES (?, ?, ?)"; 
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setString(1, seccion.getNombre());
            ps.setInt(2, seccion.getUbicacionId());
            ps.setString(3, seccion.getDescripcion());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public Seccion obtenerSeccionPorId(int id) {
        Seccion seccion = null;
        String sql = "SELECT * FROM secciones WHERE Id = ?";

        try (PreparedStatement statement = con.conectar().prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                seccion = new Seccion();
                seccion.setId(resultSet.getInt("Id"));
                seccion.setNombre(resultSet.getString("Nombre"));
                seccion.setUbicacionId(resultSet.getInt("Ubicacion_id"));
                seccion.setDescripcion(resultSet.getString("Descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejo de errores adecuado
        }

        return seccion;
    }

    // Método para actualizar una sección existente
    public boolean actualizarSeccion(Seccion seccion) {
        String sql = "UPDATE secciones SET nombre=?, ubicacion_id=?, descripcion=? WHERE id=?"; 
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setString(1, seccion.getNombre());
            ps.setInt(2, seccion.getUbicacionId());
            ps.setString(3, seccion.getDescripcion());
            ps.setInt(4, seccion.getId());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Método para eliminar una sección
    public boolean eliminarSeccion(int id) {
        String sql = "DELETE FROM secciones WHERE id=?"; 
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
