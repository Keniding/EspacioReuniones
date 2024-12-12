-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2024 a las 20:36:53
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_reservar_sala`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `espacios`
--

CREATE TABLE `espacios` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Capacidad` int(30) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `seccion_id` int(11) DEFAULT NULL,
  `ubicacion_id` int(11) DEFAULT NULL,
  `Estado` enum('Disponible','Ocupado','Deshabilitado') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `espacios`
--

INSERT INTO `espacios` (`Id`, `Nombre`, `Capacidad`, `Descripcion`, `seccion_id`, `ubicacion_id`, `Estado`) VALUES
(2, 'svxdvsds', 23, 'qwfqwdqdwq', 2, 1, 'Disponible'),
(3, 'Peti2', 21, 'qwfqfqf', 2, 1, 'Disponible'),
(5, 'KEVIN SAMUEL', 20, '20', 2, 1, 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `espacio_caracteristicas`
--

CREATE TABLE `espacio_caracteristicas` (
  `Id` int(11) NOT NULL,
  `Espacio_id` int(11) NOT NULL,
  `caracteristicas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `Id` int(11) NOT NULL,
  `Usuario_id` int(11) NOT NULL,
  `Espacio_id` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora_inicio` time NOT NULL,
  `Hora_fin` time NOT NULL,
  `Estado` enum('Pendiente','Confirmado','Cancelado') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`Id`, `Usuario_id`, `Espacio_id`, `Fecha`, `Hora_inicio`, `Hora_fin`, `Estado`) VALUES
(6, 3, 2, '2024-10-14', '20:42:00', '21:42:00', 'Pendiente'),
(24, 3, 2, '2024-10-14', '00:29:00', '01:29:00', 'Pendiente'),
(28, 3, 2, '2024-10-19', '21:55:00', '22:55:00', 'Pendiente'),
(29, 3, 2, '2024-10-19', '03:54:00', '04:54:00', 'Pendiente'),
(31, 3, 2, '2024-10-17', '21:58:00', '22:58:00', 'Pendiente'),
(32, 3, 2, '2024-10-10', '23:02:00', '00:02:00', 'Pendiente'),
(33, 3, 2, '2024-10-18', '01:01:00', '02:01:00', 'Pendiente'),
(34, 3, 2, '2024-10-18', '22:04:00', '23:04:00', 'Pendiente'),
(36, 10, 2, '2024-10-19', '00:17:00', '01:17:00', 'Pendiente'),
(39, 10, 2, '2024-10-21', '23:49:00', '00:49:00', 'Pendiente'),
(43, 10, 2, '2024-10-30', '00:06:00', '01:06:00', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE `secciones` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Ubicacion_id` int(11) DEFAULT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `secciones`
--

INSERT INTO `secciones` (`Id`, `Nombre`, `Ubicacion_id`, `Descripcion`) VALUES
(2, 'qQQQQQQQQQQQQ', 1, 'qwqw'),
(4, 'wqdq22', 1, '121541241'),
(6, 'dvsvs', 1, 'ascaca'),
(7, 'SSSSSSSSSSSSSS', 1, 'ZZZZZZZZZZZ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciones`
--

CREATE TABLE `ubicaciones` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ubicaciones`
--

INSERT INTO `ubicaciones` (`Id`, `Nombre`, `Direccion`) VALUES
(1, 'Peti2', 'TorreAb'),
(2, 'Petsa', 'TorreA'),
(3, 'Pet', 'TorreAss'),
(4, '12342', 'csavasva'),
(6, '5', 'TorreC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id` int(11) NOT NULL,
  `Nombres` varchar(100) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `DNI` varchar(20) NOT NULL,
  `Codigo_alumno` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Rol` enum('Superadministrador','Coordinador_ubicacion','Administrador_seccion','Empleado','Invitado','Asistente_reserva') NOT NULL,
  `Ubicacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id`, `Nombres`, `Apellidos`, `DNI`, `Codigo_alumno`, `Email`, `Password`, `Rol`, `Ubicacion_id`) VALUES
(1, 'Henry', 'Lazaraaaa', '72893093', 'U20310552', 'maria.rodriguez@interbank.com', '$2a$10$Q8qfHmvj5ryS4ZGznyRLD.WIcIGhisl7EPxVitgOb4rDAs2k3WLga', 'Administrador_seccion', 1),
(3, 'Henry', 'Lazaro', '72893093', 'U20310552', 'henrykeny2604@gmail.com', '$2a$10$Jvv.B4soXCdsRwL0gZvJwuCdptws4QbmqfyqRKb7P0wpYkXWZUcPm', 'Superadministrador', 1),
(4, 'Juan', 'Juan', '71234521', 'U20310553', 'jaisan22030@gmail.com', '$2a$10$xA9uBZNkYHtk0DDrFfBGY.EadgekhW9z7qna5WqQuGhI676tZB4X2', 'Coordinador_ubicacion', 3),
(9, 'kevin', 'guayan', '7599999', 'u78945615', 'kevin@gmail.com', '$2a$10$3wzpoSp5LFZkXjPe2EGLTOf1bL/OC1Q4xD6tiCyMgTP6vKgIz4RKm', 'Coordinador_ubicacion', 1),
(10, 'samuel', 'gp', '79999998', 'u78945615', 'samuel@gmail.com', '$2a$10$LO5Q/jiDgDr8Oq4c1fJeAeXG6axlhrHKDSHCm.abNMl5d0akthwAO', 'Superadministrador', 1),
(11, 'kkkkkk', 'hhhhhh', '7999', 'u9999999', 'sarrrrr@gmail.com', '$2a$10$124PoGp865XUHkapQkTjJe8/sLrELBZGnyGTvx/XSEjITPwQQz4fq', 'Superadministrador', 1),
(12, 'JHONAAA', 'Guayan Perez', '555553333', '14001', 'JHONA@GMAIL.COM', '$2a$10$eGi08rQbZr61ZFtr/.4LCOBfMC0gBSprG.WqdsoqHfa3e31/c3JvW', 'Coordinador_ubicacion', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `espacios`
--
ALTER TABLE `espacios`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `espacios_ubicacion_id_ubicaciones` (`ubicacion_id`),
  ADD KEY `espacios_seccion_id_secciones` (`seccion_id`);

--
-- Indices de la tabla `espacio_caracteristicas`
--
ALTER TABLE `espacio_caracteristicas`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `espacio_caracteristicas_espacio_id_espacios` (`Espacio_id`),
  ADD KEY `espacios_caracteristicas_id_caracteristicas` (`caracteristicas_id`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `reservas_usuario_id_usuario` (`Usuario_id`),
  ADD KEY `reservas_espacio_id_espacios` (`Espacio_id`);

--
-- Indices de la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `secciones_ubicacion_id_ubicaciones` (`Ubicacion_id`);

--
-- Indices de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `usuarios_ubicacion_id_ubicaciones` (`Ubicacion_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `espacios`
--
ALTER TABLE `espacios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `espacio_caracteristicas`
--
ALTER TABLE `espacio_caracteristicas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `secciones`
--
ALTER TABLE `secciones`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `espacios`
--
ALTER TABLE `espacios`
  ADD CONSTRAINT `espacios_seccion_id_secciones` FOREIGN KEY (`seccion_id`) REFERENCES `secciones` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `espacios_ubicacion_id_ubicaciones` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicaciones` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `espacio_caracteristicas`
--
ALTER TABLE `espacio_caracteristicas`
  ADD CONSTRAINT `espacio_caracteristicas_espacio_id_espacios` FOREIGN KEY (`Espacio_id`) REFERENCES `espacios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `espacios_caracteristicas_id_caracteristicas` FOREIGN KEY (`caracteristicas_id`) REFERENCES `caracteristicas` (`Id`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_espacio_id_espacios` FOREIGN KEY (`Espacio_id`) REFERENCES `espacios` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reservas_usuario_id_usuario` FOREIGN KEY (`Usuario_id`) REFERENCES `usuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD CONSTRAINT `secciones_ubicacion_id_ubicaciones` FOREIGN KEY (`Ubicacion_id`) REFERENCES `ubicaciones` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuarios_ubicacion_id_ubicaciones` FOREIGN KEY (`Ubicacion_id`) REFERENCES `usuario` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
