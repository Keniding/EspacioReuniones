<%-- 
    Document   : usuario-edit
    Created on : 11 sept 2024, 23:09:54
    Author     : Bruce Porras
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario de edición</title>
    </head>
<body>
    <h2>Formulario de Usuario</h2>
<form action="UsuarioServlet?action=actualizar" method="post">
        <input type="hidden" name="id" value="${usuario.id}">
        <label>Nombres:</label>
        <input type="text" name="nombres" value="${usuario.nombres}"><br>
        <label>Apellidos:</label>
        <input type="text" name="apellidos" value="${usuario.apellidos}"><br>
        <label>DNI:</label>
        <input type="text" name="dni" value="${usuario.dni}"><br>
        <label>Código Alumno:</label>
        <input type="text" name="codigoAlumno" value="${usuario.codigoAlumno}"><br>
        <label>Email:</label>
        <input type="email" name="email" value="${usuario.email}"><br>
        <label>Rol:</label>
        <select name="rol" required>
            <option value="Superadministrador" ${usuario.rol == 'Superadministrador' ? 'selected' : ''}>Superadministrador</option>
            <option value="Coordinador_ubicacion" ${usuario.rol == 'Coordinador_ubicacion' ? 'selected' : ''}>Coordinador_ubicacion</option>
            <option value="Administrador_seccion" ${usuario.rol == 'Administrador_seccion' ? 'selected' : ''}>Administrador_seccion</option>
            <option value="Empleado" ${usuario.rol == 'Empleado' ? 'selected' : ''}>Empleado</option>
            <option value="Invitado" ${usuario.rol == 'Invitado' ? 'selected' : ''}>Invitado</option>
            <option value="Asistente_reserva" ${usuario.rol == 'Asistente_reserva' ? 'selected' : ''}>Asistente_reserva</option>
        </select><br>
        <label>Ubicación:</label>
        <input type="number" name="ubicacionId" value="${usuario.ubicacionId}"><br>
        <input type="submit" value="Guardar">
    </form>
</body>
</html>
