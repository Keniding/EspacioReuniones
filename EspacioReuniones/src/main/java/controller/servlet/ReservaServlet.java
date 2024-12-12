package controller.servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Reserva;
import controller.ReservaDAO;
import java.util.List;

public class ReservaServlet extends HttpServlet {

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
                listarReservas(request, response);
                break;
            case "nuevo":
                agregarReserva(request, response);
                break;
            case "guardar":
                guardarReserva(request, response);
                break;
            case "editar":
                obtenerReserva(request, response);
                break;
            case "actualizar":
                actualizarReserva(request, response);
                break;
            case "eliminar":
                eliminarReserva(request, response);
                break;
            default:
                listarReservas(request, response);
                break;
        }
    }

    private void listarReservas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ReservaDAO reservaDAO = new ReservaDAO();
        HttpSession session = request.getSession();
        Integer usuarioId = (Integer) session.getAttribute("usuarioId");
        List<Reserva> reservas = reservaDAO.listarReservas(usuarioId);
        request.setAttribute("reservas", reservas);

        request.setAttribute("pageContent", "/view/reservas.jsp");
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }

    private void agregarReserva(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ReservaDAO reservaDAO = new ReservaDAO();
        HttpSession session = request.getSession();
        Integer usuarioId = (Integer) session.getAttribute("usuarioId");
        List<Reserva> reservas = reservaDAO.listarReservas(usuarioId);
        request.setAttribute("reservas", reservas);

        request.setAttribute("pageContent", "/view/reserva-nuevo.jsp");
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }

    private void guardarReserva(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int usuarioId = (int) session.getAttribute("usuarioId");
        int espacioId = Integer.parseInt(request.getParameter("txtespacioId"));
        Date fecha = Date.valueOf(request.getParameter("txtfecha"));
        Time horaInicio = Time.valueOf(request.getParameter("txthoraInicio") + ":00");
        Time horaFin = calcularHoraFin(horaInicio);
        String estado = "Pendiente";

        Reserva reserva = new Reserva();
        reserva.setUsuarioId(usuarioId);
        reserva.setEspacioId(espacioId);
        reserva.setFecha(fecha);
        reserva.setHoraInicio(horaInicio);
        reserva.setHoraFin(horaFin);
        reserva.setEstado(estado);

        ReservaDAO reservaDAO = new ReservaDAO();
        if (reservaDAO.agregarReserva(reserva)) {
            response.sendRedirect("ReservaServlet?action=listar");
        } else {
            response.sendRedirect("ReservaServlet?action=nuevo");
        }
    }

    private void obtenerReserva(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ReservaDAO reservaDAO = new ReservaDAO();
        HttpSession session = request.getSession();
        Integer usuarioId = (Integer) session.getAttribute("usuarioId");
        List<Reserva> reservas = reservaDAO.listarReservas(usuarioId);
        request.setAttribute("reservas", reservas);
        
        int id = Integer.parseInt(request.getParameter("id"));
        Reserva reserva = reservaDAO.obtenerReservaPorId(id);
        request.setAttribute("reserva", reserva);

        request.setAttribute("pageContent", "/view/reserva-nuevo.jsp");
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }

    private void actualizarReserva(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        int usuarioId = (int) session.getAttribute("usuarioId");
        int espacioId = Integer.parseInt(request.getParameter("txtespacioId"));
        Date fecha = Date.valueOf(request.getParameter("txtfecha"));
        Time horaInicio = Time.valueOf(request.getParameter("txthoraInicio") + ":00");
        String estado = request.getParameter("selEstado");
        Time horaFin = calcularHoraFin(horaInicio);

        Reserva reserva = new Reserva();
        reserva.setId(id);
        reserva.setUsuarioId(usuarioId);
        reserva.setEspacioId(espacioId);
        reserva.setFecha(fecha);
        reserva.setHoraInicio(horaInicio);
        reserva.setHoraFin(horaFin);
        reserva.setEstado(estado);

        ReservaDAO reservaDAO = new ReservaDAO();
        if (reservaDAO.actualizarReserva(reserva)) {
            response.sendRedirect("ReservaServlet?action=listar");
        } else {
            response.sendRedirect("ReservaServlet?action=nuevo&id=" + id);
        }
    }

    private void eliminarReserva(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ReservaDAO reservaDAO = new ReservaDAO();
        if (reservaDAO.eliminarReserva(id)) {
            response.sendRedirect("ReservaServlet?action=listar");
        } else {
            response.sendRedirect("ReservaServlet?action=eliminar&id=" + id);
        }
    }

    private Time calcularHoraFin(Time horaInicio) {
        // Implementa la lógica para calcular la hora de fin
        // Por ejemplo, sumando una hora a la hora de inicio
        long millis = horaInicio.getTime() + 3600000; // 1 hora en milisegundos
        return new Time(millis);
    }
}