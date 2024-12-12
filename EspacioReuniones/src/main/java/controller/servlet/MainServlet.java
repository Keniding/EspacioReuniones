/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Bruce Porras
 */
public class MainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String pageContent = "view/main.jsp"; // Página por defecto

        // Obtener la sesión actual
        HttpSession session = request.getSession();
        Integer usuarioId = (Integer) session.getAttribute("usuarioId");
        
        // Verificar si el usuario está autenticado
        if (usuarioId == null && "reservar".equals(action)) {
            // Si no está autenticado y se intenta reservar, redirigir al login
            response.sendRedirect("login.jsp");
            return;
        }
        
        switch (action) {
            case "ubicaciones":
                pageContent = "/view/ubicaciones.jsp";
                break;
            case "secciones":
                pageContent = "/view/secciones.jsp";
                break;
            case "espacios":
                pageContent = "/view/espacios.jsp";
                break;
            case "usuarios":
                pageContent = "/view/usuarios.jsp";
                break;
            case "reservar":
                pageContent = "/view/reservar.jsp";
                break;
            case "misreservas":
                pageContent = "/view/misreservas.jsp";
                break;
            default:
                pageContent = "view/main.jsp"; // Fragmento de la página de inicio
                break;
        }

        // Asigna el fragmento dinámico al atributo que se cargará en main.jsp
        request.setAttribute("pageContent", pageContent);
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }
}