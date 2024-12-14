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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Ubicaciones</title>
    
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
    <!-- DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.css">
    
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --background-color: #f8f9fa;
        }

        body {
            background-color: var(--background-color);
            color: var(--primary-color);
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }

        .card-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border-radius: 15px 15px 0 0 !important;
            padding: 1.5rem;
        }

        .table {
            border-radius: 15px;
            overflow: hidden;
            margin-bottom: 0;
        }

        .table thead th {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
            color: var(--primary-color);
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            padding: 1rem;
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
            color: white;
            background-color: #f1c40f;
            border: none;
        }

        .btn-danger {
            background-color: var(--accent-color);
            border: none;
        }

        .btn-icon {
            padding: 0.5rem;
            width: 38px;
            height: 38px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin: 0 0.25rem;
        }

        .action-buttons {
            white-space: nowrap;
        }

        .page-header {
            background: var(--primary-color);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
            border-radius: 0 0 1.5rem 1.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .empty-state {
            text-align: center;
            padding: 2rem;
            color: var(--text-muted);
        }

        .table-responsive {
            border-radius: 15px;
            overflow: hidden;
        }
        
        .container {
            color: var(--primary-color);
        }

        tr:hover {
            background-color: rgba(52, 152, 219, 0.05);
        }
    </style>
</head>
<body>
    <div class="page-header">
        <div class="container">
            <h2 class="mb-0">
                <i class="fas fa-map-marker-alt me-2"></i>
                Gestión de Ubicaciones
            </h2>
        </div>
    </div>

    <div class="container">
        <div class="card">
            <div class="card-header">
                <div class="d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">
                        <i class="fas fa-list me-2"></i>
                        Listado de Ubicaciones
                    </h5>
                    <a href="UbicacionServlet?action=nuevo" class="btn btn-primary">
                        <i class="fas fa-plus me-2"></i>
                        Agregar Nueva Ubicación
                    </a>
                </div>
            </div>
            <div class="card-body">
                <c:if test="${empty ubicaciones}">
                    <div class="empty-state">
                        <i class="fas fa-inbox fa-3x mb-3"></i>
                        <p class="text-muted">No hay ubicaciones disponibles.</p>
                    </div>
                </c:if>
                
                <c:if test="${not empty ubicaciones}">
                    <div class="table-responsive">
                        <table class="table table-hover" id="ubicacionesTable">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Dirección</th>
                                    <th class="text-center">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="ubicacion" items="${ubicaciones}">
                                    <tr>
                                        <td class="align-middle">${ubicacion.id}</td>
                                        <td class="align-middle">${ubicacion.nombre}</td>
                                        <td class="align-middle">${ubicacion.direccion}</td>
                                        <td class="text-center action-buttons">
                                            <a href="UbicacionServlet?action=editar&id=${ubicacion.id}" 
                                               class="btn btn-warning btn-icon" title="Editar">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="UbicacionServlet?action=eliminar&id=${ubicacion.id}" 
                                               class="btn btn-danger btn-icon"
                                               onclick="return confirm('¿Está seguro de que desea eliminar esta ubicación?');"
                                               title="Eliminar">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
    
    <script>
        $(document).ready(function() {
            $('#ubicacionesTable').DataTable({
                language: {
                    url: '//cdn.datatables.net/plug-ins/1.13.2/i18n/es-ES.json'
                }
            });
        });
    </script>
</body>
</html>
