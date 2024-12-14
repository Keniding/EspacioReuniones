<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secciones</title>
    
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.css">
    
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --background-color: #f8f9fa;
            --text-color: #2c3e50;
            --border-color: #dee2e6;
            --card-shadow: 0 2px 4px rgba(44, 62, 80, 0.1);
        }

        body {
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
        }

        .container {
            padding: 2rem;
            margin-top: 2rem;
            margin-bottom: 2rem;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: var(--card-shadow);
            margin-bottom: 2rem;
        }

        .card-body {
            padding: 2rem;
        }

        h5 {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 1.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: 500;
            color: var(--text-color);
            margin-bottom: 0.5rem;
        }

        .form-control {
            border: 2px solid var(--border-color);
            border-radius: 8px;
            padding: 0.625rem 1rem;
            transition: all 0.2s ease-in-out;
        }

        .form-control:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
        }

        .form-control:disabled {
            background-color: #f8f9fa;
            cursor: not-allowed;
        }

        .btn {
            padding: 0.625rem 1.25rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.2s ease-in-out;
        }

        .btn-primary {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
        }

        .btn-primary:hover {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-danger {
            background-color: var(--accent-color);
            border-color: var(--accent-color);
        }

        .btn-info {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            color: white;
        }

        .btn:disabled {
            opacity: 0.65;
            cursor: not-allowed;
        }

        /* Tabla */
        .table {
            margin-bottom: 0;
        }

        .table thead th {
            background-color: var(--primary-color);
            color: white;
            font-weight: 500;
            border: none;
            padding: 1rem;
        }

        .table tbody td {
            padding: 1rem;
            vertical-align: middle;
            border-color: var(--border-color);
        }

        .table-hover tbody tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
        }

        /* Botones de acción */
        .btn-warning, .btn-danger {
            padding: 0.5rem;
            margin: 0 0.25rem;
            border-radius: 6px;
        }

        .btn-warning {
            background-color: #f1c40f;
            border-color: #f1c40f;
            color: white;
        }

        .btn-warning:hover {
            background-color: #d4ac0d;
            border-color: #d4ac0d;
            color: white;
        }

        /* DataTables personalización */
        .dataTables_wrapper .dataTables_length select,
        .dataTables_wrapper .dataTables_filter input {
            border: 2px solid var(--border-color);
            border-radius: 6px;
            padding: 0.375rem 0.75rem;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button.current {
            background: var(--secondary-color);
            border-color: var(--secondary-color);
            color: white !important;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
            background: var(--primary-color);
            border-color: var(--primary-color);
            color: white !important;
        }
    </style>
</head>
<body>
    <div class="container">
            <!--PARA MOSTRAR E INGRESAR LOS DATOS DE LA SECCIÓN-->
            <form id="seccionForm" method="post">
                <input type="hidden" name="id" value="${seccion.id}">
                <h5><i class="fa-solid fa-layer-group"></i> Datos de la Sección</h5>
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Nombre</label>
                                    <input type="text" name="txtNombre" id="txtNombre" value="${seccion.nombre}" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Ubicación ID</label>
                                    <input type="text" name="txtUbicacionId" id="txtUbicacionId" value="${seccion.ubicacionId}" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>Descripción</label>
                                    <textarea name="txtDescripcion" id="txtDescripcion" class="form-control" rows="3" disabled>${seccion.descripcion}</textarea>
                                </div>
                            </div>
                            <div class="form-group mt-4 text-center">
                                <button type="button" id="btna" class="btn btn-primary">Agregar</button>
                                <button type="button" id="btng" class="btn btn-danger" disabled>Guardar</button>
                                <button type="button" id="btnm" class="btn btn-info" disabled>Modificar</button>
                                <button type="button" id="btnac" class="btn btn-success" disabled>Actualizar</button>
                                <button type="button" id="btnc" class="btn btn-warning" disabled>Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <!--PARA MOSTRAR EL LISTADO DE SECCIONES-->                        
            <h5 class="text-center mt-3">Listado de Secciones</h5>
            <div class="card">
                <div class="card-body">
                    <table class="table table-hover" id="mi_tabla">
                        <thead>
                            <tr>
                                <th class="text-center">ID</th>
                                <th class="text-center">Nombre</th>
                                <th class="text-center">Ubicación ID</th>
                                <th class="text-center">Descripción</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="sec" items="${secciones}">
                                <tr class="text-center">
                                    <td>${sec.getId()}</td>
                                    <td>${sec.getNombre()}</td>
                                    <td>${sec.getUbicacionId()}</td>
                                    <td>${sec.getDescripcion()}</td>
                                    <td>
                                        <a class="btn btn-warning" id="btned" href="SeccionServlet?action=editar&id=${sec.getId()}"><i class="fa-solid fa-pen-to-square"></i></a>
                                        <a class="btn btn-danger" id="btnq" href="SeccionServlet?action=eliminar&id=${sec.getId()}"><i class="fa-solid fa-trash-can"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!--De JavaScript-->
        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>                        
        <!--De bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <!--Para paginacion de la tabla-->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.js"></script>

        <!--De JS-->
        <script type="text/javascript">
            //Para la actualizacion de la tabla de secciones
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
                document.getElementById("txtUbicacionId").disabled = true;
                document.getElementById("txtDescripcion").disabled = true;
            };
            document.getElementById("btna").onclick = function () {
                document.getElementById("btnc").disabled = false;
                document.getElementById("btna").disabled = true;
                document.getElementById("btnm").disabled = true;
                document.getElementById("btng").disabled = false;
                document.getElementById("txtNombre").disabled = false;
                document.getElementById("txtUbicacionId").disabled = false;
                document.getElementById("txtDescripcion").disabled = false;
                document.getElementById("txtNombre").focus();
                document.getElementById("txtNombre").value = "";
                document.getElementById("txtUbicacionId").value = "";
                document.getElementById("txtDescripcion").value = "";
            };
            document.getElementById("btnm").onclick = function () {
                document.getElementById("btnc").disabled = false;
                document.getElementById("btna").disabled = true;
                document.getElementById("btnm").disabled = true;
                document.getElementById("btnac").disabled = false;
                document.getElementById("txtNombre").disabled = false;
                document.getElementById("txtUbicacionId").disabled = false;
                document.getElementById("txtDescripcion").disabled = false;
                document.getElementById("txtNombre").focus();
            };
            if ($('#txtNombre').val().length !== 0) {
                document.getElementById("btnm").disabled = false;
            }

            function prepararParaGuardar() {
                document.getElementById("txtNombre").disabled = false;
                document.getElementById("txtUbicacionId").disabled = false;
                document.getElementById("txtDescripcion").disabled = false;
                document.getElementById("btnac").disabled = true;
                document.getElementById("btna").disabled = true;
                document.getElementById("btng").disabled = false;
                document.getElementById("btnm").disabled = true;
                document.getElementById("btnc").disabled = false;
            }

            function prepararParaEditar() {
                document.getElementById("txtNombre").disabled = false;
                document.getElementById("txtUbicacionId").disabled = false;
                document.getElementById("txtDescripcion").disabled = false;
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
                document.getElementById("txtUbicacionId").disabled = true;
                document.getElementById("txtDescripcion").disabled = true;
            };
            
            document.getElementById("btng").onclick = function () {
                document.getElementById("seccionForm").action = "SeccionServlet?action=guardar";
                document.getElementById("seccionForm").submit();
            };

            document.getElementById("btnac").onclick = function () {
                document.getElementById("seccionForm").action = "SeccionServlet?action=actualizar";
                document.getElementById("seccionForm").submit();
            };

        </script>
    </body>
</html>