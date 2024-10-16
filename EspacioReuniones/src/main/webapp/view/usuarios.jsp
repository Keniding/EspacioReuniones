<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Lista de Usuarios</title>
</head>
<body>
<h2>Lista de Usuarios</h2>
<c:if test="${empty usuarios}">
    <p>No se encontraron usuarios.</p>
</c:if>
<table border="1">
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
                <a href="UsuarioServlet?action=editar&id=${usuario.id}">Editar</a>
                <a href="UsuarioServlet?action=eliminar&id=${usuario.id}" onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?');">Eliminar</a>
            </td>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="UsuarioServlet?action=nuevo">Agregar Usuario</a>
</body>
</html>
