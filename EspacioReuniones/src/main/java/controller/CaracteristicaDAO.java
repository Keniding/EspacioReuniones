/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import model.Caracteristica;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CaracteristicaDAO {
    DbConexion con;

    // Constructor que inicializa la conexión usando la clase DbConexion
    public CaracteristicaDAO() {
        con = new DbConexion();
    }

    // Método para listar todas las características
    public List<Caracteristica> listarCaracteristicas() {
        List<Caracteristica> lista = new ArrayList<>();
        String sql = "SELECT * FROM caracteristicas"; 
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Caracteristica caracteristica = new Caracteristica();
                caracteristica.setId(rs.getInt("id"));
                caracteristica.setNombre(rs.getString("nombre"));
                caracteristica.setDescripcion(rs.getString("descripcion"));
                
                lista.add(caracteristica);
            }
            System.out.println("Características cargadas: " + lista.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Método para agregar una nueva característica
    public boolean agregarCaracteristica(Caracteristica caracteristica) {
        String sql = "INSERT INTO caracteristicas (nombre, descripcion) VALUES (?, ?)"; 
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setString(1, caracteristica.getNombre());
            ps.setString(2, caracteristica.getDescripcion());
           
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Método para actualizar una característica existente
    public boolean actualizarCaracteristica(Caracteristica caracteristica) {
        String sql = "UPDATE caracteristicas SET nombre=?, descripcion=? WHERE id=?"; 
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setString(1, caracteristica.getNombre());
            ps.setString(2, caracteristica.getDescripcion());
            ps.setInt(3, caracteristica.getId());
           
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Método para eliminar una característica
    public boolean eliminarCaracteristica(int id) {
        String sql = "DELETE FROM caracteristicas WHERE id=?"; 
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

