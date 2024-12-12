<%-- 
    Document   : seccion
    Created on : 19 oct. 2024, 6:20:59 p. m.
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Secciones</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>Lista de Secciones</h2>
        
        <a href="SeccionServlet?action=nuevo" class="btn btn-primary mb-3">Agregar Sección</a>
        
        <c:if test="${empty secciones}">
            <p class="text-muted">No se encontraron secciones.</p>
        </c:if>
        
        <c:if test="${not empty secciones}">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Ubicación ID</th>
                        <th>Descripción</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="seccion" items="${secciones}">
                        <tr>
                            <td>${seccion.id}</td>
                            <td>${seccion.nombre}</td>
                            <td>${seccion.ubicacionId}</td>
                            <td>${seccion.descripcion}</td>
                            <td>
                                <a href="SeccionServlet?action=editar&id=${seccion.id}" class="btn btn-warning">Editar</a>
                                <a href="SeccionServlet?action=eliminar&id=${seccion.id}" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar esta sección?');">Eliminar</a>
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