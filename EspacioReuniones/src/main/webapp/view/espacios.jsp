<%-- 
    Document   : espacios
    Created on : 19 oct. 2024, 6:49:22 p. m.
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Espacios</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>Lista de Espacios</h2>
        
        <a href="EspacioServlet?action=nuevo" class="btn btn-primary mb-3">Agregar Espacio</a>
        
        <c:if test="${empty espacios}">
            <p class="text-muted">No se encontraron espacios.</p>
        </c:if>
        
        <c:if test="${not empty espacios}">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Capacidad</th>
                        <th>Descripción</th>
                        <th>Sección ID</th>
                        <th>Ubicación ID</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="espacio" items="${espacios}">
                        <tr>
                            <td>${espacio.id}</td>
                            <td>${espacio.nombre}</td>
                            <td>${espacio.capacidad}</td>
                            <td>${espacio.descripcion}</td>
                            <td>${espacio.seccionId}</td>
                            <td>${espacio.ubicacionId}</td>
                            <td>${espacio.estado}</td>
                            <td>
                                <a href="EspacioServlet?action=editar&id=${espacio.id}" class="btn btn-warning">Editar</a>
                                <a href="EspacioServlet?action=eliminar&id=${espacio.id}" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar este espacio?');">Eliminar</a>
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