<%-- 
    Document   : reservas
    Created on : 15 oct 2024, 21:45:59
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
        <title>Reservas</title>

        <!--Para paginacion de la tabla-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.css">
    </head>
    <body>
        <div class="container">
            <!--PARA MOSTRAR E INGRESAR LOS DATOS DE LA RESERVA-->
            <form action="ReservaServlet?action=guardar" method="post">
                <h5><i class="fa-solid fa-calendar-check"></i> Datos de la Reserva</h5>
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <!-- Campo de ID de Usuario eliminado -->
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>ID Espacio</label>
                                    <input type="text" name="txtespacioId" id="txtEspacioId" value="${reserva.getEspacioId()}" class="form-control">
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>Fecha</label>
                                    <input type="date" name="txtfecha" id="txtFecha" value="${reserva.getFecha()}" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Hora Inicio</label>
                                    <input type="time" name="txthoraInicio" id="txtHoraInicio" value="${reserva.getHoraInicio()}" class="form-control">
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>Estado</label>
                                    <select class="form-select" name="selEstado" id="selEstado">
                                        <option value="Pendiente" ${estado.equals("Pendiente") ? "selected" : ""}>Pendiente</option>
                                        <option value="Confirmado" ${estado.equals("Confirmado") ? "selected" : ""}>Confirmado</option>
                                        <option value="Cancelado" ${estado.equals("Cancelado") ? "selected" : ""}>Cancelado</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group mt-4 text-center">
                                <input type="submit" name="accion" id="btnm" value="Modificar" class="btn btn-info">
                                <input type="submit" name="accion" id="btnac" value="Actualizar" class="btn btn-success" disabled>
                                <input type="submit" name="accion" id="btnc" value="Cancelar" class="btn btn-warning" disabled>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <!--PARA MOSTRAR EL LISTADO DE RESERVAS-->                        
            <h5 class="text-center mt-3">Listado de Reservas</h5>
            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered">
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
                                    <td>${reserva.fecha}</td>
                                    <td>${reserva.horaInicio}</td>
                                    <td>${reserva.horaFin}</td>
                                    <td>${reserva.estado}</td>
                                    <td>
                                        <a href="ReservaServlet?action=editar&id=${reserva.id}" class="btn btn-warning">Editar</a>
                                        <a href="ReservaServlet?action=eliminar&id=${reserva.id}" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar esta reserva?');">Eliminar</a>
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
