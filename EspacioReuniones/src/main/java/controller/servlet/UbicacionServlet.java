package controller.servlet;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Ubicacion;
import controller.UbicacionDAO;

public class UbicacionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    // Método para manejar tanto GET como POST
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Si no se especifica ninguna acción, mostrar la lista de ubicaciones por defecto
        if (action == null) {
            action = "listar";
        }

        switch (action) {
            case "listar":
                listarUbicaciones(request, response);
                break;
            case "nuevo":
                agregarUbicaciones(request, response);
                break;
            case "guardar":
                guardarUbicaciones(request, response);
                break;
            case "editar":
                obtenerUbicacion(request, response);
                break;
            case "actualizar":
                actualizarUbicacion(request, response);
                break;
            case "eliminar":
                eliminarUbicacion(request, response);
                break;
            default:
                listarUbicaciones(request, response);
                break;
        }
    }

    private void lista(HttpServletRequest request) {
        UbicacionDAO ubicacionDAO = new UbicacionDAO();
        List<Ubicacion> ubicaciones = ubicacionDAO.listarUbicaciones();
        request.setAttribute("ubicaciones", ubicaciones);
    }
    
    private void listarUbicaciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        lista(request);

        // Establecer el valor de pageContent para cargar ubicaciones.jsp dentro de main.jsp
        request.setAttribute("pageContent", "/view/ubicaciones.jsp");

        // Reenviar la petición a main.jsp en lugar de ubicaciones.jsp directamente
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }

    private void agregarUbicaciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        lista(request);
        
        request.setAttribute("guardar", 1);
        
        request.setAttribute("pageContent", "/view/ubicacion-nuevo.jsp");
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }
    
    private void guardarUbicaciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("txtNombre");
        String direccion = request.getParameter("txtDireccion");

        Ubicacion ubicacion = new Ubicacion();
        ubicacion.setNombre(nombre);
        ubicacion.setDireccion(direccion);

        UbicacionDAO ubicacionDAO = new UbicacionDAO();
        if (ubicacionDAO.agregarUbicacion(ubicacion)) {
            // Redirige a la lista de ubicaciones después de guardar
            response.sendRedirect("UbicacionServlet?action=listar");
        } else {
            // Maneja el error si no se pudo guardar
            response.sendRedirect("UbicacionServlet?action=nuevo");
        }
    }
    
    private void obtenerUbicacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        lista(request);
        
        int id = Integer.parseInt(request.getParameter("id"));
       
        UbicacionDAO ubicacionDAO = new UbicacionDAO();
        Ubicacion ubicacion = ubicacionDAO.obtenerUbicacionPorId(id);
        request.setAttribute("ubicacion", ubicacion);

        // Redirige a la página de edición con los datos cargados
        request.setAttribute("pageContent", "/view/ubicacion-nuevo.jsp");
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }

    private void actualizarUbicacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        String nombre = request.getParameter("txtNombre");
        String direccion = request.getParameter("txtDireccion");

        Ubicacion ubicacion = new Ubicacion();
        ubicacion.setId(id);
        ubicacion.setNombre(nombre);
        ubicacion.setDireccion(direccion);

        UbicacionDAO ubicacionDAO = new UbicacionDAO();
        if (ubicacionDAO.actualizarUbicacion(ubicacion)) {
            // Redirige a la lista de ubicaciones después de actualizar
            response.sendRedirect("UbicacionServlet?action=listar");
        } else {
            // Maneja el error si no se pudo actualizar
            response.sendRedirect("UbicacionServlet?action=editar&id=" + id);
        }
    }

    private void eliminarUbicacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        UbicacionDAO ubicacionDAO = new UbicacionDAO();
        if (ubicacionDAO.eliminarUbicacion(id)) {
            // Redirige a la lista de ubicaciones después de actualizar
            response.sendRedirect("UbicacionServlet?action=listar");
        } else {
            // Maneja el error si no se pudo actualizar
            response.sendRedirect("UbicacionServlet?action=eliminar&id=" + id);
        }
    }
}
