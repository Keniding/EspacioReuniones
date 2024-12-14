<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Formulario de edición</title>
        
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
                padding-top: 2rem;
            }

            .card {
                border: none;
                border-radius: 15px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .card-header {
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
                color: white;
                border-radius: 15px 15px 0 0 !important;
                padding: 1.5rem;
            }

            .form-floating {
                margin-bottom: 1.5rem;
            }

            .form-control, .form-select {
                border-radius: 8px;
                border: 1px solid #dee2e6;
                padding: 0.75rem;
                height: calc(3.5rem + 2px);
                transition: all 0.3s ease;
            }

            .form-control:focus, .form-select:focus {
                border-color: var(--secondary-color);
                box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            }

            .btn {
                border-radius: 8px;
                padding: 0.75rem 2rem;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            .btn-primary {
                background-color: var(--secondary-color);
                border: none;
            }

            .btn-primary:hover {
                background-color: var(--primary-color);
                transform: translateY(-2px);
            }

            .form-label {
                font-weight: 500;
                color: var(--primary-color);
                margin-bottom: 0.5rem;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fa-solid fa-user-edit me-2"></i>
                        Formulario de Usuario
                    </h5>
                </div>
                <div class="card-body p-4">
                    <form action="UsuarioServlet?action=actualizar" method="post">
                        <input type="hidden" name="id" value="${usuario.id}">
                        
                        <div class="row g-4">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="nombres" 
                                           name="nombres" value="${usuario.nombres}" 
                                           placeholder="Nombres" required>
                                    <label for="nombres">Nombres</label>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="apellidos" 
                                           name="apellidos" value="${usuario.apellidos}" 
                                           placeholder="Apellidos" required>
                                    <label for="apellidos">Apellidos</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="dni" 
                                           name="dni" value="${usuario.dni}" 
                                           placeholder="DNI" required>
                                    <label for="dni">DNI</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="codigoAlumno" 
                                           name="codigoAlumno" value="${usuario.codigoAlumno}" 
                                           placeholder="Código Alumno">
                                    <label for="codigoAlumno">Código Alumno</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="email" class="form-control" id="email" 
                                           name="email" value="${usuario.email}" 
                                           placeholder="Email" required>
                                    <label for="email">Email</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-floating">
                                    <select class="form-select" id="rol" name="rol" required>
                                        <option value="Superadministrador" ${usuario.rol == 'Superadministrador' ? 'selected' : ''}>Superadministrador</option>
                                        <option value="Coordinador_ubicacion" ${usuario.rol == 'Coordinador_ubicacion' ? 'selected' : ''}>Coordinador de ubicación</option>
                                        <option value="Administrador_seccion" ${usuario.rol == 'Administrador_seccion' ? 'selected' : ''}>Administrador de sección</option>
                                        <option value="Empleado" ${usuario.rol == 'Empleado' ? 'selected' : ''}>Empleado</option>
                                        <option value="Invitado" ${usuario.rol == 'Invitado' ? 'selected' : ''}>Invitado</option>
                                        <option value="Asistente_reserva" ${usuario.rol == 'Asistente_reserva' ? 'selected' : ''}>Asistente de reserva</option>
                                    </select>
                                    <label for="rol">Rol</label>
                                </div>
                            </div>

                            <div class="col-12 text-center mt-4">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save me-2"></i>
                                    Guardar Cambios
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
