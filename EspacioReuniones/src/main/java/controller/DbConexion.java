/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author Bruce Porras
 */
public class DbConexion {
    
    Connection con;
    String URL = "jdbc:mysql://localhost:3306/";
    String DB = "bd_reservar_sala";
    String USER = "root";  // Cambia a tu usuario de MySQL
    String PASSWORD = ""; // Cambia a tu contraseña de MySQL
    String DRIVER = "com.mysql.cj.jdbc.Driver";

    public DbConexion(){
    }
    public Connection conectar(){
        try {
            Class.forName(DRIVER);
            con = DriverManager.getConnection(URL+DB,USER,PASSWORD);
            System.out.println("Se conecto");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("No se conecto: "+ ex.getMessage());
             ex.printStackTrace();            
        }
        return con;
    }   
    public void desconectar(){
        try {
            con.close();
        } catch (SQLException e) {
            System.out.println("Dsconection failed"+ e);
        }
    }
    public static void main(String[] args){
    DbConexion con = new DbConexion();
    con.conectar();
    }
}
