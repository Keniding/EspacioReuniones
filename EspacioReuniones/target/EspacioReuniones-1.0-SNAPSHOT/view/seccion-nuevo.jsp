<%-- 
    Document   : secciones
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
        <title>Secciones</title>

        <!--Para paginacion de la tabla-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.css">
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