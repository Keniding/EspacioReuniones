<%-- 
    Document   : reservas
    Created on : 19 oct. 2024, 7:19:02 p. m.
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reserva de Sala</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Reservar Sala</h1>
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
                            <div class="form-group mt-4 text-center">
                                <input type="submit" name="accion" id="btng" value="Guardar" class="btn btn-danger">                                
                            </div>
                        </div>
                    </div>
                </div>
            </form>
    </div>
</body>
</html>
