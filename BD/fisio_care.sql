-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-12-2023 a las 17:01:12
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fisio_care`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuarioId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-------------------------------------------------------

--
-- Estructura de tabla para la tabla `citasservicios`
--

CREATE TABLE `citasservicios` (
  `id` int(11) NOT NULL,
  `citaId` int(11) DEFAULT NULL,
  `servicioId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citasservicios`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `descripcion` varchar(600) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `precio`, `descripcion`) VALUES
(1, 'Relajante', 30, ' Consiste en la realización de maniobras superficiales en las que la intensidad de la presión es suave y el ritmo lento y reiterativo, de manera que al recibir un contacto repetido y constante, se pierde la sensación de dolor y los músculos se relajan.'),
(2, 'Descontractuante', 35, '  Es una técnica de terapia manual, que consiste en emplear maniobras profundas e intensas, que van dirigidas a zonas de dolor y que buscan eliminar las contracturas y puntos gatillo, ayudando a recuperar la función normal del músculo.'),
(3, 'Completo', 70, 'Consiste en una manipulación gradual del cuerpo para estimular sus diferentes partes, una a la vez. Por lo general, el masajista comienza desde los pies y sube lentamente por las piernas, la espalda, los brazos, los hombros, finalmente el cuello y la cabeza.'),
(4, 'Quiropráctico', 30, 'El tratamiento más común es la manipulación que el quiropráctico hace con la mano. Consiste en mover una articulación de la columna vertebral hasta el máximo de su rango, seguido de una compresión ligera. Esto con frecuencia se llama \"ajuste\".'),
(6, 'Linfático', 60, 'Técnica que se realiza con las manos a través de movimientos muy suaves, lentos y repetitivos que favorecen la circulación de la linfa, mejorando así cuadros edematosos, inflamaciones y retenciones de líquidos orgánicos.'),
(7, 'Acupuntura', 40, 'Consiste en la inserción de agujas muy finas en la piel en puntos estratégicos del cuerpo,es muy eficaz para una variedad de afecciones relacionadas con el dolor crónico, incluidas las migrañas, la osteoartritis, los problemas menstruales, el dolor de espalda y una variedad de problemas de dolor.'),
(8, 'Deportivo', 30, 'Consiste en la utilización de diferentes técnicas de masaje con diferentes fines: Calentar los músculos antes de la competición, oxigenándolos y aportándoles flexibilidad. Recuperación y descarga de los músculos mediante masajes de drenaje linfático y retorno venoso.'),
(9, 'Masaje deportivo', 30, 'Consiste en la utilización de diferentes técnicas de masaje con diferentes fines: Calentar los músculos antes de la competición, oxigenándolos y aportándoles flexibilidad. Recuperación y descarga de los músculos mediante masajes de drenaje linfático y retorno venoso.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `token` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--


-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_cita_usuario1_idx` (`usuarioId`) USING BTREE;

--
-- Indices de la tabla `citasservicios`
--
ALTER TABLE `citasservicios`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_cita_has_servicio_servicio1_idx` (`servicioId`),
  ADD KEY `fk_cita_has_servicio_cita1_idx` (`citaId`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `citasservicios`
--
ALTER TABLE `citasservicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

-
--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Filtros para la tabla `citasservicios`
--
ALTER TABLE `citasservicios`
  ADD CONSTRAINT `citasservicios_ibfk_1` FOREIGN KEY (`citaId`) REFERENCES `cita` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `citasservicios_ibfk_2` FOREIGN KEY (`servicioId`) REFERENCES `servicios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
