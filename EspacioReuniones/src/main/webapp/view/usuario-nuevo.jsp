<%-- 
    Document   : usuarios
    Created on : 19 oct 2024, 22:15:59
    Author     : Henry
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Usuarios</title>
    
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
            --accent-color: #e74c3c;
            --background-color: #f8f9fa;
            --success-color: #2ecc71;
            --warning-color: #f1c40f;
            --text-color: #2c3e50;
            --text-muted: #6c757d;
            --border-color: #dee2e6;
        }

        body {
            background-color: var(--background-color);
            color: var(--text-color);
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
            background: white;
        }

        .card-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border-radius: 15px 15px 0 0 !important;
            padding: 1.5rem;
            border-bottom: none;
        }

        .card-header h5 {
            margin: 0;
            font-weight: 600;
        }

        .card-body {
            padding: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: 600;
            color: var(--text-color);
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
        }

        .form-control, .form-select {
            border-radius: 8px;
            border: 2px solid var(--border-color);
            padding: 0.45rem;
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
        }

        .form-control:disabled, .form-select:disabled {
            background-color: #f8f9fa;
            cursor: not-allowed;
        }

        .btn {
            border-radius: 8px;
            padding: 0.75rem 1.5rem;
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
            background-color: var(--warning-color);
            border: none;
            color: var(--primary-color);
        }

        .btn-danger {
            background-color: var(--accent-color);
            border: none;
        }

        .btn-success {
            background-color: var(--success-color);
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

        .table {
            border-radius: 15px;
            overflow: hidden;
        }

        .table thead th {
            background-color: #f8f9fa;
            border-bottom: 2px solid var(--border-color);
            color: var(--text-color);
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            padding: 1rem;
        }

        .table td {
            padding: 1rem;
            vertical-align: middle;
        }

        .user-info-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .user-info-item {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }

        .user-info-item i {
            width: 24px;
            color: var(--secondary-color);
            margin-right: 0.75rem;
        }

        .badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: 500;
        }

        .badge-role {
            background-color: var(--secondary-color);
            color: white;
        }

        /* DataTables customization */
        .dataTables_wrapper .dataTables_paginate .paginate_button.current {
            background: var(--secondary-color) !important;
            border-color: var(--secondary-color) !important;
            color: white !important;
            border-radius: 8px;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .card-body {
                padding: 1.5rem;
            }
            
            .btn {
                padding: 0.5rem 1rem;
                font-size: 0.9rem;
            }
            
            .table-responsive {
                border-radius: 15px;
                overflow: hidden;
            }
        }
    </style>
