package controller.servlet;

import com.mycompany.EspacioReuniones.resources.PasswordUtil;
import controller.UsuarioDAO;
import model.Usuario;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class UsuarioServlet extends HttpServlet {
    private UsuarioDAO usuarioDAO;

    @Override
    public void init() {
        usuarioDAO = new UsuarioDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "listar":
                listarUsuarios(request, response);
                break;
            case "nuevo":
                mostrarFormularioNuevo(request, response);
                break;
            case "editar":
                mostrarFormularioEditar(request, response);
                break;
            case "eliminar":
                eliminarUsuario(request, response); // Llama al método que maneja la eliminación
                break;
            default:
                listarUsuarios(request, response);
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "listar"; // Acción predeterminada si no se proporciona ninguna
        }

        switch (action) {
            case "crear":
                crearUsuario(request, response); // Método para manejar la creación de un nuevo usuario
                break;
            case "actualizar":
                actualizarUsuario(request, response); // Llama al método que maneja la actualización
                break;
            case "login":
                loginUsuario(request, response); // Maneja la lógica de inicio de sesión aquí
                break;
            default:
                listarUsuarios(request, response); // Redirige a la lista si la acción no coincide
                break;
        }
    }

    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Usuario> usuarios = usuarioDAO.listarUsuarios();
        System.out.println("Número de usuarios obtenidos: " + usuarios.size());
        request.setAttribute("usuarios", usuarios);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/usuarios.jsp");
        dispatcher.forward(request, response);
    }

    private void mostrarFormularioNuevo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/usuario-new.jsp");
        dispatcher.forward(request, response);
    }

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Usuario usuario = usuarioDAO.obtenerUsuarioPorId(id); // Método para obtener un usuario por su ID
        request.setAttribute("usuario", usuario);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/usuario-edit.jsp");
        dispatcher.forward(request, response);
    }
    private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String dni = request.getParameter("dni");
        String codigoAlumno = request.getParameter("codigoAlumno");
        String email = request.getParameter("email");
        String rol = request.getParameter("rol");
        int ubicacionId = Integer.parseInt(request.getParameter("ubicacionId"));

        Usuario usuario = new Usuario();
        usuario.setId(id);
        usuario.setNombres(nombres);
        usuario.setApellidos(apellidos);
        usuario.setDni(dni);
        usuario.setCodigoAlumno(codigoAlumno);
        usuario.setEmail(email);
        usuario.setRol(rol);
        usuario.setUbicacionId(ubicacionId);

        boolean actualizado = usuarioDAO.actualizarUsuario(usuario);

        if (actualizado) {
            response.sendRedirect("UsuarioServlet?action=listar"); // Redirige a la lista de usuarios tras la actualización
        } else {
            request.setAttribute("error", "No se pudo actualizar el usuario");
            mostrarFormularioEditar(request, response); // Muestra nuevamente el formulario si falla
        }
    }
    private void crearUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String dni = request.getParameter("dni");
        String codigoAlumno = request.getParameter("codigoAlumno");
        String email = request.getParameter("email");
        String passwordNoEncrypt = request.getParameter("password");
        String rol = request.getParameter("rol");
        int ubicacionId = Integer.parseInt(request.getParameter("ubicacionId"));

        //Encriptar
        String password = PasswordUtil.hashPassword(passwordNoEncrypt);
        
        Usuario usuario = new Usuario();
        usuario.setNombres(nombres);
        usuario.setApellidos(apellidos);
        usuario.setDni(dni);
        usuario.setCodigoAlumno(codigoAlumno);
        usuario.setEmail(email);
        usuario.setPassword(password);
        usuario.setRol(rol);
        usuario.setUbicacionId(ubicacionId);

        boolean creado = usuarioDAO.crearUsuario(usuario);

        if (creado) {
            response.sendRedirect("UsuarioServlet?action=listar"); // Redirige a la lista después de crear
        } else {
            request.setAttribute("error", "No se pudo registrar el usuario");
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/nuevo-usuario.jsp");
            dispatcher.forward(request, response); // Muestra el formulario de nuevo si falla
        }
    }
    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id")); // Obtiene el ID del usuario a eliminar
        boolean eliminado = usuarioDAO.eliminarUsuario(id);

        if (eliminado) {
            response.sendRedirect("UsuarioServlet?action=listar"); // Redirige a la lista de usuarios tras la eliminación
        } else {
            request.setAttribute("error", "No se pudo eliminar el usuario");
            listarUsuarios(request, response); // Vuelve a mostrar la lista si falla
        }
    }
    private void loginUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("usuario"); // Asumiendo que 'usuario' se refiere al correo
        String password = request.getParameter("password");

        // Llama al DAO para verificar las credenciales
        boolean autenticado = usuarioDAO.verificarCredenciales(email, password);
        
        if (autenticado) {
            // Redirige a la lista de usuarios si la autenticación es correcta
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/main.jsp");
            dispatcher.forward(request, response);
        } else {
            // Si falla, redirige nuevamente al login con un mensaje de error
            request.setAttribute("error", "Correo o contraseña incorrectos.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
    }
}