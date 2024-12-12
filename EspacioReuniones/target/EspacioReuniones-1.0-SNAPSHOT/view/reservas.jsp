<%-- 
    Document   : reservas
    Created on : 20 oct 2024
    Author     : Henry
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Reservas</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>Lista de Reservas</h2>

        <a href="MainServlet?action=reservar" class="btn btn-primary mb-3">Agregar Reserva</a>
        
        <c:if test="${empty reservas}">
            <p class="text-muted">No se encontraron reservas.</p>
        </c:if>
        
        <c:if test="${not empty reservas}">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>ID Usuario</th>
                        <th>ID Espacio</th>
                        <th>Fecha</th>
                        <th>Hora Inicio</th>
                        <th>Hora Fin</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="reserva" items="${reservas}">
                        <tr>
                            <td>${reserva.id}</td>
                            <td>${reserva.usuarioId}</td>
                            <td>${reserva.espacioId}</td>
                            <td>${reserva.fecha}</td>
                            <td>${reserva.horaInicio}</td>
                            <td>${reserva.horaFin}</td>
                            <td>${reserva.estado}</td>
                            <td>
                                <a href="ReservaServlet?action=editar&id=${reserva.id}" class="btn btn-warning">Editar</a>
                                <a href="ReservaServlet?action=eliminar&id=${reserva.id}" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar esta reserva?');">Eliminar</a>
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
