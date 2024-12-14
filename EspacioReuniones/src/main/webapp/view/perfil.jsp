<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container py-5">
    <div class="row">
        <!-- Tarjeta de perfil -->
        <div class="col-lg-4">
            <div class="card mb-4">
                <div class="card-body text-center">
                    <img src="https://api.dicebear.com/7.x/avataaars/svg?seed=${usuario.email}" 
     alt="avatar" class="rounded-circle img-fluid" style="width: 150px; background-color: #f8f9fa;">
                    <h5 class="my-3">${usuario.nombres} ${usuario.apellidos}</h5>
                    <p class="text-muted mb-1">${usuario.rol}</p>
                    <p class="text-muted mb-4">Código: ${usuario.codigoAlumno}</p>
                </div>
            </div>
        </div>
        
        <!-- Detalles del perfil -->
        <div class="col-lg-8">
            <div class="card mb-4">
                <div class="card-header">
                    <h5 class="mb-0">Información Personal</h5>
                </div>
                <div class="card-body">
                    <form id="formPerfil" action="UsuarioServlet" method="POST">
                        <input type="hidden" name="action" value="actualizarPerfil">
                        <input type="hidden" name="id" value="${usuario.id}">
                        
                        <div class="row mb-3">
                            <div class="col-sm-3">
                                <label class="form-label">Nombres</label>
                            </div>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="txtNombres" 
                                       value="${usuario.nombres}" required>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-sm-3">
                                <label class="form-label">Apellidos</label>
                            </div>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="txtApellidos" 
                                       value="${usuario.apellidos}" required>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-sm-3">
                                <label class="form-label">DNI</label>
                            </div>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="txtDni" 
                                       value="${usuario.dni}" required>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-sm-3">
                                <label class="form-label">Código Alumno</label>
                            </div>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="txtCodigoAlumno" 
                                       value="${usuario.codigoAlumno}" required>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-sm-3">
                                <label class="form-label">Email</label>
                            </div>
                            <div class="col-sm-9">
                                <input type="email" class="form-control" name="txtEmail" 
                                       value="${usuario.email}" required>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-sm-3">
                                <label class="form-label">Contraseña</label>
                            </div>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" name="txtPassword" 
                                       placeholder="Dejar en blanco para mantener la actual">
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-12 text-end">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save"></i> Guardar Cambios
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
