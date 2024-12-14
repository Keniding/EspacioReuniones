<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reserva de Sala</title>
    
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --background-color: #f8f9fa;
            --text-color: #2c3e50;
            --text-muted: #6c757d;
            --border-color: #dee2e6;
            --card-shadow: 0 2px 4px rgba(44, 62, 80, 0.1);
            --input-focus: rgba(52, 152, 219, 0.25);
        }

        body {
            background-color: var(--background-color);
            color: var(--text-color);
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }

        .page-header {
            background: var(--primary-color);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
            box-shadow: 0 4px 6px rgba(44, 62, 80, 0.1);
        }

        .page-header h1 {
            font-size: 1.75rem;
            font-weight: 600;
        }

        .card {
            border: none;
            border-radius: 0.75rem;
            box-shadow: var(--card-shadow);
            background-color: white;
        }

        .card-header {
            background-color: var(--primary-color);
            color: white;
            padding: 1rem 1.5rem;
            border-bottom: none;
            border-radius: 0.75rem 0.75rem 0 0 !important;
        }

        .card-header h5 {
            font-weight: 600;
            font-size: 1.1rem;
            margin: 0;
        }

        .card-body {
            padding: 2rem;
        }

        .form-label {
            font-weight: 600;
            color: var(--text-color);
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
        }

        .form-control {
            border: 2px solid var(--border-color);
            border-radius: 0.5rem;
            padding: 0.625rem 1rem;
            color: var(--text-color);
            transition: all 0.2s ease-in-out;
        }

        .form-control:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.25rem var(--input-focus);
        }

        .form-control::placeholder {
            color: var(--text-muted);
        }

        .btn-primary {
            background-color: var(--secondary-color);
            border: none;
            border-radius: 0.5rem;
            padding: 0.75rem 2rem;
            font-weight: 600;
            transition: all 0.2s ease-in-out;
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--primary-color);
            transform: translateY(-1px);
            box-shadow: 0 4px 6px rgba(44, 62, 80, 0.1);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        .icon-input {
            position: relative;
        }

        .icon-input i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
            transition: color 0.2s ease-in-out;
        }

        .icon-input input {
            padding-left: 2.75rem;
        }

        .icon-input input:focus + i {
            color: var(--secondary-color);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        /* Mejoras específicas para inputs de fecha y hora */
        input[type="date"],
        input[type="time"] {
            cursor: pointer;
        }

        /* Estilo para campos requeridos */
        .required-field::after {
            content: "*";
            color: var(--accent-color);
            margin-left: 4px;
        }
        
        .container {
            color: var(--primary-color);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .card-body {
                padding: 1.5rem;
            }
            
            .row {
                margin-right: -0.75rem;
                margin-left: -0.75rem;
            }
            
            .col-md-4,
            .col-md-6,
            .col-md-8 {
                padding-right: 0.75rem;
                padding-left: 0.75rem;
            }
        }
    </style>
</head>
<body>
    <!-- Encabezado -->
    <div class="page-header">
        <div class="container">
            <h1>
                <i class="fas fa-calendar-check me-2"></i>
                Reserva de Sala
            </h1>
        </div>
    </div>

    <!-- Contenido Principal -->
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h5>
                    <i class="fas fa-clipboard-list me-2"></i>
                    Datos de la Reserva
                </h5>
            </div>
            <div class="card-body">
                <form action="ReservaServlet?action=guardar" method="post">
                    <div class="row g-4">
                        <!-- ID Espacio -->
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-label required-field">ID Espacio</label>
                                <div class="icon-input">
                                    <i class="fas fa-building"></i>
                                    <input type="text" 
                                           name="txtespacioId" 
                                           id="txtEspacioId" 
                                           value="${reserva.getEspacioId()}" 
                                           class="form-control"
                                           placeholder="Ej: ESP001"
                                           required>
                                </div>
                            </div>
                        </div>

                        <!-- Fecha y Hora -->
                        <div class="col-md-8">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label required-field">Fecha</label>
                                        <div class="icon-input">
                                            <i class="fas fa-calendar"></i>
                                            <input type="date" 
                                                   name="txtfecha" 
                                                   id="txtFecha" 
                                                   value="${reserva.getFecha()}" 
                                                   class="form-control"
                                                   required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label required-field">Hora de Inicio</label>
                                        <div class="icon-input">
                                            <i class="fas fa-clock"></i>
                                            <input type="time" 
                                                   name="txthoraInicio" 
                                                   id="txtHoraInicio" 
                                                   value="${reserva.getHoraInicio()}" 
                                                   class="form-control"
                                                   required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Botón de Guardar -->
                        <div class="col-12 text-center mt-4">
                            <button type="submit" 
                                    name="accion" 
                                    id="btng" 
                                    value="Guardar" 
                                    class="btn btn-primary">
                                <i class="fas fa-save me-2"></i>
                                Guardar Reserva
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
