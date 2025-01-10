-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-01-2025 a las 18:48:11
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `facultad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrocentro`
--

CREATE TABLE `registrocentro` (
  `id` int(11) NOT NULL,
  `numero_centro` int(11) NOT NULL,
  `computadoras` int(11) NOT NULL DEFAULT 0,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `inicio_semestre` date DEFAULT NULL,
  `fin_semestre` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registrocentro`
--

INSERT INTO `registrocentro` (`id`, `numero_centro`, `computadoras`, `fecha_registro`, `inicio_semestre`, `fin_semestre`) VALUES
(1, 1, 28, '2025-01-06 23:01:43', NULL, NULL),
(2, 2, 32, '2025-01-06 23:01:43', NULL, NULL),
(3, 4, 1, '2025-01-06 23:01:43', NULL, NULL),
(5, 3, 4, '2025-01-10 04:24:31', '2025-01-09', '2025-01-11'),
(6, 3, 3, '2025-01-10 04:25:20', '2025-01-09', '2025-01-10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `registrocentro`
--
ALTER TABLE `registrocentro`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `registrocentro`
--
ALTER TABLE `registrocentro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
