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
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

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
            case "exportarExcel":
                exportarExcel(request, response);
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
    
    private void exportarExcel(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        try {
            // Configurar la respuesta HTTP
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=Secciones.xlsx");

            // Crear el libro de trabajo Excel
            XSSFWorkbook workbook = new XSSFWorkbook();
            XSSFSheet sheet = workbook.createSheet("Secciones");

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
            String[] columns = {"ID", "Nombre", "Descripción", "Ubicación ID"};

            for (int i = 0; i < columns.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(columns[i]);
                cell.setCellStyle(headerStyle);
                sheet.autoSizeColumn(i);
            }

            // Obtener los datos de secciones
            SeccionDAO seccionDAO = new SeccionDAO();
            List<Seccion> secciones = seccionDAO.listarSecciones();

            // Llenar los datos
            int rowNum = 1;
            for (Seccion seccion : secciones) {
                Row row = sheet.createRow(rowNum++);
                row.createCell(0).setCellValue(seccion.getId());
                row.createCell(1).setCellValue(seccion.getNombre());
                row.createCell(2).setCellValue(seccion.getDescripcion());
                row.createCell(3).setCellValue(seccion.getUbicacionId());
            }

            // Escribir el libro de trabajo en la respuesta
            workbook.write(response.getOutputStream());
            workbook.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("SeccionServlet?action=listar&error=export");
        }
    }
}
