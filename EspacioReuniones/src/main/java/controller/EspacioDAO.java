/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import model.Espacio;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EspacioDAO {
    DbConexion con;

    // Constructor que inicializa la conexión usando la clase DbConexion
    public EspacioDAO() {
        con = new DbConexion();
    }

    // Método para listar todos los espacios
    public List<Espacio> listarEspacios() {
        List<Espacio> lista = new ArrayList<>();
        String sql = "SELECT * FROM espacios"; 
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Espacio espacio = new Espacio();
                espacio.setId(rs.getInt("id"));
                espacio.setNombre(rs.getString("nombre"));
                espacio.setCapacidad(rs.getInt("capacidad"));
                espacio.setDescripcion(rs.getString("descripcion"));
                espacio.setUbicacionId(rs.getInt("ubicacion_id"));
                espacio.setSeccionId(rs.getInt("seccion_id"));
                espacio.setEstado(rs.getString("estado"));
                
                lista.add(espacio);
            }
            System.out.println("Espacios cargados: " + lista.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Método para agregar un nuevo espacio
    public boolean agregarEspacio(Espacio espacio) {
        String sql = "INSERT INTO espacios (nombre, capacidad, descripcion, seccion_id, ubicacion_id, estado) VALUES (?, ?, ?, ?, ?, ?)"; 
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setString(1, espacio.getNombre());
            ps.setInt(2, espacio.getCapacidad());
            ps.setString(3, espacio.getDescripcion());
            ps.setInt(4, espacio.getSeccionId());
            ps.setInt(5, espacio.getUbicacionId());
            ps.setString(6, espacio.getEstado());
            
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public Espacio obtenerEspacioPorId(int id) {
        Espacio espacio = null;
        String sql = "SELECT * FROM espacios WHERE id = ?";
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                espacio = new Espacio();
                espacio.setId(rs.getInt("id"));
                espacio.setNombre(rs.getString("nombre"));
                espacio.setCapacidad(rs.getInt("capacidad"));
                espacio.setDescripcion(rs.getString("descripcion"));
                espacio.setSeccionId(rs.getInt("seccion_id"));
                espacio.setUbicacionId(rs.getInt("ubicacion_id"));
                espacio.setEstado(rs.getString("estado"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return espacio;
    }

    // Método para actualizar un espacio existente
    public boolean actualizarEspacio(Espacio espacio) {
        String sql = "UPDATE espacios SET nombre=?, capacidad=?, descripcion=?, seccion_id=?, ubicacion_id=?, estado=? WHERE id=?"; 
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setString(1, espacio.getNombre());
            ps.setInt(2, espacio.getCapacidad());
            ps.setString(3, espacio.getDescripcion());
            ps.setInt(4, espacio.getSeccionId());
            ps.setInt(5, espacio.getUbicacionId());
            ps.setString(6, espacio.getEstado());
            ps.setInt(7, espacio.getId());
            
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Método para eliminar un espacio
    public boolean eliminarEspacio(int id) {
        String sql = "DELETE FROM espacios WHERE id=?"; 
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

