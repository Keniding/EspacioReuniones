/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import com.mycompany.EspacioReuniones.resources.PasswordUtil;
import model.Usuario;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {
    DbConexion con;

    // Constructor que inicializa la conexión usando la clase Conexion
    public UsuarioDAO() {
        con = new DbConexion();
    }

    // Método para listar todos los usuarios
    public List<Usuario> listarUsuarios() {
        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT * FROM usuario";
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombres(rs.getString("nombres"));
                usuario.setApellidos(rs.getString("apellidos"));
                usuario.setDni(rs.getString("dni"));
                usuario.setCodigoAlumno(rs.getString("codigo_alumno"));
                usuario.setEmail(rs.getString("email"));
                usuario.setPassword(rs.getString("password"));
                usuario.setRol(rs.getString("rol"));
                usuario.setUbicacionId(rs.getInt("ubicacion_id"));
                lista.add(usuario);
            }
            System.out.println("Usuarios cargados: " + lista.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Método para agregar un nuevo usuario
    public boolean agregarUsuario(Usuario usuario) {
        String sql = "INSERT INTO usuario (nombres, apellidos, dni, codigo_alumno, email, password, rol, ubicacion_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setString(1, usuario.getNombres());
            ps.setString(2, usuario.getApellidos());
            ps.setString(3, usuario.getDni());
            ps.setString(4, usuario.getCodigoAlumno());
            ps.setString(5, usuario.getEmail());
            ps.setString(6, usuario.getPassword());
            ps.setString(7, usuario.getRol());
            ps.setInt(8, usuario.getUbicacionId());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Método para actualizar un usuario existente
    public boolean actualizarUsuario(Usuario usuario) {
        String sql = "UPDATE usuario SET nombres=?, apellidos=?, dni=?, codigo_alumno=?, email=?, password = ?, rol=?, ubicacion_id=? WHERE id=?";
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setString(1, usuario.getNombres());
            ps.setString(2, usuario.getApellidos());
            ps.setString(3, usuario.getDni());
            ps.setString(4, usuario.getCodigoAlumno());
            ps.setString(5, usuario.getEmail());
            ps.setString(6, usuario.getPassword());
            ps.setString(7, usuario.getRol());
            ps.setInt(8, usuario.getUbicacionId());
            ps.setInt(9, usuario.getId());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Método para eliminar un usuario por su ID
    public boolean eliminarUsuario(int id) {
        String sql = "DELETE FROM usuario WHERE id=?";
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("Error al eliminar el usuario con ID " + id);
            e.printStackTrace();
        }
        return false;
    }

    
    public Usuario obtenerUsuarioPorId(int id) {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuario WHERE id = ?";
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombres(rs.getString("nombres"));
                usuario.setApellidos(rs.getString("apellidos"));
                usuario.setDni(rs.getString("dni"));
                usuario.setCodigoAlumno(rs.getString("codigo_alumno"));
                usuario.setEmail(rs.getString("email"));
                usuario.setPassword(rs.getString("password"));
                usuario.setRol(rs.getString("rol"));
                usuario.setUbicacionId(rs.getInt("ubicacion_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }
    
    public Usuario obtenerUsuarioPorEmail(String email) {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuario WHERE email = ?";
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombres(rs.getString("nombres"));
                usuario.setApellidos(rs.getString("apellidos"));
                usuario.setDni(rs.getString("dni"));
                usuario.setCodigoAlumno(rs.getString("codigo_alumno"));
                usuario.setEmail(rs.getString("email"));
                usuario.setPassword(rs.getString("password"));
                usuario.setRol(rs.getString("rol"));
                usuario.setUbicacionId(rs.getInt("ubicacion_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }
    
    public boolean crearUsuario(Usuario usuario) {
        String sql = "INSERT INTO usuario (nombres, apellidos, dni, codigo_alumno, email, password, rol, ubicacion_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setString(1, usuario.getNombres());
            ps.setString(2, usuario.getApellidos());
            ps.setString(3, usuario.getDni());
            ps.setString(4, usuario.getCodigoAlumno());
            ps.setString(5, usuario.getEmail());
            ps.setString(6, usuario.getPassword());
            ps.setString(7, usuario.getRol());
            ps.setInt(8, usuario.getUbicacionId());

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean verificarCredenciales(String email, String plainPassword) {
        String sql = "SELECT password FROM usuario WHERE email = ?";
        try {
            PreparedStatement ps = con.conectar().prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String storedHashedPassword = rs.getString("password");
                // Verifica la contraseña ingresada con la encriptada
                return PasswordUtil.checkPassword(plainPassword, storedHashedPassword);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}