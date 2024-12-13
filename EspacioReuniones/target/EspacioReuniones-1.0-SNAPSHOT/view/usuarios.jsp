<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Usuarios</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Lista de Usuarios</h2>

    <!-- Solo mostrar el botón de Agregar Usuario si es Superadministrador -->
    <c:if test="${sessionScope.rol == 'Superadministrador'}">
        <a href="UsuarioServlet?action=nuevo" class="btn btn-primary mb-3">Agregar Usuario</a>
    </c:if>

    <c:if test="${empty usuarios}">
        <p class="text-muted">No se encontraron usuarios.</p>
    </c:if>

    <c:if test="${not empty usuarios}">
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
                        <!-- Lógica de permisos para botones -->
                        <c:choose>
                            <%-- Superadministrador puede editar y eliminar todo --%>
                            <c:when test="${sessionScope.rol == 'Superadministrador'}">
                                <a href="UsuarioServlet?action=editar&id=${usuario.id}" class="btn btn-warning btn-sm">Editar</a>
                                <a href="UsuarioServlet?action=eliminar&id=${usuario.id}"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?');">
                                    Eliminar
                                </a>
                            </c:when>

                            <%-- Administrador_seccion puede editar usuarios de su ubicación --%>
                            <c:when test="${sessionScope.rol == 'Administrador_seccion' && sessionScope.ubicacionId == usuario.ubicacionId}">
                                <a href="UsuarioServlet?action=editar&id=${usuario.id}" class="btn btn-warning btn-sm">Editar</a>
                            </c:when>

                            <%-- Usuario normal solo puede editar su propia información --%>
                            <c:when test="${sessionScope.usuarioId == usuario.id}">
                                <a href="UsuarioServlet?action=editar&id=${usuario.id}" class="btn btn-warning btn-sm">Editar</a>
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

<!-- Scripts de Bootstrap -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
