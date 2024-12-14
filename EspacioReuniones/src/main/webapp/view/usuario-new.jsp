<%-- 
    Document   : usuario-new
    Created on : 13 sept 2024
    Author     : Bruce Porras
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro de Nuevo Usuario - Space Manager</title>
        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- FontAwesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        
        <style>
            :root {
                --primary-color: #2c3e50;
                --secondary-color: #3498db;
                --accent-color: #e74c3c;
                --background-color: #f8f9fa;
            }

            body {
                background-color: var(--background-color);
                color: var(--primary-color);
                font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            }

            .logo {
                max-width: 150px;
                margin-bottom: 1rem;
            }

            .app-name {
                color: var(--primary-color);
                font-size: 2rem;
                font-weight: 700;
                text-align: center;
                margin-bottom: 2rem;
            }

            .card {
                border: none;
                border-radius: 15px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                background: white;
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
                border: 2px solid #dee2e6;
                padding: 0.75rem;
                transition: all 0.3s ease;
            }

            .form-control:focus, .form-select:focus {
                border-color: var(--secondary-color);
                box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            }

            .form-label {
                font-weight: 600;
                color: var(--primary-color);
                margin-bottom: 0.5rem;
            }

            .form-group {
                margin-bottom: 1.5rem;
            }

            .btn-primary {
                background-color: var(--secondary-color);
                border: none;
                border-radius: 8px;
                padding: 0.75rem 1.5rem;
                font-weight: 600;
                transition: all 0.3s ease;
            }

            .btn-primary:hover {
                background-color: var(--primary-color);
                transform: translateY(-2px);
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .form-floating > label {
                padding: 1rem;
                color: #6c757d;
            }

            .form-floating > .form-control {
                height: calc(3.5rem + 2px);
                line-height: 1.25;
            }

            /* Estilo para campos requeridos */
            .form-label.required::after {
                content: "*";
                color: var(--accent-color);
                margin-left: 4px;
            }

            /* Contenedor principal */
            .registration-container {
                max-width: 800px;
                margin: 0 auto;
                padding: 2rem;
            }

            /* Responsive */
            @media (max-width: 768px) {
                .registration-container {
                    padding: 1rem;
                }
                
                .app-name {
                    font-size: 1.75rem;
                }
            }
        </style>
    </head>
    <body>
        <div class="registration-container">
            <!-- Logo de la aplicación -->
            <div class="text-center">
                <img src="resources/images/logo_1.png" alt="Logo" class="logo">
                <div class="app-name">Space Manager</div>
            </div>
            
            <!-- Formulario de registro -->
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fas fa-user-plus me-2"></i>
                        Registro de Nuevo Usuario
                    </h5>
                </div>
                <div class="card-body p-4">
                    <form action="UsuarioServlet?action=crear" method="post">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" id="txtNombres" name="txtNombres" 
                                           class="form-control" placeholder="Nombres" required>
                                    <label for="txtNombres" class="required">Nombres</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" id="txtApellidos" name="txtApellidos" 
                                           class="form-control" placeholder="Apellidos" required>
                                    <label for="txtApellidos" class="required">Apellidos</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" id="txtDni" name="txtDni" 
                                           class="form-control" placeholder="DNI" required>
                                    <label for="txtDni" class="required">DNI</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" id="txtCodigoAlumno" name="txtCodigoAlumno" 
                                           class="form-control" placeholder="Código Alumno">
                                    <label for="txtCodigoAlumno">Código Alumno</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="email" id="txtEmail" name="txtEmail" 
                                           class="form-control" placeholder="Email" required>
                                    <label for="txtEmail" class="required">Email</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="password" id="txtPassword" name="txtPassword" 
                                           class="form-control" placeholder="Password" required>
                                    <label for="txtPassword" class="required">Password</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <select id="txtRol" name="txtRol" class="form-select" required>
                                        <option value="">Seleccione un rol</option>
                                        <option value="Superadministrador">Superadministrador</option>
                                        <option value="Coordinador_ubicacion">Coordinador de ubicación</option>
                                        <option value="Administrador_seccion">Administrador de sección</option>
                                        <option value="Empleado">Empleado</option>
                                        <option value="Invitado">Invitado</option>
                                        <option value="Asistente_reserva">Asistente de reserva</option>
                                    </select>
                                    <label for="txtRol" class="required">Rol</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="number" id="txtUbicacionId" name="txtUbicacionId" 
                                           class="form-control" placeholder="Ubicación" required>
                                    <label for="txtUbicacionId" class="required">Ubicación</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary w-100">
                                    <i class="fas fa-user-plus me-2"></i>
                                    Registrar Usuario
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
