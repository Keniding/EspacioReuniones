package controller.servlet;

import com.mycompany.EspacioReuniones.resources.PasswordUtil;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;
import controller.UsuarioDAO;
import jakarta.servlet.http.HttpSession;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;

public class UsuarioServlet extends HttpServlet {

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
            case "login":
                login(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            case "new":
                crear(request, response);
                break;
            case "crear":
                guardar(request, response);
            case "listar":
                listarUsuarios(request, response);
                break;
            case "nuevo":
                agregarUsuario(request, response);
                break;
            case "guardar":
                guardarUsuario(request, response);
                break;
            case "editar":
                obtenerUsuario(request, response);
                break;
            case "actualizar":
                actualizarUsuario(request, response);
                break;
            case "eliminar":
                eliminarUsuario(request, response);
                break;
            case "verPerfil":
                mostrarPerfil(request, response);
                break;
            case "actualizarPerfil":
                actualizarPerfil(request, response);
                break;
            case "exportarExcel":
                exportarExcel(request, response);
                break;
            default:
                listarUsuarios(request, response);
                break;
        }
    }
    
    private void exportarExcel(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        try {
            // Configurar la respuesta HTTP
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "attachment; filename=Usuarios.xlsx");

            // Crear el libro de trabajo Excel
            XSSFWorkbook workbook = new XSSFWorkbook();
            XSSFSheet sheet = workbook.createSheet("Usuarios");

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
            String[] columns = {"ID", "Nombres", "Apellidos", "DNI", "Código Alumno", 
                               "Email", "Rol", "Ubicación"};

            for (int i = 0; i < columns.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(columns[i]);
                cell.setCellStyle(headerStyle);
                sheet.autoSizeColumn(i);
            }

            // Obtener los datos de usuarios
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            List<Usuario> usuarios = usuarioDAO.listarUsuarios();

            // Llenar los datos
            int rowNum = 1;
            for (Usuario usuario : usuarios) {
                Row row = sheet.createRow(rowNum++);
                row.createCell(0).setCellValue(usuario.getId());
                row.createCell(1).setCellValue(usuario.getNombres());
                row.createCell(2).setCellValue(usuario.getApellidos());
                row.createCell(3).setCellValue(usuario.getDni());
                row.createCell(4).setCellValue(usuario.getCodigoAlumno());
                row.createCell(5).setCellValue(usuario.getEmail());
                row.createCell(6).setCellValue(usuario.getRol());
                row.createCell(7).setCellValue(usuario.getUbicacionId());
            }

            // Escribir el libro de trabajo en la respuesta
            workbook.write(response.getOutputStream());
            workbook.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("UsuarioServlet?action=listar&error=export");
        }
    }


    private void listaUsuarios(HttpServletRequest request) {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        List<Usuario> usuarios = usuarioDAO.listarUsuarios();
        request.setAttribute("usuarios", usuarios);
    }
    
    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        listaUsuarios(request);

        request.setAttribute("pageContent", "/view/usuarios.jsp");
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }

    private void agregarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        listaUsuarios(request);

        request.setAttribute("guardar", 1);
        request.setAttribute("pageContent", "/view/usuario-nuevo.jsp");
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }
    
    private void guardarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombres = request.getParameter("txtNombres");
        String apellidos = request.getParameter("txtApellidos");
        String dni = request.getParameter("txtDni");
        String codigoAlumno = request.getParameter("txtCodigoAlumno");
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        String rol = request.getParameter("txtRol");
        String ubicacionId = request.getParameter("txtUbicacionId");
        
        int ubicacion = Integer.parseInt(ubicacionId);
        
        String passEncrypt = PasswordUtil.hashPassword(password);

        Usuario usuario = new Usuario();
        usuario.setNombres(nombres);
        usuario.setApellidos(apellidos);
        usuario.setDni(dni);
        usuario.setCodigoAlumno(codigoAlumno);
        usuario.setEmail(email);
        usuario.setPassword(passEncrypt);
        usuario.setRol(rol);
        usuario.setUbicacionId(ubicacion);

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        if (usuarioDAO.agregarUsuario(usuario)) {
            response.sendRedirect("UsuarioServlet?action=listar");
        } else {
            response.sendRedirect("UsuarioServlet?action=nuevo");
        }
    }

    private void obtenerUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer usuarioIdSesion = (Integer) session.getAttribute("usuarioId");
        String rolUsuario = (String) session.getAttribute("rol");

        int idUsuarioAEditar = Integer.parseInt(request.getParameter("id"));

        // Verificar si es el mismo usuario o tiene rol Superadministrador
        if (usuarioIdSesion == idUsuarioAEditar || "Superadministrador".equals(rolUsuario)) {
            listaUsuarios(request);

            UsuarioDAO usuarioDAO = new UsuarioDAO();
            Usuario usuario = usuarioDAO.obtenerUsuarioPorId(idUsuarioAEditar);
            request.setAttribute("usuario", usuario);

            request.setAttribute("pageContent", "/view/usuario-nuevo.jsp");
            request.getRequestDispatcher("/view/main.jsp").forward(request, response);
        } else {
            // Si no tiene permisos, redirigir a la lista con un mensaje de error
            request.setAttribute("error", "No tiene permisos para editar este usuario");
            response.sendRedirect("UsuarioServlet?action=listar");
        }
    }

    private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer usuarioIdSesion = (Integer) session.getAttribute("usuarioId");
        String rolUsuario = (String) session.getAttribute("rol");

        int idUsuarioAActualizar = Integer.parseInt(request.getParameter("id"));

        // Verificar si es el mismo usuario o tiene rol Superadministrador
        if (usuarioIdSesion == idUsuarioAActualizar || "Superadministrador".equals(rolUsuario)) {
            String nombres = request.getParameter("txtNombres");
            String apellidos = request.getParameter("txtApellidos");
            String dni = request.getParameter("txtDni");
            String codigoAlumno = request.getParameter("txtCodigoAlumno");
            String email = request.getParameter("txtEmail");
            String password = request.getParameter("txtPassword");
            String rol = request.getParameter("txtRol");
            String ubicacionId = request.getParameter("txtUbicacionId");
            int ubicacion = Integer.parseInt(ubicacionId);

            // Obtener el usuario actual de la base de datos
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            Usuario usuarioExistente = usuarioDAO.obtenerUsuarioPorId(idUsuarioAActualizar);

            // Comparar si la contraseña ha cambiado
            String pass;
            if (password.equals(usuarioExistente.getPassword())) {
                // Si la contraseña es igual a la almacenada, mantener la misma
                pass = usuarioExistente.getPassword();
            } else {
                // Si la contraseña es diferente, hashear la nueva
                pass = PasswordUtil.hashPassword(password);
            }

            Usuario usuario = new Usuario();
            usuario.setId(idUsuarioAActualizar);
            usuario.setNombres(nombres);
            usuario.setApellidos(apellidos);
            usuario.setDni(dni);
            usuario.setCodigoAlumno(codigoAlumno);
            usuario.setEmail(email);
            usuario.setPassword(pass);
            usuario.setRol(rol);
            usuario.setUbicacionId(ubicacion);

            if (usuarioDAO.actualizarUsuario(usuario)) {
                response.sendRedirect("UsuarioServlet?action=listar");
            } else {
                response.sendRedirect("UsuarioServlet?action=editar&id=" + idUsuarioAActualizar);
            }
        } else {
            // Si no tiene permisos, redirigir a la lista con un mensaje de error
            request.setAttribute("error", "No tiene permisos para actualizar este usuario");
            response.sendRedirect("UsuarioServlet?action=listar");
        }
    }

    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String rolUsuario = (String) session.getAttribute("rol");

        // Solo permitir eliminar usuarios si es Superadministrador
        if (!"Superadministrador".equals(rolUsuario)) {
            request.setAttribute("error", "No tiene permisos para eliminar usuarios");
            response.sendRedirect("UsuarioServlet?action=listar");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        if (usuarioDAO.eliminarUsuario(id)) {
            response.sendRedirect("UsuarioServlet?action=listar");
        } else {
            request.setAttribute("error", "No se pudo eliminar el usuario");
            response.sendRedirect("UsuarioServlet?action=listar");
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("usuario");
        String password = request.getParameter("password");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        boolean isValidUser = usuarioDAO.verificarCredenciales(email, password);

        if (isValidUser) {
            // Obtener el usuario completo para acceder a su ID
            Usuario usuario = usuarioDAO.obtenerUsuarioPorEmail(email);

            // Iniciar la sesión y guardar el ID del usuario
            HttpSession session = request.getSession();
            session.setAttribute("usuarioId", usuario.getId());
            session.setAttribute("rol", usuario.getRol());

            response.sendRedirect("InicioServlet?action=inicio");

        }
         else {
            // Si las credenciales no son válidas, mostrar un mensaje de error
            request.setAttribute("error", "Correo electrónico o contraseña incorrectos.");
        response.sendRedirect("index.jsp");
        }
    }
    
    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("index.jsp");
    }

    private void crear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        listaUsuarios(request);

        request.setAttribute("guardar", 1);
        request.setAttribute("pageContent", "/view/usuario-new.jsp");
        request.getRequestDispatcher("/view/main.jsp").forward(request, response);
    }

    private void guardar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombres = request.getParameter("txtNombres");
        String apellidos = request.getParameter("txtApellidos");
        String dni = request.getParameter("txtDni");
        String codigoAlumno = request.getParameter("txtCodigoAlumno");
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        String rol = request.getParameter("txtRol");
        String ubicacionId = request.getParameter("txtUbicacionId");
        
        int ubicacion = Integer.parseInt(ubicacionId);
        
        String passEncrypt = PasswordUtil.hashPassword(password);

        Usuario usuario = new Usuario();
        usuario.setNombres(nombres);
        usuario.setApellidos(apellidos);
        usuario.setDni(dni);
        usuario.setCodigoAlumno(codigoAlumno);
        usuario.setEmail(email);
        usuario.setPassword(passEncrypt);
        usuario.setRol(rol);
        usuario.setUbicacionId(ubicacion);

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        if (usuarioDAO.agregarUsuario(usuario)) {
            // Obtener el usuario completo para acceder a su ID
            Usuario user;
            user = usuarioDAO.obtenerUsuarioPorEmail(email);

            // Iniciar la sesión y guardar el ID del usuario
            HttpSession session = request.getSession();
            session.setAttribute("usuarioId", user.getId());
            //response.sendRedirect("InicioServlet?action=inicio");
        } else {
            //response.sendRedirect("UsuarioServlet?action=nuevo");
        }
    }
    
    private void mostrarPerfil(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer usuarioId = (Integer) session.getAttribute("usuarioId");

        if (usuarioId != null) {
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            Usuario usuario = usuarioDAO.obtenerUsuarioPorId(usuarioId);
            request.setAttribute("usuario", usuario);

            request.setAttribute("pageContent", "/view/perfil.jsp");
            request.getRequestDispatcher("/view/main.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    private void actualizarPerfil(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer usuarioId = (Integer) session.getAttribute("usuarioId");

        if (usuarioId != null) {
            String nombres = request.getParameter("txtNombres");
            String apellidos = request.getParameter("txtApellidos");
            String dni = request.getParameter("txtDni");
            String codigoAlumno = request.getParameter("txtCodigoAlumno");
            String email = request.getParameter("txtEmail");
            String password = request.getParameter("txtPassword");

            UsuarioDAO usuarioDAO = new UsuarioDAO();
            Usuario usuarioExistente = usuarioDAO.obtenerUsuarioPorId(usuarioId);

            Usuario usuario = new Usuario();
            usuario.setId(usuarioId);
            usuario.setNombres(nombres);
            usuario.setApellidos(apellidos);
            usuario.setDni(dni);
            usuario.setCodigoAlumno(codigoAlumno);
            usuario.setEmail(email);
            usuario.setRol(usuarioExistente.getRol());
            usuario.setUbicacionId(usuarioExistente.getUbicacionId());

            // Manejar la contraseña
            if (password != null && !password.trim().isEmpty()) {
                usuario.setPassword(PasswordUtil.hashPassword(password));
            } else {
                usuario.setPassword(usuarioExistente.getPassword());
            }

            if (usuarioDAO.actualizarUsuario(usuario)) {
                request.setAttribute("mensaje", "Perfil actualizado correctamente");
            } else {
                request.setAttribute("error", "Error al actualizar el perfil");
            }

            response.sendRedirect("UsuarioServlet?action=verPerfil");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}