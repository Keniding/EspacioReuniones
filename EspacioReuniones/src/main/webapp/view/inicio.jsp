<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Inicio - Gestión de Espacios</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(rgba(44, 62, 80, 0.9), rgba(52, 152, 219, 0.9)),
                        url('https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=1200') center/cover;
            color: white;
            padding: 6rem 2rem;
            text-align: center;
            border-radius: 15px;
            margin-bottom: 3rem;
        }

        .hero-section h1 {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            font-weight: 600;
        }

        .hero-section p {
            font-size: 1.25rem;
            max-width: 600px;
            margin: 0 auto;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin: 3rem 0;
        }

        .feature-card {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
        }

        .feature-icon {
            font-size: 2.5rem;
            color: #3498db;
            margin-bottom: 1rem;
        }

        .testimonial-section {
            background-color: #f8f9fa;
            padding: 4rem 2rem;
            border-radius: 15px;
            margin: 3rem 0;
        }

        .testimonial-card {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            margin: 1rem auto;
            max-width: 800px;
        }

        .testimonial-text {
            font-style: italic;
            font-size: 1.1rem;
            color: #2c3e50;
            margin-bottom: 1rem;
        }

        .testimonial-author {
            color: #3498db;
            font-weight: 600;
        }

        .map-section {
            margin: 3rem 0;
        }

        .map-container {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .contact-section {
            background-color: #2c3e50;
            color: white;
            padding: 3rem 2rem;
            border-radius: 15px;
            text-align: center;
            margin-top: 3rem;
        }

        .contact-link {
            color: #3498db;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .contact-link:hover {
            color: #2980b9;
        }

        @media (max-width: 768px) {
            .hero-section {
                padding: 4rem 1rem;
            }

            .hero-section h1 {
                font-size: 2rem;
            }

            .map-container iframe {
                height: 300px;
            }
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <header class="hero-section">
        <h1>Reserva tu Sala de Reuniones Fácilmente</h1>
        <p>Espacios cómodos y modernos para tu próxima reunión</p>
    </header>

    <!-- Servicios -->
    <section id="servicios">
        <div class="features-grid">
            <div class="feature-card">
                <i class="fas fa-tv feature-icon"></i>
                <h3>Equipos Audiovisuales</h3>
                <p>Proyectores y pantallas de última generación</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-wifi feature-icon"></i>
                <h3>Internet de Alta Velocidad</h3>
                <p>Conexión estable y segura</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-headset feature-icon"></i>
                <h3>Soporte Técnico</h3>
                <p>Asistencia disponible cuando la necesites</p>
            </div>
        </div>
    </section>

    <!-- Testimonios -->
    <section id="testimonios" class="testimonial-section">
        <h2 class="text-center mb-4">Lo que dicen nuestros clientes</h2>
        <div class="testimonial-card">
            <div class="testimonial-text">
                "La mejor experiencia de reserva de salas que hemos tenido, fácil y rápido!"
            </div>
            <div class="testimonial-author">- Ana G.</div>
        </div>
    </section>

    <!-- Mapa -->
    <section id="ubicacion" class="map-section">
        <h2 class="text-center mb-4">Encuéntranos en:</h2>
        <div class="map-container">
            <iframe 
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3901.964560036523!2d-77.03195518561798!3d-12.045909791460692!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c8b5d35662c7%3A0x45c5b2d7e1317d49!2sPlaza%20Mayor%20de%20Lima!5e0!3m2!1ses!2spe!4v1631234567890!5m2!1ses!2spe"
                width="100%" 
                height="450" 
                style="border:0;" 
                allowfullscreen="" 
                loading="lazy">
            </iframe>
        </div>
    </section>

    <!-- Contacto -->
    <section class="contact-section">
        <h3>¿Tienes preguntas?</h3>
        <p>
            Contáctanos al 
            <a href="mailto:soporte@reservasala.com" class="contact-link">soporte@reservasala.com</a> 
            o llama al 
            <a href="tel:+51999999999" class="contact-link">+51 999999999</a>
        </p>
    </section>
</body>
</html>
