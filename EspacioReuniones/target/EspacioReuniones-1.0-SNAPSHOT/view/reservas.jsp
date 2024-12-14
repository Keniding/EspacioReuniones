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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Reservas</title>
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

        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            padding: 2rem;
            margin-top: 2rem;
            margin-bottom: 2rem;
        }

        .page-title {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-primary {
            background-color: var(--secondary-color);
            border: none;
            padding: 0.5rem 1.5rem;
            border-radius: 5px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: var(--primary-color);
            transform: translateY(-2px);
        }

        .table {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
        }

        .table thead th {
            background-color: var(--primary-color);
            color: white;
            font-weight: 500;
            border: none;
            padding: 1rem;
        }

        .table tbody tr:nth-child(even) {
            background-color: rgba(52, 152, 219, 0.05);
        }

        .table tbody td {
            padding: 1rem;
            vertical-align: middle;
            border-color: #edf2f7;
        }

        .btn {
            padding: 0.4rem 1rem;
            border-radius: 5px;
            font-weight: 500;
            transition: all 0.2s;
        }

        .btn-warning {
            background-color: #f1c40f;
            border: none;
            color: var(--primary-color);
        }

        .btn-danger {
            background-color: var(--accent-color);
            border: none;
        }

        .btn-warning:hover, .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .text-muted {
            color: #6c757d !important;
            font-style: italic;
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
            justify-content: flex-end;
        }

        .status-badge {
            padding: 0.35rem 0.75rem;
            border-radius: 20px;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .status-active {
            background-color: #2ecc71;
            color: white;
        }

        .status-pending {
            background-color: #f1c40f;
            color: var(--primary-color);
        }

        .status-cancelled {
            background-color: #e74c3c;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="page-title">
            <i class="fas fa-calendar-check"></i>
            Lista de Reservas
        </h2>

        <a href="MainServlet?action=reservar" class="btn btn-primary mb-4">
            <i class="fas fa-plus me-2"></i>
            Agregar Reserva
        </a>
        <a href="ReservaServlet?action=exportarExcel" class="btn btn-success mb-4">
            <i class="fas fa-file-excel me-2"></i>
            Exportar a Excel
        </a>
        
        <c:if test="${empty reservas}">
            <div class="alert alert-info" role="alert">
                <i class="fas fa-info-circle me-2"></i>
                No se encontraron reservas.
            </div>
        </c:if>
        
        <c:if test="${not empty reservas}">
            <div class="table-responsive">
                <table class="table">
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
                                <td>
                                    <i class="far fa-calendar me-2"></i>
                                    ${reserva.fecha}
                                </td>
                                <td>
                                    <i class="far fa-clock me-2"></i>
                                    ${reserva.horaInicio}
                                </td>
                                <td>
                                    <i class="far fa-clock me-2"></i>
                                    ${reserva.horaFin}
                                </td>
                                <td>
                                    <span class="status-badge ${reserva.estado == 'Activa' ? 'status-active' : 
                                                               reserva.estado == 'Pendiente' ? 'status-pending' : 
                                                               'status-cancelled'}">
                                        ${reserva.estado}
                                    </span>
                                </td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="ReservaServlet?action=editar&id=${reserva.id}" 
                                           class="btn btn-warning">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="ReservaServlet?action=eliminar&id=${reserva.id}" 
                                           class="btn btn-danger"
                                           onclick="return confirm('¿Estás seguro de que deseas eliminar esta reserva?');">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
