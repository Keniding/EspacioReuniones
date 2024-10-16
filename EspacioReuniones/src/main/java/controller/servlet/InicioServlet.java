package controller.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class InicioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Si no se especifica ninguna acción, mostrar la lista de ubicaciones por defecto
        if (action == null) {
            action = "inicio";
        }

        switch (action) {
            case "inicio":
                irInicio(request, response);
                break;
            case "nuevo":
                // lógica para agregar nueva ubicación
                break;
            case "editar":
                // lógica para editar ubicación existente
                break;
            case "eliminar":
                // lógica para eliminar ubicación
                break;
            default:
                irInicio(request, response);
                break;
        }
    }

    private void irInicio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Establecer el valor de pageContent para cargar ubicaciones.jsp dentro de main.jsp
        request.setAttribute("pageContent", "/view/inicio.jsp");

        // Reenviar la petición a main.jsp en lugar de ubicaciones.jsp directamente
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }

    // Otros métodos como agregar, editar y eliminar ubicaciones pueden ser agregados aquí.
}
