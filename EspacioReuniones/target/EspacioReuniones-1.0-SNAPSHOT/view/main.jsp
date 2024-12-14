<%-- 
    Document   : main
    Created on : 13 sept 2024, 23:56:22
    Author     : Bruce Porras
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Espacios</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Espacio de Reuniones</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <%-- Inicio - Accesible para todos --%>
                <li class="nav-item">
                    <a class="nav-link" href="InicioServlet?action=inicio">Inicio</a>
                </li>

                <%-- Ubicaciones --%>
                <c:if test="${sessionScope.rol == 'Superadministrador' || 
                              sessionScope.rol == 'Coordinador_ubicacion' || 
                              sessionScope.rol == 'Administrador_seccion'}">
                    <li class="nav-item">
                        <a class="nav-link" href="UbicacionServlet?action=listar">Ubicaciones</a>
                    </li>
                </c:if>

                <%-- Secciones --%>
                <c:if test="${sessionScope.rol == 'Superadministrador' || 
                              sessionScope.rol == 'Administrador_seccion'}">
                    <li class="nav-item">
                        <a class="nav-link" href="SeccionServlet?action=listar">Secciones</a>
                    </li>
                </c:if>

                <%-- Espacios --%>
                <c:if test="${sessionScope.rol == 'Superadministrador' || 
                              sessionScope.rol == 'Coordinador_ubicacion' || 
                              sessionScope.rol == 'Administrador_seccion' || 
                              sessionScope.rol == 'Empleado'}">
                    <li class="nav-item">
                        <a class="nav-link" href="EspacioServlet?action=listar">Espacios</a>
                    </li>
                </c:if>

                <%-- Gestión de Usuarios (solo Superadministrador) --%>
                <c:if test="${sessionScope.rol == 'Superadministrador'}">
                    <li class="nav-item">
                        <a class="nav-link" href="UsuarioServlet?action=listar">Usuarios</a>
                    </li>
                </c:if>

                <%-- Reservar Espacio --%>
                <c:if test="${sessionScope.rol != 'Invitado'}">
                    <li class="nav-item">
                        <a class="nav-link" href="MainServlet?action=reservar">Reservar Espacio</a>
                    </li>
                </c:if>

                <%-- Mis Reservas --%>
                <c:if test="${sessionScope.rol != 'Invitado'}">
                    <li class="nav-item">
                        <a class="nav-link" href="ReservaServlet?action=listar">Mis Reservas</a>
                    </li>
                </c:if>
                    
                    
                <c:if test="${sessionScope.rol != 'Superadministrador'}">
                    <li class="nav-item"><a class="nav-link" href="UsuarioServlet?action=listar">Editar Perfil</a></li>
                    
                </c:if>    

                <%-- Perfil de Usuario --%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-user-circle"></i> Mi Cuenta
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="UsuarioServlet?action=verPerfil">
                            <i class="fas fa-user"></i> Ver Perfil
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="UsuarioServlet?action=logout">
                            <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                        </a>
                    </div>
                </li>
            </ul>

        </div>
    </nav>
    
    <!-- Main Content -->
    <div class="container mt-4">
        <%-- Cargar contenido dinámico basado en la acción --%>
        <jsp:include page="${pageContent}" />
    </div>
    
    <!-- Footer -->
    <footer class="bg-light text-center text-lg-start mt-4">
        <div class="text-center p-3">
            © 2024 EspacioReuniones - Todos los derechos reservados.
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
