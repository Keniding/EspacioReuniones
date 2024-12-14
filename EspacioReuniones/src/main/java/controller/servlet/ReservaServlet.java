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
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

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
            case "exportarExcel":
                exportarExcel(request, response);
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
    
    private void exportarExcel(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        try {
            // Configurar la respuesta HTTP
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=Reservas.xlsx");

            // Crear el libro de trabajo Excel
            XSSFWorkbook workbook = new XSSFWorkbook();
            XSSFSheet sheet = workbook.createSheet("Reservas");

            // Crear el estilo para los encabezados
            XSSFCellStyle headerStyle = workbook.createCellStyle();
            headerStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
            headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            headerStyle.setBorderBottom(BorderStyle.THIN);
            headerStyle.setBorderTop(BorderStyle.THIN);
            headerStyle.setBorderRight(BorderStyle.THIN);
            headerStyle.setBorderLeft(BorderStyle.THIN);

            // Crear la fila de encabezados
            Row headerRow = sheet.createRow(0);
            String[] columns = {"ID", "Usuario ID", "Espacio ID", "Fecha", "Hora Inicio", 
                              "Hora Fin", "Estado"};

            for (int i = 0; i < columns.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(columns[i]);
                cell.setCellStyle(headerStyle);
                sheet.autoSizeColumn(i);
            }

            // Obtener los datos de reservas
            ReservaDAO reservaDAO = new ReservaDAO();
            HttpSession session = request.getSession();
            Integer usuarioId = (Integer) session.getAttribute("usuarioId");
            List<Reserva> reservas = reservaDAO.listarReservas(usuarioId);

            // Llenar los datos
            int rowNum = 1;
            for (Reserva reserva : reservas) {
                Row row = sheet.createRow(rowNum++);
                row.createCell(0).setCellValue(reserva.getId());
                row.createCell(1).setCellValue(reserva.getUsuarioId());
                row.createCell(2).setCellValue(reserva.getEspacioId());
                row.createCell(3).setCellValue(reserva.getFecha().toString());
                row.createCell(4).setCellValue(reserva.getHoraInicio().toString());
                row.createCell(5).setCellValue(reserva.getHoraFin().toString());
                row.createCell(6).setCellValue(reserva.getEstado());
            }

            // Escribir el libro de trabajo en la respuesta
            workbook.write(response.getOutputStream());
            workbook.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ReservaServlet?action=listar&error=export");
        }
    }
}
