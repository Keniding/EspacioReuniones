<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Usuarios</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <c:if test="${sessionScope.rol == 'Superadministrador'}">
        <h2>Lista de Usuarios</h2>
    </c:if>
    <c:if test="${sessionScope.rol != 'Superadministrador'}">
        <h2>Perfil</h2>
    </c:if>


    <!-- Solo mostrar el botón de Agregar Usuario si es Superadministrador -->
    <c:if test="${sessionScope.rol == 'Superadministrador'}">
        <a href="UsuarioServlet?action=nuevo" class="btn btn-primary mb-3">Agregar Usuario</a>
    </c:if>

    <c:if test="${empty usuarios}">
        <p class="text-muted">No se encontraron usuarios.</p>
    </c:if>

    <c:if test="${not empty usuarios}">
        <!-- Vista para administradores -->
        <c:if test="${sessionScope.rol == 'Superadministrador' || sessionScope.rol == 'Administrador_seccion'}">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>DNI</th>
                    <th>Código Alumno</th>
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
                        <td>${usuario.dni}</td>
                        <td>${usuario.codigoAlumno}</td>
                        <td>${usuario.email}</td>
                        <td>${usuario.rol}</td>
                        <td>${usuario.ubicacionId}</td>
                        <td>
                            <c:choose>
                                <c:when test="${sessionScope.rol == 'Superadministrador'}">
                                    <a href="UsuarioServlet?action=editar&id=${usuario.id}" class="btn btn-warning btn-sm">Editar</a>
                                    <a href="UsuarioServlet?action=eliminar&id=${usuario.id}"
                                       class="btn btn-danger btn-sm"
                                       onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?');">
                                        Eliminar
                                    </a>
                                </c:when>
                                <c:when test="${sessionScope.rol == 'Administrador_seccion' && sessionScope.ubicacionId == usuario.ubicacionId}">
                                    <a href="UsuarioServlet?action=editar&id=${usuario.id}" class="btn btn-warning btn-sm">Editar</a>
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- Vista para usuarios normales -->
        <c:if test="${sessionScope.rol != 'Superadministrador' && sessionScope.rol != 'Administrador_seccion'}">
            <c:forEach var="usuario" items="${usuarios}">
                <c:if test="${sessionScope.usuarioId == usuario.id}">
                    <div class="card shadow-sm">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">Información Personal</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <i class="fas fa-user mr-2"></i>
                                        <strong>Nombres:</strong> ${usuario.nombres}
                                    </div>
                                    <div class="mb-3">
                                        <i class="fas fa-user mr-2"></i>
                                        <strong>Apellidos:</strong> ${usuario.apellidos}
                                    </div>
                                    <div class="mb-3">
                                        <i class="fas fa-id-card mr-2"></i>
                                        <strong>DNI:</strong> ${usuario.dni}
                                    </div>
                                    <div class="mb-3">
                                        <i class="fas fa-graduation-cap mr-2"></i>
                                        <strong>Código Alumno:</strong> ${usuario.codigoAlumno}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <i class="fas fa-envelope mr-2"></i>
                                        <strong>Email:</strong> ${usuario.email}
                                    </div>
                                    <div class="mb-3">
                                        <i class="fas fa-user-tag mr-2"></i>
                                        <strong>Rol:</strong> ${usuario.rol}
                                    </div>
                                    <div class="mb-3">
                                        <i class="fas fa-map-marker-alt mr-2"></i>
                                        <strong>Ubicación:</strong> ${usuario.ubicacionId}
                                    </div>
                                </div>
                            </div>
                            <div class="text-right mt-3">
                                <a href="UsuarioServlet?action=editar&id=${usuario.id}" class="btn btn-warning">
                                    <i class="fas fa-edit mr-1"></i> Editar Información
                                </a>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </c:if>
    </c:if>
</div>

<!-- Scripts de Bootstrap -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