</head>
    <body>
        <div class="container">
            <!--PARA MOSTRAR E INGRESAR LOS DATOS DEL USUARIO-->
            <form id="usuarioForm" method="post">
                <input type="hidden" name="id" value="${usuario.id}">
                <h5><i class="fa-solid fa-user"></i> Datos del Usuario</h5>
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Nombres</label>
                                    <input type="text" name="txtNombres" id="txtNombres" value="${usuario.nombres}" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Apellidos</label>
                                    <input type="text" name="txtApellidos" id="txtApellidos" value="${usuario.apellidos}" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>DNI</label>
                                    <input type="text" name="txtDni" id="txtDni" value="${usuario.dni}" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Código Alumno</label>
                                    <input type="text" name="txtCodigoAlumno" id="txtCodigoAlumno" value="${usuario.codigoAlumno}" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" name="txtEmail" id="txtEmail" value="${usuario.email}" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" name="txtPassword" id="txtPassword" value="${usuario.password}" class="form-control">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Ubicación ID</label>
                                    <input type="text" name="txtUbicacionId" id="txtUbicacionId" value="${usuario.ubicacionId}" class="form-control" 
                                           <c:if test="${sessionScope.rol != 'Superadministrador' && sessionScope.rol != 'Administrador_seccion'}">disabled</c:if>>
                                </div>
                            </div>
                            <div></div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Rol</label>
                                        <select name="txtRol" id="txtRol" class="form-control" 
                                                <c:if test="${sessionScope.rol != 'Superadministrador' && sessionScope.rol != 'Administrador_seccion'}">disabled</c:if>>

                                            <%-- Roles administrativos (solo visibles para Superadministrador) --%>
                                            <c:if test="${sessionScope.rol == 'Superadministrador'}">
                                                <option value="Superadministrador" ${usuario.rol == 'Superadministrador' ? 'selected' : ''}>Superadministrador</option>
                                                <option value="Coordinador_ubicacion" ${usuario.rol == 'Coordinador_ubicacion' ? 'selected' : ''}>Coordinador_ubicacion</option>
                                                <option value="Administrador_seccion" ${usuario.rol == 'Administrador_seccion' ? 'selected' : ''}>Administrador_seccion</option>
                                            </c:if>

                                            <%-- Roles básicos (siempre visibles) --%>
                                            <option value="Empleado" ${usuario.rol == 'Empleado' ? 'selected' : ''}>Empleado</option>
                                            <option value="Invitado" ${usuario.rol == 'Invitado' ? 'selected' : ''}>Invitado</option>
                                            <option value="Asistente_reserva" ${usuario.rol == 'Asistente_reserva' ? 'selected' : ''}>Asistente_reserva</option>
                                        </select>
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

            <!--PARA MOSTRAR EL LISTADO DE USUARIOS-->                        
            <h5 class="text-center mt-3">Listado de Usuarios</h5>
            <div class="card">
                <div class="card-body">
                    <c:if test="${not empty usuarios}">
                    <!-- Vista para administradores -->
                        <c:if test="${sessionScope.rol == 'Superadministrador' || sessionScope.rol == 'Administrador_seccion'}">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombres</th>
                                    <th>Apellidos</th>
                                    <th>DNI</th>
                                    <th>Código Alumno</th>
                                    <th>Email</th>
                                    <th>Rol</th>
                                    <th>Ubicación</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="usuario" items="${usuarios}">
                                    <tr>
                                        <td>${usuario.id}</td>
                                        <td>${usuario.nombres}</td>
                                        <td>${usuario.apellidos}</td>
                                        <td>${usuario.dni}</td>
                                        <td>${usuario.codigoAlumno}</td>
                                        <td>${usuario.email}</td>
                                        <td>${usuario.rol}</td>
                                        <td>${usuario.ubicacionId}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${sessionScope.rol == 'Superadministrador'}">
                                                    <a href="UsuarioServlet?action=editar&id=${usuario.id}" class="btn btn-warning btn-sm">Editar</a>
                                                    <a href="UsuarioServlet?action=eliminar&id=${usuario.id}"
                                                       class="btn btn-danger btn-sm"
                                                       onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?');">
                                                        Eliminar
                                                    </a>
                                                </c:when>
                                                <c:when test="${sessionScope.rol == 'Administrador_seccion' && sessionScope.ubicacionId == usuario.ubicacionId}">
                                                    <a href="UsuarioServlet?action=editar&id=${usuario.id}" class="btn btn-warning btn-sm">Editar</a>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                    
                        <!-- Vista para usuarios normales -->
                        <c:if test="${sessionScope.rol != 'Superadministrador' && sessionScope.rol != 'Administrador_seccion'}">
                            <c:forEach var="usuario" items="${usuarios}">
                                <c:if test="${sessionScope.usuarioId == usuario.id}">
                                    <div class="card shadow-sm">
                                        <div class="card-header bg-primary text-white">
                                            <h4 class="mb-0">Información Personal</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <i class="fas fa-user mr-2"></i>
                                                        <strong>Nombres:</strong> ${usuario.nombres}
                                                    </div>
                                                    <div class="mb-3">
                                                        <i class="fas fa-user mr-2"></i>
                                                        <strong>Apellidos:</strong> ${usuario.apellidos}
                                                    </div>
                                                    <div class="mb-3">
                                                        <i class="fas fa-id-card mr-2"></i>
                                                        <strong>DNI:</strong> ${usuario.dni}
                                                    </div>
                                                    <div class="mb-3">
                                                        <i class="fas fa-graduation-cap mr-2"></i>
                                                        <strong>Código Alumno:</strong> ${usuario.codigoAlumno}
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <i class="fas fa-envelope mr-2"></i>
                                                        <strong>Email:</strong> ${usuario.email}
                                                    </div>
                                                    <div class="mb-3">
                                                        <i class="fas fa-user-tag mr-2"></i>
                                                        <strong>Rol:</strong> ${usuario.rol}
                                                    </div>
                                                    <div class="mb-3">
                                                        <i class="fas fa-map-marker-alt mr-2"></i>
                                                        <strong>Ubicación:</strong> ${usuario.ubicacionId}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="text-right mt-3">
                                                <a href="UsuarioServlet?action=editar&id=${usuario.id}" class="btn btn-warning">
                                                    <i class="fas fa-edit mr-1"></i> Editar Información
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:if>
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
            //Para la actualizacion de la tabla usuario
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
                document.getElementById("txtNombres").disabled = true;
                document.getElementById("txtApellidos").disabled = true;
                document.getElementById("txtDni").disabled = true;
                document.getElementById("txtCodigoAlumno").disabled = true;
                document.getElementById("txtEmail").disabled = true;
                document.getElementById("txtRol").disabled = true;
                document.getElementById("txtUbicacionId").disabled = true;
                document.getElementById("txtPassword").disabled = true;
            };
            document.getElementById("btna").onclick = function () {
                document.getElementById("btnc").disabled = false;
                document.getElementById("btna").disabled = true;
                document.getElementById("btnm").disabled = true;
                document.getElementById("btng").disabled = false;
                document.getElementById("txtNombres").disabled = false;
                document.getElementById("txtApellidos").disabled = false;
                document.getElementById("txtDni").disabled = false;
                document.getElementById("txtCodigoAlumno").disabled = false;
                document.getElementById("txtEmail").disabled = false;
                document.getElementById("txtRol").disabled = false;
                document.getElementById("txtUbicacionId").disabled = false;
                document.getElementById("txtPassword").disabled = false;
                document.getElementById("txtNombres").focus();
                document.getElementById("txtNombres").value = "";
                document.getElementById("txtApellidos").value = "";
                document.getElementById("txtDni").value = "";
                document.getElementById("txtCodigoAlumno").value = "";
                document.getElementById("txtEmail").value = "";
                document.getElementById("txtRol").value = "";
                document.getElementById("txtUbicacionId").value = "";
                document.getElementById("txtPassword").value = "";
            };
            document.getElementById("btnm").onclick = function () {
                document.getElementById("btnc").disabled = false;
                document.getElementById("btna").disabled = true;
                document.getElementById("btnm").disabled = true;
                document.getElementById("btnac").disabled = false;
                document.getElementById("txtNombres").disabled = false;
                document.getElementById("txtApellidos").disabled = false;
                document.getElementById("txtDni").disabled = false;
                document.getElementById("txtCodigoAlumno").disabled = false;
                document.getElementById("txtEmail").disabled = false;
                document.getElementById("txtRol").disabled = false;
                document.getElementById("txtUbicacionId").disabled = false;
                document.getElementById("txtPassword").disabled = false;
                document.getElementById("txtNombres").focus();
            };
            if ($('#txtNombres').val().length !== 0) {
                document.getElementById("btnm").disabled = false;
            }

            function prepararParaGuardar() {
                document.getElementById("txtNombres").disabled = false;
                document.getElementById("txtApellidos").disabled = false;
                document.getElementById("txtDni").disabled = false;
                document.getElementById("txtCodigoAlumno").disabled = false;
                document.getElementById("txtEmail").disabled = false;
                document.getElementById("txtRol").disabled = false;
                document.getElementById("txtUbicacionId").disabled = false;
                document.getElementById("txtPassword").disabled = false;
                document.getElementById("btnac").disabled = true;
                document.getElementById("btna").disabled = true;
                document.getElementById("btng").disabled = false;
                document.getElementById("btnm").disabled = true;
                document.getElementById("btnc").disabled = false;
            }

            function prepararParaEditar() {
                document.getElementById("txtNombres").disabled = false;
                document.getElementById("txtApellidos").disabled = false;
                document.getElementById("txtDni").disabled = false;
                document.getElementById("txtCodigoAlumno").disabled = false;
                document.getElementById("txtEmail").disabled = false;
                document.getElementById("txtRol").disabled = false;
                document.getElementById("txtUbicacionId").disabled = false;
                document.getElementById("txtPassword").disabled = false;
                document.getElementById("btnac").disabled = false;
                document.getElementById("btna").disabled = true;
                document.getElementById("btng").disabled = true;
                document.getElementById("btnm").disabled = true;
                document.getElementById("btnc").disabled = false;
            }

            if (document.getElementById("txtNombres").value !== "" && document.getElementById("txtApellidos").value !== "") {
                prepararParaEditar();
            }

            document.getElementById("btnc").onclick = function () {
                document.getElementById("btnc").disabled = true;
                document.getElementById("btna").disabled = false;
                document.getElementById("btng").disabled = true;
                document.getElementById("btnac").disabled = true;
                document.getElementById("txtNombres").disabled = true;
                document.getElementById("txtApellidos").disabled = true;
                document.getElementById("txtDni").disabled = true;
                document.getElementById("txtCodigoAlumno").disabled = true;
                document.getElementById("txtEmail").disabled = true;
                document.getElementById("txtRol").disabled = true;
                document.getElementById("txtUbicacionId").disabled = true;
                document.getElementById("txtPassword").disabled = true;
            };
            
            document.getElementById("btng").onclick = function () {
                document.getElementById("usuarioForm").action = "UsuarioServlet?action=guardar";
                document.getElementById("usuarioForm").submit();
            };

            document.getElementById("btnac").onclick = function () {
                document.getElementById("usuarioForm").action = "UsuarioServlet?action=actualizar";
                document.getElementById("usuarioForm").submit();
            };

        </script>
    </body>
</html>