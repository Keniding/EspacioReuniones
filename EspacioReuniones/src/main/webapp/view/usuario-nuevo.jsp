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
        <!--De bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <!-- Los iconos tipo Solid de Fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <script src="https://use.fontawesome.com/releases/v6.1.1/js/all.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <title>Usuarios</title>

        <!--Para paginacion de la tabla-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.css">
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
                                    <label>Ubicación ID</label>
                                    <input type="text" name="txtUbicacionId" id="txtUbicacionId" value="${usuario.ubicacionId}" class="form-control" disabled>
                                </div>
                            </div>
                                <div></div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Rol</label>
                                    <select name="txtRol" id="txtRol" class="form-control" disabled>
                                        <option value="Superadministrador" ${usuario.rol == 'Superadministrador' ? 'selected' : ''}>Superadministrador</option>
                                        <option value="Coordinador_ubicacion" ${usuario.rol == 'Coordinador_ubicacion' ? 'selected' : ''}>Coordinador_ubicacion</option>
                                        <option value="Administrador_seccion" ${usuario.rol == 'Administrador_seccion' ? 'selected' : ''}>Administrador_seccion</option>
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
                    <table class="table table-hover" id="mi_tabla">
                        <thead>
                            <tr>
                                <th class="text-center">ID</th>
                                <th class="text-center">Nombres</th>
                                <th class="text-center">Apellidos</th>
                                <th class="text-center">DNI</th>
                                <th class="text-center">Código Alumno</th>
                                <th class="text-center">Email</th>
                                <th class="text-center">Rol</th>
                                <th class="text-center">Ubicación ID</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="usr" items="${usuarios}">
                                <tr class="text-center">
                                    <td>${usr.getId()}</td>
                                    <td>${usr.getNombres()}</td>
                                    <td>${usr.getApellidos()}</td>
                                    <td>${usr.getDni()}</td>
                                    <td>${usr.getCodigoAlumno()}</td>
                                    <td>${usr.getEmail()}</td>
                                    <td>${usr.getRol()}</td>
                                    <td>${usr.getUbicacionId()}</td>
                                    <td>
                                        <a class="btn btn-warning" id="btned" href="UsuarioServlet?action=editar&id=${usr.getId()}"><i class="fa-solid fa-pen-to-square"></i></a>
                                        <a class="btn btn-danger" id="btnq" href="UsuarioServlet?action=eliminar&id=${usr.getId()}"><i class="fa-solid fa-trash-can"></i></a>
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
                document.getElementById("txtNombres").focus();
                document.getElementById("txtNombres").value = "";
                document.getElementById("txtApellidos").value = "";
                document.getElementById("txtDni").value = "";
                document.getElementById("txtCodigoAlumno").value = "";
                document.getElementById("txtEmail").value = "";
                document.getElementById("txtRol").value = "";
                document.getElementById("txtUbicacionId").value = "";
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
