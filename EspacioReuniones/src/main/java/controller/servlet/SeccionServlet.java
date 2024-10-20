package controller.servlet;

import controller.SeccionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Seccion;

@WebServlet(name = "SeccionServlet", urlPatterns = {"/SeccionServlet"})
public class SeccionServlet extends HttpServlet {

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

        // Obtener la sesión actual
        HttpSession session = request.getSession();
        Integer usuarioId = (Integer) session.getAttribute("usuarioId");
        
        // Verificar si el usuario está autenticado
        if (usuarioId == null && "listar".equals(action)) {
            // Si no está autenticado y se intenta reservar, redirigir al login
            response.sendRedirect("login.jsp");
            return;
        }
        
        if (usuarioId == null && "nuevo".equals(action)) {
            // Si no está autenticado y se intenta reservar, redirigir al login
            response.sendRedirect("login.jsp");
            return;
        }
        
        if (usuarioId == null && "guardar".equals(action)) {
            // Si no está autenticado y se intenta reservar, redirigir al login
            response.sendRedirect("login.jsp");
            return;
        }
        
        if (usuarioId == null && "editar".equals(action)) {
            // Si no está autenticado y se intenta reservar, redirigir al login
            response.sendRedirect("login.jsp");
            return;
        }
        
        if (usuarioId == null && "actualizar".equals(action)) {
            // Si no está autenticado y se intenta reservar, redirigir al login
            response.sendRedirect("login.jsp");
            return;
        }
        
        if (usuarioId == null && "eliminar".equals(action)) {
            // Si no está autenticado y se intenta reservar, redirigir al login
            response.sendRedirect("login.jsp");
            return;
        }
        
        if (action == null) {
            action = "listar";
        }

        switch (action) {
            case "listar":
                listarSecciones(request, response);
                break;
            case "nuevo":
                agregarSeccion(request, response);
                break;
            case "guardar":
                guardarSeccion(request, response);
                break;
            case "editar":
                obtenerSeccion(request, response);
                break;
            case "actualizar":
                actualizarSeccion(request, response);
                break;
            case "eliminar":
                eliminarSeccion(request, response);
                break;
            default:
                listarSecciones(request, response);
                break;
        }
    }

    private void listaSecciones(HttpServletRequest request) {
        SeccionDAO seccionDAO = new SeccionDAO();
        List<Seccion> secciones = seccionDAO.listarSecciones();
        request.setAttribute("secciones", secciones);
    }
    
    private void listarSecciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        listaSecciones(request);

        request.setAttribute("pageContent", "/view/secciones.jsp");
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }

    private void agregarSeccion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        listaSecciones(request);

        request.setAttribute("guardar", 1);
        request.setAttribute("pageContent", "/view/seccion-nuevo.jsp");
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }
    
    private void guardarSeccion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("txtNombre");
        String descripcion = request.getParameter("txtDescripcion");
        String ubicacionId = request.getParameter("txtUbicacionId");
        
        Integer ubicacion = ubicacionId != null && !ubicacionId.isEmpty() ? Integer.valueOf(ubicacionId) : null;

        Seccion seccion = new Seccion();
        seccion.setNombre(nombre);
        seccion.setDescripcion(descripcion);
        seccion.setUbicacionId(ubicacion);

        SeccionDAO seccionDAO = new SeccionDAO();
        if (seccionDAO.agregarSeccion(seccion)) {
            response.sendRedirect("SeccionServlet?action=listar");
        } else {
            response.sendRedirect("SeccionServlet?action=nuevo");
        }
    }
    
    private void obtenerSeccion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        listaSecciones(request);

        int id = Integer.parseInt(request.getParameter("id"));
       
        SeccionDAO seccionDAO = new SeccionDAO();
        Seccion seccion = seccionDAO.obtenerSeccionPorId(id);
        request.setAttribute("seccion", seccion);

        request.setAttribute("pageContent", "/view/seccion-nuevo.jsp");
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }

    private void actualizarSeccion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        String nombre = request.getParameter("txtNombre");
        String descripcion = request.getParameter("txtDescripcion");
        String ubicacionId = request.getParameter("txtUbicacionId");
        
        Integer ubicacion = ubicacionId != null && !ubicacionId.isEmpty() ? Integer.valueOf(ubicacionId) : null;

        Seccion seccion = new Seccion();
        seccion.setId(id);
        seccion.setNombre(nombre);
        seccion.setDescripcion(descripcion);
        seccion.setUbicacionId(ubicacion);

        SeccionDAO seccionDAO = new SeccionDAO();
        if (seccionDAO.actualizarSeccion(seccion)) {
            response.sendRedirect("SeccionServlet?action=listar");
        } else {
            response.sendRedirect("SeccionServlet?action=editar&id=" + id);
        }
    }

    private void eliminarSeccion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        SeccionDAO seccionDAO = new SeccionDAO();
        if (seccionDAO.eliminarSeccion(id)) {
            response.sendRedirect("SeccionServlet?action=listar");
        } else {
            response.sendRedirect("SeccionServlet?action=eliminar&id=" + id);
        }
    }
}
