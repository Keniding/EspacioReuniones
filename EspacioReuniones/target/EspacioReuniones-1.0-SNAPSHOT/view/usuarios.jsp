<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Usuarios</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.min.css">
    
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --background-color: #f8f9fa;
            --success-color: #2ecc71;
            --warning-color: #f1c40f;
            --danger-color: #e74c3c;
        }

        body {
            background-color: var(--background-color);
            color: var(--primary-color);
        }

        .page-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 2rem;
            border-radius: 0 0 15px 15px;
            margin-bottom: 2rem;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
            overflow: hidden;
        }

        .card-header {
            background: var(--primary-color);
            color: white;
            border-bottom: none;
            padding: 1.5rem;
        }

        .table {
            margin-bottom: 0;
        }

        .table thead th {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
            color: var(--primary-color);
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
        }

        .btn {
            border-radius: 8px;
            padding: 0.5rem 1.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background-color: var(--secondary-color);
            border: none;
        }

        .btn-warning {
            background-color: var(--warning-color);
            border: none;
            color: var(--primary-color);
        }

        .btn-danger {
            background-color: var(--danger-color);
            border: none;
        }

        .btn-sm {
            padding: 0.4rem 1rem;
            font-size: 0.875rem;
        }

        .info-item {
            padding: 1rem;
            border-radius: 8px;
            background-color: rgba(52, 152, 219, 0.1);
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }

        .info-item:hover {
            background-color: rgba(52, 152, 219, 0.2);
            transform: translateY(-2px);
        }

        .info-item i {
            color: var(--secondary-color);
            width: 24px;
            text-align: center;
        }

        .table-responsive {
            border-radius: 15px;
            overflow: hidden;
        }

        .table td, .table th {
            padding: 1rem;
            vertical-align: middle;
        }

        .badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: 500;
        }

        .text-muted {
            color: #6c757d !important;
            font-style: italic;
        }
        
        .container {
            color: var(--primary-color);
        }

        @media (max-width: 768px) {
            .page-header {
                padding: 1.5rem;
            }
            
            .card-body {
                padding: 1rem;
            }
            
            .info-item {
                padding: 0.75rem;
            }
        }
    </style>
</head>
<body>
    <div class="page-header">
        <div class="container">
            <c:if test="${sessionScope.rol == 'Superadministrador'}">
                <h2 class="mb-0">
                    <i class="fas fa-users-cog me-2"></i>
                    Lista de Usuarios
                </h2>
            </c:if>
            <c:if test="${sessionScope.rol != 'Superadministrador'}">
                <h2 class="mb-0">
                    <i class="fas fa-user-circle me-2"></i>
                    Perfil
                </h2>
            </c:if>
        </div>
    </div>

    <div class="container">
        <c:if test="${sessionScope.rol == 'Superadministrador'}">
            <a href="UsuarioServlet?action=nuevo" class="btn btn-primary mb-4">
                <i class="fas fa-user-plus me-2"></i>
                Agregar Usuario
            </a>
        </c:if>

        <c:if test="${empty usuarios}">
            <div class="card">
                <div class="card-body text-center">
                    <i class="fas fa-users fa-3x text-muted mb-3"></i>
                    <p class="text-muted mb-0">No se encontraron usuarios.</p>
                </div>
            </div>
        </c:if>

        <c:if test="${not empty usuarios}">
            <!-- Vista para administradores -->
            <c:if test="${sessionScope.rol == 'Superadministrador' || sessionScope.rol == 'Administrador_seccion'}">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">
                            <i class="fas fa-table me-2"></i>
                            Gestión de Usuarios
                        </h5>
                        <a href="UsuarioServlet?action=exportarExcel" class="btn btn-success">
                            <i class="fas fa-file-excel me-2"></i>
                            Exportar a Excel
                        </a>
                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th>DNI</th>
                                        <th>Código</th>
                                        <th>Email</th>
                                        <th>Rol</th>
                                        <th>Ubicación</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="usuario" items="${usuarios}">
                                        <tr>
                                            <td>${usuario.id}</td>
                                            <td>${usuario.nombres}</td>
                                            <td>${usuario.apellidos}</td>
                                            <td>
                                                <i class="fas fa-id-card me-1"></i>
                                                ${usuario.dni}
                                            </td>
                                            <td>
                                                <i class="fas fa-graduation-cap me-1"></i>
                                                ${usuario.codigoAlumno}
                                            </td>
                                            <td>
                                                <i class="fas fa-envelope me-1"></i>
                                                ${usuario.email}
                                            </td>
                                            <td>
                                                <span class="badge bg-secondary">
                                                    ${usuario.rol}
                                                </span>
                                            </td>
                                            <td>
                                                <i class="fas fa-map-marker-alt me-1"></i>
                                                ${usuario.ubicacionId}
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${sessionScope.rol == 'Superadministrador'}">
                                                        <a href="UsuarioServlet?action=editar&id=${usuario.id}" 
                                                           class="btn btn-warning btn-sm me-1">
                                                            <i class="fas fa-edit"></i>
                                                        </a>
                                                        <a href="UsuarioServlet?action=eliminar&id=${usuario.id}"
                                                           class="btn btn-danger btn-sm"
                                                           onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?');">
                                                            <i class="fas fa-trash-alt"></i>
                                                        </a>
                                                    </c:when>
                                                    <c:when test="${sessionScope.rol == 'Administrador_seccion' && sessionScope.ubicacionId == usuario.ubicacionId}">
                                                        <a href="UsuarioServlet?action=editar&id=${usuario.id}" 
                                                           class="btn btn-warning btn-sm">
                                                            <i class="fas fa-edit"></i>
                                                        </a>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </c:if>

            <!-- Vista para usuarios normales -->
            <c:if test="${sessionScope.rol != 'Superadministrador' && sessionScope.rol != 'Administrador_seccion'}">
                <c:forEach var="usuario" items="${usuarios}">
                    <c:if test="${sessionScope.usuarioId == usuario.id}">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="mb-0">
                                    <i class="fas fa-user-circle me-2"></i>
                                    Información Personal
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="info-item">
                                            <i class="fas fa-user me-2"></i>
                                            <strong>Nombres:</strong> ${usuario.nombres}
                                        </div>
                                        <div class="info-item">
                                            <i class="fas fa-user me-2"></i>
                                            <strong>Apellidos:</strong> ${usuario.apellidos}
                                        </div>
                                        <div class="info-item">
                                            <i class="fas fa-id-card me-2"></i>
                                            <strong>DNI:</strong> ${usuario.dni}
                                        </div>
                                        <div class="info-item">
                                            <i class="fas fa-graduation-cap me-2"></i>
                                            <strong>Código Alumno:</strong> ${usuario.codigoAlumno}
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="info-item">
                                            <i class="fas fa-envelope me-2"></i>
                                            <strong>Email:</strong> ${usuario.email}
                                        </div>
                                        <div class="info-item">
                                            <i class="fas fa-user-tag me-2"></i>
                                            <strong>Rol:</strong> ${usuario.rol}
                                        </div>
                                        <div class="info-item">
                                            <i class="fas fa-map-marker-alt me-2"></i>
                                            <strong>Ubicación:</strong> ${usuario.ubicacionId}
                                        </div>
                                    </div>
                                </div>
                                <div class="text-end mt-4">
                                    <a href="UsuarioServlet?action=editar&id=${usuario.id}" 
                                       class="btn btn-warning">
                                        <i class="fas fa-edit me-2"></i>
                                        Editar Información
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </c:if>
        </c:if>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
