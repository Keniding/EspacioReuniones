/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.servlet;

/**
 *
 * @author User
 */

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Espacio;
import controller.EspacioDAO;
import jakarta.servlet.http.HttpSession;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class EspacioServlet extends HttpServlet {

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
                listarEspacios(request, response);
                break;
            case "nuevo":
                agregarEspacio(request, response);
                break;
            case "guardar":
                guardarEspacio(request, response);
                break;
            case "editar":
                obtenerEspacio(request, response);
                break;
            case "actualizar":
                actualizarEspacio(request, response);
                break;
            case "eliminar":
                eliminarEspacio(request, response);
                break;
            case "exportarExcel":
                exportarExcel(request, response);
                break;
            default:
                listarEspacios(request, response);
                break;
        }
    }

    private void listaEspacios(HttpServletRequest request) {
        EspacioDAO espacioDAO = new EspacioDAO();
        List<Espacio> espacios = espacioDAO.listarEspacios();
        request.setAttribute("espacios", espacios);
    }
    
    private void listarEspacios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        listaEspacios(request);

        request.setAttribute("pageContent", "/view/espacios.jsp");
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }

    private void agregarEspacio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        listaEspacios(request);

        request.setAttribute("guardar", 1);
        request.setAttribute("pageContent", "/view/espacio-nuevo.jsp");
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }
    
    private void guardarEspacio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("txtNombre");
        int capacidad = Integer.parseInt(request.getParameter("txtCapacidad"));
        String descripcion = request.getParameter("txtDescripcion");
        String seccionId = request.getParameter("txtSeccionId");
        String ubicacionId = request.getParameter("txtUbicacionId");
        String estado = request.getParameter("txtEstado");

        int seccion = Integer.parseInt(seccionId);
        int ubicacion = Integer.parseInt(ubicacionId);

        Espacio espacio = new Espacio();
        espacio.setNombre(nombre);
        espacio.setCapacidad(capacidad);
        espacio.setDescripcion(descripcion);
        espacio.setSeccionId(seccion);
        espacio.setUbicacionId(ubicacion);
        espacio.setEstado(estado);

        EspacioDAO espacioDAO = new EspacioDAO();
        if (espacioDAO.agregarEspacio(espacio)) {
            response.sendRedirect("EspacioServlet?action=listar");
        } else {
            response.sendRedirect("EspacioServlet?action=nuevo");
        }
    }
    
    private void obtenerEspacio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        listaEspacios(request);

        int id = Integer.parseInt(request.getParameter("id"));
       
        EspacioDAO espacioDAO = new EspacioDAO();
        Espacio espacio = espacioDAO.obtenerEspacioPorId(id);
        request.setAttribute("espacio", espacio);

        request.setAttribute("pageContent", "/view/espacio-nuevo.jsp");
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }

    private void actualizarEspacio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        String nombre = request.getParameter("txtNombre");
        int capacidad = Integer.parseInt(request.getParameter("txtCapacidad"));
        String descripcion = request.getParameter("txtDescripcion");
        String seccionId = request.getParameter("txtSeccionId");
        String ubicacionId = request.getParameter("txtUbicacionId");
        String estado = request.getParameter("txtEstado");

        int seccion = Integer.parseInt(seccionId);
        int ubicacion = Integer.parseInt(ubicacionId);

        Espacio espacio = new Espacio();
        espacio.setId(id);
        espacio.setNombre(nombre);
        espacio.setCapacidad(capacidad);
        espacio.setDescripcion(descripcion);
        espacio.setSeccionId(seccion);
        espacio.setUbicacionId(ubicacion);
        espacio.setEstado(estado);

        EspacioDAO espacioDAO = new EspacioDAO();
        if (espacioDAO.actualizarEspacio(espacio)) {
            response.sendRedirect("EspacioServlet?action=listar");
        } else {
            response.sendRedirect("EspacioServlet?action=editar&id=" + id);
        }
    }

    private void eliminarEspacio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        EspacioDAO espacioDAO = new EspacioDAO();
        if (espacioDAO.eliminarEspacio(id)) {
            response.sendRedirect("EspacioServlet?action=listar");
        } else {
            response.sendRedirect("EspacioServlet?action=eliminar&id=" + id);
        }
    }

    private void exportarExcel(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        try {
            // Configurar la respuesta HTTP
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=Espacios.xlsx");

            // Crear el libro de trabajo Excel
            XSSFWorkbook workbook = new XSSFWorkbook();
            XSSFSheet sheet = workbook.createSheet("Espacios");

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
            String[] columns = {"ID", "Nombre", "Capacidad", "Descripción", 
                              "Sección ID", "Ubicación ID", "Estado"};

            for (int i = 0; i < columns.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(columns[i]);
                cell.setCellStyle(headerStyle);
                sheet.autoSizeColumn(i);
            }

            // Obtener los datos de espacios
            EspacioDAO espacioDAO = new EspacioDAO();
            List<Espacio> espacios = espacioDAO.listarEspacios();

            // Llenar los datos
            int rowNum = 1;
            for (Espacio espacio : espacios) {
                Row row = sheet.createRow(rowNum++);
                row.createCell(0).setCellValue(espacio.getId());
                row.createCell(1).setCellValue(espacio.getNombre());
                row.createCell(2).setCellValue(espacio.getCapacidad());
                row.createCell(3).setCellValue(espacio.getDescripcion());
                row.createCell(4).setCellValue(espacio.getSeccionId());
                row.createCell(5).setCellValue(espacio.getUbicacionId());
                row.createCell(6).setCellValue(espacio.getEstado());
            }

            // Escribir el libro de trabajo en la respuesta
            workbook.write(response.getOutputStream());
            workbook.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("EspacioServlet?action=listar&error=export");
        }
    }
}
