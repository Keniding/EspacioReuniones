<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Espacios</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --success-color: #2ecc71;
            --warning-color: #f1c40f;
            --danger-color: #e74c3c;
        }

        body {
            background-color: #f8f9fa;
            color: var(--primary-color);
        }

        .page-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 2rem;
            border-radius: 10px;
            margin-bottom: 2rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .page-header h2 {
            margin: 0;
            font-weight: 600;
        }

        .btn-add {
            background-color: var(--success-color);
            border: none;
            padding: 0.5rem 1.5rem;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .btn-add:hover {
            background-color: #27ae60;
            transform: translateY(-2px);
        }

        .btn-add i {
            margin-right: 0.5rem;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .table {
            margin-bottom: 0;
        }

        .table thead th {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
            color: var(--primary-color);
            font-weight: 600;
        }

        .table td {
            vertical-align: middle;
        }

        .badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: 500;
        }

        .badge-active {
            background-color: var(--success-color);
            color: white;
        }

        .badge-inactive {
            background-color: #95a5a6;
            color: white;
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .btn-edit, .btn-delete {
            padding: 0.4rem 1rem;
            border-radius: 5px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .btn-edit {
            background-color: var(--warning-color);
            border: none;
            color: var(--primary-color);
        }

        .btn-delete {
            background-color: var(--danger-color);
            border: none;
        }

        .btn-edit:hover, .btn-delete:hover {
            transform: translateY(-2px);
        }

        .empty-state {
            text-align: center;
            padding: 3rem;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .empty-state i {
            font-size: 3rem;
            color: #95a5a6;
            margin-bottom: 1rem;
        }

        @media (max-width: 768px) {
            .table-responsive {
                border-radius: 10px;
            }
            
            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="page-header d-flex justify-content-between align-items-center">
            <h2><i class="fas fa-door-open mr-2"></i>Lista de Espacios</h2>
            <a href="EspacioServlet?action=nuevo" class="btn btn-add">
                <i class="fas fa-plus"></i>Agregar Espacio
            </a>
        </div>
        
        <c:if test="${empty espacios}">
            <div class="empty-state">
                <i class="fas fa-search"></i>
                <p class="text-muted">No se encontraron espacios disponibles.</p>
                <p class="small">Comienza agregando un nuevo espacio.</p>
            </div>
        </c:if>
        
        <c:if test="${not empty espacios}">
            <div class="card">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Capacidad</th>
                                <th>Descripción</th>
                                <th>Sección</th>
                                <th>Ubicación</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="espacio" items="${espacios}">
                                <tr>
                                    <td>#${espacio.id}</td>
                                    <td>
                                        <strong>${espacio.nombre}</strong>
                                    </td>
                                    <td>
                                        <i class="fas fa-users mr-1"></i>
                                        ${espacio.capacidad}
                                    </td>
                                    <td>${espacio.descripcion}</td>
                                    <td>
                                        <i class="fas fa-layer-group mr-1"></i>
                                        ${espacio.seccionId}
                                    </td>
                                    <td>
                                        <i class="fas fa-map-marker-alt mr-1"></i>
                                        ${espacio.ubicacionId}
                                    </td>
                                    <td>
                                        <span class="badge ${espacio.estado == 'Activo' ? 'badge-active' : 'badge-inactive'}">
                                            ${espacio.estado}
                                        </span>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <a href="EspacioServlet?action=editar&id=${espacio.id}" 
                                               class="btn btn-edit">
                                                <i class="fas fa-edit mr-1"></i>Editar
                                            </a>
                                            <a href="EspacioServlet?action=eliminar&id=${espacio.id}" 
                                               class="btn btn-delete"
                                               onclick="return confirm('¿Estás seguro de que deseas eliminar este espacio?');">
                                                <i class="fas fa-trash-alt mr-1"></i>Eliminar
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:if>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
