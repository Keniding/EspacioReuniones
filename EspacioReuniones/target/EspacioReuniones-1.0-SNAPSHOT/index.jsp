<%-- 
    Document   : index
    Created on : 13 sept 2024
    Author     : Bruce Porras
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesión</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Incluir el archivo CSS personalizado -->
        <link href="resources/css/styles.css" rel="stylesheet">
    </head>
<body>
    <div class="login-container">
        <!-- Logo de la aplicación -->
        <img src="resources/images/logo 1.png" alt="Logo" class="logo"> 

        <!-- Nombre de la aplicación -->
        <div class="app-name">Espacio de Reuniones</div>
        
        <!-- Título del formulario -->
        <h2 class="login-header">Bienvenido</h2>

        <!-- Formulario de Inicio de Sesión -->
        <form action="UsuarioServlet?action=login" method="post">
            <div class="mb-3">
                <label for="usuario" class="form-label">Correo Electrónico</label>
                <input type="email" class="form-control" id="usuario" name="usuario" placeholder="Ingresa tu correo" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Ingresa tu contraseña" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Iniciar Sesión</button>
        </form>

        <!-- Botón para Registrar Usuario -->
        <form action="UsuarioServlet" method="get" class="mt-3">
            <input type="hidden" name="action" value="nuevo">
            <button type="submit" class="btn btn-secondary w-100">Registrar Usuario</button>
        </form>

        
        
        <c:if test="${not empty error}">
            <div class="alert alert-custom">${error}</div>
        </c:if>
    </div>

    <!-- Incluir Bootstrap JS desde la CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
