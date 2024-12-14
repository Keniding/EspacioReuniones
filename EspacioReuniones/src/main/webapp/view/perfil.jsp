<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Estilos personalizados -->
<style>
    :root {
        --primary-color: #4a90e2;
        --secondary-color: #f8f9fa;
        --text-color: #2c3e50;
        --border-radius: 15px;
        --transition: all 0.3s ease;
    }

    .profile-card {
        border: none;
        border-radius: var(--border-radius);
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
        transition: var(--transition);
    }

    .profile-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
    }

    .avatar-container {
        position: relative;
        width: 150px;
        height: 150px;
        margin: 0 auto;
        margin-bottom: 1.5rem;
    }

    .profile-avatar {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border: 4px solid white;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        transition: var(--transition);
    }

    .profile-avatar:hover {
        transform: scale(1.05);
    }

    .role-badge {
        background: linear-gradient(135deg, var(--primary-color), #2980b9);
        color: white;
        padding: 0.5rem 1.5rem;
        border-radius: 20px;
        font-size: 0.9rem;
        display: inline-block;
        margin-bottom: 1rem;
    }

    .form-control {
        border-radius: 10px;
        padding: 0.8rem 1rem;
        border: 2px solid #eef2f7;
        transition: var(--transition);
    }

    .form-control:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 0 0.2rem rgba(74, 144, 226, 0.25);
    }

    .form-label {
        font-weight: 600;
        color: var(--text-color);
        margin-bottom: 0.5rem;
    }

    .btn-save {
        padding: 0.8rem 2rem;
        border-radius: 10px;
        background: linear-gradient(135deg, var(--primary-color), #2980b9);
        border: none;
        font-weight: 500;
        transition: var(--transition);
    }

    .btn-save:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 15px rgba(74, 144, 226, 0.4);
    }

    .info-section {
        position: relative;
        padding: 2rem;
    }

    .info-section::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(90deg, var(--primary-color), #2980b9);
        border-radius: var(--border-radius) var(--border-radius) 0 0;
    }

    @media (max-width: 768px) {
        .profile-card {
            margin-bottom: 2rem;
        }
        
        .form-label {
            margin-bottom: 0.5rem;
        }
    }
</style>

<div class="container py-5">
    <div class="row">
        <!-- Tarjeta de perfil -->
        <div class="col-lg-4">
            <div class="card profile-card">
                <div class="card-body text-center p-4">
                    <div class="avatar-container">
                        <img src="https://api.dicebear.com/7.x/avataaars/svg?seed=${usuario.email}" 
                             alt="avatar" class="rounded-circle profile-avatar">
                    </div>
                    <h4 class="mb-3">${usuario.nombres} ${usuario.apellidos}</h4>
                    <div class="role-badge">
                        <i class="fas fa-user-graduate me-2"></i>${usuario.rol}
                    </div>
                    <p class="text-muted">
                        <i class="fas fa-id-card me-2"></i>
                        Código: ${usuario.codigoAlumno}
                    </p>
                </div>
            </div>
        </div>
        
        <!-- Detalles del perfil -->
        <div class="col-lg-8">
            <div class="card profile-card">
                <div class="info-section">
                    <h4 class="mb-4">
                        <i class="fas fa-user-edit me-2"></i>
                        Información Personal
                    </h4>
                    <form id="formPerfil" action="UsuarioServlet" method="POST">
                        <input type="hidden" name="action" value="actualizarPerfil">
                        <input type="hidden" name="id" value="${usuario.id}">
                        
                        <div class="row g-4">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-user me-2"></i>Nombres
                                    </label>
                                    <input type="text" class="form-control" name="txtNombres" 
                                           value="${usuario.nombres}" required>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-user me-2"></i>Apellidos
                                    </label>
                                    <input type="text" class="form-control" name="txtApellidos" 
                                           value="${usuario.apellidos}" required>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-id-card me-2"></i>DNI
                                    </label>
                                    <input type="text" class="form-control" name="txtDni" 
                                           value="${usuario.dni}" required>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-graduation-cap me-2"></i>Código Alumno
                                    </label>
                                    <input type="text" class="form-control" name="txtCodigoAlumno" 
                                           value="${usuario.codigoAlumno}" required>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-envelope me-2"></i>Email
                                    </label>
                                    <input type="email" class="form-control" name="txtEmail" 
                                           value="${usuario.email}" required>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        <i class="fas fa-lock me-2"></i>Contraseña
                                    </label>
                                    <input type="password" class="form-control" name="txtPassword" 
                                           placeholder="Dejar en blanco para mantener la actual">
                                </div>
                            </div>
                            
                            <div class="col-12 text-end mt-4">
                                <button type="submit" class="btn btn-primary btn-save">
                                    <i class="fas fa-save me-2"></i>
                                    Guardar Cambios
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
