<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión de Espacios</title>
        
        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- FontAwesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <!-- DataTables -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.css">
        <!-- Custom CSS -->
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

            .form-control, .form-select {
                border-radius: 8px;
                border: 1px solid #dee2e6;
                padding: 0.75rem;
                transition: all 0.3s ease;
            }

            .form-control:focus, .form-select:focus {
                border-color: var(--secondary-color);
                box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            }

            .form-control:disabled, .form-select:disabled {
                background-color: #f8f9fa;
                cursor: not-allowed;
            }

            .btn {
                border-radius: 8px;
                padding: 0.5rem 1.5rem;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            .btn:hover {
                transform: translateY(-2px);
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

            .table {
                border-radius: 15px;
                overflow: hidden;
            }

            .table thead th {
                background-color: #f8f9fa;
                border-bottom: 2px solid #dee2e6;
                color: var(--primary-color);
                font-weight: 600;
                text-transform: uppercase;
                font-size: 0.85rem;
            }

            .badge {
                padding: 0.5rem 1rem;
                border-radius: 20px;
                font-weight: 500;
            }

            .badge-disponible {
                background-color: var(--success-color);
                color: white;
            }

            .badge-ocupado {
                background-color: var(--warning-color);
                color: var(--primary-color);
            }

            .badge-deshabilitado {
                background-color: #95a5a6;
                color: white;
            }

            .dataTables_wrapper .dataTables_paginate .paginate_button.current {
                background: var(--secondary-color) !important;
                border-color: var(--secondary-color) !important;
                color: white !important;
            }

            .form-floating > label {
                padding: 1rem;
            }

            .form-floating > .form-control {
                height: calc(3.5rem + 2px);
                line-height: 1.25;
            }
        </style>
    </head>
    <body>
        <div class="container py-4">
            <!-- Formulario -->
            <form id="espacioForm" method="post">
                <input type="hidden" name="id" value="${espacio.id}">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <i class="fa-solid fa-building-user me-2"></i>
                            Gestión de Espacio
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="row g-4">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" name="txtNombre" id="txtNombre" 
                                           value="${espacio.nombre}" class="form-control" 
                                           placeholder="Nombre" disabled>
                                    <label for="txtNombre">Nombre</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="number" name="txtCapacidad" id="txtCapacidad" 
                                           value="${espacio.capacidad}" class="form-control" 
                                           placeholder="Capacidad" disabled>
                                    <label for="txtCapacidad">Capacidad</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-floating">
                                    <textarea name="txtDescripcion" id="txtDescripcion" 
                                              class="form-control" style="height: 100px" 
                                              placeholder="Descripción" disabled>${espacio.descripcion}</textarea>
                                    <label for="txtDescripcion">Descripción</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" name="txtSeccionId" id="txtSeccionId" 
                                           value="${espacio.seccionId}" class="form-control" 
                                           placeholder="Sección ID" disabled>
                                    <label for="txtSeccionId">Sección ID</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" name="txtUbicacionId" id="txtUbicacionId" 
                                           value="${espacio.ubicacionId}" class="form-control" 
                                           placeholder="Ubicación ID" disabled>
                                    <label for="txtUbicacionId">Ubicación ID</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <select name="txtEstado" id="txtEstado" class="form-select" disabled>
                                        <option value="Disponible" ${espacio.estado == 'Disponible' ? 'selected' : ''}>Disponible</option>
                                        <option value="Ocupado" ${espacio.estado == 'Ocupado' ? 'selected' : ''}>Ocupado</option>
                                        <option value="Deshabilitado" ${espacio.estado == 'Deshabilitado' ? 'selected' : ''}>Deshabilitado</option>
                                    </select>
                                    <label for="txtEstado">Estado</label>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <div class="btn-group" role="group">
                                    <button type="button" id="btna" class="btn btn-primary">
                                        <i class="fas fa-plus me-2"></i>Agregar
                                    </button>
                                    <button type="button" id="btng" class="btn btn-danger" disabled>
                                        <i class="fas fa-save me-2"></i>Guardar
                                    </button>
                                    <button type="button" id="btnm" class="btn btn-info" disabled>
                                        <i class="fas fa-edit me-2"></i>Modificar
                                    </button>
                                    <button type="button" id="btnac" class="btn btn-success" disabled>
                                        <i class="fas fa-check me-2"></i>Actualizar
                                    </button>
                                    <button type="button" id="btnc" class="btn btn-warning" disabled>
                                        <i class="fas fa-times me-2"></i>Cancelar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <!-- Tabla -->
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fa-solid fa-table me-2"></i>
                        Listado de Espacios
                    </h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover" id="mi_tabla">
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
                                <c:forEach var="esp" items="${espacios}">
                                    <tr>
                                        <td class="text-center">${esp.getId()}</td>
                                        <td>${esp.getNombre()}</td>
                                        <td class="text-center">
                                            <i class="fas fa-users me-1"></i>
                                            ${esp.getCapacidad()}
                                        </td>
                                        <td>${esp.getDescripcion()}</td>
                                        <td class="text-center">
                                            <i class="fas fa-layer-group me-1"></i>
                                            ${esp.getSeccionId()}
                                        </td>
                                        <td class="text-center">
                                            <i class="fas fa-map-marker-alt me-1"></i>
                                            ${esp.getUbicacionId()}
                                        </td>
                                        <td class="text-center">
                                            <span class="badge badge-${esp.getEstado().toLowerCase()}">
                                                ${esp.getEstado()}
                                            </span>
                                        </td>
                                        <td class="text-center">
                                            <a class="btn btn-warning btn-icon" id="btned" 
                                               href="EspacioServlet?action=editar&id=${esp.getId()}" 
                                               title="Editar">
                                                <i class="fa-solid fa-pen-to-square"></i>
                                            </a>
                                            <a class="btn btn-danger btn-icon" id="btnq" 
                                               href="EspacioServlet?action=eliminar&id=${esp.getId()}" 
                                               onclick="return confirm('¿Estás seguro de que deseas eliminar este espacio?');"
                                               title="Eliminar">
                                                <i class="fa-solid fa-trash-can"></i>
                                            </a>
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
        <script type="text/javascript" src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.js"></script>

        <!--De JS-->
        <script type="text/javascript">
            //Para la actualizacion de la tabla de espacios
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
                document.getElementById("txtNombre").disabled = true;
                document.getElementById("txtCapacidad").disabled = true;
                document.getElementById("txtDescripcion").disabled = true;
                document.getElementById("txtSeccionId").disabled = true;
                document.getElementById("txtUbicacionId").disabled = true;
                document.getElementById("txtEstado").disabled = true;
            };
            document.getElementById("btna").onclick = function () {
                document.getElementById("btnc").disabled = false;
                document.getElementById("btna").disabled = true;
                document.getElementById("btnm").disabled = true;
                document.getElementById("btng").disabled = false;
                document.getElementById("txtNombre").disabled = false;
                document.getElementById("txtCapacidad").disabled = false;
                document.getElementById("txtDescripcion").disabled = false;
                document.getElementById("txtSeccionId").disabled = false;
                document.getElementById("txtUbicacionId").disabled = false;
                document.getElementById("txtEstado").disabled = false;
                document.getElementById("txtNombre").focus();
                document.getElementById("txtNombre").value = "";
                document.getElementById("txtCapacidad").value = "";
                document.getElementById("txtDescripcion").value = "";
                document.getElementById("txtSeccionId").value = "";
                document.getElementById("txtUbicacionId").value = "";
                document.getElementById("txtEstado").value = "";
            };
            document.getElementById("btnm").onclick = function () {
                document.getElementById("btnc").disabled = false;
                document.getElementById("btna").disabled = true;
                document.getElementById("btnm").disabled = true;
                document.getElementById("btnac").disabled = false;
                document.getElementById("txtNombre").disabled = false;
                document.getElementById("txtCapacidad").disabled = false;
                document.getElementById("txtDescripcion").disabled = false;
                document.getElementById("txtSeccionId").disabled = false;
                document.getElementById("txtUbicacionId").disabled = false;
                document.getElementById("txtEstado").disabled = false;
                document.getElementById("txtNombre").focus();
            };
            if ($('#txtNombre').val().length !== 0) {
                document.getElementById("btnm").disabled = false;
            }

            function prepararParaGuardar() {
                document.getElementById("txtNombre").disabled = false;
                document.getElementById("txtCapacidad").disabled = false;
                document.getElementById("txtDescripcion").disabled = false;
                document.getElementById("txtSeccionId").disabled = false;
                document.getElementById("txtUbicacionId").disabled = false;
                document.getElementById("txtEstado").disabled = false;
                document.getElementById("btnac").disabled = true;
                document.getElementById("btna").disabled = true;
                document.getElementById("btng").disabled = false;
                document.getElementById("btnm").disabled = true;
                document.getElementById("btnc").disabled = false;
            }

            function prepararParaEditar() {
                document.getElementById("txtNombre").disabled = false;
                document.getElementById("txtCapacidad").disabled = false;
                document.getElementById("txtDescripcion").disabled = false;
                document.getElementById("txtSeccionId").disabled = false;
                document.getElementById("txtUbicacionId").disabled = false;
                document.getElementById("txtEstado").disabled = false;
                document.getElementById("btnac").disabled = false;
                document.getElementById("btna").disabled = true;
                document.getElementById("btng").disabled = true;
                document.getElementById("btnm").disabled = true;
                document.getElementById("btnc").disabled = false;
            }

            if (document.getElementById("txtNombre").value !== "" && document.getElementById("txtDescripcion").value !== "") {
                prepararParaEditar();
            }

            document.getElementById("btnc").onclick = function () {
                document.getElementById("btnc").disabled = true;
                document.getElementById("btna").disabled = false;
                document.getElementById("btng").disabled = true;
                document.getElementById("btnac").disabled = true;
                document.getElementById("txtNombre").disabled = true;
                document.getElementById("txtCapacidad").disabled = true;
                document.getElementById("txtDescripcion").disabled = true;
                document.getElementById("txtSeccionId").disabled = true;
                document.getElementById("txtUbicacionId").disabled = true;
                document.getElementById("txtEstado").disabled = true;
            };
            
            document.getElementById("btng").onclick = function () {
                document.getElementById("espacioForm").action = "EspacioServlet?action=guardar";
                document.getElementById("espacioForm").submit();
            };

            document.getElementById("btnac").onclick = function () {
                document.getElementById("espacioForm").action = "EspacioServlet?action=actualizar";
                document.getElementById("espacioForm").submit();
            };

        </script>
    </body>
</html>