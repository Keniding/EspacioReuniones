<%-- 
    Document   : ubicaciones
    Created on : 14 sept 2024, 13:01:52
    Author     : Bruce Porras
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Ubicaciones</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>Gestión de Ubicaciones</h2>
        <!-- Enlace para agregar una nueva ubicación -->
        <a href="UbicacionesServlet?action=nuevo" class="btn btn-primary mb-3">Agregar Nueva Ubicación</a>
        
        <!-- Verifica si la lista de ubicaciones está vacía -->
        <c:if test="${empty ubicaciones}">
            <p class="text-muted">No hay ubicaciones disponibles.</p>
        </c:if>
        
        <!-- Tabla de ubicaciones -->
        <c:if test="${not empty ubicaciones}">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Dirección</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ubicacion" items="${ubicaciones}">
                        <tr>
                            <td>${ubicacion.id}</td>
                            <td>${ubicacion.nombre}</td>
                            <td>${ubicacion.direccion}</td>
                            <td>
                                <!-- Enlaces para editar y eliminar ubicaciones -->
                                <a href="UbicacionesServlet?action=editar&id=${ubicacion.id}" class="btn btn-warning">Editar</a>
                                <a href="UbicacionesServlet?action=eliminar&id=${ubicacion.id}" class="btn btn-danger">Eliminar</a>
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
