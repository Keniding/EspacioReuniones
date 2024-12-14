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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --background-color: #f8f9fa;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--background-color);
        }

        .navbar {
            background-color: white !important;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 1rem 2rem;
        }

        .navbar-brand {
            font-weight: 600;
            color: var(--primary-color) !important;
            font-size: 1.5rem;
        }

        .nav-link {
            color: var(--primary-color) !important;
            font-weight: 500;
            padding: 0.5rem 1rem !important;
            margin: 0 0.2rem;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            background-color: rgba(52, 152, 219, 0.1);
            color: var(--secondary-color) !important;
        }

        .nav-item.active .nav-link {
            background-color: var(--secondary-color);
            color: white !important;
        }

        .dropdown-menu {
            border: none;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        .dropdown-item {
            padding: 0.7rem 1.5rem;
            color: var(--primary-color);
        }

        .dropdown-item:hover {
            background-color: rgba(52, 152, 219, 0.1);
            color: var(--secondary-color);
        }

        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            padding: 2rem;
            margin-top: 2rem;
            margin-bottom: 2rem;
        }

        footer {
            background-color: var(--primary-color) !important;
            color: white !important;
            padding: 1.5rem 0;
            position: relative;
            bottom: 0;
            width: 100%;
        }

        /* Iconos en el menú */
        .nav-link i {
            margin-right: 0.5rem;
            font-size: 1.1rem;
        }

        /* Animación para el botón de toggle */
        .navbar-toggler {
            border: none;
            padding: 0.5rem;
        }

        .navbar-toggler:focus {
            outline: none;
            box-shadow: none;
        }

        /* Estilo para el botón de perfil */
        .profile-button {
            display: flex;
            align-items: center;
            background-color: var(--primary-color);
            color: white !important;
            padding: 0.5rem 1rem;
            border-radius: 20px;
        }

        .profile-button:hover {
            background-color: #34495e;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="#">
            <i class="fas fa-building-user me-2"></i>
            Espacio de Reuniones
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto align-items-center">
                <li class="nav-item">
                    <a class="nav-link" href="InicioServlet?action=inicio">
                        <i class="fas fa-home"></i> Inicio
                    </a>
                </li>

                <c:if test="${sessionScope.rol == 'Superadministrador' || 
                              sessionScope.rol == 'Coordinador_ubicacion' || 
                              sessionScope.rol == 'Administrador_seccion'}">
                    <li class="nav-item">
                        <a class="nav-link" href="UbicacionServlet?action=listar">
                            <i class="fas fa-map-marker-alt"></i> Ubicaciones
                        </a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.rol == 'Superadministrador' || 
                              sessionScope.rol == 'Administrador_seccion'}">
                    <li class="nav-item">
                        <a class="nav-link" href="SeccionServlet?action=listar">
                            <i class="fas fa-layer-group"></i> Secciones
                        </a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.rol == 'Superadministrador' || 
                              sessionScope.rol == 'Coordinador_ubicacion' || 
                              sessionScope.rol == 'Administrador_seccion' || 
                              sessionScope.rol == 'Empleado'}">
                    <li class="nav-item">
                        <a class="nav-link" href="EspacioServlet?action=listar">
                            <i class="fas fa-door-open"></i> Espacios
                        </a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.rol == 'Superadministrador'}">
                    <li class="nav-item">
                        <a class="nav-link" href="UsuarioServlet?action=listar">
                            <i class="fas fa-users"></i> Usuarios
                        </a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.rol != 'Invitado'}">
                    <li class="nav-item">
                        <a class="nav-link" href="MainServlet?action=reservar">
                            <i class="fas fa-calendar-plus"></i> Reservar
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ReservaServlet?action=listar">
                            <i class="fas fa-calendar-check"></i> Mis Reservas
                        </a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.rol != 'Superadministrador'}">
                    <li class="nav-item">
                        <a class="nav-link" href="UsuarioServlet?action=listar">
                            <i class="fas fa-user-edit"></i> Editar Perfil
                        </a>
                    </li>
                </c:if>

                <li class="nav-item dropdown ml-2">
                    <a class="nav-link profile-button dropdown-toggle" href="#" id="navbarDropdown" 
                       data-toggle="dropdown">
                        <i class="fas fa-user-circle"></i>
                        Mi Cuenta
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="UsuarioServlet?action=verPerfil">
                            <i class="fas fa-user"></i> Ver Perfil
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item text-danger" href="UsuarioServlet?action=logout">
                            <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <jsp:include page="${pageContent}" />
    </div>

    <!-- Footer -->
    <footer class="text-center text-lg-start">
        <div class="text-center p-3">
            © 2024 EspacioReuniones - Todos los derechos reservados
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
