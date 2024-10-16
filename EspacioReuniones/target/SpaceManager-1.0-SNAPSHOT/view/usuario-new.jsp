<%-- 
    Document   : usuario-new
    Created on : 13 sept 2024
    Author     : Bruce Porras
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Nuevo Usuario - Space Manager</title>
        <!-- Incluir Bootstrap -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Incluir el archivo CSS personalizado (si es necesario) -->
        <link href="resources/css/styles_1.css" rel="stylesheet">
    </head>
<body>
    <div class="container mt-4">
        <!-- Logo de la aplicación -->
        <div class="text-center">
            <img src="resources/images/icon.png" alt="Logo" class="logo">
        </div>
        <!-- Nombre de la aplicación -->
        <div class="app-name">Space Manager</div>
        
        <!-- Formulario de registro de nuevo usuario -->
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="mb-4">Registro de Nuevo Usuario</h2>
                <form action="UsuarioServlet?action=crear" method="post" class="form">
                    <div class="form-group mb-3">
                        <label for="nombres">Nombres:</label>
                        <input type="text" id="nombres" name="nombres" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="apellidos">Apellidos:</label>
                        <input type="text" id="apellidos" name="apellidos" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="dni">DNI:</label>
                        <input type="text" id="dni" name="dni" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="codigoAlumno">Código Alumno:</label>
                        <input type="text" id="codigoAlumno" name="codigoAlumno" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="rol">Rol:</label>
                        <select id="rol" name="rol" class="form-control" required>
                            <option value="Superadministrador">Superadministrador</option>
                            <option value="Coordinador_ubicacion">Coordinador_ubicacion</option>
                            <option value="Administrador_seccion">Administrador_seccion</option>
                            <option value="Empleado">Empleado</option>
                            <option value="Invitado">Invitado</option>
                            <option value="Asistente_reserva">Asistente_reserva</option>  
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label for="ubicacionId">Ubicación:</label>
                        <input type="number" id="ubicacionId" name="ubicacionId" class="form-control" required>
                    </div>
                    <input type="submit" value="Registrar" class="btn btn-primary w-100">
                </form>
            </div>
        </div>
    </div>

    <!-- Incluir scripts de Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>