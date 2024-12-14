<%-- 
    Document   : seccion
    Created on : 19 oct. 2024, 6:20:59 p. m.
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Secciones</title>
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

        h2 {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }

        h2:before {
            content: '\f0ae';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            margin-right: 0.75rem;
            color: var(--secondary-color);
        }

        .btn-primary {
            background-color: var(--secondary-color);
            border: none;
            padding: 0.5rem 1.5rem;
            border-radius: 5px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: var(--primary-color);
            transform: translateY(-1px);
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .btn-primary:before {
            content: '\f067';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            margin-right: 0.5rem;
        }

        .table {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 0 1px rgba(0,0,0,0.1);
        }

        .table thead {
            background-color: var(--primary-color);
            color: white;
        }

        .table thead th {
            border: none;
            padding: 1rem;
            font-weight: 600;
        }

        .table tbody tr:nth-child(even) {
            background-color: rgba(52, 152, 219, 0.05);
        }

        .table tbody td {
            padding: 1rem;
            vertical-align: middle;
            border-color: rgba(0,0,0,0.05);
        }

        .btn-warning, .btn-danger {
            padding: 0.4rem 1rem;
            border-radius: 4px;
            margin: 0 0.2rem;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
        }

        .btn-warning {
            background-color: #f39c12;
            border: none;
            color: white;
        }

        .btn-warning:hover {
            background-color: #e67e22;
            color: white;
        }

        .btn-danger {
            background-color: var(--accent-color);
            border: none;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }

        .btn-warning:before {
            content: '\f304';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            margin-right: 0.5rem;
        }

        .btn-danger:before {
            content: '\f2ed';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            margin-right: 0.5rem;
        }

        .text-muted {
            color: #95a5a6 !important;
            font-style: italic;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        .text-muted:before {
            content: '\f119';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            margin-right: 0.5rem;
            font-size: 1.2rem;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .table thead {
                display: none;
            }

            .table, .table tbody, .table tr, .table td {
                display: block;
                width: 100%;
            }

            .table tr {
                margin-bottom: 1rem;
                border: 1px solid rgba(0,0,0,0.1);
                border-radius: 8px;
                padding: 0.5rem;
            }

            .table td {
                text-align: right;
                padding: 0.5rem;
                position: relative;
                padding-left: 50%;
            }

            .table td:before {
                content: attr(data-label);
                position: absolute;
                left: 0;
                width: 50%;
                padding-left: 0.5rem;
                font-weight: 600;
                text-align: left;
            }

            .btn-warning, .btn-danger {
                display: block;
                width: 100%;
                margin: 0.2rem 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Lista de Secciones</h2>
        
        <a href="SeccionServlet?action=nuevo" class="btn btn-primary mb-4">Agregar Sección</a>
      
        <a href="SeccionServlet?action=exportarExcel" class="btn btn-success mb-4">
            <i class="fas fa-file-excel me-2"></i>
            Exportar a Excel
        </a>
        
        <c:if test="${empty secciones}">
            <p class="text-muted">No se encontraron secciones.</p>
        </c:if>
        
        <c:if test="${not empty secciones}">
            <div class="table-responsive">
                <table class="table">
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
                                <td data-label="ID">${seccion.id}</td>
                                <td data-label="Nombre">${seccion.nombre}</td>
                                <td data-label="Ubicación ID">${seccion.ubicacionId}</td>
                                <td data-label="Descripción">${seccion.descripcion}</td>
                                <td data-label="Acciones">
                                    <a href="SeccionServlet?action=editar&id=${seccion.id}" 
                                       class="btn btn-warning">Editar</a>
                                    <a href="SeccionServlet?action=eliminar&id=${seccion.id}" 
                                       class="btn btn-danger" 
                                       onclick="return confirm('¿Estás seguro de que deseas eliminar esta sección?');">
                                        Eliminar
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
