<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión de Reservas</title>
        
        <!-- CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.css">
        
        <style>
            :root {
                --primary-color: #3498db;
                --success-color: #2ecc71;
                --warning-color: #f1c40f;
                --danger-color: #e74c3c;
                --border-radius: 12px;
            }

            body {
                background-color: #f8f9fa;
            }

            .card {
                border: none;
                border-radius: var(--border-radius);
                box-shadow: 0 0 20px rgba(0,0,0,0.05);
                margin-bottom: 2rem;
            }

            .card-header {
                background: linear-gradient(135deg, var(--primary-color), #2980b9);
                color: white;
                border-radius: var(--border-radius) var(--border-radius) 0 0 !important;
                padding: 1.5rem;
            }

            .form-control, .form-select {
                border-radius: 8px;
                border: 2px solid #eef2f7;
                padding: 0.75rem;
                transition: all 0.3s;
            }

            .form-control:focus, .form-select:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            }

            .form-label {
                font-weight: 600;
                color: #2c3e50;
                margin-bottom: 0.5rem;
            }

            .btn {
                padding: 0.6rem 1.5rem;
                border-radius: 8px;
                font-weight: 500;
                transition: all 0.3s;
            }

            .btn:hover {
                transform: translateY(-2px);
            }

            .btn-info {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
                color: white;
            }

            .btn-info:hover {
                background-color: #2980b9;
                border-color: #2980b9;
                color: white;
            }

            .table {
                border-radius: var(--border-radius);
                overflow: hidden;
            }

            .table thead th {
                background-color: #f8f9fa;
                border-bottom: 2px solid #dee2e6;
                color: #2c3e50;
                font-weight: 600;
                text-transform: uppercase;
                font-size: 0.85rem;
            }

            .status-badge {
                padding: 0.5rem 1rem;
                border-radius: 20px;
                font-weight: 500;
            }

            .status-pendiente {
                background-color: #f1c40f;
                color: #000;
            }

            .status-confirmado {
                background-color: #2ecc71;
                color: white;
            }

            .status-cancelado {
                background-color: #e74c3c;
                color: white;
            }

            .action-buttons .btn {
                padding: 0.4rem 1rem;
                margin: 0 0.2rem;
            }

            @media (max-width: 768px) {
                .action-buttons .btn {
                    margin-bottom: 0.5rem;
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <div class="container py-5">
            <!-- Formulario de Reserva -->
            <div class="card mb-4">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fa-solid fa-calendar-check me-2"></i>
                        Nueva Reserva
                    </h5>
                </div>
                <div class="card-body p-4">
                    <form action="ReservaServlet?action=guardar" method="post">
                        <div class="row g-4">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-building me-2"></i>ID Espacio
                                    </label>
                                    <input type="text" name="txtespacioId" id="txtEspacioId" 
                                           value="${reserva.getEspacioId()}" class="form-control">
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group mb-3">
                                    <label class="form-label">
                                        <i class="fas fa-calendar me-2"></i>Fecha
                                    </label>
                                    <input type="date" name="txtfecha" id="txtFecha" 
                                           value="${reserva.getFecha()}" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-clock me-2"></i>Hora Inicio
                                    </label>
                                    <input type="time" name="txthoraInicio" id="txtHoraInicio" 
                                           value="${reserva.getHoraInicio()}" class="form-control">
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-tag me-2"></i>Estado
                                    </label>
                                    <select class="form-select" name="selEstado" id="selEstado">
                                        <option value="Pendiente" ${estado.equals("Pendiente") ? "selected" : ""}>
                                            🕒 Pendiente
                                        </option>
                                        <option value="Confirmado" ${estado.equals("Confirmado") ? "selected" : ""}>
                                            ✅ Confirmado
                                        </option>
                                        <option value="Cancelado" ${estado.equals("Cancelado") ? "selected" : ""}>
                                            ❌ Cancelado
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <div class="text-center mt-4">
                            <button type="submit" name="accion" id="btnm" value="Modificar" 
                                    class="btn btn-info">
                                <i class="fas fa-edit me-2"></i>Modificar
                            </button>
                            <button type="submit" name="accion" id="btnac" value="Actualizar" 
                                    class="btn btn-success" disabled>
                                <i class="fas fa-check me-2"></i>Actualizar
                            </button>
                            <button type="submit" name="accion" id="btnc" value="Cancelar" 
                                    class="btn btn-warning" disabled>
                                <i class="fas fa-times me-2"></i>Cancelar
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Tabla de Reservas -->
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fas fa-list me-2"></i>
                        Listado de Reservas
                    </h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0" id="tablaReservas">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Usuario</th>
                                    <th>Espacio</th>
                                    <th>Fecha</th>
                                    <th>Inicio</th>
                                    <th>Fin</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="reserva" items="${reservas}">
                                    <tr>
                                        <td>${reserva.id}</td>
                                        <td>
                                            <i class="fas fa-user me-1"></i>
                                            ${reserva.usuarioId}
                                        </td>
                                        <td>
                                            <i class="fas fa-building me-1"></i>
                                            ${reserva.espacioId}
                                        </td>
                                        <td>
                                            <i class="fas fa-calendar me-1"></i>
                                            ${reserva.fecha}
                                        </td>
                                        <td>
                                            <i class="fas fa-clock me-1"></i>
                                            ${reserva.horaInicio}
                                        </td>
                                        <td>
                                            <i class="fas fa-clock me-1"></i>
                                            ${reserva.horaFin}
                                        </td>
                                        <td class="text-center">
                                            <span class="status-badge status-${reserva.estado.toLowerCase()}">
                                                ${reserva.estado}
                                            </span>
                                        </td>
                                        <td class="text-center">
                                            <div class="action-buttons">
                                                <a href="ReservaServlet?action=editar&id=${reserva.id}" 
                                                   class="btn btn-warning btn-sm">
                                                    <i class="fas fa-edit me-1"></i>Editar
                                                </a>
                                                <a href="ReservaServlet?action=eliminar&id=${reserva.id}" 
                                                   class="btn btn-danger btn-sm"
                                                   onclick="return confirm('¿Estás seguro de que deseas eliminar esta reserva?');">
                                                    <i class="fas fa-trash me-1"></i>Eliminar
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.js"></script>

        <!--De JS-->
        <script type="text/javascript">
            //Para la actualizacion de la tabla de reservas
            $(document).ready(function () {
                $('#mi_tabla').DataTable({
                    language: {
                        search: "Buscar"
                    }
                });
            });

            document.getElementById("btnc").onclick = function () {
                document.getElementById("btnc").disabled = true;
                document.getElementById("btna").disabled = false;
                document.getElementById("btng").disabled = true;
                document.getElementById("btnac").disabled = true;
                document.getElementById("txtEspacioId").disabled = true;
                document.getElementById("txtHoraInicio").disabled = true;
                document.getElementById("txtHoraFin").disabled = true;
            };
            document.getElementById("btna").onclick = function () {
                document.getElementById("btnc").disabled = false;
                document.getElementById("btna").disabled = true;
                document.getElementById("btnm").disabled = true;
                document.getElementById("btng").disabled = false;
                document.getElementById("txtEspacioId").disabled = true;
                document.getElementById("txtHoraInicio").disabled = true;
                document.getElementById("txtHoraFin").disabled = true;
                document.getElementById("txtEspacioId").focus();
                document.getElementById("txtEspacioId").value = "";
                document.getElementById("txtHoraInicio").value = "";
                document.getElementById("txtHoraFin").value = "";
            };
            document.getElementById("btnm").onclick = function () {
                document.getElementById("btnc").disabled = false;
                document.getElementById("btna").disabled = true;
                document.getElementById("btnm").disabled = true;
                document.getElementById("btnac").disabled = false;
                document.getElementById("txtEspacioId").disabled = false;
                document.getElementById("txtHoraInicio").disabled = false;
                document.getElementById("txtHoraFin").disabled = false;
            };
        </script>
    </body>
</html>
