package controller.servlet;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Ubicacion;
import controller.UbicacionDAO;
import jakarta.servlet.http.HttpSession;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

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
            case "exportarExcel":
                exportarExcel(request, response);
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
            response.sendRedirect("UbicacionServlet?action=listar");
        } else {
            response.sendRedirect("UbicacionServlet?action=editar&id=" + id);
        }
    }

    private void exportarExcel(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        try {
            // Configurar la respuesta HTTP
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=Ubicaciones.xlsx");

            // Crear el libro de trabajo Excel
            XSSFWorkbook workbook = new XSSFWorkbook();
            XSSFSheet sheet = workbook.createSheet("Ubicaciones");

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
            String[] columns = {"ID", "Nombre", "Dirección"};

            for (int i = 0; i < columns.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(columns[i]);
                cell.setCellStyle(headerStyle);
                sheet.autoSizeColumn(i);
            }

            // Obtener los datos de ubicaciones
            UbicacionDAO ubicacionDAO = new UbicacionDAO();
            List<Ubicacion> ubicaciones = ubicacionDAO.listarUbicaciones();

            // Llenar los datos
            int rowNum = 1;
            for (Ubicacion ubicacion : ubicaciones) {
                Row row = sheet.createRow(rowNum++);
                row.createCell(0).setCellValue(ubicacion.getId());
                row.createCell(1).setCellValue(ubicacion.getNombre());
                row.createCell(2).setCellValue(ubicacion.getDireccion());
            }

            // Escribir el libro de trabajo en la respuesta
            workbook.write(response.getOutputStream());
            workbook.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("UbicacionServlet?action=listar&error=export");
        }
    }
}

